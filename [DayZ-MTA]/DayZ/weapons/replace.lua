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

end

function start()
	setWorldSoundEnabled(5, false)

	tex = engineLoadTXD ( "mods/weapons/None.txd", 356)
	engineImportTXD ( tex, 355)
	engineImportTXD ( tex, 356)
	engineImportTXD ( tex, 357)
	engineImportTXD ( tex, 358)
	mod = engineLoadDFF ( "mods/weapons/None.dff", 356)
	engineReplaceModel ( mod, 355)
	engineReplaceModel ( mod, 356)
	engineReplaceModel ( mod, 357)
	engineReplaceModel ( mod, 358)


	for i,v in ipairs(Armas) do
		Replace(v[2],v[1],v[3])
	end
end

function PlaySound(ID)
  wpn1 = getElementData(source,"currentweapon_1")
  x,y,z = getPedWeaponMuzzlePosition(source)
  for _,weap in pairs(Armas)do
      soundName = weap[1]:gsub(' ',' ')
      if wpn1 == weap[1] then
	  if not fileExists("sounds/weapons/"..soundName..".wav")then return end
	  sound = playSound3D("sounds/weapons/"..soundName..".wav",x,y,z, false)
	  setSoundMaxDistance(sound,200)
	end
  end
end
addEventHandler("onClientPlayerWeaponFire",root,PlaySound)

addEventHandler( "onClientResourceStart", resourceRoot, start )