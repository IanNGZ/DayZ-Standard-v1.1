
function rearmPlayerWeapon (weaponName,slot)
   takeAllWeapons (source)
    --Rearm
    local ammoData,weapID = getWeaponAmmoType (weaponName)
    if getElementData(source,ammoData) <= 0 then triggerClientEvent (source, "displayClientInfo", source,"Rearm",shownInfos["nomag"],255,22,0) return end
    setElementData(source,"currentweapon_"..slot,weaponName)
    --Old Weapons
    local weapon = getElementData(source,"currentweapon_1")
    if weapon then
        local ammoData,weapID = getWeaponAmmoType (weapon)
        giveWeapon(source,weapID,getElementData(source,ammoData), true )
        setPedWeaponSlot( source, 0 )
    end
    local weapon = getElementData(source,"currentweapon_2")
    if weapon then
        local ammoData,weapID = getWeaponAmmoType (weapon)
        giveWeapon(source,weapID,getElementData(source,ammoData), false )
        setPedWeaponSlot( source, 0 )
    end
    local weapon = getElementData(source,"currentweapon_3")
    if weapon then
        local ammoData,weapID = getWeaponAmmoType (weapon)
        giveWeapon(source,weapID,getElementData(source,ammoData), false )
        setPedWeaponSlot( source, 0 )
    end
    if elementWeaponBack[source] then
        detachElementFromBone(elementWeaponBack[source])
        destroyElement(elementWeaponBack[source])
        elementWeaponBack[source] = false
    end    
    setElementModel(source, getElementData(source,"skin"))
end
addEvent("onPlayerRearmWeapon",true)
addEventHandler("onPlayerRearmWeapon",getRootElement(),rearmPlayerWeapon)

--attaches
local elementBackpack = {}
function backPackBack (dataName,oldValue)
    if getElementType(source) == "player" and dataName =="MAX_Slots" then
        local newValue = getElementData(source,dataName)
        if elementBackpack[source] then
            detachElementFromBone(elementBackpack[source])
            destroyElement(elementBackpack[source])
            elementBackpack[source] = false
        end
        local x,y,z = getElementPosition(source)
        local rx,ry,rz = getElementRotation(source)
        if newValue == 12 then
            elementBackpack[source] = createObject(3026,x,y,z)
        elseif newValue == 16 then
            elementBackpack[source] = createObject(1248,x,y,z)
        elseif newValue == 26 then
            elementBackpack[source] = createObject(1575,x,y,z)
        elseif newValue == 36 then
            elementBackpack[source] = createObject(1252,x,y,z)
		elseif newValue == 60 then
            elementBackpack[source] = createObject(1669,x,y,z)
		elseif newValue == 48 then
            elementBackpack[source] = createObject(1809,x,y,z)
        elseif newValue == 8 then
            return
        end
        if newValue == 26 then
            attachElementToBone(elementBackpack[source],source,3,0,-0.16,0.05,270,0,180)
		elseif newValue == 45 then 
            attachElementToBone(elementBackpack[source],source,3,0,-0.215,0.03,90,0,0)
        else
            attachElementToBone(elementBackpack[source],source,3,0,-0.225,0.05,90,0,0)
        end
    end   
end
addEventHandler ( "onElementDataChange", getRootElement(), backPackBack )

function backpackRemoveQuit ()
    if elementBackpack[source] then
        detachElementFromBone(elementBackpack[source])
        destroyElement(elementBackpack[source])
    end
	if elementWeaponbBack[source] then
		detachElementFromBone(elementWeaponbBack[source])
	    destroyElement(elementWeaponbBack[source])	
		elementWeaponbBack[source] = false
	end	
    if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end	  
end
addEventHandler ( "onPlayerQuit", getRootElement(), backpackRemoveQuit )

elementWeaponBack = {}
function weaponSwitchBack ( previousWeaponID, currentWeaponID )
local weapon1 = getElementData(source,"currentweapon_1")
 if not weapon1 then return end
 local ammoData1,weapID1 = getWeaponAmmoType(weapon1)
 local x,y,z = getElementPosition(source)
 local rx,ry,rz = getElementRotation(source)
    if previousWeaponID == weapID1 then
        if elementWeaponBack[source] then
            detachElementFromBone(elementWeaponBack[source])
            destroyElement(elementWeaponBack[source])
            elementWeaponBack[source] = false
        end
        for i,v in ipairs(Armas) do
            if weapon1 == v[1] then
                elementWeaponBack[source] = createObject(v[2],x,y,z)
                setObjectScale(elementWeaponBack[source],1) 
            end
        end
        if elementWeaponBack[source] then
            attachElementToBone(elementWeaponBack[source],source,3,0.19,-0.11,-0.1,0,270,10)
        end 
        --print(1)
    elseif currentWeaponID == weapID1 then

        if elementWeaponBack[source] then
            detachElementFromBone(elementWeaponBack[source])
            destroyElement(elementWeaponBack[source])
            elementWeaponBack[source] = false
        end
        for i,v in ipairs(Armas) do
            if weapon1 == v[1] then
                elementWeaponBack[source] = createObject(v[2],x,y,z)
                setObjectScale(elementWeaponBack[source],1) 
            end
        end
        if elementWeaponBack[source] then
            attachElementToBone(elementWeaponBack[source],source,12,0,0,0,0,270,0) 
        end 
        --print(2)
    end
end


 
addEventHandler("onPlayerWeaponSwitch",getRootElement(),weaponSwitchBack)
----Secundarias----
elementWeaponbBack = {}
function weaponSwitchbBack ( previousWeaponID, currentWeaponID )
 local weapon2 = getElementData(source,"currentweapon_2")
 if not weapon2 then return end
 local ammoData2,weapID2 = getWeaponAmmoType(weapon2)
 local x,y,z = getElementPosition(source)
 local rx,ry,rz = getElementRotation(source)
          if previousWeaponID == weapID2 then
           if elementWeaponbBack[source] then
            detachElementFromBone(elementWeaponbBack[source])
            destroyElement(elementWeaponbBack[source])
            elementWeaponbBack[source] = false
           end
           if weapon2 == "Hatchet" then
           elementWeaponbBack[source] = createObject(339,x,y,z)
           setObjectScale(elementWeaponbBack[source],0.999)
           elseif weapon2 == "Golf-Club" then
           elementWeaponbBack[source] = createObject(333,x,y,z)
           setObjectScale(elementWeaponbBack[source],0.999)
           elseif weapon2 == "Baseball-Bat" then
           elementWeaponbBack[source] = createObject(336,x,y,z)
           setObjectScale(elementWeaponbBack[source],0.999)
           elseif weapon2 == "Shovel" then
           elementWeaponbBack[source] = createObject(337,x,y,z)
           setObjectScale(elementWeaponbBack[source],0.999)
		   elseif weapon2 == "--" then
           end
		   if elementBackpack[source] then
           attachElementToBone(elementWeaponbBack[source],source,3,-0.15,-0.13,0.10,-0.1,-180,90)
           else
           attachElementToBone(elementWeaponbBack[source],source,3,0,-0.13,0.10,-0.1,-180,0)
		   end
           elseif currentWeaponID == weapID2 then
	       if isElement(elementWeaponbBack[source]) then
           detachElementFromBone(elementWeaponbBack[source])
           destroyElement(elementWeaponbBack[source])
           elementWeaponbBack[source] = false
          end
     end
 end
addEventHandler ( "onPlayerWeaponSwitch", getRootElement(), weaponSwitchbBack )

function removeBackWeaponOnDrop ()
    if elementWeaponBack[source] then
        detachElementFromBone(elementWeaponBack[source])
        destroyElement(elementWeaponBack[source])    
        elementWeaponBack[source] = false
    end
	if elementWeaponbBack[source] then
        detachElementFromBone(elementWeaponbBack[source])
        destroyElement(elementWeaponbBack[source])    
        elementWeaponbBack[source] = false
    end
end
addEvent("removeBackWeaponOnDrop",true)
addEventHandler("removeBackWeaponOnDrop",getRootElement(),removeBackWeaponOnDrop)

function removeAttachedOnDeath ()
    if elementBackpack[source] then
        detachElementFromBone(elementBackpack[source])
        destroyElement(elementBackpack[source])
		elementBackpack[source] = false
    end
	if elementWeaponbBack[source] then
        detachElementFromBone(elementWeaponbBack[source])
        destroyElement(elementWeaponbBack[source])    
        elementWeaponbBack[source] = false
    end   
    if elementWeaponBack[source] then
        detachElementFromBone(elementWeaponBack[source])
        destroyElement(elementWeaponBack[source])    
        elementWeaponBack[source] = false
    end    
end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),removeAttachedOnDeath)

function weaponDelete(dataName,oldValue)
    if getElementType(source) == "player" then -- check if the element is a player
        local weapon1 = getElementData(source,"currentweapon_1")
        local weapon2 = getElementData(source,"currentweapon_2")
        local weapon3 = getElementData(source,"currentweapon_3")
        if dataName == weapon1 or dataName == weapon2 or dataName == weapon3 then
            if getElementData (source,dataName) == 0 then
                local ammoData,weapID = getWeaponAmmoType(dataName)
                takeWeapon (source,weapID)
            end
        end
        local weapon1 = getElementData(source,"currentweapon_1")
        local weapon2 = getElementData(source,"currentweapon_2")
        local weapon3 = getElementData(source,"currentweapon_3")
        local ammoData1,weapID1 = getWeaponAmmoType(weapon1)
        local ammoData2,weapID2 = getWeaponAmmoType(weapon2)
        local ammoData3,weapID3 = getWeaponAmmoType(weapon3)
        if dataName == ammoData1 then
            if not oldValue then return end
            local newammo = oldValue - getElementData (source,dataName)
            if newammo == 1 then return end
            if getElementData (source,dataName) < oldValue then
                takeWeapon (source,weapID1,newammo) 
                if elementWeaponBack[source] then
                    detachElementFromBone(elementWeaponBack[source])
                    destroyElement(elementWeaponBack[source])    
                    elementWeaponBack[source] = false
                end    
            elseif getElementData (source,dataName) > oldValue then
                giveWeapon(source,weapID1,getElementData (source,dataName)-oldValue,true)
            end
        end    
        if dataName == ammoData2 then
            if not oldValue then return end
            local newammo = oldValue - getElementData (source,dataName)
            if newammo == 1 then return end
            if getElementData (source,dataName) < oldValue then
                takeWeapon (source,weapID2,newammo) 
            elseif getElementData (source,dataName) > oldValue then
                giveWeapon(source,weapID2,getElementData (source,dataName)-oldValue,false)
            end
        end    
        if dataName == ammoData3 then
            if not oldValue then return end
            local newammo = oldValue - getElementData (source,dataName)
            if newammo == 1 then return end
            if getElementData (source,dataName) < oldValue then
                takeWeapon (source,weapID3,newammo) 
            elseif getElementData (source,dataName) > oldValue then
                giveWeapon(source,weapID3,getElementData (source,dataName)-oldValue,false)
            end    
        end
    end
end
addEventHandler("onElementDataChange",getRootElement(),weaponDelete)

function addPlayerStats (player,data,value)
    if data == "food" then
        local current = getElementData(player,data)
        if current + value > 100 then
            setElementData(player,data,100)
        elseif     current + value < 1 then
            setElementData(player,data,0)
            setElementData(player,"blood",getElementData(player,"blood")-math.random(50,120))
        else
            setElementData(player,data,current+value)
        end
    elseif data == "thirst" then
        local current = getElementData(player,data)
        if current + value > 100 then
            setElementData(player,data,100)
        elseif     current + value < 1 then
            setElementData(player,data,0)
            setElementData(player,"blood",getElementData(player,"blood")-math.random(50,120))
        else
            setElementData(player,data,current+value)
        end
    elseif data == "blood" then
        local current = getElementData(player,data)
        if current + value > 12000 then
            setElementData(player,data,12000)
        elseif     current + value < 1 then
            setElementData(player,data,0)
        else
            setElementData(player,data,current+value)
        end
    elseif data == "temperature" then
        local current = getElementData(player,data)
        if current + value > 41 then
            setElementData(player,data,41)
        elseif     current + value <= 31 then
            setElementData(player,data,31)
        else
            setElementData(player,data,current+value)
        end
    elseif data == "humanity" then
        local current = getElementData(player,data)
        if current + value > 5000 then
            setElementData(player,data,5000)
        else
            setElementData(player,data,current+value)
        end        
    end
end

function checkTemperature()
    for i,player in ipairs(getElementsByType("player")) do
        if getElementData(player,"logedin") then
            value = 0
            if getWeather == 7 then
                value = -0.1
            elseif getWeather == 12 then
                value = 0
            elseif getWeather == 16 then
                value = -0.4
            elseif getWeather == 4 then
                value = -0.1
            end
            local hour, minutes = getTime()
            if hour >= 21 and hour <= 8 then
                value = value-0.05
            end
            addPlayerStats (player,"temperature",value)
        end
    end    
end
setTimer(checkTemperature,60000,0)

function checkTemperature2()
    for i,player in ipairs(getElementsByType("player")) do
        if getElementData(player,"logedin") then
            value = 0
            if isElementInWater(player) then
                value = gameplayVariables["temperaturewater"]
            end    
            if getControlState (player,"sprint") then
                value = value+gameplayVariables["temperaturesprint"]
            end
            addPlayerStats (player,"temperature",value)
        end    
    end
end
setTimer(checkTemperature2,10000,0)

function setHunger()
    for i,player in ipairs(getElementsByType("player")) do
        if getElementData(player,"logedin") then
            value = gameplayVariables["loseHunger"]
            addPlayerStats (player,"food",value)
        end    
    end
end
setTimer(setHunger,60000,0)

function setThirsty()
    for i,player in ipairs(getElementsByType("player")) do
        if getElementData(player,"logedin") then
            value = gameplayVariables["loseThirst"]
            addPlayerStats (player,"thirst",value)
        end
    end
end
setTimer(setThirsty,60000,0)

function checkThirsty()
    for i,player in ipairs(getElementsByType("player")) do
        if getElementData(player,"logedin") then
            value = 0
            if getControlState (player,"sprint") then
                value = gameplayVariables["sprintthirst"]
            end    
            addPlayerStats (player,"thirst",value)
        end
    end
end
setTimer(checkThirsty,10000,0)

function checkHumanity()
    for i,player in ipairs(getElementsByType("player")) do
        if getElementData(player,"logedin") then
            if getElementData(player,"humanity") < 2500 then
                addPlayerStats (player,"humanity",30)
                if getElementData(player,"humanity") > 2000 then
                    setElementData(player,"bandit",false)
                end
            end
        end    
    end
end
setTimer(checkHumanity,60000,0)

function onPlayerRequestChangingStats(itemName,itemInfo,data)
    if data == "food" then
        if itemName == "Burger" then
            blood = 300
        elseif itemName == "Pizza" then
            blood = 300
        elseif itemName == "Cooked Meat" then
            blood = 800
        elseif itemName == "Beans Can" then
            blood = 200
        elseif itemName == "Pasta Can" then
            blood = 200
        end
        setPedAnimation (source,"FOOD","EAT_Burger",-1,false,false,false,false)
        setElementData(source,itemName,getElementData(source,itemName)-1)
        addPlayerStats (source,"blood",blood)
        addPlayerStats (source,data,gameplayVariables["foodrestore"])
    elseif data == "thirst" then
        setElementData(source,itemName,getElementData(source,itemName)-1)
        addPlayerStats (source,data,gameplayVariables["thirstrestore"])
        setPedAnimation (source,"VENDING","VEND_Drink2_P",-1,false,false,false,false) 
        if itemName == "Water Bottle" then
            setElementData(source,"Empty Water Bottle",(getElementData(source,"Empty Water Bottle") or 0)+1)
        end
    end
    triggerClientEvent (source, "displayClientInfo", source,"Food",shownInfos["youconsumed"].." "..itemName,22,255,0)
    triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerRequestChangingStats",true)
addEventHandler("onPlayerRequestChangingStats",getRootElement(),onPlayerRequestChangingStats)

function onPlayerUseMedicObject(itemName)
    local playersource = source
    setPedAnimation (playersource,"BOMBER","BOM_Plant",-1,false,false,false,false)
    setTimer( function ()
        if itemName == "Bandage" then
            setElementData(playersource,"bleeding",0)
            setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
        elseif itemName == "Medic Kit" then
            addPlayerStats (playersource,"blood",7000)
            setElementData(playersource,"bleeding",0)
            setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
        elseif itemName == "Heat Pack" then
            setElementData(playersource,"cold",false)
            setElementData(playersource,"temperature",37)
            setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
        elseif itemName == "Painkiller" then
            setElementData(playersource,"pain",false)
            setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
        elseif itemName == "Morphine" then
            setElementData(playersource,"brokenbone",false)
            setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Blood Bag" then
			addPlayerStats (playersource,"blood",2000)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
			setElementData(playersource,"Blood Bag (Empty)",getElementData(playersource,"Blood Bag (Empty)")+1)
		end
	end,1500,1)	 
    triggerClientEvent(playersource,"refreshInventoryManual",playersource)
end
addEvent("onPlayerUseMedicObject",true)
addEventHandler("onPlayerUseMedicObject",getRootElement(),onPlayerUseMedicObject)

function onPlayerGiveMedicObject(itemName,player)
    local playersource = source
    setPedAnimation (playersource,"BOMBER","BOM_Plant",-1,false,false,false,false)
    setTimer( function ()
        if itemName == "bandage" then
            setElementData(player,"bleeding",0)
            setElementData(playersource,"Bandage",getElementData(playersource,"Bandage")-1)
            addPlayerStats (playersource,humanity,40)
        elseif itemName == "giveblood" then
				addPlayerStats (player,"blood",12000)
				setElementData(playersource,"Blood Bag",getElementData(playersource,"Blood Bag")-1)
				setElementData(playersource,"Blood Bag (Empty)",getElementData(playersource,"Blood Bag (Empty)")+1)
				addPlayerStats (playersource,"humanity",250)
			else
				setElementData(player,"blood",getElementData(player,"blood")-4000)
				setElementData(playersource,"Blood Bag",getElementData(playersource,"Blood Bag")-1)
				setElementData(playersource,"Blood Bag (Empty)",getElementData(playersource,"Blood Bag (Empty)")+1)
				--triggerClientEvent(playersource,"displayClientInfo",playersource,"BloodType","Your blood type is incompatible with "..getPlayerName(player).."!",255,0,0)
				--triggerClientEvent(player,"displayClientInfo",player,"BloodType","Your blood type is incompatible with "..getPlayerName(playersource).."!",255,0,0)
		end
	end,1500,1,player,playersource,itemName)	
end 
addEvent("onPlayerGiveMedicObject",true)
addEventHandler("onPlayerGiveMedicObject",getRootElement(),onPlayerGiveMedicObject)

function onPlayerTransfuseBlood()
	if getElementData(source,"Transfusion Kit") > 0 then
		if getElementData(source,"Blood Bag (Empty)") > 0 then
			setPedAnimation (source,"BOMBER","BOM_Plant",5000,false,false,nil,false)
			setElementData(source,"Blood Bag",getElementData(source,"Blood Bag")+1)
			setElementData(source,"Blood Bag (Empty)",getElementData(source,"Blood Bag (Empty)")-1)
			setElementData(source,"blood",getElementData(source,"blood")-4000)
			triggerClientEvent(source,"displayClientInfo",source,"BloodTransfusion","You transfused some blood into the blood bag.",0,255,0)
		else
			triggerClientEvent(source,"displayClientInfo",source,"BloodType","You need Blood Bag (Empty) for that!",255,0,0)
			return
		end
	else
		triggerClientEvent(source,"displayClientInfo",source,"BloodType","You need a Transfusion Kit!",255,0,0)
		return
	end
end
addEvent("onPlayerTransfuseBlood",true)
addEventHandler("onPlayerTransfuseBlood",root,onPlayerTransfuseBlood)


skinTable = {
{"Ghillie Suit",285},
{"Survivor Clothing(Green)",120},
{"Survivor Clothing(Military)",124},
{"Survivor Clothing(Purple)",125},
{"Female Standart",191},
{"Survivor Clothing",73},
{"Survivor Clothing(Medic)",112},
{"Rebel[F]",131},
{"Jill Clothing",12},
{"Bandit[F]",71},
{"Jill Army",226},
{"Bandit[F]II",256},
{"Bandit[F]III",263},
{"Female Militar",257},
}


function getSkinIDFromName(name)
    for i,skin in ipairs(skinTable) do
        if name == skin[1] then
            return skin[2]
        end
    end
end

function getSkinNameFromID(id)
    for i,skin in ipairs(skinTable) do
        if id == skin[2] then
            return skin[1]
        end
    end
end

function addPlayerSkin (skin)
    local current = getElementData(source,"skin")
    local name = getSkinNameFromID(current)
    setElementData(source,name,getElementData(source,name)+1)
    setElementData(source,skin,getElementData(source,skin)-1)
    local id = getSkinIDFromName(skin)
    setElementData(source,"skin",id)
    setElementModel(source,id)
    triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeSkin",true)
addEventHandler("onPlayerChangeSkin",getRootElement(),addPlayerSkin)


function onPlayerRefillWaterBottle (itemName)
    if isElementInWater(source) then
        setElementData(source,"Water Bottle",getElementData(source,"Water Bottle")+1)
        setElementData(source,itemName,getElementData(source,itemName)-1)
        triggerClientEvent(source,"refreshInventoryManual",source)
        triggerClientEvent (source, "displayClientInfo", source,"Water Bottle",shownInfos["filledup"],22,255,0)
    else
        triggerClientEvent (source, "displayClientInfo", source,"Water Bottle",shownInfos["needwatersource"],255,22,0)
    end    
end
addEvent("onPlayerRefillWaterBottle",true)
addEventHandler("onPlayerRefillWaterBottle",getRootElement(),onPlayerRefillWaterBottle)

function getPointFromDistanceRotation(x, y, dist, angle)
 
    local a = math.rad(90 - angle);
 
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;
 
    return x+dx, y+dy;
 
end

function onPlayerPitchATent (itemName)
    setElementData(source,itemName,getElementData(source,itemName)-1)
    setPedAnimation (source,"BOMBER","BOM_Plant",-1,false,false,false,false)
    local source = source
    setTimer( function ()        
            local x,y,z = getElementPosition(source)
            local xr,yr,zr = getElementRotation(source)
            px, py, pz = getElementPosition(source)
            prot = getPedRotation(source)
            local offsetRot = math.rad(prot+90)
            local vx = px + 5 * math.cos(offsetRot)
            local vy = py + 5 * math.sin(offsetRot)
            local vz = pz + 2
            local vrot = prot+180
            tent = createObject(3243,vx,vy,z-1,0,0,vrot)
            setObjectScale(tent,1.3)
            tentCol = createColSphere(x,y,z,4)
            attachElements ( tentCol, tent, 0, 0, 0 )
            setElementData(tentCol,"parent",tent)
            setElementData(tent,"parent",tentCol)
            setElementData(tentCol,"tent",true)
            setElementData(tentCol,"vehicle",true)
            setElementData(tentCol,"MAX_Slots",100)
            triggerClientEvent(source,"refreshInventoryManual",source)
    end,1500,1)            
end
addEvent("onPlayerPitchATent",true)
addEventHandler("onPlayerPitchATent",getRootElement(),onPlayerPitchATent)

function onPlayerBuildAWireFence (itemName)
    setElementData(source,itemName,getElementData(source,itemName)-1)
    setPedAnimation (source,"BD_FIRE","wash_up",-1,false,false,false,false)
    local source = source
    setTimer( function ()                
            local x,y,z = getElementPosition(source)
            local xr,yr,zr = getElementRotation(source)
            --outputChatBox(zr)
            px, py, pz = getElementPosition(source)
            prot = getPedRotation(source)
            local offsetRot = math.rad(prot+90)
            local vx = px + 1 * math.cos(offsetRot)
            local vy = py + 1 * math.sin(offsetRot)
            local vz = pz + 2
            local vrot = prot+90
            --local x,y = getPointFromDistanceRotation(x,y,5,0)
            tent = createObject(983,vx,vy,pz,xr,yr,vrot)
            setObjectScale(tent,1)
            tentCol = createColSphere(x,y,z,2)
            attachElements ( tentCol, tent, 0, 0, 0 )
            setElementData(tentCol,"parent",tent)
            setElementData(tent,"parent",tentCol)
            setElementData(tentCol,"wirefence",true)
            triggerClientEvent(source,"refreshInventoryManual",source)
    end,1500,1)            
end
addEvent("onPlayerBuildAWireFence",true)
addEventHandler("onPlayerBuildAWireFence",getRootElement(),onPlayerBuildAWireFence)

function removeWirefence (object)
    setPedAnimation (source,"BD_FIRE","wash_up",-1,false,false,false,false)
    destroyElement(getElementData(object,"parent"))
    destroyElement(object)
end
addEvent("removeWirefence",true)
addEventHandler("removeWirefence",getRootElement(),removeWirefence)

function removeTent (object)
    local x,y,z = getElementPosition(getElementData(object,"parent"))
    local item,itemString = getItemTablePosition("Tent")
    local itemPickup = createItemPickup(item,x,y,z+1,itemString)
    destroyElement(getElementData(object,"parent"))
    destroyElement(object)
end
addEvent("removeTent",true)
addEventHandler("removeTent",getRootElement(),removeTent)


function addPlayerCookMeat ()
    local playersource = source
    setPedAnimation (playersource,"BOMBER","BOM_Plant",-1,false,false,false,false)
    local meat = getElementData(playersource,"Raw Meat")
    setTimer(function()
            setElementData(playersource,"Raw Meat",0)
            setElementData(playersource,"Cooked Meat",getElementData(playersource,"Cooked Meat")+meat)
            triggerClientEvent (playersource, "displayClientInfo", playersource,"Fireplace","You cooked "..meat.." Raw Meat.",22,255,0)
    end,5000,1)
end
addEvent("addPlayerCookMeat",true)
addEventHandler("addPlayerCookMeat",getRootElement(),addPlayerCookMeat)

function onPlayerMakeAFire (itemName)
    setElementData(source,"Wood Pile",getElementData(source,"Wood Pile")-1)
    local x,y,z = getElementPosition(source)
    local xr,yr,zr = getElementRotation(source)
    px, py, pz = getElementPosition(source)
    prot = getPedRotation(source)
    local offsetRot = math.rad(prot+90)
    local vx = px + 1 * math.cos(offsetRot)
    local vy = py + 1 * math.sin(offsetRot)
    local vz = pz + 2
    local vrot = prot+90
    --local x,y = getPointFromDistanceRotation(x,y,5,0)
    local wood = createObject(1463,vx,vy,pz-0.75,xr,yr,vrot)
    setObjectScale(wood,0.55)
    setElementCollisionsEnabled(wood, false)
    setElementFrozen (wood,true)
    local fire = createObject(3525,vx,vy,pz-0.75,xr,yr,vrot)
    setObjectScale(fire,0)
    local fireCol = createColSphere(x,y,z,2)
    setElementData(fireCol,"parent",wood)
    setElementData("Wood Pile","parent",fireCol)
    setElementData(fireCol,"fireplace",true)
    triggerClientEvent(source,"refreshInventoryManual",source)
    setPedAnimation (playersource,"BOMBER","BOM_Plant",-1,false,false,false,false)
    setTimer(function()
        destroyElement(fireCol)
        destroyElement(fire)
        destroyElement(wood)
    end,120000,1)
end
addEvent("onPlayerMakeAFire",true)
addEventHandler("onPlayerMakeAFire",getRootElement(),onPlayerMakeAFire)

function onPlayerPlaceRoadflare (itemName)
    setElementData(source,itemName,getElementData(source,itemName)-1)
    local x,y,z = getElementPosition(source)
    local object = createObject(354,x,y,z-0.6)
    setTimer(destroyElement,300000,1,object)
    triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerPlaceRoadflare",true)
addEventHandler("onPlayerPlaceRoadflare",getRootElement(),onPlayerPlaceRoadflare)

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

--------------------------------------------------------
--Chat System--                                       --
--------------------------------------------------------
local chatRadius = 15
local chatEadioRadius = 250
 
function sendMessageToNearbyPlayers( message, messageType )
cancelEvent()
    if (messageType == 0) then
        local posX, posY, posZ = getElementPosition( source )
        local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
        destroyElement( chatSphere )
        for index, nearbyPlayer in ipairs( nearbyPlayers ) do
            outputChatBox("[LOCAL]"..string.gsub((getPlayerName(source).." : "..message), '#%x%x%x%x%x%x', ''),nearbyPlayer, 211,211,211,true ) -- Color changed from 60,200,40 to 211,211,211
        end
    end    
end
addEventHandler( "onPlayerChat", getRootElement(), sendMessageToNearbyPlayers )

--[[function playerRadioChat(playersource,cmd,...)
    if cmd == "radiochat" then
        local msg2 = table.concat({...}, " ")
        if (getElementData(playersource,"Radio Device") or 0) <= 0 then outputChatBox(shownInfos["noradio"],playersource) return end
        local posX, posY, posZ = getElementPosition( playersource )
        local chatSphere = createColSphere( posX, posY, posZ, chatEadioRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
        destroyElement( chatSphere )
        for index, nearbyPlayer in ipairs( nearbyPlayers ) do
            if getElementData(nearbyPlayer,"Radio Device") > 0 then
                outputChatBox("[RADIO]"..string.gsub((getPlayerName(playersource).." : "..msg2), '#%x%x%x%x%x%x', ''),nearbyPlayer, 238,238,0,true ) -- Color changed from 60,200,40 to 238,238,0
            end
        end
    end
end
addCommandHandler( "radiochat", playerRadioChat )
 
function blockChatMessage(m,mt)
    if mt == 1 then
        cancelEvent()
    end
end
addEventHandler( "onPlayerChat", getRootElement(), blockChatMessage )--]]


--[[function checkBandit ()
    for i, player in ipairs(getElementsByType("player")) do
        if getElementData(player,"logedin") then
            local current = getElementData(player,"skin")
            if getElementData(player,"bandit") then
                if current == 179 or current == 287 then
                    setElementModel(player,288)
                elseif current == 73 then
                    setElementModel(player,180)
                end
            elseif getElementData(player,"humanity") == 5000 then
                if current == 73 or current == 179 or current == 287 then
                    setElementModel(player,210)
                end
            else
                setElementModel(player,getElementData(player,"skin"))
            end
        end
    end
end
setTimer(checkBandit,20000,0)--]]

local infoTimer = 240000

function outputInfo1 ()
    for i, player in ipairs(getElementsByType("player")) do
        triggerClientEvent (player, "displayClientInfo", player,"Info","Você pode usar o botão do meio do mouse ou '-' para fazer certas ações",200,200,22)
    end
    setTimer(outputInfo2,infoTimer,1)
end
setTimer(outputInfo1,infoTimer,1)

function outputInfo2 ()
    for i, player in ipairs(getElementsByType("player")) do
        triggerClientEvent (player, "displayClientInfo", player,"Info","Para suporte, adicione no skype: live:guilhermeroberto25",200,200,22)
    end
    setTimer(outputInfo3,infoTimer,1)
end

function outputInfo3 ()
    for i, player in ipairs(getElementsByType("player")) do
        triggerClientEvent (player, "displayClientInfo", player,"Info","O servidor possui backup de veículos a cada 10 minutos",200,200,22)
    end
    setTimer(outputInfo4,infoTimer,1)
end

function outputInfo4 ()
    for i, player in ipairs(getElementsByType("player")) do
        triggerClientEvent (player, "displayClientInfo", player,"Info","Você pode ativar e desativar o debugmonitor pressionando F5",200,200,22)
    end
    setTimer(outputInfo5,infoTimer,1)
end

function outputInfo5 ()
    for i, player in ipairs(getElementsByType("player")) do
        triggerClientEvent (player, "displayClientInfo", player,"Info","Está com dúvidas? Chame um membro da staff no chat ou acesse o F6 para algumas informações.",200,200,22)
    end
    setTimer(outputInfo1,infoTimer,1)
end

function getTeamMemberOnline ()
    theTableMembersOnline = ""
    for i,player in ipairs(getElementsByType("player")) do
        local account = getPlayerAccount(player)
        if not isGuestAccount(account) then
            if getElementData(player,"supporter") or getElementData(player,"admin") then
                theTableMembersOnline = theTableMembersOnline..","..getPlayerName(player)
            end
        end
    end
    if theTableMembersOnline == "" then
        return "None"
    else
        return theTableMembersOnline
    end
end

--player Wildcard
function getPlayerWildcard(namePart)
    namePart = string.lower(namePart)
    
    local bestaccuracy = 0
    local foundPlayer, b, e
    for _,player in ipairs(getElementsByType("player")) do
        b,e = string.find(string.lower(string.gsub(getPlayerName(player), "#%x%x%x%x%x%x", "")), namePart)
        if b and e then
            if e-b > bestaccuracy then
                bestaccuracy = e-b
                foundPlayer = player
            end
        end
    end
    
    if (foundPlayer) then
        return foundPlayer
    else
        return false
    end
end

---------------------Set Admin/Supporter--------------------------------------------------
function setGroup (playersource,command,teamName,targetString)
    if (isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(playersource)), aclGetGroup("Admin")))  then
        local foundTargetPlayer = getPlayerWildcard(targetString)
        if (foundTargetPlayer) then
            --Team Strings Rework 
            if teamName == "admin" or teamName == "supporter" or teamName == "remove" then 
                --nüx
            else
                outputChatBox ("#FFFFFFCorrect names are admin, supporter and remove!",playersource,27, 89, 224,true)    
                return
            end
            --Set Player to Teams
            if teamName == "remove" then
                value = false
                account = getPlayerAccount(foundTargetPlayer)
                setAccountData(account,"admin",value)
                setAccountData(account,"supporter",value)
                setElementData(foundTargetPlayer,"admin",value)
                setElementData(foundTargetPlayer,"supporter",value)
            else
                value = true
            end
            account = getPlayerAccount(foundTargetPlayer)
            accountname = getAccountName(account)
            setAccountData(account,teamName,value)
            setElementData(foundTargetPlayer,teamName,value)
            if value == true then
                outputChatBox ("#FFFFFF"..getPlayerName (foundTargetPlayer).." #FF0000 has been promoted to "..teamName.."!",getRootElement(),27, 89, 224,true)
            else
                outputChatBox ("#FFFFFF"..getPlayerName (foundTargetPlayer).." #FF0000 lost his status...",getRootElement(),27, 89, 224,true)
            end
        else
            outputChatBox ("#FFFFFFCan't find player! Did you input the correct name?",playersource,27, 89, 224,true)        
        end
    else
        outputChatBox ("#FFFFFFYou are not an admin!",playersource,27, 89, 224,true)        
    end
end
addCommandHandler("add",setGroup)

function banPLayer (playersource,command,targetString,banTime,reason)
    if getAccountData(getPlayerAccount(playersource),"admin") == true  then
        local foundTargetPlayer = getPlayerWildcard(targetString)
        local banTime = banTime or 0
        local reason = reason or "Unknown"
        if (foundTargetPlayer) then
            local account = getPlayerAccount()
            local ip = getPlayerIP(foundTargetPlayer)
            local serial = getPlayerSerial(foundTargetPlayer)
            local name = getPlayerName(foundTargetPlayer)
            kickPlayer(foundTargetPlayer,playersource,reason)
            addBan (ip,name,serial,playersource,reason,banTime*86400)
            outputChatBox ("#FFFFFF"..name.." #FF0000 has been banned for "..banTime.." Day(Z)'s.",getRootElement(),27, 89, 224,true)
        else
            outputChatBox ("#FFFFFFCan't find player! Did you input the correct name?",playersource,27, 89, 224,true)        
        end
    else
        outputChatBox ("#FFFFFFYou are not an admin! ",playersource,27, 89, 224,true)        
    end
end
addCommandHandler("playerban",banPLayer)

function pmsgAdmin (playersource,command,...)
    local msg = table.concat({...}, " ")
    if getAccountData(getPlayerAccount(playersource),"admin") == true  then
        outputChatBox ("[GLOBAL]"..getPlayerName(playersource)..": "..msg,getRootElement(),60,200,40,true)    
    else
        outputChatBox ("#FFFFFFYou are not an admin! ",playersource,27, 89, 224,true)        
    end
end
addCommandHandler("pmsg",pmsgAdmin)

    
botSupportTable = {
--Website
--Chat
{"hey","james","","Hey.","","James"},
{"hey","paul","","Yo!.","","Paul"},
{"hey","sandra","","Hello.","","Sandra"},
{"how are","you","james","I am fine, thank you.","","James"},
{"how are","you","paul","Feeling absolutely splendid today, why, thanks!","","Paul"},
{"how are","you","sandra","I am perfectly fine.","","Sandra"},
{"i love","you","sandra","ERROR: Can't access emotions.exe.","Thanks.","Sandra"},
{"thank","you","james","You are welcome.","","James"},
{"thank","paul","you","Hey, that's my job!","","Paul"},
{"thank","sandra","you","You are welcome.","","Sandra"},
--IngameHelp (james)
{"how","use","map","Press F11 to use the map.","","James"},
{"how","use","gps","The GPS activates automatically. You can see it at the lower left corner.","","James"},
{"how","take","items","Press 'J' to open your inventory. Alternatively, you can press the middle mouse button or '-' to pick items up.","","James"},
{"how","open","inven","By pressing 'J', you can open your inventory.","","James"},
--Cyxno
{"drop","item","","Press 'J' to open your inventory, select the item you want to drop and press the arrow pointing to the left.","","Paul"},
{"fuel","car","how","You need an 'Empty Gas Canister'. You can fill it at a gas station.","","Sandra"},
{"pick","items","how","Press the middle mouse button (or '-') when the name of the item is written on the left of your screen.","","Sandra"},
{"fence","wire","destroy","You need a toolbox to destroy a wirefence.","","James"},
{"register","how","to","You need to fill in your name and password. Afterwards, press 'Register'. If it doesn't work, reconnect.","","James"},
{"bugged","stuck","help","Wait until an admin contacts and helps you.","","Sandra"},
--Marwin
{"radio","chat","","Press 'Z' to use the radio device.","","James"},
}



function botCheck (text,player)
    for i, data in ipairs(botSupportTable) do
         if string.find(text:lower(), data[1]:lower(), 1, true) and string.find(text:lower(), data[2]:lower(), 1, true) and string.find(text:lower(), data[3]:lower(), 1, true) then
            answere = data[4]
            if data[5] ~= "" then
                local randomNumber = math.random(4,5)
                answere = data[randomNumber]
            end
            setTimer(onServerSupportChatMessage,math.random(3000,6000),1,data[6],string.gsub(getPlayerName ( player ), '#%x%x%x%x%x%x', '')..", "..answere)
        end
    end    
end

function onServerSupportChatMessage (player2,text)
    notGoOn = false
    mutedmessage = false
    for i, player in ipairs(getElementsByType("player")) do
        if player2 == "Sandra" or player2 == "James" or player2 == "Paul" then
            triggerClientEvent(player,"onSupportChatMessage",player,player2,text)
            notGoOn = true
        elseif getElementData(player,"supporter") or getElementData(player,"admin") then
            if not getElementData(player2,"admin") then
                if not getElementData(player2,"supporter") then
                    if not isPlayerMuted(player2) then
                        outputChatBox("#E01BBCNew Support Message by "..getPlayerName(player2),player,255,255,255,true)
                    end
                end
            end
        end
        if not notGoOn then
            if not isPlayerMuted(player2) then
                triggerClientEvent(player,"onSupportChatMessage",player,player2,text)
            else
                mutedmessage = true
            end
        end    
    end    
    if not notGoOn then
        botCheck(text,player2)
    end
    if mutedmessage then
        outputChatBox("#2200ddYou are muted!",player2,255,255,255,true)
    end
end
addEvent("onServerSupportChatMessage",true)
addEventHandler("onServerSupportChatMessage", getRootElement(),onServerSupportChatMessage)

--Weapon Property

setWeaponProperty ("m4","poor","maximum_clip_ammo",30)
setWeaponProperty ("m4","std","maximum_clip_ammo",30)
setWeaponProperty ("m4","pro","maximum_clip_ammo",30)
setWeaponProperty ("ak-47","poor","weapon_range",250)
setWeaponProperty ("ak-47","std","weapon_range",250)
setWeaponProperty ("ak-47","pro","weapon_range",250)
setWeaponProperty ("ak-47","poor","target_range",250)
setWeaponProperty ("ak-47","std","target_range",250)
setWeaponProperty ("ak-47","pro","target_range",250)
setWeaponProperty ("m4","poor","weapon_range",250)
setWeaponProperty ("m4","std","weapon_range",250)
setWeaponProperty ("m4","pro","weapon_range",250)
setWeaponProperty ("m4","poor","target_range",250)
setWeaponProperty ("m4","std","target_range",250)
setWeaponProperty ("m4","pro","target_range",250)
setWeaponProperty ("ak-47","poor","accuracy",0.3000)
setWeaponProperty ("ak-47","std","accuracy",0.3000)
setWeaponProperty ("ak-47","pro","accuracy",0.3000)
setWeaponProperty ("m4","poor","accuracy",0.4000)
setWeaponProperty ("m4","std","accuracy",0.4000)
setWeaponProperty ("m4","pro","accuracy",0.4000)
setWeaponProperty ("rifle","poor","weapon_range",270)
setWeaponProperty ("rifle","std","weapon_range",270)
setWeaponProperty ("rifle","pro","weapon_range",270)
setWeaponProperty ("rifle","poor","target_range",270)
setWeaponProperty ("rifle","std","target_range",270)
setWeaponProperty ("rifle","pro","target_range",270)
setWeaponProperty ("mp5","poor","weapon_range",120)
setWeaponProperty ("mp5","std","weapon_range",120)
setWeaponProperty ("mp5","pro","weapon_range",120)
setWeaponProperty ("mp5","poor","accuracy",0.6000)
setWeaponProperty ("mp5","std","accuracy",0.6000)
setWeaponProperty ("mp5","pro","accuracy",0.6000)
setWeaponProperty ("mp5","poor","target_range",120)
setWeaponProperty ("mp5","std","target_range",120)
setWeaponProperty ("mp5","pro","target_range",120)
setWeaponProperty ("uzi","poor","weapon_range",90)
setWeaponProperty ("uzi","std","weapon_range",90)
setWeaponProperty ("uzi","pro","weapon_range",90)
setWeaponProperty ("uzi","poor","accuracy",0.6000)
setWeaponProperty ("uzi","std","accuracy",0.6000)
setWeaponProperty ("uzi","pro","accuracy",0.6000)
setWeaponProperty ("uzi","poor","target_range",90)
setWeaponProperty ("uzi","std","target_range",90)
setWeaponProperty ("uzi","pro","target_range",90)
setWeaponProperty ("silenced","poor","weapon_range",80)
setWeaponProperty ("silenced","std","weapon_range",80)
setWeaponProperty ("silenced","pro","weapon_range",80)
setWeaponProperty ("silenced","poor","target_range",80)
setWeaponProperty ("silenced","std","target_range",80)
setWeaponProperty ("silenced","pro","target_range",80)
setWeaponProperty ("silenced","poor","accuracy",0.9900)
setWeaponProperty ("silenced","std","accuracy",0.9900)
setWeaponProperty ("silenced","pro","accuracy",0.9900)
setWeaponProperty ("deagle","poor","weapon_range",80)
setWeaponProperty ("deagle","std","weapon_range",80)
setWeaponProperty ("deagle","pro","weapon_range",80)
setWeaponProperty ("deagle","poor","target_range",80)
setWeaponProperty ("deagle","std","target_range",80)
setWeaponProperty ("deagle","pro","target_range",80)
setWeaponProperty ("deagle","poor","accuracy",0.9000)
setWeaponProperty ("deagle","std","accuracy",0.9000)
setWeaponProperty ("deagle","pro","accuracy",0.9000)

setWeaponProperty(31, "poor", "maximum_clip_ammo", 40)
setWeaponProperty(30, "poor", "maximum_clip_ammo", 30)
setWeaponProperty(25, "poor", "maximum_clip_ammo", 2)
setWeaponProperty(29, "poor", "maximum_clip_ammo", 30)
setWeaponProperty(28, "poor", "maximum_clip_ammo", 30)
setWeaponProperty(32, "poor", "maximum_clip_ammo", 25)
setWeaponProperty(22, "poor", "maximum_clip_ammo", 7)
setWeaponProperty(23, "poor", "maximum_clip_ammo", 15)
setWeaponProperty(24, "poor", "maximum_clip_ammo", 6)

setWeaponProperty(31, "std", "maximum_clip_ammo", 40)
setWeaponProperty(30, "std", "maximum_clip_ammo", 30)
setWeaponProperty(25, "std", "maximum_clip_ammo", 2)
setWeaponProperty(29, "std", "maximum_clip_ammo", 30)
setWeaponProperty(28, "std", "maximum_clip_ammo", 30)
setWeaponProperty(32, "std", "maximum_clip_ammo", 25)
setWeaponProperty(22, "std", "maximum_clip_ammo", 7)
setWeaponProperty(23, "std", "maximum_clip_ammo", 15)
setWeaponProperty(24, "std", "maximum_clip_ammo", 6)

setWeaponProperty(31, "pro", "maximum_clip_ammo", 40)
setWeaponProperty(30, "pro", "maximum_clip_ammo", 30)
setWeaponProperty(25, "pro", "maximum_clip_ammo", 2)
setWeaponProperty(29, "pro", "maximum_clip_ammo", 30)
setWeaponProperty(28, "pro", "maximum_clip_ammo", 30)
setWeaponProperty(32, "pro", "maximum_clip_ammo", 25)
setWeaponProperty(22, "pro", "maximum_clip_ammo", 7)
setWeaponProperty(23, "pro", "maximum_clip_ammo", 15)
setWeaponProperty(24, "pro", "maximum_clip_ammo", 6)



--Supportermode
local supporterMode = {}
local foodd = {}
local thirstt = {}

function Supportermode (playersource,command)
    if getAccountData(getPlayerAccount(playersource),"supporter") == true  then
        supporterMode[playersource] = not (supporterMode[playersource] or false)
        if supporterMode[playersource] then
            setElementAlpha(playersource,0)
            setElementFrozen(playersource,true)
            foodd[playersource] = getElementData(playersource,"food")
            thirstt[playersource] = getElementData(playersource,"thirst")
        else
            setElementAlpha(playersource,255)
            setElementFrozen(playersource,false)
        end
    else
        outputChatBox ("#FFFFFFYou are not a supporter, you can't use this command!",playersource,27, 89, 224,true)        
    end
end
addCommandHandler("supportmode",Supportermode)

function StatsSupportermode ()
    for i,player in ipairs(getElementsByType("player")) do
        if supporterMode[player] then
            setElementData (player,"food",foodd[player])
            setElementData (player,"thirst",thirstt[player])
        end
    end    
end
setTimer(StatsSupportermode,60000,0)

function preventCommandSpam(commandName)
    if commandName == "login" or commandName == "logout" then
        cancelEvent()
    end
end
addEventHandler("onPlayerCommand", root, preventCommandSpam)


local handsUp = false
local sitting = false
local lying = false
local saluting = false

function funcBindSit ( player, key, keyState )
    if getElementData(player,"isUseMedic") == false and getElementData(player,"isEating") == false and getElementData(player,"isDrinking") == false and getElementData(player,"isSetingTent") == false and getElementData(player,"Repairing") == false then
	if sitting then
		setPedAnimation (player,false)
		sitting = false
	else
	    if (getElementData(player, "repairerTab") == true) then return false; end
		if isPedInVehicle (player) then return end
		setPedAnimation (player,"BEACH","ParkSit_M_loop",-1,false)
		sitting = true
	end
   end
end


function funcBindHandsup ( player, key, keyState )
    if getElementData(player,"isUseMedic") == false and getElementData(player,"isEating") == false and getElementData(player,"isDrinking") == false and getElementData(player,"isSetingTent") == false and getElementData(player,"Repairing") == false then
	if handsUp then
		setPedAnimation (player,false)
		handsUp = false
	else
	    if (getElementData(player, "repairerTab") == true) then return false; end
		if isPedInVehicle (player) then return end
		setPedAnimation (player,"SHOP","SHP_Rob_HandsUp",-1,false)
		setTimer(function() setPedAnimation (player,false) end,1300,1)
		handsUp = true
	end
   end
end

function funcBindLie ( player, key, keyState )
    if getElementData(player,"isUseMedic") == false and getElementData(player,"isEating") == false and getElementData(player,"isDrinking") == false and getElementData(player,"isSetingTent") == false and getElementData(player,"Repairing") == false then
	if lying then
		setPedAnimation(player,"ped","getup_front",-1,false)
		setTimer(function() setPedAnimation (player,false) end,1300,1)
		lying = false
	else
	    if (getElementData(player, "repairerTab") == true) then return false; end
		if isPedInVehicle(player) then return end
		setPedAnimation (player,"ped","FLOOR_hit_f", -1,false)
		lying = true
	end
   end
end

function funcBindSalute ( player, key, keyState )
    if getElementData(player,"isUseMedic") == false and getElementData(player,"isEating") == false and getElementData(player,"isDrinking") == false and getElementData(player,"isSetingTent") == false and getElementData(player,"Repairing") == false then
	if saluting then
		setPedAnimation (player,false)
		saluting = false
	else
	    if (getElementData(player, "repairerTab") == true) then return false; end
		if isPedInVehicle(player) then return end
		setPedAnimation(player,"GHANDS","gsign5LH",-1,false)
		setTimer(function() setPedAnimation (player,false) end,2100,1)
		saluting = true
	end
   end
end

function bindTheKeys()
	bindKey(source,",","down",funcBindSalute)
	bindKey(source,".","down",funcBindHandsup)
	bindKey(source,";","down",funcBindSit)
	bindKey(source,"l","down",funcBindLie)
end
addEventHandler("onPlayerLogin", root, bindTheKeys)

addEventHandler("onResourceStart",resourceRoot,
function()
	for k,v in ipairs(getElementsByType("player")) do
		if not isGuestAccount(getPlayerAccount(v)) then
			bindKey(v,",","down",funcBindSalute)
			bindKey(v,".","down",funcBindHandsup)
			bindKey(v,";","down",funcBindSit)
			bindKey(v,"l","down",funcBindLie)
		end
	end
end)

function unbindFuncKeys()
	unbindKey(source,",","down",funcBindSalute)
	unbindKey(source,".","down",funcBindHandsup)
	unbindKey(source,";","down",funcBindSit)
	unbindKey(source,"l","down",funcBindLie)
end
addEvent("unbindFuncKeys",true)
addEventHandler("unbindFuncKeys",root,unbindFuncKeys)

function bindFuncKeys()
	bindKey(source,",","down",funcBindSalute)
	bindKey(source,".","down",funcBindHandsup)
	bindKey(source,";","down",funcBindSit)
	bindKey(source,"l","down",funcBindLie)
	handsUp = false
	sitting = false
	lying = false
	saluting = false
end
addEvent("bindFuncKeys",true)
addEventHandler("bindFuncKeys",root,bindFuncKeys)

--Armadilha de Urso
local traps = {}

createBearTrap = function(x, y, z)
            local trap = createObject ( 1762, x, y, z, 0, 0, math.random(0,360)) 
			setPedAnimation(source, "BOMBER", "BOM_Plant", -1, false, false, false, false)
			setElementCollisionsEnabled (trap, false)
            table.insert ( traps, trap ) 
            local shape = createColSphere ( x, y, z, 1 ) 
            local shapeFar = createColSphere ( x, y, z, 2 ) 
            setElementData ( shape, "trap", true ) 
            setElementData ( shape, "objectLink", trap ) 
            setElementData ( shape, "farShapeLink", shapeFar ) 
end 

 addEvent("createBearTrapC", true) 
 addEventHandler("createBearTrapC", getRootElement(), createBearTrap) 

function checkTrapPlace( theElement, matchingDimension ) 
            if ( getElementType ( theElement ) == 'player' ) and matchingDimension then 
                if getElementData ( source, "trap" ) then         
                    if not getElementData ( source, "closed" ) and not getPedOccupiedVehicle ( theElement ) then 
                        local object = getElementData ( source, "objectLink" ) 
                        if isElement ( object ) then 
                            setElementData ( source, "closed", true ) 
							setElementData(theElement, "brokenbone", true)
							setElementData(theElement, "bleeding", getElementData(theElement, "bleeding") + 12)
							setElementData(theElement, "blood", getElementData(theElement, "blood") - 3412)
							setElementData(theElement, "pain", true)
                            triggerClientEvent ( theElement, "playTrapSound", source ) 
							triggerClientEvent ( theElement, "playTrapSound_voul", source ) 
							setElementModel ( object, 1759 ) 
							setTimer(function()
							destroyElement(object)
							end,720000,1)
                        end 
                    end 
                end 
            end 
 end 
 addEventHandler("onColShapeHit",getRootElement(),checkTrapPlace) 


function makeRadioStayOff()
    setRadioChannel(0)
    cancelEvent()
end
addEventHandler("onClientPlayerVehicleEnter",getRootElement(),makeRadioStayOff)
addEventHandler("onClientPlayerRadioSwitch",getRootElement(),makeRadioStayOff)
