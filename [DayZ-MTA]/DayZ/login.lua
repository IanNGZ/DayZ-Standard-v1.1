function startServer()
outputServerLog ("                 DayZ v1.0 Simple  ")
end
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),startServer)

function playerLogin(username, pass, player)
    local playerID = getAccountData(getPlayerAccount(player),"playerID")
    account = getPlayerAccount(player)
    local x,y,z =  getAccountData(account,"last_x"),getAccountData(account,"last_y"),getAccountData(account,"last_z")
    local skin = getAccountData(account,"skin")
    if getAccountData(account,"isDead") then
        spawnDayZPlayer(player)
        return
    end
    if x == false or y == false or z == false then return end
    spawnPlayer (player, x,y,z + 0.5, math.random(0,14), skin, 0, 0)
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
    for i,data in ipairs(playerDataTable) do
        local elementData = getAccountData(account,data[1])
        if not elementData then
            if data[1] == "brokenbone" or data[1] == "pain" or data[1] == "cold" or data[1] == "infection" or data[1] == "currentweapon_1" or data[1] == "currentweapon_2" or data[1] == "currentweapon_3" or data[1] == "bandit" then
                elementData = elementData
            else
                elementData = 0
            end
        end
        setElementData(player,data[1],elementData)
    end
    setElementData(player,"logedin",true)
    --Weapons
    --Old Weapons
    local weapon = getElementData(player,"currentweapon_1")
    if weapon then
        local ammoData,weapID = getWeaponAmmoType (weapon)
        giveWeapon(player,weapID,getElementData(player,ammoData), true )
    end
    local weapon = getElementData(player,"currentweapon_2")
    if weapon then
        local ammoData,weapID = getWeaponAmmoType (weapon)
        giveWeapon(player,weapID,getElementData(player,ammoData), false )
    end
    local weapon = getElementData(player,"currentweapon_3")
    if weapon then
        local ammoData,weapID = getWeaponAmmoType (weapon)
        giveWeapon(player,weapID,getElementData(player,ammoData), false )
    end
    setElementModel(player, getElementData(player,"skin"))

    setElementData(player,"admin",getAccountData(account,"admin") or false)
    setElementData(player,"supporter",getAccountData(account,"supporter") or false)
    --triggerClientEvent(player, "onClientPlayerDayZLogin", player)
    
end
addEvent("onPlayerDayZLogin", true)
addEventHandler("onPlayerDayZLogin", getRootElement(), playerLogin)


function playerRegister(username, pass, player)
    local number = math.random(table.size(spawnPositions))
    local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
    spawnPlayer (player, x,y,z, math.random(0,360), 73, 0, 0)
    fadeCamera (player, true)
    setCameraTarget (player, player)
    playerCol = createColSphere(x,y,z,1.5)
    attachElements ( playerCol, player, 0, 0, 0 )
    setElementData(playerCol,"parent",player)
    setElementData(playerCol,"player",true)
    ----------------------------------
    --Player Items on Start
    for i,data in ipairs(playerDataTable) do
        if data[1] =="Bandage" then
            setElementData(player,data[1],2)
        elseif data[1] =="Painkiller" then
            setElementData(player,data[1],1)
        elseif data[1] =="Parachute" then
            setElementData(player,data[1],1)
		elseif data[1] =="Map" then
            setElementData(player,data[1],1)
        elseif data[1] =="MAX_Slots" then
            setElementData(player,data[1],8)
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
        setElementData(player,"currentweapon_3","Parachute")
        giveWeapon(player,46,1, true )    
    end
    account = getAccount(username)
    local value = getAccounts()
    local value = #value
    setElementData(player,"playerID",value+1)
    setAccountData(account,"playerID",value+1)
    setElementData(player,"logedin",true)
end
addEvent("onPlayerDayZRegister", true)
addEventHandler("onPlayerDayZRegister", getRootElement(), playerRegister)

--[[function saveAccounts () -- Save in the database
    local account = getPlayerAccount(source)
    if account then
    for i,data in ipairs(playerDataTable) do
        setAccountData(account,data[1],getElementData(source,data[1]))
    end
        local x,y,z =  getElementPosition(source)
        setAccountData(account,"last_x",x)
        setAccountData(account,"last_y",y)
        setAccountData(account,"last_z",z)
        destroyElement(getElementData(source,"playerCol"))
    end    
    setElementData(source,"logedin",false)
end
addEventHandler ( "onPlayerQuit", getRootElement(), saveAccounts )

function saveAccounts2 () -- Save in the database
for i, player in ipairs(getElementsByType("player")) do
    local account = getPlayerAccount(player)
    if account then
    for i,data in ipairs(playerDataTable) do
        setAccountData(account,data[1],getElementData(player,data[1]))
    end
        local x,y,z =  getElementPosition(player)
        setAccountData(account,"last_x",x)
        setAccountData(account,"last_y",y)
        setAccountData(account,"last_z",z)
    end    
    --setElementData(player,"logedin",false)
end    
end
addEventHandler ( "onResourceStop", getRootElement(), saveAccounts2 )--]]

function saveAccounts ()
	local account = getPlayerAccount(source)
	if account then
		if isElementInWater ( source ) then
			setAccountData(account,"isDead",true)
		end
		for i,data in ipairs(playerDataTable) do
			setAccountData(account,data[1],getElementData(source,data[1]))
		end
		if getElementData(source,"antiRelogWork") then
			--createPlayerBody(source)
			setAccountData(account,"isDead",true)
		end
		local x,y,z =  getElementPosition(source)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		if isElement(getElementData(source,"playerCol")) then
		destroyElement(getElementData(source,"playerCol"))
		end
	end
	setElementData(source,"logedin",false)
end
addEventHandler ( "onPlayerQuit", getRootElement(), saveAccounts )

function saveAccounts2 ()
	for i, player in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(player)
		if account then
			for i,data in ipairs(playerDataTable) do
				setAccountData(account,data[1],getElementData(player,data[1]))
			end
			local x,y,z =  getElementPosition(player)
			setAccountData(account,"last_x",x)
			setAccountData(account,"last_y",y)
			if isElementInWater ( source ) then
				setAccountData(account,"last_z",z+30)
			else
				setAccountData(account,"last_z",z)
			end
		end
	end
end
addEventHandler ( "onResourceStop", getRootElement(), saveAccounts2 )

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

