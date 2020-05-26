
function spawnDayZPlayer(player)
    local number = math.random(table.size(spawnPositions))
    local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
    spawnPlayer (player, x,y,z, math.random(0,360), 73, 0, 0)
    setElementFrozen(player, true)
    fadeCamera (player, true)
    setCameraTarget (player, player)
    setTimer( function(player)
        if isElement(player) then
            setElementFrozen(player, false)
        end
    end,500,1,player)
    playerCol = createColSphere(x,y,z,1.5)
    setElementData(player,"playerCol",playerCol)
    attachElements ( playerCol, player, 0, 0, 0 )
    setElementData(playerCol,"parent",player)
    setElementData(playerCol,"player",true)
    local account = getPlayerAccount(player)
    setAccountData(account,"isDead",false)
    setElementData(player,"isDead",false)
    setElementData(player,"logedin",true)
    setElementData(player,"admin",getAccountData(account,"admin") or false)
    setElementData(player,"supporter",getAccountData(account,"supporter") or false)
    ----------------------------------
    --Player Items on Start
    for i,data in ipairs(playerDataTable) do
        if data[1] =="Bandage" then
            setElementData(player,data[1],2)    
        elseif data[1] =="Painkiller" then
            setElementData(player,data[1],1)        
        elseif data[1] =="MAX_Slots" then
            setElementData(player,data[1],8)    
		elseif data[1] =="Map" then
            setElementData(player,data[1],1)
        elseif data[1] =="skin" then
            setElementData(player,data[1],73)
        elseif data[1] =="blood" then
            setElementData(player,data[1],12000)
        elseif data[1] =="temperature" then
            setElementData(player,data[1],37)
        elseif data[1] =="brokenbone" then
            setElementData(player,data[1],false)    
        elseif data[1] =="pain" then
            setElementData(player,data[1],false)
        elseif data[1] =="cold" then
            setElementData(player,data[1],false)
        elseif data[1] =="infection" then
            setElementData(player,data[1],false)
        elseif data[1] =="food" then
            setElementData(player,data[1],100)
        elseif data[1] =="thirst" then
            setElementData(player,data[1],100)
        elseif data[1] =="currentweapon_1" then
            setElementData(player,data[1],false)
        elseif data[1] =="currentweapon_2" then
            setElementData(player,data[1],false)    
        elseif data[1] =="currentweapon_3" then
            setElementData(player,data[1],false)    
        elseif data[1] =="bandit" then
            setElementData(player,data[1],false)    
        elseif data[1] =="humanity" then
            setElementData(player,data[1],2500)    
        else
            setElementData(player,data[1],0)
        end        
    end
    setElementData(player,"currentweapon_3","Parachute")
    giveWeapon(player,46,getElementData(player,"Parachute"), true )
    ----------------------------------
end
--addEvent("onPlayerLoginToDayZ",true)
--addEventHandler("onPlayerLoginToDayZ",getRootElement(),spawnDayZPlayer)
--addEventHandler("onPlayerJoin",getRootElement(),spawnDayZPlayer)

function checkBuggedAccount()
    for i,player in ipairs(getElementsByType("player")) do
        local account = getPlayerAccount(player)
        if not account then return end
        if getElementData(player,"logedin") then
            if getElementModel(player) == 0 then
                spawnDayZPlayer(player)
                outputChatBox(getPlayerName(player).."Cuenta bug, se ha reseteado.",getRootElement(),22,255,22,true)
            end
        end
    end    
end
setTimer(checkBuggedAccount,90000,0)

function notifyAboutExplosion2()
    for i,player in pairs(getVehicleOccupants(source)) do
        triggerEvent("kilLDayZPlayer",player)
    end
end
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion2)

function destroyDeadPlayer (ped,pedCol)
    destroyElement(ped)
    destroyElement(pedCol)
end

function kilLDayZPlayer (killer,headshot,weapon)
    if getElementData(source,"repairerTab") == true then
		triggerEvent("onClientMovesWhileAnimation",source)
	end
    --[[if not getElementData(source,"isDead") then
      setElementData(source,"isDead",true)
    end --]]
	if getElementData(source,"isDead") then return end
	setElementData(source,"isDead",true)
	setElementData(source,"pain",0)
	if getPedOccupiedVehicle ( source ) then removePedFromVehicle ( source ) end
    pedCol = false
    local account = getPlayerAccount(source)
    --if getElementData(source,"isInEvent") then removePlayerEvent(source) return end
    if not account then return end
    killPed(source)
    triggerClientEvent(source,"hideInventoryManual",source)
    if getElementData(source,"alivetime") > 10 then 
        if not isElementInWater(source) then
            local x,y,z = getElementPosition(source)
            if getDistanceBetweenPoints3D (x,y,z,6000,6000,0) > 200 then
                local x,y,z = getElementPosition(source)
                local rotX,rotY,rotZ = getElementRotation(source)
                local skin = getElementModel(source)
                local ped = createPed(skin,x,y,z,rotZ)
                pedCol = createColSphere(x,y,z,1.5)
                killPed(ped)
                setTimer(destroyDeadPlayer,300000,1,ped,pedCol)    
                attachElements (pedCol,ped,0,0,0)
                setElementData(pedCol,"parent",ped)
                setElementData(pedCol,"playername",getPlayerName(source))
                setElementData(pedCol,"deadman",true)
                setElementData(pedCol,"MAX_Slots",getElementData(source,"MAX_Slots"))
                local time = getRealTime()
                local hours = time.hour
                local minutes = time.minute
                setElementData(pedCol,"deadreason",getPlayerName(source).." Muerto. Causa: "..(weapon or "Unknown")..". Hora de muerte: "..hours..":"..minutes..".")
            end    
        end
    end
    if killer then
        if not getElementData(source,"bandit") then
            addPlayerStats (killer,"humanity",math.random(-2500,-1000))
        else
            addPlayerStats (killer,"humanity",math.random(1000,2500))
        end
        setElementData(killer,"murders",getElementData(killer,"murders")+1)
        if getElementData(killer,"humanity") < 0 then
            setElementData(killer,"bandit",true)
        end
        if getElementData(source,"bandit") == true then
            setElementData(killer,"banditskilled",getElementData(killer,"banditskilled")+1)
        end
        if headshot == true then
            setElementData(killer,"headshots",getElementData(killer,"headshots")+1)
        end
		    	local xX,yY,zZ = getElementPosition(source)
				local xk,yk,zk = getElementPosition(killer)
				local Distancia = getDistanceBetweenPoints3D(xX,yY,zZ,xk,yk,zk)
				triggerClientEvent ("onRollMessageStart", getRootElement(),getPlayerName(source):gsub('#%x%x%x%x%x%x','').."#1A1AFF muerto por #ffffff"..getPlayerName(killer):gsub('#%x%x%x%x%x%x','').."#FFFFFF (( Arma: #44CC00"..(weapon or "Unknown").."#FFFFFF )) Distância: #000000"..math.floor(Distancia).."m",killer,0,128,255,true)
				--triggerClientEvent ("onRollMessageStart", getRootElement(),"#FFFFFF Você foi morto por: #32FF32"..getPlayerName(killer):gsub('#%x%x%x%x%x%x',''):gsub('#%x%x%x%x%x%x','').."#FFFFFF || Arma: #32FF32"..(weapon or "Unknown").."#FFFFFF || Distância: #32FF32"..math.floor(Distancia).."m",source,0,128,255,true)
				--triggerClientEvent("onRollMessageStart",getRootElement(),getPlayerName(source):gsub('#%x%x%x%x%x%x','').." foi morto por "..getPlayerName(killer):gsub('#%x%x%x%x%x%x',''),255,255,255, "died")
	else
		triggerClientEvent("onRollMessageStart",getRootElement(),getPlayerName(source):gsub('#%x%x%x%x%x%x','').." muerto.",255,255,255, "died")
	end
    --SetElementDatas
    if pedCol then
        for i,data in ipairs(playerDataTable) do
            local plusData = getElementData(source,data[1])
            for i,v in ipairs(Ammo) do
                if data[1] == v[1] then
                    plusData = math.floor(getElementData(source,data[1])/v[2])
                end
            end
            setElementData(pedCol,data[1],plusData)
        end
        --Skin
        local skinID = getElementData(source,"skin")
        local skin = getSkinNameFromID(skinID)
        setElementData(pedCol,skin,1)
        --Backpack
        local backpackSlots = getElementData(source,"MAX_Slots")
        if backpackSlots == 12 then
            setElementData(pedCol,"Assault Pack (ACU)",1)
        elseif backpackSlots == 16 then
            setElementData(pedCol,"Alice Pack",1)
        elseif backpackSlots == 26 then
            setElementData(pedCol,"Czech Backpack",1)
		elseif backpackSlots == 48 then
            setElementData(pedCol,"Drybag(Yellow)",1)
		elseif backpackSlots == 60 then
            setElementData(pedCol,"Mountain Backpack",1)
        elseif backpackSlots == 36 then
            setElementData(pedCol,"Coyote Backpack",1)
        end
    end
    setTimer(setElementPosition,500,1,source,6000,6000,0)
    triggerClientEvent(source,"onClientPlayerDeathInfo",source)
    setAccountData(account,"isDead",true)
    setElementData(source,"isDead",true)
    --triggerClientEvent ( "onRollMessageStart", getRootElement(),"#FFFFFF"..getPlayerName(source).." #FFFFFFestá morto",0,22,255, "died")
    if isElement(getElementData(source,"playerCol")) then
	   destroyElement(getElementData(source,"playerCol"))
	end	
    setTimer(spawnDayZPlayer,4000,1,source)
end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),kilLDayZPlayer)