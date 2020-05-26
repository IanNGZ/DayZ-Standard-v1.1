local h1, h2, h3 = debug.gethook () 
debug.sethook ()

function createItemPickup(item,x,y,z,tableStringName)
    if item and x and y and z then
        local object = createObject(itemTable[tostring(tableStringName)][item][2],x,y,z-0.875,itemTable[tostring(tableStringName)][item][4],0,math.random(0,360))
        setObjectScale(object,itemTable[tostring(tableStringName)][item][3])
        setElementCollisionsEnabled(object, false)
        setElementFrozen (object,true)
        local col = createColSphere(x,y,z,0.75)
        setElementData(col,"item",itemTable[tostring(tableStringName)][item][1])
        setElementData(col,"parent",object)
        setTimer(function()
            if isElement(col) then
                destroyElement(col)
                destroyElement(object)
            end    
        end,900000,1)
        return object
    end
end

function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end

function math.percentChance (percent,repeatTime)
    local hits = 0
    for i = 1, repeatTime do
    local number = math.random(0,200)/2
        if number <= percent then
            hits = hits+1
        end
    end
    return hits
end

function createItemLoot (lootPlace,x,y,z,id)
    col = createColSphere(x,y,z,1.25)
    setElementData(col,"itemloot",true)
    setElementData(col,"isTimerToRefresh",false)
    setElementData(col,"parent",lootPlace)
    setElementData(col,"MAX_Slots",20)
    --Items
    for i, item in ipairs(itemTable[lootPlace]) do
        local value =  math.percentChance (item[5],math.random(1,3))
        setElementData(col,item[1],value)
        --weapon Ammo
        local ammoData,weapID = getWeaponAmmoType (item[1],true)
        if ammoData and value > 0 then
            setElementData(col,ammoData,math.random(1,3))
        end
    end
    --itemLoot
    refreshItemLoot (col,lootPlace, true)
    
    return col
end

function refreshItemLoots (loot)
    local lootPlace = getElementData(loot,"parent")
    setElementData(loot,"isTimerToRefresh",false)
    --outputChatBox("#ff2200WARNING! #ffffff - SPAWNPOINTS FOR ITEMS WILL BE REFRESHED IN 1 MINUTE! BEWARE OF MASSIVE LAG!",getRootElement(),255,255,255,true)
    for i, item in ipairs(itemTable[lootPlace]) do
    local value =  math.percentChance (item[5],math.random(1,3))
        setElementData(loot,item[1],value)
        local ammoData,weapID = getWeaponAmmoType (item[1],true)
        if ammoData and value > 0 then
          setElementData(loot,ammoData,math.random(1,3))
        end
    end
    refreshItemLoot (loot,lootPlace,true)
end
timetorefresh = gameplayVariables["itemrespawntimer"] 


function refreshItemLoot (col,place, creating)
    if not creating and not getElementData(col,"isTimerToRefresh") then
      setElementData(col,"isTimerToRefresh",true)
      setTimer(refreshItemLoots,timetorefresh,1,col)
    end
    local objects = getElementData(col,"objectsINloot")
    if objects then
        if objects[1] ~= nil then
            destroyElement(objects[1])
        end
        if objects[2] ~= nil then
            destroyElement(objects[2])
        end
        if objects[3] ~= nil then
            destroyElement(objects[3])
        end
    end
    --setting objects
    local counter = 0
    local obejctItem = {}
    --Tables
    for i, item in ipairs(itemTable["other"]) do
        if getElementData(col,item[1]) and getElementData(col,item[1]) > 0 then
            if counter == 3 then
                break
            end    
            counter = counter + 1
            local x,y,z = getElementPosition(col)
            obejctItem[counter] = createObject(item[2],x+math.random(-1,1),y+math.random(-1,1),z-0.875,item[4])
            setObjectScale(obejctItem[counter],item[3])
            setElementCollisionsEnabled(obejctItem[counter], false)
            setElementFrozen (obejctItem[counter],true)
        end
    end
    -------Debug
    if obejctItem[1] == nil then
        local x,y,z = getElementPosition(col)
        obejctItem[1] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
        setObjectScale(obejctItem[1],0)
        setElementCollisionsEnabled(obejctItem[1], false)
        setElementFrozen (obejctItem[1],true)
    end
    if obejctItem[2] == nil then
        local x,y,z = getElementPosition(col)
        obejctItem[2] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
        setObjectScale(obejctItem[2],0)
        setElementCollisionsEnabled(obejctItem[2], false)
        setElementFrozen (obejctItem[2],true)
    end
    if obejctItem[3] == nil then
        local x,y,z = getElementPosition(col)
        obejctItem[3] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
        setObjectScale(obejctItem[3],0)
        setElementCollisionsEnabled(obejctItem[3], false)
        setElementFrozen (obejctItem[3],true)
    end
    setElementData(col,"objectsINloot",{obejctItem[1], obejctItem[2], obejctItem[3]})
end
addEvent( "refreshItemLoot", true )
addEventHandler( "refreshItemLoot", getRootElement(), refreshItemLoot )

function createPickupsOnServerStart()
    iPickup = 0
    for i,pos in ipairs(pickupPositions["residential"]) do
        iPickup = iPickup + 1
        createItemLoot("residential",pos[1],pos[2],pos[3],iPickup)
    end
    setTimer(createPickupsOnServerStart2,5000,1)
end

function createPickupsOnServerStart2()
    for i,pos in ipairs(pickupPositions["industrial"]) do
        iPickup = iPickup + 1
        createItemLoot("industrial",pos[1],pos[2],pos[3],iPickup)
    end
    setTimer(createPickupsOnServerStart3,5000,1)
end

function createPickupsOnServerStart3()
    for i,pos in ipairs(pickupPositions["farm"]) do
        iPickup = iPickup + 1
        createItemLoot("farm",pos[1],pos[2],pos[3],iPickup)
    end
    setTimer(createPickupsOnServerStart4,5000,1)
end

function createPickupsOnServerStart4()
    for i,pos in ipairs(pickupPositions["supermarket"]) do
        iPickup = iPickup + 1
        createItemLoot("supermarket",pos[1],pos[2],pos[3],iPickup)
    end
    setTimer(createPickupsOnServerStart5,5000,1)
end

function createPickupsOnServerStart5()
    for i,pos in ipairs(pickupPositions["military"]) do
        iPickup = iPickup + 1
        createItemLoot("military",pos[1],pos[2],pos[3],iPickup)
    end
end


createPickupsOnServerStart()


function onPlayerTakeItemFromGround (itemName,col)
    itemPlus = 1
    for i,v in ipairs(Ammo) do
        if itemName == v[1] then
            itemPlus = v[2]
        end
    end
    for i,v in ipairs(Armas) do
        if itemName == v[1] then
            removeBackWeaponOnDrop()
        end
    end
    local x,y,z = getElementPosition(source)
    local id,ItemType = getItemTablePosition (itemName)
    setElementData(source,itemName,(getElementData(source,itemName) or 0)+itemPlus)
    destroyElement(getElementData(col,"parent"))
    destroyElement(col)
end
addEvent( "onPlayerTakeItemFromGround", true )
addEventHandler( "onPlayerTakeItemFromGround", getRootElement(), onPlayerTakeItemFromGround )

function onPlayerChangeLoot(loot)
local players = getElementsWithinColShape (loot,"player")
    for theKey,player in ipairs(players) do 
        triggerClientEvent(player,"refreshLootManual",player,loot)
    end    
end
addEvent( "onPlayerChangeLoot", true )
addEventHandler( "onPlayerChangeLoot", getRootElement(), onPlayerChangeLoot )

function playerDropAItem(itemName)
    local x,y,z = getElementPosition(source)
    local item,itemString = getItemTablePosition(itemName)
    local itemPickup = createItemPickup(item,x+math.random(-1.25,1.25),y+math.random(-1.25,1.25),z,itemString)
end
addEvent( "playerDropAItem", true )
addEventHandler( "playerDropAItem", getRootElement(), playerDropAItem )

function getItemTablePosition (itema)
    for id, item in ipairs(itemTable[tostring("other")]) do
        if itema == item[1] then
            return id, "other"
        end
    end
    return item,itemString
end


