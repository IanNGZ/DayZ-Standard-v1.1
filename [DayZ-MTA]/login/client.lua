-- -308.42431640625,1296.0610351563,115.47154998779
resourceRoot = getResourceRootElement(getThisResource())
localPlayer = getLocalPlayer()
marwinButtons = {}

font = {}
font[1] = guiCreateFont( "font.ttf", 12 )
font[2] = guiCreateFont( "font.ttf", 28 )

--Button
function createMarwinButton(x,y,widht,height,text,bool,parent,info)
button = guiCreateStaticImage(x,y,widht,height,"images/button_standart.png", bool,parent or nil)
table.insert(marwinButtons,button)
guiBringToFront(button)
label = guiCreateLabel(0,0,1,1,text,bool,button)
guiBringToFront(label)
setElementData(label,"parent",button)
setElementData(button,"info",info)
guiSetFont(label,font[1])
guiLabelSetVerticalAlign (label, "center")
guiLabelSetHorizontalAlign (label, "center")
addEventHandler("onClientMouseEnter",label,markButton,false)
addEventHandler("onClientMouseLeave",label,unmarkButton,false)
return label
end

function markButton ()
parent = getElementData(source,"parent")
guiStaticImageLoadImage (parent,"images/button_mouse.png")
setElementData(getLocalPlayer(),"clickedButton",parent)
end

function unmarkButton (b,s)
parent = getElementData(source,"parent")
guiStaticImageLoadImage (parent,"images/button_standart.png")
setElementData(getLocalPlayer(),"clickedButton",false)
end
--false to disable all debug messages
idb = false

function loginPanel()
showCursor(true,false)
	screenw,screenh = guiGetScreenSize()
	local namep = getPlayerName(getLocalPlayer())
	local randomImage = math.random(1,4) -- Random Image Login //Scarface
	login_window = guiCreateStaticImage(0, 0, screenw, screenh, "images/bg_"..randomImage..".png", true)
        login_login = createMarwinButton(0.1,0.455,0.095,0.03,"Jugar",true,login_window,"login")
		--name = guiCreateLabel(5, 700, 175, 48, namep, false, login_window)
		--guiSetFont ( name, font[2] )
		  --login_error = guiCreateLabel(5, 5, 175, 48, "", false, login_window)
		addEventHandler ( "onClientGUIClick", login_login, function() 
			if isElement(login_window2) then 
				guiSetVisible(login_window2,false)
			end
			if isElement(register_window) then 
				guiSetVisible(register_window,false)
			end
		createLogin()
        --if idb == true then
	--outputChatBox("got reg click")
	--end
	--username = guiGetText(login_username)
	--password = guiGetText(login_password)
	--if username ~= "" and password ~= "" then
	--	guiSetText(login_error,"")
	--	 triggerServerEvent("onClientSendLoginDataToServer", getLocalPlayer(), username, password)
	--else
		--guiSetText(login_error,"Ошибка: Заполните все поля!")
	--end
         end, false )
---		 
        login_register = createMarwinButton(0.1,0.495,0.095,0.03,"Register",true,login_window,"login")
		addEventHandler ( "onClientGUIClick", login_register, function() 
			if isElement(register_window) then 
				guiSetVisible(register_window,false)
			end
			if isElement(login_window2) then 
				guiSetVisible(login_window2,false)
			end
		createRegistration()

		
 end, false )
				  login_exit = createMarwinButton(0.1,0.535,0.095,0.03,"Salir",true,login_window,"quit")
        addEventHandler ( "onClientGUIClick", login_exit, function() 
		guiSetVisible(login_window2,false)
		guiSetVisible(register_window,false)
		
 end, false )
         login_error = guiCreateLabel(5, 5, 175, 48, "", false, login_window)
        guiLabelSetColor(login_error, 197, 0, 0)
        guiLabelSetHorizontalAlign(login_error, "left", true) 
	end	
	
	
	function createRegistration()
	screenw,screenh = guiGetScreenSize()
	register_window = guiCreateStaticImage(350, 270, 200, 250, "images/menu.png", false)
	infol1 = guiCreateLabel(0.27, 0.05, 0.80, 0.30,"Registrarse",true,register_window)
	guiSetFont(infol1,font[1])
	infol4 = guiCreateLabel(0.38, 0.16, 0.80, 0.30,"Entrar",true,register_window)
	guiSetFont(infol4,font[1])
	infol5 = guiCreateLabel(0.36, 0.38, 0.80, 0.30,"Contraseña",true,register_window)
	guiSetFont(infol5,font[1])
	register_username = guiCreateEdit(30, 60, 134, 28, "", false, register_window)
    guiSetAlpha(register_username, 0.60)
	register_password = guiCreateEdit(30, 120, 134, 28, "", false, register_window)
	if isElement(login_password) then guiSetAlpha(login_password, 0.60)end
    guiEditSetMasked(register_password, true)
	regbutt = createMarwinButton(0.14,0.695,0.695,0.110,"Registrarse",true,register_window,"login")
   -- regbutt = guiCreateButton( 7, 180, 175, 48, "Вперед!", false, register_window)
	      addEventHandler ( "onClientGUIClick",  regbutt, function() 
        if idb == true then
	outputChatBox("got reg click")
	end
	username = guiGetText(register_username)
	 pass1 = guiGetText(register_password)
	if username ~= "" and  pass1 ~= "" then
		guiSetText(login_error,"")
		triggerServerEvent("onClientSendRegisterDataToServer", getLocalPlayer(), username, pass1)
	else
		guiSetText(login_error,"Error: Por favor, rellena todos los campos!")
	end
         end, false )
	end
	
	function createLogin()
	screenw,screenh = guiGetScreenSize()
	login_window2 = guiCreateStaticImage(350, 270, 200, 250, "images/menu.png", false)
	infol = guiCreateLabel(0.27, 0.05, 0.80, 0.30,"       Login",true,login_window2)
	guiSetFont(infol,font[1])
	infol2 = guiCreateLabel(0.38, 0.16, 0.80, 0.30,"Entrar",true,login_window2)
	guiSetFont(infol2,font[1])
	infol3 = guiCreateLabel(0.36, 0.38, 0.80, 0.30,"Contraseña",true,login_window2)
	guiSetFont(infol3,font[1])
	--login_window2 = guiCreateWindow(450, 250, 200, 250, "Вход", false)
	--register_window = guiCreateWindow ( 450, 250, 200, 250, "Register", true )
	login_username = guiCreateEdit(30, 60, 134, 28, "", false, login_window2)
	if isElement(register_username) then
		guiSetAlpha(register_username, 0.60)
	end
    login_password = guiCreateEdit(30, 120, 134, 28, "", false, login_window2)
    guiSetAlpha(login_password, 0.60)
    guiEditSetMasked(login_password, true)
    loginbutt = createMarwinButton(0.14,0.695,0.695,0.110,"Entrar",true,login_window2,"login")
	      addEventHandler ( "onClientGUIClick",  loginbutt, function() 
        if idb == true then
	outputChatBox("got reg click")
	end
	username = guiGetText(login_username)
	password = guiGetText(login_password)
	if username ~= "" and password ~= "" then
		guiSetText(login_error,"")
		 triggerServerEvent("onClientSendLoginDataToServer", getLocalPlayer(), username, password)
	else
		guiSetText(login_error,"Error: Por favor, rellena todos los campos!")
	end
         end, false )
		         config = xmlLoadFile("fragconf.xml")
        if config then
        uname = xmlNodeGetAttribute(config,"username")
        pass = xmlNodeGetAttribute(config,"pass")
        guiSetText(login_username,uname)
        guiSetText(login_password,pass)
        else
        config = xmlCreateFile("fragconf.xml","account")
        xmlNodeSetAttribute(config, "username", "")
    	xmlNodeSetAttribute(config, "pass", "")
        xmlSaveFile(config)
        end
	end

addEvent("regerror",true)
function registererror(etype)
	local enames = {}
	enames[0] = "Esa cuenta ya existe!"
	enames[1] = "Rellena todos los campos!"
	enames[2] = "Error desconocido!"
	enames[3] = "Nombre de usuario o contraseña invalida!"
	guiSetText(login_error,"Erro: "..enames[etype])
end
addEventHandler ( "regerror", getLocalPlayer(), registererror)

function finishlogin()
  config = xmlLoadFile("fragconf.xml")
  if isElement(login_username) then
  xmlNodeSetAttribute(config, "username",guiGetText(login_username))
  end
  if isElement(login_password) then
	xmlNodeSetAttribute(config, "pass",guiGetText(login_password))
  end
  xmlSaveFile(config)
  if isElement(login_bg) then
  	guiSetVisible(login_bg,false)
  end
  guiSetVisible(login_window,false)
  
  showCursor(false)
  if isElement(register_window) then
  	guiSetVisible(register_window,false)
  end

  if isElement(login_window2) then
	guiSetVisible(login_window2,false)
end
  
end
addEvent("onPlayerDoneLogin", true)
addEventHandler("onPlayerDoneLogin", getRootElement(), finishlogin)

addEventHandler("onClientResourceStart", resourceRoot, 
    function ()
         loginPanel()
		setPlayerHudComponentVisible ("radar", false )  
        guiSetInputMode("no_binds_when_editing")
        fadeCamera (true) 
        setCameraMatrix(2658.2626953125, 2728.0246582031, 10.541299819946, 2659.0986328125, 2728.521484375, 10.774273872375)
    end
)
--playSound("music.mp3")
