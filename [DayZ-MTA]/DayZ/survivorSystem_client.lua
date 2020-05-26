
local screenW, screenH = guiGetScreenSize()
--disable ped targeting markers
setPedTargetingMarkerEnabled(false)
--Survivor Skins
--Sniper
snipertxd = engineLoadTXD ("mods/sniper.txd");
engineImportTXD (snipertxd, 285);
sniperdff = engineLoadDFF ("mods/sniper.dff", 285);
engineReplaceModel (sniperdff, 285);
--Standard
snipertxd = engineLoadTXD ("mods/standart.txd");
engineImportTXD (snipertxd, 73);
sniperdff = engineLoadDFF ("mods/standart.dff", 73);
engineReplaceModel (sniperdff, 73);
--Standard Medic
snipertxd = engineLoadTXD ("mods/standart1.txd");
engineImportTXD (snipertxd, 112);
sniperdff = engineLoadDFF ("mods/standart.dff", 112);
engineReplaceModel (sniperdff, 112);
--Standard Purple
snipertxd = engineLoadTXD ("mods/standart4.txd");
engineImportTXD (snipertxd, 125);
sniperdff = engineLoadDFF ("mods/standart.dff", 125);
engineReplaceModel (sniperdff, 125);
--Standard Military
snipertxd = engineLoadTXD ("mods/standart2.txd");
engineImportTXD (snipertxd, 124);
sniperdff = engineLoadDFF ("mods/standart.dff", 124);
engineReplaceModel (sniperdff, 124);
--Standart Green
snipertxd = engineLoadTXD ("mods/standart3.txd");
engineImportTXD (snipertxd, 120);
sniperdff = engineLoadDFF ("mods/standart.dff", 120);
engineReplaceModel (sniperdff, 120);

-- Jill
snipertxd = engineLoadTXD ("mods/jillarmy.txd");
engineImportTXD (snipertxd, 226);
sniperdff = engineLoadDFF ("mods/jillarmy.dff", 226);
engineReplaceModel (sniperdff, 226);

-- Jill
snipertxd = engineLoadTXD ("mods/jill.txd");
engineImportTXD (snipertxd, 12);
sniperdff = engineLoadDFF ("mods/jill.dff", 12);
engineReplaceModel (sniperdff, 12);

--Standard (Female)
snipertxd = engineLoadTXD ("mods/femalestandard.txd");
engineImportTXD (snipertxd, 191);
sniperdff = engineLoadDFF ("mods/femalestandard.dff", 191);
engineReplaceModel (sniperdff, 191);

---RebeL (Female)
snipertxd = engineLoadTXD ("mods/rebel.txd");
engineImportTXD (snipertxd, 131);
sniperdff = engineLoadDFF ("mods/rebel.dff", 131);
engineReplaceModel (sniperdff, 131);

--bear trap
itemTXD = engineLoadTXD("mods/trap_open.txd")
engineImportTXD(itemTXD, 1759)
itemDFF = engineLoadDFF("mods/trap_closed.dff", 1759)
engineReplaceModel(itemDFF, 1759)
itemCOL = engineLoadCOL ( "mods/trap_closed.col" )
engineReplaceCOL(itemCOL, 1759)

itemTXD = engineLoadTXD("mods/trap_open.txd")
engineImportTXD(itemTXD, 1762)
itemDFF = engineLoadDFF("mods/trap_open.dff", 1762)
engineReplaceModel(itemDFF, 1762)
itemCOL = engineLoadCOL ( "mods/trap_open.col" )
engineReplaceCOL(itemCOL, 1762) 

---RebeL (Female)
snipertxd = engineLoadTXD ("mods/banditf.txd");
engineImportTXD (snipertxd, 71);
sniperdff = engineLoadDFF ("mods/banditf.dff", 71);
engineReplaceModel (sniperdff, 71);


---RebeL (Female)
snipertxd = engineLoadTXD ("mods/bandit3.txd");
engineImportTXD (snipertxd, 263);
sniperdff = engineLoadDFF ("mods/bandit3.dff", 263);
engineReplaceModel (sniperdff, 263);

---RebeL (Female)
snipertxd = engineLoadTXD ("mods/banditf.txd");
engineImportTXD (snipertxd, 71);
sniperdff = engineLoadDFF ("mods/banditf.dff", 71);
engineReplaceModel (sniperdff, 71);

snipertxd = engineLoadTXD ("mods/banditf2.txd");
engineImportTXD (snipertxd, 256);
sniperdff = engineLoadDFF ("mods/banditf2.dff", 256);
engineReplaceModel (sniperdff, 256); 

snipertxd = engineLoadTXD ("mods/female1.txd");
engineImportTXD (snipertxd, 257);
sniperdff = engineLoadDFF ("mods/female1.dff", 257);
engineReplaceModel (sniperdff, 257); 

--Items
itemTXD = engineLoadTXD ("items/bloodbag.txd");
engineImportTXD (itemTXD, 1580);
itemDFF = engineLoadDFF ("items/bloodbag.dff", 1580);
engineReplaceModel (itemDFF, 1580);

itemTXD = engineLoadTXD ("items/army_clothes.txd");
engineImportTXD (itemTXD, 1247);
itemDFF = engineLoadDFF ("items/army_clothes.dff", 1247);
engineReplaceModel (itemDFF, 1247);

itemTXD = engineLoadTXD ("items/sniper_clothes.txd");
engineImportTXD (itemTXD, 1213);
itemDFF = engineLoadDFF ("items/sniper_clothes.dff", 1213);
engineReplaceModel (itemDFF, 1213);

itemTXD = engineLoadTXD ("items/civilian_clothes.txd");
engineImportTXD (itemTXD, 1241);
itemDFF = engineLoadDFF ("items/civilian_clothes.dff", 1241);
engineReplaceModel (itemDFF, 1241);

itemTXD = engineLoadTXD ("items/standard_clothes.txd");
engineImportTXD (itemTXD, 1577);
itemDFF = engineLoadDFF ("items/standard_clothes.dff", 1577);
engineReplaceModel (itemDFF, 1577);

itemTXD = engineLoadTXD ("items/beans_can.txd");
engineImportTXD (itemTXD, 2601);
itemDFF = engineLoadDFF ("items/beans_can.dff", 2601);
engineReplaceModel (itemDFF, 2601);

itemTXD = engineLoadTXD ("items/first_aid_kit.txd");
engineImportTXD (itemTXD, 2891);
itemDFF = engineLoadDFF ("items/first_aid_kit.dff", 2891);
engineReplaceModel (itemDFF, 2891);

itemTXD = engineLoadTXD ("items/heat_pack.txd");
engineImportTXD (itemTXD, 1576);
itemDFF = engineLoadDFF ("items/heat_pack.dff", 1576);
engineReplaceModel (itemDFF, 1576);

itemTXD = engineLoadTXD ("items/pain_killers.txd");
engineImportTXD (itemTXD, 2709);
itemDFF = engineLoadDFF ("items/pain_killers.dff", 2709);
engineReplaceModel (itemDFF, 2709);

itemTXD = engineLoadTXD ("items/pasta_can.txd");
engineImportTXD (itemTXD, 2770);
itemDFF = engineLoadDFF ("items/pasta_can.dff", 2770);
engineReplaceModel (itemDFF, 2770);

itemTXD = engineLoadTXD ("items/pistol_ammo.txd");
engineImportTXD (itemTXD, 3013);
itemDFF = engineLoadDFF ("items/pistol_ammo.dff", 3013);
engineReplaceModel (itemDFF, 3013);

itemTXD = engineLoadTXD ("items/shotgun_ammo.txd");
engineImportTXD (itemTXD, 2358);
itemDFF = engineLoadDFF ("items/shotgun_ammo.dff", 2358);
engineReplaceModel (itemDFF, 2358);

itemTXD = engineLoadTXD ("items/backpack_small.txd");
engineImportTXD (itemTXD, 3026);
itemDFF = engineLoadDFF ("items/backpack_small.dff", 3026);
engineReplaceModel (itemDFF, 3026);

itemTXD = engineLoadTXD ("items/smg_ammo.txd");
engineImportTXD (itemTXD, 2041);
itemDFF = engineLoadDFF ("items/smg_ammo.dff", 2041);
engineReplaceModel (itemDFF, 2041);

itemTXD = engineLoadTXD ("items/sniper_ammo.txd");
engineImportTXD (itemTXD, 2358);
itemDFF = engineLoadDFF ("items/sniper_ammo.dff", 2358);
engineReplaceModel (itemDFF, 2358);

itemTXD = engineLoadTXD ("items/soda_can.txd");
engineImportTXD (itemTXD, 2647);
itemDFF = engineLoadDFF ("items/soda_can.dff", 2647);
engineReplaceModel (itemDFF, 2647);

itemTXD = engineLoadTXD ("items/water_bottle.txd");
engineImportTXD (itemTXD, 2683);
itemDFF = engineLoadDFF ("items/water_bottle.dff", 2683);
engineReplaceModel (itemDFF, 2683);

itemTXD = engineLoadTXD ("items/assault_ammo.txd");
engineImportTXD (itemTXD, 1271);
itemDFF = engineLoadDFF ("items/assault_ammo.dff", 1271);
engineReplaceModel (itemDFF, 1271);

itemTXD = engineLoadTXD ("items/backpack_alice.txd");
engineImportTXD (itemTXD, 1248);
itemDFF = engineLoadDFF ("items/backpack_alice.dff", 1248);
engineReplaceModel (itemDFF, 1248);

itemTXD = engineLoadTXD ("items/backpack_coyote.txd");
engineImportTXD (itemTXD, 1252);
itemDFF = engineLoadDFF ("items/backpack_coyote.dff", 1252);
engineReplaceModel (itemDFF, 1252);

itemTXD = engineLoadTXD ("items/backpack_czech.txd");
engineImportTXD (itemTXD, 1575);
itemDFF = engineLoadDFF ("items/backpack_czech.dff", 1575);
engineReplaceModel (itemDFF, 1575);

itemTXD = engineLoadTXD ("items/mountain.txd");
engineImportTXD (itemTXD,1669);
itemDFF = engineLoadDFF ("items/mountain.dff", 1669);
engineReplaceModel (itemDFF, 1669);

itemTXD = engineLoadTXD ("items/drybag.txd");
engineImportTXD (itemTXD, 1809);
itemDFF = engineLoadDFF ("items/drybag.dff", 1809);
engineReplaceModel (itemDFF, 1809);

itemTXD = engineLoadTXD ("items/tent.txd");
engineImportTXD (itemTXD, 3243);
itemCOL = engineLoadCOL ("items/tent.col" );
engineReplaceCOL ( itemCOL, 3243);
itemDFF = engineLoadDFF ("items/tent.dff", 3243);
engineReplaceModel (itemDFF, 3243);

itemTXD = engineLoadTXD ("items/tentbag.txd");
engineImportTXD (itemTXD, 1512);
itemDFF = engineLoadDFF ("items/tentbag.dff", 1512);
engineReplaceModel (itemDFF, 1512);

itemTXD = engineLoadTXD ("items/wirefence.txd");
engineImportTXD (itemTXD, 983);
itemDFF = engineLoadDFF ("items/wirefence.dff", 983);
engineReplaceModel (itemDFF, 983);

--Weapons

-- Camera -> Binoculars
weaponTXD = engineLoadTXD ("items/camera.txd");
engineImportTXD (weaponTXD, 367);
weaponDFF = engineLoadDFF ("items/camera.dff", 367);
engineReplaceModel (weaponDFF, 367);

-- Katana -> Hatchet
weaponTXD = engineLoadTXD ("items/katana.txd");
engineImportTXD (weaponTXD, 339);
weaponDFF = engineLoadDFF ("items/katana.dff", 339);
engineReplaceModel (weaponDFF, 339);

function playerStatsClientSite()
    if getElementData(getLocalPlayer(),"logedin") then
	toggleControl("radar", false);
	setPlayerHudComponentVisible("radar", false);
	setPlayerHudComponentVisible("area_name", false);
	setPlayerHudComponentVisible("breath", false);
	setPlayerHudComponentVisible("clock", false);
	setPlayerHudComponentVisible("money", false);
	setPlayerHudComponentVisible("health", false);
	setPlayerHudComponentVisible("vehicle_name", false);
	setPlayerHudComponentVisible("radio", false);
	setPlayerHudComponentVisible("weapon", false);
	setPlayerHudComponentVisible("ammo", false);
	setAmbientSoundEnabled("general", false);
	setAmbientSoundEnabled("gunfire", false);
	for _,v in pairs(getElementsByType("object")) do
		engineSetModelLODDistance(getElementModel(v), 300);
	end
        if getElementData(getLocalPlayer(),"Map") >= 1  then
            toggleControl ("radar",true)
        end
        if getElementData(getLocalPlayer(),"GPS") >= 1  then
            setPlayerHudComponentVisible ("radar",true) 
        end
        if getElementData(getLocalPlayer(),"Watch") >= 1 then
            setPlayerHudComponentVisible ("clock",true) 
        end
    end
end
setTimer(playerStatsClientSite,1000,0)

---Som de armadilha
playTrapSoundClient = function() 
            local x,y,z = getElementPosition ( source ) 
            local trap = playSound3D ( "sounds/trap.ogg", x, y, z,false)   
			setSoundMaxDistance(trap,20)			
 end 
 addEvent("playTrapSound", true) 
 addEventHandler("playTrapSound", getRootElement(), playTrapSoundClient) 
 
function playTrapSound_voul()
    if getElementData(getLocalPlayer(), "logedin") then
        local x,y,z = getElementPosition ( source ) 
		local voul = math.random(0,4)
		voul = playSound3D("sounds/scream_short_"..voul..".ogg", x, y, z, false) 
		setSoundMaxDistance(voul,20)
		local animR = math.random(1,4)
		if animR == 1 then
		setPedAnimation(getLocalPlayer(), "ped", "KO_shot_face")
		elseif animR == 2  then
		setPedAnimation(getLocalPlayer(), "CRACK", "crckdeth3")
		elseif animR == 3  then
		setPedAnimation(getLocalPlayer(), "ped", "KO_shot_stom")
		elseif animR == 4  then
        setPedAnimation(getLocalPlayer(), "CRACK", "crckdeth2")
        end
		setTimer(function()
		setPedAnimation(getLocalPlayer())
		end,2000,1)
    end
	end
addEvent("playTrapSound_voul", true) 
addEventHandler("playTrapSound_voul", getRootElement(),playTrapSound_voul) 

function playerZoom (key,keyState)
    if key == "n" then
        if getElementData(getLocalPlayer(),"Night Vision Goggles") > 0 then
            if nightvision then
                nightvision = false
                setCameraGoggleEffect("normal")
                local hour, minutes = getTime()
                if gameplayVariables["enablenight"] then
                    setClientNight (hour,minutes)
                end
            else 
                nightvision = true
                setCameraGoggleEffect("nightvision")
                setFarClipDistance(1000)
            end
        end
    elseif key == "i" then
        if getElementData(getLocalPlayer(),"Infrared Goggles") > 0 then
            if infaredvision then
                infaredvision = false
                setCameraGoggleEffect("normal")
                if gameplayVariables["enablenight"] then
                    setClientNight (hour,minutes)
                end
            else 
                 infaredvision = true
                setCameraGoggleEffect("thermalvision")
                if gameplayVariables["enablenight"] then
                    setClientNight (hour,minutes)
                end
            end
        end
    end
end
bindKey("n","down",playerZoom)
bindKey("i","up",playerZoom)

--------------------------------------------------------
--Player Stats                                          --
--------------------------------------------------------
function getGroundMaterial(x, y, z)
    local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight(x, y, z, x, y, z-10, true, false, false, true, false, false, false, false, nil)
    return material
end

function isInBuilding(x, y, z)
    local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight(x, y, z, x, y, z+10, true, false, false, true, false, false, false, false, nil)
    if hit then return true end
    return false
end

function isObjectAroundPlayer2 ( thePlayer, distance, height )
    material_value = 0
    local x, y, z = getElementPosition( thePlayer )
    for i = math.random(0,360), 360, 1 do
        local nx, ny = getPointFromDistanceRotation( x, y, distance, i )
        local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight ( x, y, z + height, nx, ny, z + height,true,false,false,false,false,false,false,false )
        if material == 0 then
            material_value = material_value+1
        end
        if material_value > 40 then
            return 0,hitX, hitY, hitZ
        end
    end
    return false
end

function isObjectAroundPlayer ( thePlayer, distance, height )
    local x, y, z = getElementPosition( thePlayer )
    for i = math.random(0,360), 360, 1 do
        local nx, ny = getPointFromDistanceRotation( x, y, distance, i )
        local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight ( x, y, z + height, nx, ny, z + height)
        if material == 0 then
            return material,hitX, hitY, hitZ
        end
    end
    return false
end

function getPointFromDistanceRotation ( x, y, dist, angle )
    local a = math.rad( 90 - angle )
    local dx = math.cos( a ) * dist
    local dy = math.sin( a ) * dist
    return x + dx, y + dy
end



function playRandomHitSound () 
    local number = math.random(1,3)
    local sound = playSound("sounds/hit"..number..".mp3")
end

--
function playerGetDamageDayZ ( attacker, weapon, bodypart, loss )
    cancelEvent()
	if attacker and getElementType(attacker) == "vehicle" then
		speedx, speedy, speedz = getElementVelocity ( attacker )
		actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)
		kmh = actualspeed * 180
		if kmh >= 90 then
			local vehkiller = getVehicleOccupant ( attacker )
			setElementData(source,"blood",0)
			if getElementData(source,"blood") <= 0 then
				triggerServerEvent("kilLDayZPlayer",source,vehkiller)
			end
		end
	end
    damage = 100
    headshot = false
    if weapon == 37 then
        return
    end
	if attacker and getElementData(attacker,"zombie") then
		setElementData(getLocalPlayer(), "blood", getElementData(getLocalPlayer(), "blood") - gameplayVariables.zombiedamage)
	end
    if weapon == 49 then
        if loss > 30 then
            setElementData(getLocalPlayer(),"brokenbone",true)
            setPedControlState ("jump",true)
            setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.floor(loss*10))
        end
    setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.floor(loss*5))
    elseif weapon == 63 or weapon == 51 or weapon == 19 then
        setElementData(getLocalPlayer(),"blood",0)
        if getElementData(getLocalPlayer(),"blood") <= 0 then
            if not getElementData(getLocalPlayer(),"isDead") == true then
                triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),attacker,headshot)
            end
        end
    elseif weapon and weapon > 1 and attacker and getElementType(attacker) == "player" then
        local number = math.random(1,8)
        if number >= 6 or number <= 8 then
            setElementData(getLocalPlayer(),"bleeding",getElementData(getLocalPlayer(),"bleeding") + math.floor(loss*10))
        end
        local number = math.random(1,7)
        if number == 2 then
            setElementData(getLocalPlayer(),"pain",true)
        end
        damage = getWeaponDamage (weapon)
        if bodypart == 9 then
            damage = damage*15.5
            headshot = true
        end
        if bodypart == 7 or bodypart == 8 then
            setElementData(getLocalPlayer(),"brokenbone",true)
        end
        playRandomHitSound()
        setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.random(damage*0.75,damage*1.25))
        if not getElementData(getLocalPlayer(),"bandit") then
            setElementData(attacker,"humanity",getElementData(attacker,"humanity")-math.random(40,200))
            if getElementData(attacker,"humanity") < 0 then
                setElementData(attacker,"bandit",true)
            end
        else
            setElementData(attacker,"humanity",getElementData(attacker,"humanity")+math.random(40,200))
            if getElementData(attacker,"humanity") > 5000 then
                setElementData(attacker,"humanity",5000)
            end
            if getElementData(attacker,"humanity") > 2000 then
                setElementData(attacker,"bandit",false)
            end
        end    
        if getElementData(getLocalPlayer(),"blood") <= 0 then
            if not getElementData(getLocalPlayer(),"isDead") then
                triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),attacker,headshot,getWeaponNameFromID (weapon))
                setElementData(getLocalPlayer(),"isDead",true)
            end
        end
    elseif weapon == 54 or weapon == 63 or weapon == 49 or weapon == 51 then
        setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-math.random(100,1000))
        local number = math.random(1,5)
        if loss > 30 then
            setElementData(getLocalPlayer(),"brokenbone",true)
            setPedControlState ("jump",true)
        end
        if loss >= 100 then
            setElementData(getLocalPlayer(),"blood",49)
            setElementData(getLocalPlayer(),"bleeding",50)
        end
        local number = math.random(1,11)
        if number == 3 then
            setElementData(getLocalPlayer(),"pain",true)
        end
        if getElementData(getLocalPlayer(),"blood") <= 0 then
            if not getElementData(getLocalPlayer(),"isDead") == true then
                triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),attacker,headshot,getWeaponNameFromID (weapon))
                setElementData(getLocalPlayer(),"isDead",true)
            end
        end
    end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer (), playerGetDamageDayZ )


function pedGetDamageDayZ ( attacker, weapon, bodypart, loss )
	cancelEvent()
	if getElementType(attacker) == "vehicle" then
		speedx, speedy, speedz = getElementVelocity ( attacker )
		actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)
		kmh = actualspeed * 180
		if kmh >= 50 then
			local vehkiller = getVehicleOccupant ( attacker )
			setElementData(source,"blood",0)
			if getElementData(source,"blood") <= 0 then
				triggerServerEvent("onZombieGetsKilled",source,vehkiller)
			end
		end
	end
	if attacker and attacker == getLocalPlayer() then
		damage = 100
		if weapon == 37 then
			return
		end
		if weapon == 63 or weapon == 51 or weapon == 19 then
			setElementData(source,"blood",0)
			if getElementData(source,"blood") <= 0 then
				triggerServerEvent("onZombieGetsKilled",source,attacker)
			end
		elseif weapon and weapon > 1 and attacker and getElementType(attacker) == "player" then
			damage = getWeaponDamage (weapon)
			if bodypart == 9 then
				damage = damage*1.5
				headshot = true
			end
			setElementData(source,"blood",getElementData(source,"blood")-math.random(damage*0.75,damage*1.25))
			if getElementData(source,"blood") <= 0 then
				triggerServerEvent("onZombieGetsKilled",source,attacker,headshot)
			end
		end
	end	
end
addEventHandler ( "onClientPedDamage", getRootElement(), pedGetDamageDayZ )


function checkStats()
	if getElementData(getLocalPlayer(),"logedin") then
		if getElementData(getLocalPlayer(),"bleeding") > 10 then
			setElementData(getLocalPlayer(),"blood",getElementData(getLocalPlayer(),"blood")-getElementData(getLocalPlayer(),"bleeding"))
		else
			setElementData(getLocalPlayer(),"bleeding",0)
		end
		if getElementData(getLocalPlayer(),"blood") < 0 then
			if not getElementData(getLocalPlayer(),"isDead") then
				triggerServerEvent("kilLDayZPlayer",getLocalPlayer(),false,false)
			end
		end
	end
end
setTimer(checkStats,1000,0)

function createBloodForBleedingPlayers ()
    if getElementData(getLocalPlayer(),"logedin") then
    local x,y,z = getElementPosition(getLocalPlayer())
        for i,player in ipairs(getElementsByType("player")) do
            local bleeding = getElementData(player,"bleeding") or 0
            if bleeding > 0 then
                local px,py,pz = getPedBonePosition (player,3)
                local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
                if bleeding > 600 then
                    number = 5
                elseif bleeding > 300 then
                    number = 3
                elseif bleeding > 100 then
                    number = 1
                else
                    number = 0
                end
                if pdistance <= 120 then
                    fxAddBlood ( px,py,pz,0,0,0,number, 1 )
                end
            end    
        end
    end    
end
setTimer(createBloodForBleedingPlayers,300,0)

function checkBrokenbone()
    if getElementData(getLocalPlayer(),"logedin") then
        if getElementData(getLocalPlayer(),"brokenbone") then
            if not isPedDucked(getLocalPlayer()) then
                --setControlState ("walk",false)
                --setControlState ("crouch",true)
            end
            toggleControl ( "jump", false )
            toggleControl ( "sprint", false )
        else
            toggleControl ( "jump", true )
            toggleControl ( "sprint", true )
        end
    end    
end
setTimer(checkBrokenbone,1400,0)

function setPain()
    if getElementData(getLocalPlayer(),"logedin") then
        if getElementData(getLocalPlayer(),"pain") then
		    if getElementData(getLocalPlayer(),"isDead",true) then return end
            local x,y,z = getElementPosition(getLocalPlayer())
            createExplosion (x,y,z+15,8,false,1.0,false)
            local x, y, z, lx, ly, lz = getCameraMatrix() --[[Get the current location and lookat of camera
            x, lx = x + 1, lx + 1 -- What will be the new x and x lookat values
            setCameraMatrix(x,y,z,lx,ly,lz) -- Set camera to new position
            setCameraTarget (getLocalPlayer())--]]
        end
    end    
end
setTimer(setPain,1500,0)

function checkCold()
    if getElementData(getLocalPlayer(),"logedin") then
        if getElementData(getLocalPlayer(),"temperature") <= 31 then
            setElementData(getLocalPlayer(),"cold",true)
        end
    end    
end
setTimer(checkCold,3000,0)

function setCold()
    if getElementData(getLocalPlayer(),"logedin") then
        if getElementData(getLocalPlayer(),"cold") then
            local x,y,z = getElementPosition(getLocalPlayer())
            createExplosion (x,y,z+15,8,false,0.5,false)
            local x, y, z, lx, ly, lz = getCameraMatrix() -- Get the current location and lookat of camera
        end    
    end    
end
setTimer(setCold,1500,0)

function setVolume()
    value = 0
    if getPedMoveState (getLocalPlayer()) == "stand" then
        value = 0
    elseif getPedMoveState (getLocalPlayer()) == "walk" then
        value = 20
    elseif getPedMoveState (getLocalPlayer()) == "powerwalk" then
        value = 40
    elseif getPedMoveState (getLocalPlayer()) == "jog" then
        value = 80
    elseif getPedMoveState (getLocalPlayer()) == "sprint" then    
        value = 100
    elseif getPedMoveState (getLocalPlayer()) == "crouch" then    
        value = 0
    elseif not getPedMoveState (getLocalPlayer()) then
        value = 20
    end
    if getElementData(getLocalPlayer(),"shooting") and getElementData(getLocalPlayer(),"shooting") > 0 then
        value = value+getElementData(getLocalPlayer(),"shooting")
    end
    if isPedInVehicle (getLocalPlayer()) then
        value = 100
    end    
    if value > 100 then
        value = 100
    end
    setElementData(getLocalPlayer(),"volume",value)
end
setTimer(setVolume,100,0)

function setVisibility()
    value = 0
    if getPedMoveState (getLocalPlayer()) == "stand" then
        local block, anim = getPedAnimation(localPlayer)
        if anim == "FLOOR_hit_f" then
            value = 20
        else
            value = 60
        end
    elseif getPedMoveState (getLocalPlayer()) == "walk" then
        value = 60
    elseif getPedMoveState (getLocalPlayer()) == "powerwalk" then
        value = 60
    elseif getPedMoveState (getLocalPlayer()) == "jog" then
        value = 60
    elseif getPedMoveState (getLocalPlayer()) == "sprint" then    
        value = 60
    elseif getPedMoveState (getLocalPlayer()) == "crouch" then    
        value = 20
    elseif not getPedMoveState (getLocalPlayer()) then    
        value = 20
    end
    if getElementData(getLocalPlayer(),"jumping") then
        value = 100
    end
    if isObjectAroundPlayer (getLocalPlayer(),2, 4 ) then
        value = 0
    end
    if isPedInVehicle (getLocalPlayer()) then
        value = 0
    end    
    setElementData(getLocalPlayer(),"visibly",value)
end
setTimer(setVisibility,100,0)

function debugJump()
    if getPedControlState("jump") then
        setElementData(getLocalPlayer(),"jumping",true)
        setTimer(debugJump2,650,1)
    end
end
setTimer(debugJump,100,0)

function debugJump2()
    setElementData(getLocalPlayer(),"jumping",false)
end

function debugShooting()
    if getPedControlState("fire") then
        local weapon = getPedWeapon(getLocalPlayer())
        local noise = getWeaponNoise(weapon) or 0
        setElementData(getLocalPlayer(),"shooting",noise)
        if shootTimer then
            killTimer(shootTimer)
        end
        shootTimer = setTimer(debugShooting2,100,1)
    end
end
setTimer(debugShooting,100,0)

function debugShooting2()
    setElementData(getLocalPlayer(),"shooting",0)
    shootTimer = false
end

fading = 0
fading2 = "up"
local screenWidth,screenHeight = guiGetScreenSize()
function updateIcons ()
    if getElementData(getLocalPlayer(),"logedin") then
        --fading
        if fading >= 0 and fading2 == "up" then
            fading = fading + 5
        elseif fading <= 255 and fading2 == "down" then
            fading = fading - 5
        end
        --fading math.
        if fading == 0 then
            fading2 = "up"
        elseif fading == 255 then
            fading2 = "down"
        end
        local x,y,z = getElementPosition(getLocalPlayer())
        for i,player in ipairs(getElementsByType("player")) do
            setPlayerNametagShowing ( player, false )
            if player ~= getLocalPlayer() then
            local vehicle = getPedOccupiedVehicle(player)
                local px,py,pz = getElementPosition (player)
                local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
                if pdistance <= 2 then
                    --Get screenposition
                    local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.95, 0.06 )
                    if sx and sy then
                    --Draw Name
                    if getElementData(player,"bandit") then
                        text = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '' ).." (Bandit)"
                    else
                        text = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '' )
                    end
                    local w = dxGetTextWidth(text,1.02,"default-bold")
                    dxDrawText (text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( 100, 255, 100, 200 ), 1.02, "default-bold" )
                    end
                end
            end        
        end
        --Vehicletags
        local x,y,z = getElementPosition(getLocalPlayer())
        for i,veh in ipairs(getElementsByType("vehicle")) do
            local px,py,pz = getElementPosition (veh)
            local vehID = getElementModel(veh)
            local vehicle = getPedOccupiedVehicle(getLocalPlayer())
            if veh ~= vehicle then
                if vehID ~= 548 then
                    local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
                    if pdistance <= 6 then
                        --Get screenposition
                        local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.95, 0.06 )
                        if sx and sy then
                            --Draw Vehicle
                            local w = dxGetTextWidth(getVehicleName(veh),1.02,"default-bold")
                            dxDrawText ( getVehicleName(veh), sx-(w/2), sy, sx-(w/2), sy, tocolor ( 100, 255, 100, 200 ), 1.02, "default-bold" )    
                        end
                    end
                end
            end
        end
        if not playerTarget then return end
        local x,y,z = getElementPosition(playerTarget)
        local x,y,distance = getScreenFromWorldPosition (x,y,z+0.5)
        distance = 20
        if getElementData(playerTarget,"bandit") then
            text = string.gsub(getPlayerName(playerTarget), '#%x%x%x%x%x%x', '' ).." (Bandit)"
        else
            text = string.gsub(getPlayerName(playerTarget), '#%x%x%x%x%x%x', '' )
        end
        local w = dxGetTextWidth(text,distance*0.033,"default-bold")
        dxDrawText (text,x-(w/2),y,x-(w/2), y, tocolor ( 100, 255, 100, 200 ), distance*0.033, "default-bold" )
    end    
end
addEventHandler ( "onClientRender", getRootElement(), updateIcons )

playerTarget = false
function targetingActivated ( target )
    if ( target ) and getElementType(target) == "player" then
        playerTarget = target
    else
        playerTarget = false
    end
end
addEventHandler ( "onClientPlayerTarget", getRootElement(), targetingActivated )

dayZDeathInfo = function()
local x,y,z = getElementPosition(source)
fadeCamera(true,5)
setCameraMatrix (x,y,z, 0,0,5000)
local sound1 = playSound3D ("sounds/panic_0.ogg", x,y,z, true)
setSoundMaxDistance( sound1,10)
setTimer(function()
            destroyElement(sound1)
            end,4000, 1)

end
addEvent("onClientPlayerDeathInfo",true)
addEventHandler("onClientPlayerDeathInfo",getRootElement(),dayZDeathInfo)

--OnClientPlayerHit
whiteWindow = guiCreateStaticImage(0,0,1,1,"images/white.png",true)
guiSetVisible(whiteWindow,false)


function showPlayerDamageScreen (visibly2,stateControle2)
    guiSetVisible(whiteWindow,true)
    visibly = visibly2 or visibly
    stateControle = stateControle2 or stateControle
    if visibly >= 6*0.025 and stateControle == "up" then
        stateControle = "down"
    end
    if visibly < 0 then
        guiSetVisible(whiteWindow,false)
        return
    end
    if stateControle == "up" then
        visibly = visibly + 0.025
    elseif stateControle == "down" then
        visibly = visibly - 0.025
    end
    guiSetAlpha(whiteWindow,visibly)
    setTimer(showPlayerDamageScreen,50,1)
end

function showWhiteScreen ( attacker, weapon, bodypart )
    --if weapon then
        showPlayerDamageScreen (0,"up")
    --end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), showWhiteScreen )

local antiSpamTimer = {}
function setAntiSpamActive()
    if not isTimer(antiSpamTimer) then
        antiSpamTimer = setTimer(killAntiSpamTimer,1000,1)
    else
        killTimer(antiSpamTimer)
        antiSpamTimer = setTimer(killAntiSpamTimer,2500,1)
    end
end

function isSpamTimer()
    if isTimer(antiSpamTimer) then 
        outputChatBox("Please do not spam the support chat!", 255, 255, 0,true)
        return true
    else
        return false
    end
end

function killAntiSpamTimer ()
    killTimer(antiSpamTimer)
end

--Vehicles In Water
function checkVehicleInWaterClient ()
	vehiclesInWater = {}
	for i,veh in ipairs(getElementsByType("vehicle")) do
		if isElementInWater(veh) then
			table.insert(vehiclesInWater,veh)
		end
	end
	triggerServerEvent("respawnVehiclesInWater",getLocalPlayer(),vehiclesInWater)
end
addEvent("checkVehicleInWaterClient",true)
addEventHandler("checkVehicleInWaterClient",getRootElement(),checkVehicleInWaterClient)


function updatePlayTime()
    --for i,player in ipairs(getElementsByType("player")) do
    --    local account = getPlayerAccount(player)
        --if not isGuestAccount(account) then
        if getElementData(getLocalPlayer(),"logedin") then
            local playtime = getElementData(getLocalPlayer(),"alivetime")
            setElementData(getLocalPlayer(),"alivetime",playtime+1)    
        end    
        --end
    --end
end
setTimer(updatePlayTime, 60000, 0)

--bindKey("z", "down", "chatbox", "radiochat" )


local pingFails = 0
function playerPingCheck ()
    if getPlayerPing(getLocalPlayer()) > gameplayVariables["ping"] then
        pingFails = pingFails +1
        if pingFails == 5 then
            triggerServerEvent("kickPlayerOnHighPing",getLocalPlayer())
            return
        end
            startRollMessage2("Ping", "Your ping is over "..gameplayVariables["ping"].."! ("..pingFails.."/5)", 255, 22, 0 )
        if isTimer(pingTimer) then return end
        pingTimer = setTimer(function()
            pingFails = 0
        end,30000,1)
    end
end    
setTimer(playerPingCheck,4000,0)


local screenW, screenH = guiGetScreenSize()
addEventHandler("onClientRender",root,function() 
if not getElementData(getLocalPlayer(),"logedin") then return end
local oxygen = (getPedOxygenLevel(localPlayer)*0.00015) 
if isElementInWater (localPlayer) then 
dxDrawRectangle(screenW * 0.8155, screenH * 0.3555, screenW * 0.1508, screenH * 0.0052, tocolor(0 , 0, 0, 255), true) 
dxDrawRectangle(screenW * 0.8155, screenH * 0.3555, screenW * oxygen , screenH * 0.0052,tocolor(102, 178, 255, 255), true) 
end
end)


function killKnifeStelth(targetPlayer)
if isElement(targetPlayer) and isElement(source) then
if not getElementData(targetPlayer,"bandit") then
setElementData(source,"murders",getElementData(source,"murders") + 1)
else
setElementData(source,"banditskilled",getElementData(source,"banditskilled") + 1)
end
setElementData(targetPlayer,"blood",-3)
end 
end
addEventHandler("onClientPlayerStealthKill",getRootElement(),killKnifeStelth)

function healthandblod ()
if getElementData(getLocalPlayer(),"logedin") then
 if getElementHealth (getLocalPlayer()) <= 0 then
  setElementData(getLocalPlayer(),"blood",-999) 
  setElementHealth(getLocalPlayer(),100)
  end
 end
end
setTimer(healthandblod,1000,0)


function useBnd ( )
	if getElementData(localPlayer,"Bandage") >= 1 and getElementData(localPlayer,"bleeding") >= 1 then
		setPedAnimation (localPlayer,"BOMBER","BOM_Plant",-1,false,false,false,false)
		setElementData(playersource,"Bandage",getElementData(playersource,"Bandage")-1)
		setTimer( function ()
			setElementData(playersource,"bleeding",0)
		end,1500,1)
	end
end
bindKey ("1", "down", useBnd )

function usePain ( )
if getElementData(localPlayer,"Painkiller") >= 1 and getElementData(localPlayer,"pain") then
		setPedAnimation (localPlayer,"BOMBER","BOM_Plant",-1,false,false,false,false)
		setElementData(localPlayer,"Painkiller",getElementData(localPlayer,"Painkiller")-1)
		setTimer( function ()
			setElementData(localPlayer,"pain",false)
		end,1500,1)
	end
end
bindKey ("2", "down", usePain )

function useMor ( )
	if getElementData(localPlayer,"Morphine") >= 1 and getElementData(localPlayer,"brokenbone") then
		setPedAnimation (localPlayer,"BOMBER","BOM_Plant",-1,false,false,false,false)
		setElementData(localPlayer,"Morphine",getElementData(localPlayer,"Morphine")-1)
		setTimer( function ()
			setElementData(localPlayer,"brokenbone",false)
		end,1500,1)
	end
end
bindKey ( "3", "down", useMor )

function useMed ( )
	if getElementData(localPlayer,"Medic Kit") >= 1 and getElementData(localPlayer,"blood") <= 10500 then
		setPedAnimation (localPlayer,"BOMBER","BOM_Plant",-1,false,false,false,false)
    	setElementData(localPlayer,"Medic Kit",getElementData(localPlayer,"Medic Kit")-1)
		setTimer( function ()
		setElementData(localPlayer,"blood",getElementData(localPlayer,"blood") + 7000)
			if getElementData(localPlayer,"blood") > 12000 then
				setElementData(localPlayer,"blood", 12000)
			end
		end,1500,1)
	end
end
bindKey ( "4", "down", useMed )


local alpha = 255 
bindKey ( "aim_weapon", "both", 
  function ( _, state ) 
   if getPedWeaponSlot ( localPlayer ) == 6 or getPedWeaponSlot ( localPlayer ) == 9 then 
    if ( state == "down" ) then 
     alpha = 0 
    elseif ( state == "up" ) then 
     alpha = 255 
    end 
    for _, v in ipairs ( getElementsByType ( "object", root, true ) ) do 
     if isElementAttachedToBone ( v ) then 
      local id = getElementModel ( v ) 
      if ( id == 1669 ) then 
       setElementAlpha ( v, alpha )
      elseif ( id == 1809 ) then
       setElementAlpha ( v, alpha )
      end 
     end 
    end 
   end 
  end 
)

--RECOIL DAS ARMAS
function shakeCamera(weapon)
x,y,z = getPedBonePosition ( getLocalPlayer(), 26 )
if weapon == 30  then
createExplosion ( x,y,z + 10,12,false,0.2,false)
elseif weapon == 31  then
createExplosion ( x,y,z + 10,12,false,0.1,false)
end
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), shakeCamera )
------------------

local htmlvehrep = {
	{value = 0, r = 255, g = 0, b = 0},
	{value = 100, r = 255, g = 0, b = 0},
	{value = 200, r = 255, g = 10, b = 0},
	{value = 300, r = 255, g = 20, b = 0},
	{value = 400, r = 200, g = 30, b = 0},
	{value = 500, r = 170, g = 40, b = 0},
	{value = 600, r = 150, g = 60, b = 10},
	{value = 700, r = 130, g = 80, b = 20},
	{value = 800, r = 120, g = 90, b = 30},
	{value = 900, r = 90, g = 123, b = 40},
	{value = 1000, r = 79, g = 133, b = 51},
}


function getColorWithPartvehrep(value)
	for i, htmlRgB in ipairs(htmlvehrep) do
		if value <= htmlRgB.value then
			return htmlRgB.r,htmlRgB.g,htmlRgB.b
		end
	end
end

bindKey("space","down",function()
	if getElementData(localPlayer,"repairerTab") == true then
		triggerServerEvent("onClientMovesWhileAnimation",localPlayer)
		setElementData(localPlayer,"repairerTab",false)
	end
end)

wx, hy = guiGetScreenSize()
local x, y = wx/2, hy/10
		   
addEventHandler("onClientRender",root,
function()
    local x,y,z = getElementPosition(localPlayer)
    for i,veh in ipairs(getElementsByType("vehicle",getRootElement(),true)) do
	if getElementData(localPlayer,"repairerTab") == true then
        if veh ~= getPedOccupiedVehicle(localPlayer) then
            local vx,vy,vz = getElementPosition(veh)
            if getDistanceBetweenPoints3D(x,y,z,vx,vy,vz) <= 7 then
                local sx,sy = getScreenFromWorldPosition(vx,vy,vz)
                if sx then
					local start = 0
					local dw = math.floor(100/255*getElementHealth(veh))
						if getElementHealth(veh) < 1 then
							dw = 0
						end
						if getElementHealth(veh) > 1000 then
							dw = 100
						end
						if ( getElementHealth(veh) or 0 ) > 0 then
							r,g,b = getColorWithPartvehrep(getElementHealth(veh))
						else
							r,g,b = 255,50,0
						end
						local dw2 = math.floor(100/1000*getElementHealth(veh))
						local twd =  dxGetTextWidth(tostring(dw2.."%"),1,"default-bold")
						dxDrawRectangle(wx/2-394/2-1, hy-141+start,394,16, tocolor(0,0,0, 190))
						dxDrawRectangle(wx/2-394/2, hy-140+start,dw,14, tocolor(r,g,b,180)) 
						dxDrawText(dw2.."%",wx/2-twd/2,hy-140+start,100,20,tocolor ( 255,255,255,255 ), 1, "default-bold" )
						local twd =  dxGetTextWidth("To Stop Repair, Button < space >!",1,"default-bold")
						dxDrawText("To Stop Repair, Button < space >!",wx/2-1-twd/2,hy-161+start,100,20,tocolor ( 0,0,0,255 ), 1, "default-bold" )
						dxDrawText("To Stop Repair, Button < space >!",wx/2-twd/2,hy-160+start,100,20,tocolor ( 200,200,22, 255 ), 1, "default-bold" )
					end
               end
            end
        end
    end
end)
--hud vehicles
local sW,sH = guiGetScreenSize()
local color = {}

addEventHandler("onClientRender",getRootElement(),function()
    if (getElementData (localPlayer, "hideTable") or {}).hudvehicle then return true end
    local veh = getPedOccupiedVehicle(getLocalPlayer())
    if veh then
        local parent = getElementData(veh,"parent")
        local eng_health = getElementData(parent,"Engine_inVehicledam") or 0
        local tire_health = getElementData(parent,"Tire_inVehicledam") or 0
        local parts_health = getElementData(parent,"Parts_inVehicledam") or 0
        local fuel = getElementData(parent,"fuel") or 0
        local maxfuel = getElementData(veh,"maxfuel")
        if maxfuel == false or nil then return end
        if fuel == false or nil then return end
        if eng_health == 0 and getElementData(parent,"Engine_inVehicle") > 0 then
            color.engine_r = 0
            color.engine_g = 255
            color.engine_b = 0
        elseif eng_health > 0 and eng_health < 5 and getElementData(parent,"Engine_inVehicle") > 0 then
            color.engine_r = 255
            color.engine_g = 255
            color.engine_b = 0
        elseif eng_health >= 5 and getElementData(parent,"Engine_inVehicle") > 0 then
            color.engine_r = 255
            color.engine_g = 0
            color.engine_b = 0
        else
            color.engine_r = 255
            color.engine_g = 0
            color.engine_b = 0
        end
        -- status wheels
        if tire_health == 0 and getElementData(parent,"Tire_inVehicle") > 0 then
            color.tire_r = 0
            color.tire_g = 255
            color.tire_b = 0
        elseif tire_health > 0 and tire_health < 5 and getElementData(parent,"Tire_inVehicle") > 0 then
            color.tire_r = 255
            color.tire_g = 255
            color.tire_b = 0
        elseif tire_health >= 5 and getElementData(parent,"Tire_inVehicle") > 0 then
            color.tire_r = 255
            color.tire_g = 0
            color.tire_b = 0
        else
            color.tire_r = 255
            color.tire_g = 0
            color.tire_b = 0
        end
        -- статус Tank Partsа
        if parts_health == 0  and getElementData(parent,"Parts_inVehicle") > 0 then
            color.parts_r = 0
            color.parts_g = 255
            color.parts_b = 0
        elseif parts_health > 0 and parts_health < 5  and getElementData(parent,"Parts_inVehicle") > 0 then
            color.parts_r = 255
            color.parts_g = 255
            color.parts_b = 0
        elseif parts_health >= 5   and getElementData(parent,"Parts_inVehicle") > 0 then
            color.parts_r = 255
            color.parts_g = 0
            color.parts_b = 0
        else
            color.parts_r = 255
            color.parts_g = 0
            color.parts_b = 0
        end
        if fuel > maxfuel/2 then
            color.fuel_r = 0
            color.fuel_g = 255
            color.fuel_b = 0
        elseif fuel <= maxfuel/2 and fuel > 10 then
            color.fuel_r = 255
            color.fuel_g = 255
            color.fuel_b = 0
        elseif fuel < 10 then
            color.fuel_r = 255
            color.fuel_g = 0
            color.fuel_b = 0
        end 
        -- statusbar armor
        local arm = math.floor(getElementData(getElementData(veh,"parent"),"vehicle_armor") or 0)
        dxDrawBox(sW * 0.005,sH * 0.320,100,5,tocolor(0,0,0,100),tocolor(255,255,255,50))
        dxDrawBox(sW * 0.005,sH * 0.320,arm/10,5,tocolor(0,0,255,100),tocolor(255,255,255,50))
        -- statusbar health
        local health = math.floor(getElementHealth(veh) or 0)
        dxDrawBox(sW * 0.005,sH * 0.335,100,5,tocolor(0,0,0,100),tocolor(255,255,255,50)) -- 320
        dxDrawBox(sW * 0.005,sH * 0.335,health/10,5,tocolor(0,255,0,100),tocolor(255,255,255,50)) -- 320
        -- box name detail
        dxDrawBox(sW * 0.005,sH * 0.350,sW * 0.060,sH * 0.015,tocolor(0,0,0,100),tocolor(255,255,255,50))
        dxDrawBox(sW * 0.005,sH * 0.370,sW * 0.060,sH * 0.015,tocolor(0,0,0,100),tocolor(255,255,255,50))
        dxDrawBox(sW * 0.005,sH * 0.390,sW * 0.060,sH * 0.015,tocolor(0,0,0,100),tocolor(255,255,255,50))
        dxDrawBox(sW * 0.005,sH * 0.410,sW * 0.060,sH * 0.015,tocolor(0,0,0,100),tocolor(255,255,255,50))
        -- box detail kolvo
        dxDrawBox(sW * 0.070,sH * 0.350,sW * 0.025,sH * 0.015,tocolor(0,0,0,100),tocolor(255,255,255,50))
        dxDrawBox(sW * 0.070,sH * 0.370,sW * 0.025,sH * 0.015,tocolor(0,0,0,100),tocolor(255,255,255,50))
        dxDrawBox(sW * 0.070,sH * 0.390,sW * 0.025,sH * 0.015,tocolor(0,0,0,100),tocolor(255,255,255,50))
        dxDrawBox(sW * 0.070,sH * 0.410,sW * 0.025,sH * 0.015,tocolor(0,0,0,100),tocolor(255,255,255,50))
        -- box detail status
        dxDrawBox(sW * 0.100,sH * 0.350,sW * 0.003,sH * 0.015,tocolor(color.engine_r,color.engine_g,color.engine_b,100),tocolor(255,255,255,50)) -- engine
        dxDrawBox(sW * 0.100,sH * 0.370,sW * 0.003,sH * 0.015,tocolor(color.tire_r,color.tire_g,color.tire_b,100),tocolor(255,255,255,50)) -- tire
        dxDrawBox(sW * 0.100,sH * 0.390,sW * 0.003,sH * 0.015,tocolor(color.parts_r,color.parts_g,color.parts_b,100),tocolor(255,255,255,50)) -- needparts
        dxDrawBox(sW * 0.100,sH * 0.410,sW * 0.003,sH * 0.015,tocolor(color.fuel_r,color.fuel_g,color.fuel_b,100),tocolor(255,255,255,50)) -- fuel
        -- text for box 1 name detail
        dxDrawText ("Engine",sW * 0.007,sH * 0.350-0.001,sW * 0.060,sH * 0.015,tocolor(255,255,255,255),0.8,"default-bold")
        dxDrawText ("Tire",sW * 0.007,sH * 0.370-0.001,sW * 0.060,sH * 0.015,tocolor(255,255,255,255),0.8,"default-bold")   
        dxDrawText ("TKP",sW * 0.007,sH * 0.390-0.001,sW * 0.060,sH * 0.015,tocolor(255,255,255,255),0.8,"default-bold")    
        dxDrawText ("Fuel",sW * 0.007,sH * 0.410-0.001,sW * 0.060,sH * 0.015,tocolor(255,255,255,255),0.8,"default-bold")   
        -- text for box 2 kolvo detail
        dxDrawText ("".. math.floor(tostring(getElementData(getElementData(veh,"parent"),"Engine_inVehicle") or 0)) .."/".. tostring(getElementData(veh,"needengines")).. "",sW * 0.072,sH * 0.350-0.001,sW * 0.060,sH * 0.015,tocolor(255,255,255,255),0.8,"default-bold") -- engine
        dxDrawText ("".. math.floor(tostring(getElementData(getElementData(veh,"parent"),"Tire_inVehicle") or 0)) .."/".. tostring(getElementData(veh,"needtires")).."",sW * 0.072,sH * 0.370-0.001,sW * 0.060,sH * 0.015,tocolor(255,255,255,255),0.8,"default-bold") -- tire
        dxDrawText ("".. math.floor(tostring(getElementData(getElementData(veh,"parent"),"Parts_inVehicle") or 0)) .."/"..tostring(getElementData(veh,"needparts")).."",sW * 0.072,sH * 0.390-0.001,sW * 0.060,sH * 0.015,tocolor(255,255,255,255),0.8,"default-bold") -- need parts
        dxDrawText ("".. math.floor(tostring(getElementData(getElementData(veh,"parent"),"fuel") or 0)).."/"..tostring(getElementData(veh,"maxfuel")).."",sW * 0.072,sH * 0.410-0.001,sW * 0.060,sH * 0.015,tocolor(255,255,255,255),0.8,"default-bold") -- fuel
    end 
end)

function dxDrawBox(x, y, w, h, rcolor, lcolor)
    dxDrawLine(x - 1, y - 1, x - 1, y + h, lcolor, 1)
    dxDrawLine(x + w, y - 1, x + w, y + h, lcolor, 1)
    dxDrawLine(x - 1, y + h, x + w, y + h, lcolor, 1)
    dxDrawLine(x - 1, y - 1, x + w, y - 1, lcolor, 1)
    dxDrawRectangle(x, y, w, h, rcolor)
end