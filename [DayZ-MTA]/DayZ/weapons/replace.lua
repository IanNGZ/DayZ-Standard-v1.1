function Replace(ID, Archivo, tipo)
	if tipo == 30 then
		if not fileExists('mods/weapons/AK/'..Archivo..'.txd')then return end
		engineImportTXD(engineLoadTXD('mods/weapons/AK/'..Archivo..'.txd'), ID)
		engineReplaceModel(engineLoadDFF('mods/weapons/AK/'..Archivo..'.dff'), ID)
	end
	if tipo == 31 then
		if not fileExists('mods/weapons/M4/'..Archivo..'.txd')then return end
		engineImportTXD(engineLoadTXD('mods/weapons/M4/'..Archivo..'.txd'), ID)
		engineReplaceModel(engineLoadDFF('mods/weapons/M4/'..Archivo..'.dff'), ID)
	end
	if tipo == 34 then
		if not fileExists('mods/weapons/Snipers/'..Archivo..'.txd')then return end
		engineImportTXD(engineLoadTXD('mods/weapons/Snipers/'..Archivo..'.txd'), ID)
		engineReplaceModel(engineLoadDFF('mods/weapons/Snipers/'..Archivo..'.dff'), ID)
	end
	if tipo == 22 or 23 or 24 then
		if not fileExists('mods/weapons/Handguns/'..Archivo..'.txd')then return end
		engineImportTXD(engineLoadTXD('mods/weapons/Handguns/'..Archivo..'.txd'), ID)
		engineReplaceModel(engineLoadDFF('mods/weapons/Handguns/'..Archivo..'.dff'), ID)
	end
	if tipo == 25 or 26 or 27 then
		if not fileExists('mods/weapons/Shotguns/'..Archivo..'.txd')then return end
		engineImportTXD(engineLoadTXD('mods/weapons/Shotguns/'..Archivo..'.txd'), ID)
		engineReplaceModel(engineLoadDFF('mods/weapons/Shotguns/'..Archivo..'.dff'), ID)
	end
	if tipo == 28 or 29 or 32 then
		if not fileExists('mods/weapons/Sub-Machine/'..Archivo..'.txd')then return end
		engineImportTXD(engineLoadTXD('mods/weapons/Sub-Machine/'..Archivo..'.txd'), ID)
		engineReplaceModel(engineLoadDFF('mods/weapons/Sub-Machine/'..Archivo..'.dff'), ID)
	end

end

function start()
	setWorldSoundEnabled(5, false)

	tex = engineLoadTXD ( "mods/weapons/None.txd", 356)
	--Handguns
	engineImportTXD ( tex, 346)
	engineImportTXD ( tex, 347)
	engineImportTXD ( tex, 348)
	--Shotguns
	engineImportTXD ( tex, 349)
	engineImportTXD ( tex, 350)
	engineImportTXD ( tex, 351)
	--Sub-Machine
	engineImportTXD ( tex, 352)
	engineImportTXD ( tex, 353)
	engineImportTXD ( tex, 372)
	--Assault Rifles
	engineImportTXD ( tex, 355)
	engineImportTXD ( tex, 356)
	--Rifles
	engineImportTXD ( tex, 357)
	engineImportTXD ( tex, 358)

	mod = engineLoadDFF ( "mods/weapons/None.dff", 356)


	engineReplaceModel ( mod, 346)
	engineReplaceModel ( mod, 347)
	engineReplaceModel ( mod, 348)
	--Shotguns
	engineReplaceModel ( mod, 349)
	engineReplaceModel ( mod, 350)
	engineReplaceModel ( mod, 351)
	--Sub-Machine
	engineReplaceModel ( mod, 352)
	engineReplaceModel ( mod, 353)
	engineReplaceModel ( mod, 372)
	--Assault Rifles
	engineReplaceModel ( mod, 355)
	engineReplaceModel ( mod, 356)
	--Rifles
	engineReplaceModel ( mod, 357)
	engineReplaceModel ( mod, 358)
	
	for i,v in ipairs(Armas) do
		Replace(v[2],v[1],v[3])
	end
	Sounds()
end
addEventHandler( "onClientResourceStart", resourceRoot, start )

function Sounds()
	for k, v in ipairs(Armas) do
		local Arma = v[1]

		Armas[Arma] = {}

		if v[6] then
			Armas[Arma].Sonido = v[6]
		else
			Armas[Arma].Sonido = v[1]
		end
	end
end

function Disparo()
	local Slot = getPedWeaponSlot(source)
    local mX, mY, mZ = getPedWeaponMuzzlePosition(source)

	name = false

	if Slot == 3 or Slot == 5 or Slot == 6 then
		name = source:getData('currentweapon_1')
	elseif Slot == 2 or Slot == 4 then
		name = source:getData('currentweapon_2')
	end

	if not name then return end

	Sonido = playSound3D('sounds/weapons/'..Armas[name].Sonido..'.wav', mX, mY, mZ, false)
	setSoundMaxDistance(Sonido, 75)
end
addEventHandler("onClientPlayerWeaponFire", getRootElement(), Disparo)

