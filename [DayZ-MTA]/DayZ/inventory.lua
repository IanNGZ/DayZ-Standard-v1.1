
--INVENTORY
local headline = {}
local gridlistItems = {}
local buttonItems = {}


inventoryWindows = guiCreateWindow(0.15, 0.28, 0.72, 0.63, "", true) 
-- inventoryWindows = guiCreateStaticImage(0.25,0.25,0.5,0.5,"images/scrollmenu_1.png",true)

headline["loot"] = guiCreateLabel(0.06, 0.05, 0.34, 0.09,"GEAR",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["loot"],"center")
guiSetFont (headline["loot"], "default-bold-small" )

headline["inventory"] = guiCreateLabel(0.60, 0.05, 0.34, 0.09,"INVENTORY",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["inventory"],"center")
guiSetFont (headline["inventory"], "default-bold-small" )

gridlistItems["loot"] = guiCreateGridList (0.03, 0.10, 0.39, 0.83,true,inventoryWindows)
gridlistItems["loot_colum"] = guiGridListAddColumn( gridlistItems["loot"], "Loot", 0.7 )
gridlistItems["loot_colum_amount"] = guiGridListAddColumn( gridlistItems["loot"], "", 0.2 )

gridlistItems["inventory"] = guiCreateGridList (0.57, 0.11, 0.39, 0.83,true,inventoryWindows)
gridlistItems["inventory_colum"] = guiGridListAddColumn( gridlistItems["inventory"], "Inventory", 0.7 )
gridlistItems["inventory_colum_amount"] = guiGridListAddColumn( gridlistItems["inventory"], "", 0.2 )

buttonItems["loot"] = guiCreateButton(0.42, 0.17, 0.04, 0.69, "->", true,inventoryWindows)
buttonItems["inventory"] = guiCreateButton(0.53, 0.17, 0.04, 0.69, "<-", true,inventoryWindows)

headline["slots"] = guiCreateLabel(0.62, 0.94, 0.29, 0.04,"SLOTS:",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["slots"],"center")
guiLabelSetVerticalAlign (headline["slots"],"center")
guiSetFont (headline["slots"], "default-bold-small" )

headline["slots_loot"] = guiCreateLabel(0.07, 0.94, 0.29, 0.04,"SLOTS:",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["slots_loot"],"center")
guiLabelSetVerticalAlign (headline["slots_loot"],"center")
guiSetFont (headline["slots_loot"], "default-bold-small" )

guiSetVisible(inventoryWindows,false)

function showInventory (key,keyState)
if getElementData(getLocalPlayer(),"logedin") then
    if ( keyState == "down" ) then
        guiSetVisible(inventoryWindows,not guiGetVisible(inventoryWindows))
        showCursor(not isCursorShowing())
        refreshInventory()
        if guiGetVisible(inventoryWindows) == true then
            onClientOpenInventoryStopMenu ()
        else
            hideRightClickInventoryMenu ()
        end
        if isPlayerInLoot() then
            local col = getElementData(getLocalPlayer(),"currentCol")
            local gearName = getElementData(getLocalPlayer(),"lootname")
            refreshLoot(col,gearName)
        end
    end
end    
end
bindKey ( "j", "down", showInventory )

function showInventoryManual ()
        guiSetVisible(inventoryWindows,not guiGetVisible(inventoryWindows))
        showCursor(not isCursorShowing())
        refreshInventory()
        if guiGetVisible(inventoryWindows) == true then
            onClientOpenInventoryStopMenu ()
        end
end

function hideInventoryManual ()
        guiSetVisible(inventoryWindows,false)
        showCursor(false)
        hideRightClickInventoryMenu ()
end
addEvent("hideInventoryManual",true)
addEventHandler("hideInventoryManual",getLocalPlayer(),hideInventoryManual)

function refreshInventoryManual ()
        refreshInventory()
end
addEvent("refreshInventoryManual",true)
addEventHandler("refreshInventoryManual",getLocalPlayer(),refreshInventoryManual)

function refreshLootManual (loot)
        refreshLoot(loot)
end
addEvent("refreshLootManual",true)
addEventHandler("refreshLootManual",getLocalPlayer(),refreshLootManual)

function refreshInventory()
if ( gridlistItems["inventory_colum"] ) then --If the column has been created, fill it with players
    row1,column1 = guiGridListGetSelectedItem ( gridlistItems["inventory"] )
    guiGridListClear(gridlistItems["inventory"])
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            --guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"ITEMS", false, false )
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"PRIMARY WEAPON", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"SECONDARY WEAPON", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"SPECIAL WEAPON", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"AMMO", true, false )
        for id, item in ipairs(inventoryItems["Ammo"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"FOOD & DRINKS", true, false )
        for id, item in ipairs(inventoryItems["Food"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"MISC.", true, false )
        for id, item in ipairs(inventoryItems["Items"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"TOOLBELT", true, false )
        for id, item in ipairs(inventoryItems["Toolbelt"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
        if row1 and column1 then
            guiGridListSetSelectedItem ( gridlistItems["inventory"], row1,column1)
        end
        guiSetText(headline["slots"],"SLOTS: "..getPlayerCurrentSlots().."/"..getPlayerMaxAviableSlots())
    end
end

function refreshLoot(loot,gearName)
if loot == false then
    guiGridListClear(gridlistItems["loot"])
    guiSetText(headline["loot"],"Empty")
    return
end
if ( gridlistItems["loot_colum"] ) then
    row2,column2 = guiGridListGetSelectedItem ( gridlistItems["loot"] )
    guiGridListClear(gridlistItems["loot"])
    if gearName then
        guiSetText(headline["loot"],gearName)
    end    
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            --guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Weapons", true, false )
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"PRIMARY WEAPON", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
                local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"SECONDARY WEAPON", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"SPECIAL WEAPON", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"AMMO", true, false )
        for id, item in ipairs(inventoryItems["Ammo"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"FOOD & DRINKS", true, false )
        for id, item in ipairs(inventoryItems["Food"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"MISC.", true, false )
        for id, item in ipairs(inventoryItems["Items"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"TOOLBELT", true, false )
        for id, item in ipairs(inventoryItems["Toolbelt"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end

        if row2 and column2 then
            guiGridListSetSelectedItem ( gridlistItems["loot"], row2,column2)
        end
        guiSetText(headline["slots_loot"],"SLOTS: "..getLootCurrentSlots(loot).."/"..(getLootMaxAviableSlots(loot)or 0))
    end
end


function getPlayerMaxAviableSlots()
return getElementData(getLocalPlayer(),"MAX_Slots")
end

function getLootMaxAviableSlots(loot)
return getElementData(loot,"MAX_Slots")
end

function getPlayerCurrentSlots()
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Ammo"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Food"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Items"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    return math.floor(current_SLOTS)
end


function getLootCurrentSlots(loot)
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Ammo"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Food"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Items"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    return math.floor(current_SLOTS)
end

function getItemSlots(itema)
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
        if itema == item[1] then 
            return item[2]
        end
    end    
    for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
        if itema == item[1] then 
            return item[2]
        end
    end    
    for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
        if itema == item[1] then 
            return item[2]
        end
    end    
    for id, item in ipairs(inventoryItems["Ammo"]) do
        if itema == item[1] then 
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Food"]) do
        if itema == item[1] then 
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Items"]) do
        if itema == item[1] then 
            return item[2]
        end
    end
    return false
end

function isToolbeltItem(itema)
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Toolbelt"]) do
        if itema == item[1] then 
            return true
        end
    end    
    return false
end






function onPlayerMoveItemOutOfInventory ()
if playerMovedInInventory then startRollMessage2("Inventory", "Abusing exploits will result in a ban!", 255, 22, 0 ) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
    if getElementData(getLocalPlayer(),itemName) and getElementData(getLocalPlayer(),itemName) >= 1 then
        if isPlayerInLoot() then
            local isVehicle = getElementData(isPlayerInLoot(),"vehicle")
            local isTent = getElementData(isPlayerInLoot(),"tent")
            if isVehicle and not isTent then
                local veh = getElementData(isPlayerInLoot(),"parent")
                local tires,engine,parts = getVehicleAddonInfos (getElementModel(veh))
                if itemName == "Tire" and (getElementData(isPlayerInLoot(),"Tire_inVehicle") or 0) < tires  or itemName == "Engine" and (getElementData(isPlayerInLoot(),"Engine_inVehicle") or 0)  < engine or itemName == "Tank Parts" and (getElementData(isPlayerInLoot(),"Parts_inVehicle") or 0) < parts then
                    if itemName == "Tank Parts" then itemName = "Parts" end
                    triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName.."_inVehicle",isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                elseif isToolbeltItem(itemName) then
                    triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
                    triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                else
                    startRollMessage2("Inventory", "Inventory is full!", 255, 22, 0 )
                    return
                end
            elseif isToolbeltItem(itemName) then
                    triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())    
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
            elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
                triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                playerMovedInInventory = true
                    setTimer(function()
                    playerMovedInInventory = false
                end,700,1)
            else
                startRollMessage2("Inventory", "Inventory is full!", 255, 22, 0 )
                return
            end    
        else
            triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
            playerMovedInInventory = true
            setTimer(function()
                playerMovedInInventory = false
            end,700,1)
        end    
    end
    local gearName = guiGetText(headline["loot"])
    local col = getElementData(getLocalPlayer(),"currentCol")
    setTimer(refreshInventory,200,2)
    if isPlayerInLoot() then
        setTimer(refreshLoot,200,2,col,gearName)
    end
end
addEventHandler ( "onClientGUIClick", buttonItems["inventory"], onPlayerMoveItemOutOfInventory )


function onPlayerMoveItemOutOFInventory (itemName,loot)
local itemPlus = 1
for i,v in ipairs(Ammo) do
    if itemName == v[1] then
        itemPlus = v[2]
    end
end
for i,v in ipairs(Armas) do
    if itemName == v[1] then
        triggerServerEvent("removeBackWeaponOnDrop", getLocalPlayer())
    end
end

if loot then 
    if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
        if itemName == "Full Gas Canister" then
            if getElementData(loot,"fuel")+20 < getVehicleMaxFuelLoot(loot) then
                addingfuel = 20
            elseif getElementData(loot,"fuel")+20 > getVehicleMaxFuelLoot(loot)+15 then
                triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","O tanque está cheio!",255,22,0)
                return
            else
                addingfuel = getVehicleMaxFuelLoot(loot)-getElementData(loot,"fuel")
            end
            setElementData(loot,"fuel",getElementData(loot,"fuel")+addingfuel)
            setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
            setElementData(getLocalPlayer(),"Empty Gas Canister",(getElementData(getLocalPlayer(),"Empty Gas Canister") or 0)+itemPlus)
            triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Filled gas into vehicle!",22,255,0)
            return
        end
    end
end
itemName2 = itemName
if itemName == "Tire_inVehicle" then itemName2 = "Tire" end
if itemName == "Engine_inVehicle" then itemName2 = "Engine" end
if itemName == "Parts_inVehicle" then itemName2 = "Tank Parts" end
if (getElementData(getLocalPlayer(),itemName2) or 0)/itemPlus < 1 then
    triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Can't drop this!",255,22,0)
return
end
    if loot then
        setElementData(loot,itemName,(getElementData(loot,itemName) or 0)+1)
        local players = getElementsWithinColShape (loot,"player")
            if #players > 1 then
                triggerServerEvent("onPlayerChangeLoot",getRootElement(),loot)
            end    
        if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
        end
    else
        triggerServerEvent("playerDropAItem",getLocalPlayer(),itemName)
        print(itemName)
    end
    if itemName == "Tire_inVehicle" then itemName = "Tire" end
    if itemName == "Engine_inVehicle" then itemName = "Engine" end
    if itemName == "Parts_inVehicle" then itemName = "Tank Parts" end
    setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
    if loot and getElementData(loot,"itemloot") then
        triggerServerEvent("refreshItemLoot",getRootElement(),loot,getElementData(loot,"parent"))
    end
end
addEvent( "onPlayerMoveItemOutOFInventory", true )
addEventHandler( "onPlayerMoveItemOutOFInventory", getRootElement(), onPlayerMoveItemOutOFInventory )

function onPlayerMoveItemInInventory ()
local itemName = guiGridListGetItemText ( gridlistItems["loot"], guiGridListGetSelectedItem ( gridlistItems["loot"] ), 1 )
if isPlayerInLoot() then
    if getElementData(isPlayerInLoot(),itemName) and getElementData(isPlayerInLoot(),itemName) >= 1 then
        if not isToolbeltItem(itemName) then
            if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then
                if not playerMovedInInventory then
                    triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                else
                    startRollMessage2("Inventory", "Abusing exploits will result in a ban!", 255, 22, 0 )
                    return
                end    
            else
                startRollMessage2("Inventory", "Inventory is full!", 255, 22, 0 )
                return
            end
        else
            playerMovedInInventory = true
            setTimer(function()
                playerMovedInInventory = false
            end,700,1)
            triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
        end
    end
    if isPlayerInLoot() then
        local gearName = guiGetText(headline["loot"])
        local col = getElementData(getLocalPlayer(),"currentCol")
        setTimer(refreshInventory,200,2)
        setTimer(refreshLoot,200,2,col,gearName)
    end
end    
end
addEventHandler ( "onClientGUIClick", buttonItems["loot"], onPlayerMoveItemInInventory )

function onPlayerMoveItemInInventory (itemName,loot)
local itemPlus = 1
for i,v in ipairs(Ammo) do
    if itemName == v[1] then
        itemPlus = v[2]
    end
end
if itemName == "Assault Pack (ACU)" then
    if getElementData(getLocalPlayer(),"MAX_Slots") == 12 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end
    if getElementData(getLocalPlayer(),"MAX_Slots") > 12 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end
    setElementData(getLocalPlayer(),"MAX_Slots",12)
    setElementData(loot,itemName,getElementData(loot,itemName)-1)
    itemPlus = 0
elseif itemName == "Alice Pack" then
    if getElementData(getLocalPlayer(),"MAX_Slots") == 16 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end
    if getElementData(getLocalPlayer(),"MAX_Slots") > 16 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end
    setElementData(getLocalPlayer(),"MAX_Slots",16)
    setElementData(loot,itemName,getElementData(loot,itemName)-1)
    itemPlus = 0
elseif itemName == "Czech Backpack" then
    if getElementData(getLocalPlayer(),"MAX_Slots") == 26 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You are using this backpack already!",255,22,0) return end
    if getElementData(getLocalPlayer(),"MAX_Slots") > 26 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","The currently equipped backpack has more space!",255,22,0) return end
    setElementData(getLocalPlayer(),"MAX_Slots",26)
    setElementData(loot,itemName,getElementData(loot,itemName)-1)
    itemPlus = 0    
elseif itemName == "Coyote Backpack" then
    if getElementData(getLocalPlayer(),"MAX_Slots") == 36 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You already have the best backpack!",255,22,0) return end
    setElementData(getLocalPlayer(),"MAX_Slots",36)
    setElementData(loot,itemName,getElementData(loot,itemName)-1)
    itemPlus = 0   
elseif itemName == "Mountain Backpack" then
    if getElementData(getLocalPlayer(),"MAX_Slots") == 60 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You already have the best backpack!",255,22,0) return end
    setElementData(getLocalPlayer(),"MAX_Slots",60)
    setElementData(loot,itemName,getElementData(loot,itemName)-1)
    itemPlus = 0    
elseif itemName == "Drybag(Yellow)" then
    if getElementData(getLocalPlayer(),"MAX_Slots") == 48 then triggerEvent (getLocalPlayer(), "displayClientInfo", getLocalPlayer(),"Inventory","You already have the best backpack!",255,22,0) return end
    setElementData(getLocalPlayer(),"MAX_Slots",48)
    setElementData(loot,itemName,getElementData(loot,itemName)-1)
    itemPlus = 0    
end
    if loot then
        --if itemPlus > (getElementData(loot,itemName) or 0) then
            --itemPlus = getElementData(loot,itemName) 
        --end
            setElementData(getLocalPlayer(),itemName,(getElementData(getLocalPlayer(),itemName) or 0)+itemPlus) 
            if itemPlus == 0 then
                setElementData(loot,itemName,getElementData(loot,itemName)-0)
            else
                setElementData(loot,itemName,getElementData(loot,itemName)-1)
            end
            local players = getElementsWithinColShape (loot,"player")
            if #players > 1 then
                triggerServerEvent("onPlayerChangeLoot",getRootElement(),loot)
            end
    end
    if getElementData(loot,"itemloot") then
        triggerServerEvent("refreshItemLoot",getRootElement(),loot,getElementData(loot,"parent"))
    end
end
addEvent( "onPlayerMoveItemInInventory", true )
addEventHandler( "onPlayerMoveItemInInventory", getRootElement(), onPlayerMoveItemInInventory )

function onClientOpenInventoryStopMenu ()
triggerEvent("disableMenu",getLocalPlayer())
end

function isPlayerInLoot()
if getElementData(getLocalPlayer(),"loot") then
    return getElementData(getLocalPlayer(),"currentCol")
end
return false
end


------------------------------------------------------------------------------
--right-click menu
function onPlayerPressRightKeyInInventory ()
local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
local itemName,itemInfo = getInventoryInfosForRightClickMenu(itemName)
    if isCursorShowing() and guiGetVisible(inventoryWindows) and itemInfo then
        if itemName == "Box of Matches" then
            if getElementData(getLocalPlayer(),"Wood Pile") == 0 then
                return
            end
        end
        if itemName == "Bandage" then
            if getElementData(getLocalPlayer(),"bleeding") == 0 then
                return
            end
        end    
        if itemName == "Medic Kit" then
            if getElementData(getLocalPlayer(),"blood") > 10500 then
                return
            end
        end    
        if itemName == "Heat Pack" then
            if getElementData(getLocalPlayer(),"temperature") > 35 then
                return
            end
        end    
        if itemName == "Painkiller" then
            if not getElementData(getLocalPlayer(),"pain") then
                return
            end
        end    
        if itemName == "Morphine" then
            if not getElementData(getLocalPlayer(),"brokenbone") then
                return
            end
        end    
        if itemName == "Blood Bag" then
        if getElementData(getLocalPlayer(),"blood") > 6000 then
        return
        end
    end
        --playerUseItem(itemName,itemInfo)
        showRightClickInventoryMenu(itemName, itemInfo)
    end
end
bindKey("mouse2", "down", onPlayerPressRightKeyInInventory)
--addEventHandler("onClientGUIDoubleClick",getRootElement(),onPlayerPressRightKeyInInventory)

function getInventoryInfosForRightClickMenu(itemName)
    for i,itemInfo in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
        if itemName == itemInfo[1] then
            return itemName,"Equip Primary Weapon"
        end    
    end
    for i,itemInfo in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
        if itemName == itemInfo[1] then
            return itemName,"Equip Secondary Weapon"
        end    
    end
    for i,itemInfo in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
        if itemName == itemInfo[1] then
            return itemName,"Equip Special Weapon"
        end    
    end
    for i,itemInfo in ipairs(inventoryItems["Ammo"]) do
        if itemName == itemInfo[1] then
            return itemName,false
        end    
    end
    for i,itemInfo in ipairs(inventoryItems["Food"]) do
        if itemName == itemInfo[1] then
            if itemInfo[1] == "Water Bottle" or itemInfo[1] == "Milk" or itemInfo[1] == "Soda Bottle" then
                info = "Drink"
            else
                info = "Eat"
            end
            return itemName,info
        end    
    end
    for i,itemInfo in ipairs(inventoryItems["Items"]) do
        if itemName == itemInfo[1] then
            return itemName,itemInfo[3] or false
        end    
    end
    for i,itemInfo in ipairs(inventoryItems["Toolbelt"]) do
        if itemName == itemInfo[1] then
            return itemName,itemInfo[3] or false
        end
    end
end

rightclickWindow = guiCreateStaticImage(0,0,0.05,0.0215,"images/scrollmenu_1.png",true)
headline["rightclickmenu"] = guiCreateLabel(0,0,1,1,"",true,rightclickWindow)
guiLabelSetHorizontalAlign (headline["rightclickmenu"],"center")
guiLabelSetVerticalAlign (headline["rightclickmenu"],"center")
guiSetFont (headline["rightclickmenu"], "default-bold-small" )
guiSetVisible(rightclickWindow,false)

function showRightClickInventoryMenu (itemName,itemInfo)
    if itemInfo then
        local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
        guiSetVisible(rightclickWindow,true)
        guiSetText(headline["rightclickmenu"],itemInfo)
        local whith = guiLabelGetTextExtent (headline["rightclickmenu"])
        guiSetPosition(rightclickWindow,screenx,screeny,true)
        local x,y = guiGetSize(rightclickWindow,false)
        guiSetSize(rightclickWindow,whith,y,false)
        guiBringToFront(rightclickWindow)
        setElementData(rightclickWindow,"iteminfo",{itemName,itemInfo})
    end
end

function hideRightClickInventoryMenu ()
    guiSetVisible(rightclickWindow,false)
end


function onPlayerClickOnRightClickMenu (button,state)
    if button == "left" then
        local itemName,itemInfo = getElementData(rightclickWindow,"iteminfo")[1],getElementData(rightclickWindow,"iteminfo")[2]
        hideRightClickInventoryMenu ()
        playerUseItem(itemName,itemInfo)
    end
end
addEventHandler("onClientGUIClick",headline["rightclickmenu"],onPlayerClickOnRightClickMenu,false)

local playerFire = {}
local fireCounter = 0
function playerUseItem(itemName,itemInfo)
    if itemInfo == "Drink" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"thirst")
    elseif itemInfo == "Eat" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"food")    
    elseif itemInfo == "Put clothes on" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerChangeSkin",getLocalPlayer(),itemName)
    elseif itemName == "Empty Water Bottle" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerRefillWaterBottle",getLocalPlayer(),itemName)        
    elseif itemName == "Tent" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerPitchATent",getLocalPlayer(),itemName)
    elseif itemInfo == "Build a wire fence" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerBuildAWireFence",getLocalPlayer(),itemName)
    elseif itemName == "Roadflare" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerPlaceRoadflare",getLocalPlayer(),itemName)    
    elseif itemInfo == "Make a Fire" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerMakeAFire",getLocalPlayer(),itemName)    
    elseif itemInfo == "Transfusion" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerTransfuseBlood",localPlayer)
    elseif itemName == "Blood Bag" then
        triggerServerEvent("onPlayerUseMedicObject",localPlayer,itemName)
    elseif itemInfo == "Use" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)
    elseif itemName == "Bandage" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)    
    elseif itemInfo == "Use Googles" then
        triggerServerEvent("onPlayerChangeView",getLocalPlayer(),itemName)    
    elseif itemInfo == "Equip Primary Weapon" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,1)
    elseif itemInfo == "Equip Secondary Weapon" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,2)
    elseif itemInfo == "Equip Special Weapon" then
        hideInventoryManual ()
        triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,3)
        elseif itemInfo == "Colocar armadilha" then
    playSound("sounds/desmontartenda.ogg")
    hideInventoryManual ()
    setElementData ( localPlayer, "Armadilha de Urso", getElementData ( localPlayer, "Armadilha de Urso" )-1 )
    local posX, posY, posZ = getElementPosition(localPlayer)
    local _, _, rotation = getElementRotation(localPlayer)
    posX = posX - math.sin(math.rad(rotation)) * 2
    posY = posY + math.cos(math.rad(rotation)) * 2
    triggerServerEvent ( 'createBearTrapC', localPlayer, posX, posY, getGroundPosition ( posX, posY, posZ )+0.1 )
    end
end


function weaponSwitch (weapon)
    if source == getLocalPlayer() then
        local ammoName,_ = getWeaponAmmoType2 (weapon)
        if getElementData(getLocalPlayer(),ammoName) > 0 then
            setElementData(getLocalPlayer(),ammoName,getElementData(getLocalPlayer(),ammoName)-1)
        end
    end
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), weaponSwitch )

--[[function makeRadioStayOff()
    setRadioChannel(0)
    cancelEvent()
end
addEventHandler("onClientPlayerVehicleEnter",getRootElement(),makeRadioStayOff)
addEventHandler("onClientPlayerRadioSwitch",getRootElement(),makeRadioStayOff)--]]
