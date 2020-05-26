--delete_onrestart = true


local hospitalCol = {};
local WeaponBoxCol = {};
local dayzVehicles = {};
local repairTimer = {};
local last_veh_id = 0;
local last_tent_id = 0;
local backupdone = false;

addEvent("respawnVehiclesInWater", true);
addEvent("repairVehicle", true);
addEvent("respawnDayZVehicle", true);

if fileExists("tools/backup.db") then
	backupdone = true;
else
	backupdone = false;
end

local db = dbConnect("sqlite", "tools/backup.db");
dbExec(db, "CREATE TABLE IF NOT EXISTS `vehicles` (model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, health, dayz, sx, sy, sz, id)");

--[[
function onStop( )
	if delete_onrestart then
		fileDelete("tools/backup.db")
		outputServerLog( "[VEH] Se borro la DB de Vehiculos" )
	end	
end
addEventHandler("onResourceStop", getResourceRootElement( getThisResource()), onStop)
]]


function createHeliCrashSite()
	if isElement(cargoCol) then
		destroyElement(getElementData(cargoCol, "parent"));
		destroyElement(cargoCol);
	end
	local nr = math.random(7);
	local x,y,z = heliCrashSites[nr][1], heliCrashSites[nr][2], heliCrashSites[nr][3];
	local cargobob = createVehicle(548, x, y, z);
	setElementHealth(cargobob, 0);
	setElementFrozen(cargobob, true);
	local cargoCol = createColSphere(x, y, z, 3);
	setElementData(cargoCol, "parent", cargobob);
	setElementData(cargoCol, "helicrash", true);
	setElementData(cargoCol, "MAX_Slots", 0);
	for _,v in ipairs(lootItems["helicrashsides"]) do
		local value =  math.percentChance(v[5]*3.5, math.random(2));
		setElementData(cargoCol, v[1], value);
		local ammoData,_ = getWeaponAmmoType(v[1], true);
		if (ammoData and value > 0) then
			setElementData(cargoCol, ammoData, math.random(2));
		end
	end
	setTimer(createHeliCrashSite, 3600000, 1);
end

function updateHospitals()
	for i,_ in pairs(hospitalCol) do
		for _,v in ipairs(lootItems["hospital"]) do
			setElementData(hospitalCol[i], v[1], math.random(5));
		end
	end
	setTimer(updateHospitals, 3600000, 1);
end

function createHospitalPacks()
	local number1 = 0;
	for i,v in ipairs(hospitalPacks) do
		number1 = number1+1;
		local x,y,z = v[1], v[2], v[3]-0.8;
		local object = createObject(1558, x, y, z, nil, nil, nil);
		hospitalCol[i] = createColSphere(x, y, z, 2);
		setElementData(hospitalCol[i], "parent", object);
		setElementData(hospitalCol[i], "hospitalbox", true);
		setElementData(hospitalCol[i], "MAX_Slots", 20);
	end
	updateHospitals();
end

function spawnDayZVehicles()
	for _,v in ipairs(getElementsByType("vehicle")) do
		local col = getElementData(v, "parent");
		if col then
			destroyElement(col);
		end
		destroyElement(v);
	end
	for _,v in ipairs(vehicleSpawns) do
		local x,y,z = v[2], v[3], v[4];
		local veh = createVehicle(v[1], x, y, z);
		local vehCol = createColSphere(x, y, z, 2.5);
		attachElements(vehCol, veh);
		setElementData(vehCol, "parent", veh);
		setElementData(veh, "parent", vehCol);
		setElementData(vehCol, "vehicle", true);
		setElementData(veh, "dayzvehicle", 1);
		local tires,engine,parts,slots = getVehicleAddonInfos(v[1]);
		setElementData(vehCol, "MAX_Slots", tonumber(slots));
		setElementData(vehCol, "Tire_inVehicle", math.random(0, tires));
		setElementData(vehCol, "Engine_inVehicle", math.random(0, engine));
		setElementData(vehCol, "Parts_inVehicle", math.random(0, parts));
		setElementHealth(vehCol,math.random(300,1000))
		setElementData(vehCol, "spawn", {v[1], x, y, z});
		setElementData(vehCol, "fuel", math.random(5, 20));
		for _,v in ipairs(lootItems["helicrashsides"]) do
			local value =  math.percentChance(v[5], math.random(2));
			setElementData(vehCol, v[1], value);
			local ammoData,_ = getWeaponAmmoType(v[1], true);
			if (ammoData and value > 0) then
				setElementData(vehCol, ammoData, math.random(2));
			end
		end
	end
	backup();
end

addEventHandler("onVehicleExplode", root,  function()
	for _,v in pairs(getVehicleOccupants(source)) do
		triggerEvent("kilLDayZPlayer", v);
	end
	local x1,y1,z1 = getElementPosition(source);
	local col = getElementData(source, "parent");
	local id,x,y,z = unpack(getElementData(col, "spawn"));
	setElementData(col, "deadVehicle", true);
	setElementData(source, "isExploded", true);
	if (getElementData(source, "dayzvehicle") == 1) then
		setTimer(respawnDayZVehicle, 60000, 1, id, x, y, z, source, col);
	else
		setTimer(function(col, source)
			if isElement(col) then destroyElement(col); end
			if isElement(source) then destroyElement(source); end
		end, (5*60000), 1, col, source);
	end
end);

setTimer(function()
	for _,v in ipairs(getElementsByType("vehicle")) do
		if (getElementModel(v) ~= 453) then
			local col = getElementData(v, "parent");
			if not getElementData(col, "deadVehicle") then
				if isElementInWater(v) then
					local id,x,y,z = unpack(getElementData(col, "spawn"));
					if (getElementData(v, "dayzvehicle") == 1) then
						setTimer(respawnDayZVehicle, (5*60000), 1, id, x, y, z, v, col);
					else
						setTimer(function(col, v)
							if col then destroyElement(col); end
							if v then destroyElement(v); end
						end, (5*60000), 1, col, v);
					end
				end
			end
		end
	end
end, (30*60000), 0);

function respawnDayZVehicle(id, x, y, z, veh, col)
	if veh then destroyElement(veh); end
	if col then destroyElement(col); end
	local veh = createVehicle(id, x, y, (tonumber(z)+1));
	local vehCol = createColSphere(x, y, z, 4);
	attachElements(vehCol, veh);
	setElementData(vehCol, "parent", veh);
	setElementData(veh, "parent", vehCol);
	setElementData(vehCol, "vehicle", true);
	setElementData(veh, "dayzvehicle", 1);
	local tires,engine,parts,slots = getVehicleAddonInfos(id);
	setElementData(vehCol, "MAX_Slots", tonumber(slots));
	setElementData(vehCol, "Tire_inVehicle", math.random(0, tires));
	setElementData(vehCol, "Engine_inVehicle", math.random(0, engine));
	setElementData(vehCol, "Parts_inVehicle", math.random(0, parts));
	setElementData(vehCol, "spawn", {id, x, y, z});
	setElementData(vehCol, "fuel", 10);
	for _,v in ipairs(lootItems["helicrashsides"]) do
		local value =  math.percentChance(v[5], math.random(2));
		setElementData(vehCol, v[1], value);
		local ammoData,_ = getWeaponAmmoType(v[1], true);
		if (ammoData and value > 0) then
			setElementData(vehCol, ammoData, math.random(2));
		end
	end
end
addEventHandler("respawnDayZVehicle", root, respawnDayZVehicle);

addEventHandler("onPlayerVehicleEnter", root, function(veh, seat)
	local id = getElementModel(veh);
	setVehicleEngineState(veh, true);
	if (id == 548) then cancelEvent(); end
	if (id == 509) then return; end
	local col = getElementData(veh, "parent");
	local tires,engine,parts,_ = getVehicleAddonInfos(id);
	setElementData(veh, "maxfuel", getVehicleMaxFuel(id));
	setElementData(veh, "needtires", tires);
	setElementData(veh, "needparts", parts);
	setElementData(veh, "needengines", engine);
	setVehicleEngineState(veh, false);
	if (getElementData(col, "Parts_inVehicle") == parts) then
		setElementData(veh, "fplus", 5);
	else
		setElementData(veh, "fplus", 20);
	end
	if (getElementData(col, "Tire_inVehicle") == tires) then
		if (getElementData(col, "Engine_inVehicle") == engine) then
			if (getElementData(col, "fuel") > 0) then
				setVehicleEngineState(veh, true);
				if (seat == 0) then
					--bindKey(source, "k", "down", setEngineStateByPlayer);
					--outputChatBox("Press [K] to toggle the engine!", source, 255, 255, 255);
				end
			else
				triggerClientEvent(source, "displayClientInfo", source, "Fuel tank is empty!", 22, 255, 0);
				setVehicleEngineState(veh, false);
			end
		else
			triggerClientEvent(source, "displayClientInfo", source, "This veh doesn't have Engine!", 22, 255, 0);
			setVehicleEngineState(veh, false);
		end
	else
		triggerClientEvent(source, "displayClientInfo", source, "Some Tires are missing!", 22, 255, 0);
		setVehicleEngineState(veh, false);
	end
end);

addEventHandler("onPlayerVehicleExit", root, function(veh, seat)
	if (seat == 0) then
		setVehicleEngineState(veh, false);
		unbindKey(source, "k", "down", setEngineStateByPlayer);
	end
end);

setTimer(function()
	for _,v in pairs(getElementsByType("vehicle")) do
		if (getElementModel(v) ~= 509) then
			if (getVehicleEngineState(v) == true) then
				if (getElementData(getElementData(v, "parent"), "fuel") >= 1) then
					setElementData(getElementData(v, "parent"), "fuel", getElementData(getElementData(v, "parent"), "fuel")-(getVehicleFuelRemove(getElementModel(v))*getElementData(v, "fplus"))/60);
				else
					setVehicleEngineState(v, false);
				end
			end
		end
	end
end, 1000, 0);

timeranim = {}
function repairVehicle (veh)
	if repairTimer[veh] then triggerClientEvent (source, "displayClientInfo", source,"Vehicle","The Vehicle is already repaired",255,255,255) return end
	local health = math.floor(getElementHealth(veh))
	repairTimer[veh] = setTimer(fixVehicleDayZ, 1000, 0, veh, source)
	setElementFrozen (veh,true)
	setElementData(veh,"repairer",source)
	setElementData(source,"repairingvehicle",veh)
	--setPedAnimation (source,"SCRATCHING","sclng_r",nil,false,false)
end
addEvent("repairVehicle",true)
addEventHandler("repairVehicle",getRootElement(),repairVehicle)

function fixVehicleDayZ(veh,player)
	if getElementData(veh,"repairer") then
		setElementData(player,"repairerTab",true)
		setElementHealth(veh,getElementHealth(veh)+10)
	end
	setPedAnimation (player,"SCRATCHING","sclng_r",nil,false,false)
	if getElementHealth(veh) >= 1000 then
		fixVehicle (veh)
		setPedAnimation(player,false)
		setElementFrozen (veh,false)
		setVehicleDamageProof (veh,false)
		setElementData(veh,"repairer",nil)
		setElementData(player,"repairingvehicle",nil)
		setElementData(player,"repairerTab",false)
		killTimer(repairTimer[veh])
		repairTimer[veh] = nil
		triggerClientEvent(player,"displayClientInfo",player,"Vehicle","You have completed the repair Vehicle",255,255,255)
	end
end

function stopFixxingWhileMoving(veh,player)
	local veh = getElementData(source,"repairingvehicle")
	setPedAnimation(source)
	setElementFrozen (veh,false)
	setVehicleDamageProof (veh,false)
	setElementData(veh,"repairer",nil)
	setElementData(source,"repairingvehicle",nil)
	setElementData(source,"Repairing",false)
	killTimer(repairTimer[veh])
	repairTimer[veh] = nil
	triggerClientEvent(source,"displayClientInfo",source,"Vehicle","You stopped the repair Vehicle",255,255,255)
end
addEvent("onClientMovesWhileAnimation",true)
addEventHandler("onClientMovesWhileAnimation",getRootElement(),stopFixxingWhileMoving)

function debugFixxing()
	for i,veh in ipairs(getElementsByType("vehicle")) do
		if getElementData(veh,"repairer") == source then
			setVehicleDamageProof (veh,false)
			outputDebugString("Vehicle repairer disconnected - destroyed tables")
			killTimer(repairTimer[veh])
			setElementFrozen (veh,false)
			repairTimer[veh] = nil
			setElementData(veh,"repairer",nil)
		end
	end
end
addEventHandler("onPlayerQuit",getRootElement(),debugFixxing)

--[[addEventHandler("repairVehicle", root, function(veh)
	if repairTimer[veh] then triggerClientEvent(source, "displayClientInfo", source, getVehicleName(veh).." is already in repair!", 255, 22, 0) return; end
	repairTimer[veh] = setTimer(fixDayZVehicle, (1000-(math.floor(getElementHealth(veh))))*120, 1, veh, source);
	setElementFrozen(veh, true);
	setElementFrozen(source, true);
	setPedWeaponSlot(source, 0);
	setElementData(veh, "repairer", source);
	setElementData(source, "repairingvehicle", veh);
	setElementData(source, "repairvehicle", true);
	setPedAnimation(source, "SCRATCHING", "sclng_r", nil, true, false);
	triggerClientEvent(source, "displayClientInfo", source, "Started to repair "..getVehicleName(veh), 22, 255, 0);
end);

function fixDayZVehicle(veh, player)
	setElementHealth(veh, 1000);
	fixVehicle(veh);
	setPedAnimation(player, false);
	setElementFrozen(veh, false);
	setElementFrozen(player, false);
	setElementData(player, "repairvehicle", false);
	repairTimer[veh] = nil;
	setElementData(veh, "repairer", nil);
	setElementData(player, "repairingvehicle", nil);
	triggerClientEvent(player, "displayClientInfo", player, "You repaired "..getVehicleName(veh), 22, 255, 0);
end

addEventHandler("onPlayerQuit", root, function()
	for _,v in ipairs(getElementsByType("vehicle")) do
		if (getElementData(v, "repairer") and getElementData(v, "repairer") == source) then
			outputDebugString("Vehicle repairer disconnected - destroyed tables", 3);
			killTimer(repairTimer[v]);
			setElementFrozen(v, false);
			repairTimer[v] = nil;
			setElementData(v, "repairer", nil);
		end 
	end
end);--]]

function setEngineStateByPlayer(player)
	local veh = getPedOccupiedVehicle(player);
	if (getElementData(getElementData(veh,"parent"), "fuel") <= 0) then return; end
	if (getVehicleEngineState(veh) == false) then
		setVehicleEngineState(veh, true);
		triggerClientEvent(player, "displayClientInfo", player, "Engine started!", 22, 255, 0);
	else
		setVehicleEngineState(veh, false);
		triggerClientEvent(player, "displayClientInfo", player, "Engine stopped!", 255, 22, 0);
	end
end

function backup()
	dbExec(db, "DELETE FROM `vehicles`");
	local vc = 0;
	for _,veh in ipairs(getElementsByType("vehicle")) do
		if not getElementData(veh, "helicrash") then
			local col = getElementData(veh, "parent");
			if col then
				local x,y,z = getElementPosition(veh);
				local rX,rY,rZ = getElementRotation(veh);
				local health = getElementHealth(veh);
				if (health < 500) then health = 500; end
				local _,sx,sy,sz = unpack(getElementData(col, "spawn"));
				local items = {};
				vc = vc+1;
				for _,item in ipairs(backupItemsTable) do
					local quantity = getElementData(col, item[1]) or 0;
					if (quantity > 0) then
						table.insert(items, {item[1], quantity});
					end
				end
				dbExec(db, "INSERT INTO `vehicles` (model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, dayz, health, sx, sy, sz, id) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", 
					getElementModel(veh), x, y, z, rX, rY, rZ, getElementData(col, "MAX_Slots") or 20, getElementData(col, "fuel") or 0, getElementData(col, "Engine_inVehicle") or 0, 
					getElementData(col, "Tire_inVehicle") or 0, getElementData(col, "Parts_inVehicle") or 0, toJSON(items), getElementData(veh, "dayzvehicle") or 0, health, sx, sy, sz, vc);
			end
		end
	end
	outputDebugString("Backup done ("..vc.." Vehicles)", 3);
end

function createDayzVeh(model, x, y, z, rX, rY, rZ, slots, fuel, engines, moving, parts, items, dayz, health, sx, sy, sz)
	local veh = createVehicle(model, x, y, z);
	local vehCol = createColSphere((x+5), y, z, 4);
	setElementRotation(veh, rX, rY, rZ);
	attachElements(vehCol, veh);
	setElementHealth(veh, tonumber(health));
	setElementData(vehCol, "parent", veh);
	setElementData(veh, "parent", vehCol);
	setElementData(veh, "dayzvehicle", tonumber(dayz));
	setElementData(vehCol, "vehicle", true);
	setElementData(vehCol, "MAX_Slots", tonumber(slots));
	setElementData(vehCol, "Tire_inVehicle", tonumber(moving));
	setElementData(vehCol, "Engine_inVehicle", tonumber(engines));
	setElementData(vehCol, "Parts_inVehicle", tonumber(parts));
	setElementData(vehCol, "spawn", {model, sx, sy, sz});
	setElementData(vehCol, "fuel", tonumber(fuel));
	for _,v in ipairs(fromJSON(items)) do
		setElementData(vehCol, v[1], v[2]);
	end
end


function loadBackup()
	for _,v in pairs(getElementsByType("vehicle")) do
		local col = getElementData(v, "parent");
		if col then
			destroyElement(col);
		end
		destroyElement(v);
	end
	local p = dbPoll(dbQuery(db, "SELECT * FROM `vehicles`"), -1);
	if (#p > 0) then
		for _,d in pairs(p) do
			createDayzVeh(d["model"], d["x"], d["y"], d["z"], d["rX"], d["rY"], d["rZ"], d["slots"], d["fuel"], d["engines"], d["moving"], d["parts"], d["items"], d["dayz"], d["health"], d["sx"], d["sy"], d["sz"]);
		end
	end
end

if not backupdone then
	spawnDayZVehicles();
	backupdone = true;
else
	loadBackup();
end
setTimer(backup, (10*60000), 0);

addCommandHandler("dobackup", function(player)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup("Admin")) then
		backup();
	end
end);

function updatepatrol ()
	for i,box in pairs(patrolCol) do
	    local rand = math.random(1,3); if rand == 1 then litras = 100 elseif rand == 2 then litras = 80 elseif rand == 3 then litras = 60 end
		setElementData(patrolCol[i],"patrollitras",litras)
	end
	setTimer(updatepatrol,10800000,1)
end

patrolCol = {}
function createPatrols()
	number1 = 0
    for i,patrol in ipairs(patrolPoints) do
	    number1 = number1+1
	    local x,y,z = patrol[1],patrol[2],patrol[3]
	    patrolCol[i] = createColSphere(x,y,z,3)
	    local rand = math.random(1,3); if rand == 1 then litras = 100 elseif rand == 2 then litras = 80 elseif rand == 3 then litras = 60 end
		setElementData(patrolCol[i],"patrolstation",true)
		setElementData(patrolCol[i],"patrollitras",litras)
    end
	setTimer(updatepatrol,10800000,1)
end
createPatrols()

createHeliCrashSite();
createHospitalPacks();


 -------------------------------------
 
function WeaponBox ()
	for i,box in pairs(WeaponBoxCol) do
		for _,items in ipairs(lootItemsMylitary["weaponbox"]) do
			setElementData(WeaponBoxCol[i],items[1],99999)
		end
	end
	setTimer(WeaponBox,3600000,1)
end


function WeaponPacks()
	number1 = 0
	for i,box in ipairs(MylitaryBox) do
		number1 = number1+1
		local x,y,z = box[1],box[2],box[3]-0.9;
		object = createObject(964,x,y,z,nil,nil,nil)
		--setElementCollisionsEnabled(object, false)
		WeaponBoxCol[i] = createColSphere(x,y,z,2)
		setElementData(WeaponBoxCol[i],"parent",object)
		setElementData(WeaponBoxCol[i],"weaponbox",true)
		setElementData(WeaponBoxCol[i],"MAX_Slots",10000)
		for _,items in ipairs(lootItemsMylitary["weaponbox"]) do
			setElementData(WeaponBoxCol[i],items[1],99999)
		end	
	end
	setTimer(WeaponBox,3600000,1)
end
WeaponPacks()
--Poner spawnDayZVehicles en comentarios cuando tu servidor este listo para jugar
spawnDayZVehicles();