local theTableMenuScroll = {}
function startRollMessageMenu(text, r, g, b, data)
	table.insert(theTableMenuScroll,{text,r,g,b,data})
end

function dxDrawingColorTextMenuScroll(str, ax, ay, bx, by, color, alpha, scale, font, alignX, alignY)

  if alignX then
    if alignX == "center" then
    elseif alignX == "right" then
      local w = dxGetTextWidth(str:gsub("#%x%x%x%x%x%x",""), scale, font)
      ax = bx - w
    end
  end

  if alignY then
    if alignY == "center" then
      local h = dxGetFontHeight(scale, font)
      ay = ay + (by-ay)/2 - h/2
    elseif alignY == "bottom" then
      local h = dxGetFontHeight(scale, font)
      ay = by - h
    end
  end

  local pat = "(.-)#(%x%x%x%x%x%x)"
  local s, e, cap, col = str:find(pat, 1)
  local last = 1
  while s do
    if cap == "" and col then color = tocolor(tonumber("0x"..col:sub(1, 2)), tonumber("0x"..col:sub(3, 4)), tonumber("0x"..col:sub(5, 6)), alpha) end
    if s ~= 1 or cap ~= "" then
      local w = dxGetTextWidth(cap, scale, font)
      dxDrawText(cap, ax, ay, ax + w, by, color, scale, font)
      ax = ax + w
      color = tocolor(tonumber("0x"..col:sub(1, 2)), tonumber("0x"..col:sub(3, 4)), tonumber("0x"..col:sub(5, 6)), alpha)
    end
    last = e + 1
    s, e, cap, col = str:find(pat, last)
  end
  if last <= #str then
    cap = str:sub(last)
    local w = dxGetTextWidth(cap, scale, font)
    dxDrawText(cap, ax, ay, ax + w, by, color, scale, font)
  end
end

local boxSpace = dxGetFontHeight(1,"default-bold")+dxGetFontHeight(1,"default-bold")*0.1

local optionsTable = {
["player"] = {
{"Give Painkillers"},
{"Give Bandage"},
{"Give Morphine"},
},
}
------------------------------------------------------------------------------
--MENU
function showClientMenuItem(arg1,arg2,arg3,arg4)
theTableMenuScroll = {}
setElementData(localPlayer,"usedItemTrue", false)
numberMenuScroll = 1
if arg1 == "Take" then
	startRollMessageMenu("Pegar "..arg2,50,255,50,arg2)
	setElementData(localPlayer,"usedItemTrue", true)
end
if arg1 == "stop" then
	disableMenu()
	refreshLoot(false)
end
if arg1 == "Helicrashsite" then
	startRollMessageMenu("Gear ",255,255,255,"helicrashsite")
	setElementData(localPlayer,"usedItemTrue", true)
end
if arg1 == "Weaponbox" then
	startRollMessageMenu("Gear",255,255,255,"weaponbox")
	setElementData(localPlayer,"usedItemTrue", true)
    end
if arg1 == "Hospitalbox" then
	startRollMessageMenu("Gear ",255,255,255,"hospitalbox")
	setElementData(localPlayer,"usedItemTrue", true)
end

if arg1 == "Vehicle" then
	startRollMessageMenu("Gear ("..arg2.."): "..getLootCurrentSlots(arg4).."/"..(getElementData(arg4,"MAX_Slots") or 0).." Slots",0,255,0,"vehicle")
	setElementData(localPlayer,"usedItemTrue", true)
	if getElementData(getElementData(arg3,"parent"),"tent") then
		startRollMessageMenu("Remove Tent",0,255,0,"tent")
		return
	end
	--2
	if getElementHealth(arg3) < 1000 and getElementHealth(arg3) >= 50 then
		startRollMessageMenu("Reparar ("..arg2.."): " ..tostring(math.floor(getElementHealth(arg3)/10)).."%",0,255,0,"repairvehicle")
		setElementData(localPlayer,"usedItemTrue", true)
	end
	
	
	if (getElementData(arg4,"fuel") or 0) < getVehicleMaxFuelLoot(arg4) then
		startRollMessageMenu("Colocar Gasolina ("..tostring(math.floor(getElementData(arg4,"fuel") or 0)).."/"..getVehicleMaxFuelLoot(arg4)..")",255,0,0,"FuelOne")
		setElementData(localPlayer,"usedItemTrue", true)
	end
	
	if (getElementData(arg4,"fuel") or 0) >= 20 then
		startRollMessageMenu("Tirar Gasolina ("..tostring(math.floor(getElementData(arg4,"fuel") or 0)).."/"..getVehicleMaxFuelLoot(arg4)..")",255,255,0,"FuelTwo")
		setElementData(localPlayer,"usedItemTrue", true)
	end
	
	local tires,engine,parts = getVehicleAddonInfos (getElementModel(arg3))
	if (getElementData(arg4,"Tire_inVehicle") or 0) < tires then
		startRollMessageMenu("Colocar Pneu ("..(getElementData(arg4,"Tire_inVehicle") or 0).."/"..tires..")",255,0,0,"TireOne")
		setElementData(localPlayer,"usedItemTrue", true)
	end
	if (getElementData(arg4,"Engine_inVehicle") or 0) < engine then
		startRollMessageMenu("Colocar Motor ("..(getElementData(arg4,"Engine_inVehicle") or 0).."/"..engine..")",255,0,0,"EngineOne")
		setElementData(localPlayer,"usedItemTrue", true)
	end
	if (getElementData(arg4,"Parts_inVehicle") or 0) < parts then
		startRollMessageMenu("Colocar Tank Parts ("..(getElementData(arg4,"Parts_inVehicle") or 0).."/"..parts..")",255,0,0,"PartsOne")
		setElementData(localPlayer,"usedItemTrue", true)
	end
	
	if (getElementData(arg4,"Tire_inVehicle") or 0) > 0 then
		startRollMessageMenu("Tirar Pneu ("..(getElementData(arg4,"Tire_inVehicle") or 0).."/"..tires..")",255,255,0,"TireTwo")
		setElementData(localPlayer,"usedItemTrue", true)
	end
	if (getElementData(arg4,"Engine_inVehicle") or 0) > 0 then
		startRollMessageMenu("Tirar Motor ("..(getElementData(arg4,"Engine_inVehicle") or 0).."/"..engine..")",255,255,0,"EngineTwo")
		setElementData(localPlayer,"usedItemTrue", true)
	end
	if (getElementData(arg4,"Parts_inVehicle") or 0) > 0 then
		startRollMessageMenu("Tirar Tank Parts ("..(getElementData(arg4,"Parts_inVehicle") or 0).."/"..parts..")",255,255,0,"PartsTwo")
		setElementData(localPlayer,"usedItemTrue", true)
	end	
end
if arg1 == "Player" then
	--1
	if getElementData(arg2,"bleeding") > 0 and getElementData(getLocalPlayer(),"Bandage") >= 1 then
		startRollMessageMenu("Give Bandage",255,255,255,"bandage")
		setElementData(localPlayer,"usedItemTrue", true)
	end	
	if getElementData(arg2, "blood") < 11900 and getElementData(getLocalPlayer(), "Blood Bag") >= 1 then
	  startRollMessageMenu("Administer Blood Bag",255,255,255,"giveblood")
	  setElementData(localPlayer,"usedItem","giveblood")
	end
end
if arg1 == "Dead" then
	startRollMessageMenu("Gear ("..arg2..")",0,255,0,"dead")
	startRollMessageMenu("Check Body",0,255,0,"deadreason")
	setElementData(localPlayer,"usedItemTrue", true)
end
if arg1 == "Fireplace" then
	if getElementData(getLocalPlayer(),"Raw Meat") >= 1 then
		startRollMessageMenu("Cook Meat",255,255,255,"fireplace")
		setElementData(localPlayer,"usedItemTrue", true)
	end
end
if arg1 == "patrol" then
	if getElementData(getLocalPlayer(),"Empty Gas Canister") >= 1 then
		startRollMessageMenu("Refill (Empty Gas Canister)",255,255,255,"patrolstation")
		setElementData(localPlayer,"usedItemTrue", true)
	end	
end
if arg1 == "Wirefence" then
	if getElementData(getLocalPlayer(),"Toolbox") >= 1 then
		startRollMessageMenu("Remove Wirefence",255,255,255,"wirefence")
		setElementData(localPlayer,"usedItemTrue", true)
	end	
end
if arg1 == "SandBags" then
   if getElementData(getLocalPlayer(),"Лопата") >= 1 then
		startRollMessageMenu("Убрать мешки с песком",255,255,255,"sandbags")
		setElementData(localPlayer,"usedItemTrue", true)
   end   
end
if arg1 == "Mine" then
	if getElementData(getLocalPlayer(),"Лопата") >= 1 then
		startRollMessageMenu("Убрать мину",255,255,255,"wirefence")
		setElementData(localPlayer,"usedItemTrue", true)
	end	
end
if arg1 == "Gear" then
	startRollMessageMenu("Gear",255,255,255,"itemloot")
	setElementData(localPlayer,"usedItemTrue", true)
end
numberMenuScroll = 1
end
addEvent("showClientMenuItem",true)
addEventHandler("showClientMenuItem",getLocalPlayer(),showClientMenuItem)

function PlayerScrollMenuLalitka (key,keyState,arg)
	if getElementData(localPlayer,"usedItemTrue") then
		if ( keyState == "down" ) then
			if arg == "up" then
				numberMenuScroll = numberMenuScroll-1
				if numberMenuScroll < 1 then
					numberMenuScroll = #theTableMenuScroll
				end
			elseif arg == "down" then
				numberMenuScroll = numberMenuScroll+1
				if numberMenuScroll > #theTableMenuScroll then
					numberMenuScroll = 1
				end
			end
		end
	end
end
bindKey ( "mouse_wheel_up", "down", PlayerScrollMenuLalitka, "up" )
bindKey ( "mouse_wheel_down", "down", PlayerScrollMenuLalitka, "down" )

function disableMenu()
	theTableMenuScroll = {}
	setElementData(localPlayer,"usedItemTrue", false)
	setNewbieInfo (false,"","")
end
addEvent("disableMenu",true)
addEventHandler("disableMenu",getLocalPlayer(),disableMenu)

function getPlayerInCol(tab)
	for theKey,thePlayer in ipairs(tab) do
		if thePlayer ~= getLocalPlayer() then
			return true
		end
	end
	return false
end

isInFirePlace = false
function onPlayerTargetPickup (theElement)
if theElement == getLocalPlayer() then
	if getElementData(source,"parent") == getLocalPlayer() then return end
		local player = getPlayerInCol(getElementsWithinColShape ( source, "player" ))
		if getPedOccupiedVehicle(getLocalPlayer()) then
			return
		end
		isInFirePlace = false
		setElementData(getLocalPlayer(),"isInFirePlace",false)
		if getElementData(source,"player") then
			showClientMenuItem("Player",getElementData(source,"parent"))
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			return
		end
		if player then
			return
		end
		if getElementData(source,"patrolstation") then
			showClientMenuItem("patrol")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			setNewbieInfo (true,"patrolstation","Press '-' or 'middle-mouse' to refill a canister!\n REQUIRED: Empty Gas Canister",source)
			return
		end
		if getElementData(source,"wirefence") then
			showClientMenuItem("Wirefence")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			setNewbieInfo (true,"Wirefence","Press '-' or 'middle-mouse' to remove the fence!\n REQUIRED: Toolbox",source)
			return
		end
		if getElementData(source,"sandbags") then
			showClientMenuItem("SandBags")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			setNewbieInfo (true,"Мешки с песком","Нажмите среднюю кнопку мыши чтобы убрать мешки с песком!\n Требуется:Лопата",source)
			return
		end
		if getElementData(source,"mine") then
			showClientMenuItem("Mine")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			setNewbieInfo (true,"Мина","Нажмите среднюю кнопку мыши чтобы убрать Мину!\n Требуется:Лопата",source)
			return
		end
		if getElementData(source,"fireplace") then
			showClientMenuItem("Fireplace")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			setNewbieInfo (true,"Fireplace","Press '-' or 'middle-mouse' to cook meat!\n REQUIRED: Raw Meat",source)
			isInFirePlace = true
			setElementData(getLocalPlayer(),"isInFirePlace",true)
			return
		end
		if getElementData(source,"deadman") then
			showClientMenuItem("Dead",getElementData(source,"playername"))
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Gear ("..getElementData(source,"playername")..")")
			setNewbieInfo (true,"Gear","Press J to access the gear menu!",source)
			return
		end
		if getElementData(source,"item") then
			showClientMenuItem("Take",getElementData(source,"item"))
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",false)
			setNewbieInfo (true,"Item pickup","Press '-' or 'middle-mouse' to pick this item up!",source)
			return
		end
		if getElementData(source,"weaponbox") then
			showClientMenuItem("Weaponbox","weaponbox")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Gear")
			setNewbieInfo (true,"weaponbox","Press J to open Inventory",source)
			return
		end
		if getElementData(source,"helicrash") then
			showClientMenuItem("Helicrashsite","helicrash")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Gear (Helicrash)") --(Helicrash)
			setNewbieInfo (true,"Gear","Press J to access the gear menu!",source)
			return
		end
		if getElementData(source,"hospitalbox") then
			showClientMenuItem("Hospitalbox","hospitalbox")
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Gear (Hospitalbox)")
			setNewbieInfo (true,"Gear","Press J to access the gear menu!",source)
			return
		end
		if getElementData(source,"vehicle") then
			if not getElementData(source,"deadVehicle") then
			showClientMenuItem("Vehicle",(getVehicleName(getElementData(source,"parent")) or "Tent"),getElementData(source,"parent"),source)
			setElementData(getLocalPlayer(),"currentCol",source)
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Gear ("..(getVehicleName(getElementData(source,"parent")) or "Tent")..")")
			setNewbieInfo (true,"Gear","Press J to acess the gear menu!",source)
			return
			end
		end
		if getElementData(source,"itemloot") then
			showClientMenuItem("Gear")
			setElementData(getLocalPlayer(),"loot",true)
			setElementData(getLocalPlayer(),"lootname","Gear")
			setElementData(getLocalPlayer(),"currentCol",source)
			setNewbieInfo (true,"Gear","Press J to access the gear menu!",source)
			return
		end
	showClientMenuItem("stop")
end	
end
addEventHandler("onClientColShapeHit",getRootElement(),onPlayerTargetPickup)

function onPlayerTargetPickup (theElement)
if theElement == getLocalPlayer() then
	local players = getElementsWithinColShape ( source, "player" )
	if players == getLocalPlayer() then --[[return ]]end
	showClientMenuItem("stop")
	setElementData(getLocalPlayer(),"loot",false)
	setElementData(getLocalPlayer(),"currentCol",false)
	setNewbieInfo (false,"","")
	isInFirePlace = false
	setElementData(getLocalPlayer(),"isInFirePlace",false)
end
end
addEventHandler("onClientColShapeLeave",getRootElement(),onPlayerTargetPickup)

--Newbie Infos
local screenWidth, screenHeight = guiGetScreenSize()
local newbieShow = false
local newbieHead = "-"
local newbieText = "-"
local newbiePosition = 0,0,0

function setNewbieInfo (show,head,text,element)
newbieShow = show
newbieHead = head
newbieText = text
newbiePosition = element
end

addEventHandler("onClientRender", getRootElement(),function()
    local boxSpace = dxGetFontHeight(1,"default-bold")+dxGetFontHeight(1,"default-bold")*0.1
    local veh = getPedOccupiedVehicle (getLocalPlayer())
    if veh then
        disableMenu()
    else
        for id, value in pairs(theTableMenuScroll) do
            if id == numberMenuScroll then
                r1menu,g1menu,b1menu = 109,163,61
            else
                r1menu,g1menu,b1menu = 19,19,19
            end
            dxDrawRectangle ( 0, 250+id*boxSpace, screenWidth*0.2, boxSpace, tocolor (r1menu,g1menu,b1menu,180) )
            dxDrawingColorTextMenuScroll(value[1],6, 250+id*boxSpace, 6, 250+(id+1)*boxSpace, tocolor(value[2],value[3],value[4],170),170, 1, "default-bold", "center", "center")
        end
    end
    if newbieShow == false then return end
    local x,y,z = getElementPosition(newbiePosition)
    local x,y = getScreenFromWorldPosition (x,y,z)
	local length = dxGetTextWidth(newbieText,1,"default-bold")
		if x == false or y == false or z == false then return end
		dxDrawingColorText(newbieHead,x-length/2-screenWidth*0.01,y, x+length/2+screenWidth*0.01, y+screenHeight*0.03, tocolor(100, 255, 100, 200),0.5, 1.1, "default-bold", "center", "center")
		dxDrawingColorText(newbieText,x-length/2-screenWidth*0.01,y+screenHeight*0.03, x+length/2+screenWidth*0.01, y+screenHeight*0.07, tocolor(100, 255, 100, 200),0.5, 1, "default-bold", "center", "center")  

end)

function fireRaiseTemperature ()
	if isInFirePlace then
		if getElementData(getLocalPlayer(),"temperature") <= 38 then
			setElementData(getLocalPlayer(),"temperature",getElementData(getLocalPlayer(),"temperature")+0.25)
		end
	end
end
setTimer(fireRaiseTemperature,10000,0)

------------------------------------------------------------------------------

unbindKey("mouse3","both")
function onPlayerPressMiddleMouse (key,keyState)
if ( keyState == "down" ) then
		if not getElementData(localPlayer,"usedItemTrue") then return end
		local itemName = getMenuMarkedItem()
		if itemName == "helicrashsite" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Gear (Helicrash)" -- Helicrash
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "itemloot" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Gear"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "wirefence" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Remove Wirefence"
			triggerServerEvent("removeWirefence",getLocalPlayer(),getElementData(col,"parent"))
			disableMenu()
			return
		end
		if itemName == "sandbags" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Убрать мешки с песком"
			triggerServerEvent("removeSandBags",getLocalPlayer(),getElementData(col,"parent"))
			disableMenu()
			return
		end
		if itemName == "mine" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Убрать мину"
			triggerServerEvent("removeSandBags",getLocalPlayer(),getElementData(col,"parent"))
			disableMenu()
			return
		end
		if itemName == "hospitalbox" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Gear (Hospitalbox)"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "vehicle" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Gear ("..(getVehicleName(getElementData(col,"parent")) or "Tent")..")"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "repairvehicle" then
			if getElementData(getLocalPlayer(),"Toolbox") >= 1 then
				local col = getElementData(getLocalPlayer(),"currentCol")
				triggerServerEvent("repairVehicle",getLocalPlayer(),getElementData(col,"parent"))
			else
				startRollMessage2("Inventory", "Você não tem Toolbox!", 255, 22, 0 )
			end	
			disableMenu()
			return
		end
	
		if itemName == "FuelOne" then
			if (getElementData(getLocalPlayer(),"Full Gas Canister") or 0) >= 1 then
				local col = getElementData(getLocalPlayer(),"currentCol")
				if getElementData(col,"fuel")+20 < getVehicleMaxFuelLoot(col) then
					addingfuel = 20
				elseif getElementData(col,"fuel")+20 > getVehicleMaxFuel(col)+15 then
					triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Бак полный!",255,22,0)
					disableMenu()
					return
				else
					addingfuel = getVehicleMaxFuelLoot(col)-getElementData(col,"fuel")
				end
				if (getElementData(col,"Parts_inVehicle") or 0) < 1 then
					addingfuel = addingfuel/3
					triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Resultante do transporte de gasolina!",22,255,0)
				end
				setElementData(getLocalPlayer(),"Full Gas Canister",getElementData(getLocalPlayer(),"Full Gas Canister")-1)
				setElementData(getLocalPlayer(),"Empty Gas Canister",(getElementData(getLocalPlayer(),"Empty Gas Canister") or 0)+1)
				setElementData(col,"fuel",getElementData(col,"fuel")+addingfuel)
				--triggerServerEvent("AnimAddFuel", getLocalPlayer(), getLocalPlayer())
				triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Veículos movidos por "..addingfuel.." л.!",22,255,0)
			else
				startRollMessage2("Inventory", "Você não tem latas vazias!", 255, 22, 0 )
			end
			disableMenu()
			return
		end
		
		if itemName == "FuelTwo" then
			if (getElementData(getLocalPlayer(),"Empty Gas Canister") or 0) >= 1 then
				local col = getElementData(getLocalPlayer(),"currentCol")
				setElementData(getLocalPlayer(),"Full Gas Canister",getElementData(getLocalPlayer(),"Full Gas Canister")+1)
				setElementData(getLocalPlayer(),"Empty Gas Canister",(getElementData(getLocalPlayer(),"Empty Gas Canister") or 0)-1)
				--triggerServerEvent("AnimAddFuel", getLocalPlayer(), getLocalPlayer())
				setElementData(col,"fuel",getElementData(col,"fuel")-20)
				triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Você fundiu 20l. gasolina!",22,255,0)
			else
				startRollMessage2("Inventory", "Você não tem latas vazias!", 255, 22, 0 )
			end
			disableMenu()
			return
		end
		
		if itemName == "TireOne" then
			if getElementData(getLocalPlayer(),"Toolbox") >= 1 then
				if (getElementData(getLocalPlayer(),"Tire") or 0) > 0 then	
					local col = getElementData(getLocalPlayer(),"currentCol")
					setElementData(col,"Tire_inVehicle",(getElementData(col,"Tire_inVehicle") or 0)+1)
					setElementData(getLocalPlayer(),"Tire",(getElementData(getLocalPlayer(),"Tire") or 0)-1)
					--triggerServerEvent("AnimAddFuel", getLocalPlayer(), getLocalPlayer())
					startRollMessage2("Inventory", "Você coloca uma roda!", 22, 255, 0 )
				else
					startRollMessage2("Inventory", "Você não tem rodas!", 255, 22, 0 )
				end
			else
				startRollMessage2("Inventory", "Você não tem Tools!", 255, 22, 0 )
			end
			disableMenu()
			return
		end
		
		if itemName == "TireTwo" then
			if getElementData(getLocalPlayer(),"Toolbox") >= 1 then
				local col = getElementData(getLocalPlayer(),"currentCol")
				if (getElementData(col,"Tire_inVehicle") or 0) > 0 then	
					local col = getElementData(getLocalPlayer(),"currentCol")
					setElementData(col,"Tire_inVehicle",(getElementData(col,"Tire_inVehicle") or 0)-1)
					setElementData(getLocalPlayer(),"Tire",(getElementData(getLocalPlayer(),"Tire") or 0)+1)
					--triggerServerEvent("AnimAddFuel", getLocalPlayer(), getLocalPlayer())
					startRollMessage2("Inventory", "Você removeu uma roda!", 22, 255, 0 )
				else
					startRollMessage2("Inventory", "No domínio dos transportes, não há rodas!", 255, 22, 0 )
				end
			else
				startRollMessage2("Inventory", "Você não tem Tools!", 255, 22, 0 )
			end
			disableMenu()
			return
		end
		
		if itemName == "EngineOne" then
			if getElementData(getLocalPlayer(),"Toolbox") >= 1 then
				if (getElementData(getLocalPlayer(),"Engine") or 0) > 0 then	
					local col = getElementData(getLocalPlayer(),"currentCol")
					setElementData(col,"Engine_inVehicle",(getElementData(col,"Engine_inVehicle") or 0)+1)
					setElementData(getLocalPlayer(),"Engine",(getElementData(getLocalPlayer(),"Engine") or 0)-1)
					---triggerServerEvent("AnimAddFuel", getLocalPlayer(), getLocalPlayer())
					startRollMessage2("Inventory", "Você coloca um motor!", 22, 255, 0 )
				else
					startRollMessage2("Inventory", "Você não tem o motor!", 255, 22, 0 )
				end
			else
				startRollMessage2("Inventory", "Você não tem Tools!", 255, 22, 0 )
			end
			disableMenu()
			return
		end
		
		
		if itemName == "EngineTwo" then
			if getElementData(getLocalPlayer(),"Toolbox") >= 1 then
				local col = getElementData(getLocalPlayer(),"currentCol")
				if (getElementData(col,"Engine_inVehicle") or 0) > 0 then	
					local col = getElementData(getLocalPlayer(),"currentCol")
					setElementData(col,"Engine_inVehicle",(getElementData(col,"Engine_inVehicle") or 0)-1)
					setElementData(getLocalPlayer(),"Engine",(getElementData(getLocalPlayer(),"Engine") or 0)+1)
					--triggerServerEvent("AnimAddFuel", getLocalPlayer(), getLocalPlayer())
					startRollMessage2("Inventory", "Você removeu um motor!", 22, 255, 0 )
				else
					startRollMessage2("Inventory", "Nos transportes, não há motor!", 255, 22, 0 )
				end
			else
				startRollMessage2("Inventory", "Você não tem Tools!", 255, 22, 0 )
			end
			disableMenu()
			return
		end
		
		if itemName == "PartsOne" then
		      if getElementData(getLocalPlayer(),"Toolbox") >= 1 then
				if (getElementData(getLocalPlayer(),"Tank Parts") or 0) > 0 then	
					local col = getElementData(getLocalPlayer(),"currentCol")
					setElementData(col,"Parts_inVehicle",(getElementData(col,"Parts_inVehicle") or 0)+1)
					setElementData(getLocalPlayer(),"Tank Parts",(getElementData(getLocalPlayer(),"Tank Parts") or 0)-1)
					--triggerServerEvent("AnimAddFuel", getLocalPlayer(), getLocalPlayer())
					startRollMessage2("Inventory", "Você coloca o tanque de gasolina!", 22, 255, 0 )
				else
					startRollMessage2("Inventory", "Você não tem o tanque de gasolina!", 255, 22, 0 )
				end
			else
				startRollMessage2("Inventory", "Você não tem Tools!", 255, 22, 0 )
			end
			disableMenu()
			return
		end
		
		if itemName == "PartsTwo" then
			if getElementData(getLocalPlayer(),"Toolbox") >= 1 then
				local col = getElementData(getLocalPlayer(),"currentCol")
				if (getElementData(col,"Parts_inVehicle") or 0) > 0 then	
					local col = getElementData(getLocalPlayer(),"currentCol")
					setElementData(col,"Parts_inVehicle",(getElementData(col,"Parts_inVehicle") or 0)-1)
					setElementData(getLocalPlayer(),"Tank Parts",(getElementData(getLocalPlayer(),"Tank Parts") or 0)+1)
					--triggerServerEvent("AnimAddFuel", getLocalPlayer(), getLocalPlayer())
					startRollMessage2("Inventory", "Você removeu o tanque de gasolina!", 22, 255, 0 )
				else
					startRollMessage2("Inventory", "Nos transportes, há um tanque de gasolina!", 255, 22, 0 )
				end
			else
				startRollMessage2("Inventory", "Você não tem Tools!", 255, 22, 0 )
			end
			disableMenu()
			return
		end
		
		if itemName == "tent" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("removeTent",getLocalPlayer(),getElementData(col,"parent"))
			disableMenu()
			return
		end
		if itemName == "weaponbox" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Gear"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "fireplace" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			triggerServerEvent("addPlayerCookMeat",getLocalPlayer())
			disableMenu()
			return
		end
		if itemName == "bandage" then
			local col = getElementData(getLocalPlayer(),"currentCol")
				triggerServerEvent("onPlayerGiveMedicObject",getLocalPlayer(),itemName,getElementData(col,"parent"))
				disableMenu()
			return
		end
		if itemName == "giveblood" then
			local col = getElementData(getLocalPlayer(),"currentCol")
				triggerServerEvent("onPlayerGiveMedicObject",getLocalPlayer(),itemName,getElementData(col,"parent"))
				disableMenu()
			return
		end
		if itemName == "dead" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = "Gear ("..getElementData(col,"playername")..")"
			refreshLoot(col,gearName)
			showInventoryManual()
			return
		end
		if itemName == "deadreason" then
			local col = getElementData(getLocalPlayer(),"currentCol")
			outputChatBox(getElementData(col,"deadreason"),255,255,255,true)
			return
		end
		if itemName == "patrolstation" then
			local col = getElementData(getLocalPlayer(),"currentCol")
				setPedAnimation (getLocalPlayer(),"BOMBER","BOM_Plant",nil,false,false,nil,false)
				setElementData(getLocalPlayer(),"Empty Gas Canister",getElementData(getLocalPlayer(),"Empty Gas Canister")-1)
				setElementData(getLocalPlayer(),"Full Gas Canister",(getElementData(getLocalPlayer(),"Full Gas Canister") or 0)+1)
				triggerEvent ("displayClientInfo",getLocalPlayer(),"patrolstation","Filled gas canister up!",22,255,0)
				disableMenu()
			return
		end

			if isToolbeltItem(itemName) then 
           local col = getElementData(getLocalPlayer(), "currentCol") 
           if #getElementsWithinColShape(col, "player") > 1 or getNetworkStats().packetlossLastSecond > 1 then        
                return        
            end 
            x, y, z = getElementPosition(getLocalPlayer()) 
            if pcount ~= nil and pcount < getTickCount() then 
                 pcount = getTickCount() + math.random(1800,2200)        
                 x, y, z = getElementPosition(getLocalPlayer()) 
                 return false 
               elseif pcount == nil then 
                 pcount = getTickCount() + math.random(1800,2200) 
                 x, y, z = getElementPosition(getLocalPlayer()) 
                 return false 
               end 
               local x1, y1, z1 = getElementPosition(getLocalPlayer()) 
               if x1 ~= x or y1 ~= y or z1 ~= z then 
                 pcount = nil 
               return false 
             end 
             pcount = nil 
             triggerServerEvent("onPlayerTakeItemFromGround", getLocalPlayer(), itemName, col) 
             disableMenu() 
             return 
           end        
              if itemName == "Czech Vest Pouch" or itemName == "Patrol Pack" or itemName == "Assault Pack (ACU)" or itemName == "Survival (ACU)" or itemName =="Alice Pack" or itemName == "Coyote Backpack" then
          local col = getElementData(getLocalPlayer(),"currentCol") 
          triggerServerEvent("onPlayerTakeItemFromGround",getLocalPlayer(),itemName,col) 
          disableMenu() 
          return 
         end        
         if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then 
               local col = getElementData(getLocalPlayer(), "currentCol") 
               if #getElementsWithinColShape(col, "player") > 1 or getNetworkStats().packetlossLastSecond > 1 then        
                 return        
               end 
               x, y, z = getElementPosition(getLocalPlayer()) 
               if pcount ~= nil and pcount < getTickCount() then 
                 pcount = getTickCount() + math.random(1800,2200) 
                 x, y, z = getElementPosition(getLocalPlayer()) 
                 return false 
               elseif pcount == nil then 
                 pcount = getTickCount() + math.random(1800,2200) 
                 x, y, z = getElementPosition(getLocalPlayer()) 
                 return false 
               end 
               local x1, y1, z1 = getElementPosition(getLocalPlayer()) 
               if x1 ~= x or y1 ~= y or z1 ~= z then 
                 pcount = nil 
                 return false 
               end 
               pcount = nil 
               triggerServerEvent("onPlayerTakeItemFromGround", getLocalPlayer(), itemName, col) 
               disableMenu() 
            else 
             startRollMessage2("Inventory", "Inventory is full!", 255, 22, 0) 
           end 
         end 
end 
bindKey ( "mouse3", "down", onPlayerPressMiddleMouse ) 
bindKey ( "-", "down", onPlayerPressMiddleMouse ) 

function getMenuMarkedItem()        
        for i,guiItem in ipairs(spalteGuiText) do 
         if getElementData(guiItem,"markedMenuItem") then 
          return getElementData(guiItem,"usedItem")        
         end 
        end 
end 

function playerPressedKey(button, press) 
           if (press) then 
         if button == "w" or button == "a" or button == "s" or button == "d" then 
          local anim,anim2 = getPedAnimation (getLocalPlayer()) 
          if anim and anim == "SCRATCHING" and anim2 == "sclng_r" then 
           triggerServerEvent("onClientMovesWhileAnimation",getLocalPlayer()) 
          end        
         end 
           end 
end

function getMenuMarkedItem() 
	for id, value in pairs(theTableMenuScroll) do
		if id == numberMenuScroll then
			return value[5]
		end
	end
end
--icons
function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

fading = 0
fading2 = "up"
local screenWidth,screenHeight = guiGetScreenSize()
F_SCREEN_X, F_SCREEN_Y 	= guiGetScreenSize();
function updateIcons ()
if (getElementData (localPlayer, "hideTable") or {}).icons then return true end
	 if getElementData(localPlayer,"logedin") == true then
		if fading >= 0 and fading2 == "up" then
			fading = fading + 5
		elseif fading <= 255 and fading2 == "down" then
			fading = fading - 5
		end
		if fading == 0 then
			fading2 = "up"
		elseif fading == 255 then
			fading2 = "down"
		end
		--[[dxDrawImage(screenWidth * 0.962, screenHeight * 0.493, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/indicators/sound.png", 0, 0, 0, tocolor(46, 65, 58))
		dxDrawImage(screenWidth * 0.962, screenHeight * 0.558, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/indicators/eye.png", 0, 0, 0, tocolor(46, 65, 58))
		local sound = getElementData(getLocalPlayer(), "volume") / 20
		if sound > 1 then
		dxDrawImage(screenWidth * 0.927, screenHeight * 0.495, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/indicators/level_" .. sound .. ".png", 0, 0, 0, tocolor(46, 65, 58))
		end
		local sound = getElementData(getLocalPlayer(), "visibly") / 20
		if sound > 1 then
		dxDrawImage(screenWidth * 0.927, screenHeight * 0.557, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/indicators/level_" .. sound .. ".png", 0, 0, 0, tocolor(46, 65, 58))
	    end--]]
		if getElementData(getLocalPlayer(), "humanity") >= 5000 then
            elementtemp1 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.651, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/bandit/5000.png", 0, 0, 0, tocolor(99, 138, 24))
        elseif getElementData(getLocalPlayer(), "humanity") >= 3500 then
            elementtemp2 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.651, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/bandit/3500.png", 0, 0, 0, tocolor(99, 138, 24))
        elseif getElementData(getLocalPlayer(), "humanity") >= 2500 then
            elementtemp3 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.651, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/bandit/2500.png", 0, 0, 0, tocolor(99, 138, 24))
        elseif getElementData(getLocalPlayer(), "humanity") >= 0 then
            elementtemp4 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.651, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/bandit/0.png", 0, 0, 0, tocolor(99, 138, 24))
        elseif getElementData(getLocalPlayer(), "humanity") >= -1000 then
            elementtemp5 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.651, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/bandit/-1000.png", 0, 0, 0, tocolor(99, 138, 24))
        elseif getElementData(getLocalPlayer(), "humanity") >= -2500 then
            elementtemp = dxDrawImage(screenWidth * 0.962, screenHeight * 0.651, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/bandit/-2500.png", 0, 0, 0, tocolor(99, 138, 24))
        end
		elementtemp = dxDrawImage(screenWidth * 0.962, screenHeight * 0.711, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/temperature/0.png", 0, 0, 0, tocolor(46, 65, 58))
        if getElementData(getLocalPlayer(), "temperature") >= 38 then
            elementtemp1 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.711, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/temperature/38.png", 0, 0, 0, tocolor(71, 121, 152))
        elseif getElementData(getLocalPlayer(), "temperature") >= 37 then
            elementtemp2 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.711, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/temperature/37.png", 0, 0, 0, tocolor(71, 121, 152))
        elseif getElementData(getLocalPlayer(), "temperature") >= 36 then
            elementtemp3 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.711, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/temperature/36.png", 0, 0, 0, tocolor(71, 121, 152))
        elseif getElementData(getLocalPlayer(), "temperature") >= 35 then
            elementtemp4 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.711, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/temperature/35.png", 0, 0, 0, tocolor(71, 121, 152))
        elseif getElementData(getLocalPlayer(), "temperature") >= 33.5 then
            elementtemp5 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.711, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/temperature/34.png", 0, 0, 0, tocolor(71, 121, 152))
        elseif getElementData(getLocalPlayer(), "temperature") >= 0 then
            elementtemp = dxDrawImage(screenWidth * 0.962, screenHeight * 0.711, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/temperature/0.png", 0, 0, 0, tocolor(71, 121, 152))
        end
        r, g, b = 0, 255, 0
        local thirst = getElementData(getLocalPlayer(), "thirst") * 2.55
        r, g, b = 255 - thirst, thirst, 0
        if getElementData(getLocalPlayer(), "thirst") >= 100 then
		    elementdrink = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/0.png", 0, 0, 0, tocolor(99, 138, 24))
            elementdrink1 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/100.png", 0, 0, 0, tocolor(99, 138, 24))
        elseif getElementData(getLocalPlayer(), "thirst") >= 80 then
		elementdrink = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/0.png", 0, 0, 0, tocolor(145, 150, 47))
            elementdrink2 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/80.png", 0, 0, 0, tocolor(145, 150, 47))
        elseif getElementData(getLocalPlayer(), "thirst") >= 60 then
		elementdrink = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/0.png", 0, 0, 0, tocolor(156, 69, 8))
            elementdrink3 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/60.png", 0, 0, 0, tocolor(156, 69, 8))
        elseif getElementData(getLocalPlayer(), "thirst") >= 40 then
		elementdrink = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/0.png", 0, 0, 0, tocolor(137, 133, 93))
            elementdrink4 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/40.png", 0, 0, 0, tocolor(137, 133, 93))
        elseif getElementData(getLocalPlayer(), "thirst") >= 15 then
		elementdrink = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/0.png", 0, 0, 0, tocolor(156, 16, 0))
            elementdrink5 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/15.png", 0, 0, 0, tocolor(156, 16, 0))
        elseif getElementData(getLocalPlayer(), "thirst") >= 0 then
            elementdrink = dxDrawImage(screenWidth * 0.962, screenHeight * 0.771, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/drink/0.png", 0, 0, 0, tocolor(156, 16, 0))
        end
		
		
        r, g, b = 0, 255, 0
        local food = getElementData(getLocalPlayer(), "food") * 2.55 or 0
        r, g, b = 255 - food, food, 0
        if getElementData(getLocalPlayer(), "food") >= 100 then
            elementfood1 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/100.png", 0, 0, 0, tocolor(99, 138, 24))
			elementfood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/0.png", 0, 0, 0, tocolor(99, 138, 24))
        elseif getElementData(getLocalPlayer(), "food") >= 80 then
            elementfood2 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/80.png", 0, 0, 0, tocolor(145, 150, 47))
			elementfood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/0.png", 0, 0, 0, tocolor(145, 150, 47))
        elseif getElementData(getLocalPlayer(), "food") >= 50 then
            elementfood3 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/50.png", 0, 0, 0, tocolor(156, 69, 8))
			elementfood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/0.png", 0, 0, 0, tocolor(156, 69, 8))
        elseif getElementData(getLocalPlayer(), "food") >= 30 then
            elementfood4 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/30.png", 0, 0, 0, tocolor(137, 133, 93))
			elementfood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/0.png", 0, 0, 0, tocolor(137, 133, 93))
        elseif getElementData(getLocalPlayer(), "food") >= 10 then
            elementfood5 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/10.png", 0, 0, 0, tocolor(156, 16, 0))
			elementfood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/0.png", 0, 0, 0, tocolor(156, 16, 0))
        elseif getElementData(getLocalPlayer(), "food") >= 0 then
            elementfood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.89, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/eat/0.png", 0, 0, 0, tocolor(156, 16, 0))
        end
		
		
        if getElementData(getLocalPlayer(), "blood") >= 10000 then
            elementblood1 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/100.png", 0, 0, 0, tocolor(99, 138, 24))
			elementblood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/0.png", 0, 0, 0, tocolor(99, 138, 24))
        elseif getElementData(getLocalPlayer(), "blood") >= 8000 then
            elementblood2 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/80.png", 0, 0, 0, tocolor(99, 138, 24))
			elementblood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/0.png", 0, 0, 0, tocolor(99, 138, 24))
        elseif getElementData(getLocalPlayer(), "blood") >= 5000 then
            elementblood3 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/50.png", 0, 0, 0, tocolor(68, 106, 39))
			elementblood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/0.png", 0, 0, 0, tocolor(68, 106, 39))
        elseif getElementData(getLocalPlayer(), "blood") >= 2500 then
            elementblood4 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/30.png", 0, 0, 0, tocolor(78, 146, 90))
			elementblood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/0.png", 0, 0, 0, tocolor(78, 146, 90))
        elseif getElementData(getLocalPlayer(), "blood") >= 1000 then
            elementblood5 = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/10.png", 0, 0, 0, tocolor(156, 16, 0))
			elementblood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/0.png", 0, 0, 0, tocolor(156, 16, 0))
        elseif getElementData(getLocalPlayer(), "blood") >= 0 then
            elementblood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/0.png", 0, 0, 0, tocolor(156, 16, 0))
			elementblood = dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/blood/0.png", 0, 0, 0, tocolor(156, 16, 0))
        end
        if getElementData(getLocalPlayer(), "brokenbone", true) then
            dxDrawImage(screenWidth * 0.92, screenHeight * 0.717, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/brokenbone.png", 0, 0, 0, tocolor(255, 255, 255))
        end
       --[[if getElementData(getLocalPlayer(), "infection", true) then
            dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/infection.png", 0, 0, 0, tocolor(255, 0, 0, fading))
        end--]]
        if 0 < getElementData(getLocalPlayer(), "bleeding") then
            dxDrawImage(screenWidth * 0.962, screenHeight * 0.831, screenHeight * 0.052, screenHeight * 0.052, "images/dayzicons/medic.png", 0, 0, 0, tocolor(255, 255, 255, fading))
		end
        if getElementData ( localPlayer, "clothHead" ) and getElementData ( localPlayer, "clothHead" ) ~= 0 then
            dxDrawImage(screenWidth * 0.92, screenHeight * 0.772, screenHeight * 0.052, screenHeight * 0.052, "images/bpvest1.png", 0, 0, 0, tocolor(92, 141, 71))
        end
        if getElementData ( localPlayer, "clothBody" ) and getElementData ( localPlayer, "clothBody" ) ~= 0 then
            dxDrawImage(screenWidth * 0.92, screenHeight * 0.832, screenHeight * 0.052, screenHeight * 0.052, "images/bpvest.png", 0, 0, 0, tocolor(92, 141, 71))
        end
	end
end
addEventHandler ( "onClientRender", getRootElement(), updateIcons )
