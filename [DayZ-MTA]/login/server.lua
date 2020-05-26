--[[
#---------------------------------------------------------------#
----* DayZ MTA Script server.lua                            *----
----* Script created by: Marwin                             *----
----* New additions and functions by: Unknown               *----
#---------------------------------------------------------------#
]]

function tryToLoginPlayer (username,password)
	local account = getAccount(username,password)
	if account then
		local accountName = getAccountName(account)
		logIn(source,account,password)
		triggerClientEvent(source,"onPlayerDoneLogin",source,accountName,password)
		triggerEvent("onPlayerDayZLogin",getRootElement(),username,pass,source)
		--triggerClientEvent(source,"stopLoginSound",source)
	end
end
addEvent("onClientSendLoginDataToServer", true)
addEventHandler("onClientSendLoginDataToServer",getRootElement(),tryToLoginPlayer)

function tryToRegsiterPlayer(username,pass)
	if not getAccount(username) then
		local theAccount = addAccount(username,pass)
		if (theAccount) then
			logIn(source,theAccount,pass)
			triggerClientEvent(source,"onPlayerDoneLogin",source,username,pass)	
			triggerEvent("onPlayerDayZRegister",getRootElement(),username,pass,source)
			--triggerEvent("onPlayerDayZLogin",getRootElement(),username,pass,source)
			--triggerClientEvent(source,"stopLoginSound",source)
		end
	end
end
addEvent("onClientSendRegisterDataToServer",true)
addEventHandler("onClientSendRegisterDataToServer",getRootElement(),tryToRegsiterPlayer)

addEventHandler("onPlayerJoin",getRootElement(),function()
	fadeCamera(source,true) 
	setCameraMatrix(source,200,1921.0000082813,24.79999905271,0,0,0)
end)
