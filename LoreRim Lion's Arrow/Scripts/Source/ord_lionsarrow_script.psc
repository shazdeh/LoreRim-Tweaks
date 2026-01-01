scriptName ORD_LionsArrow_Script extends activemagiceffect

actor property PlayerRef auto
formlist property ORD_Arc_LionsArrow_FormList auto

function OnPlayerBowShot(Weapon akWeapon, Ammo akAmmo, Float afPower, Bool abSunGazing)
	if afPower > 0.900000 && PlayerRef.GetAV("Magicka") >= 50
        PlayerRef.DamageAV("Magicka", 50)
		(ORD_Arc_LionsArrow_FormList.GetAt(0) as spell).Cast(PlayerRef as objectreference, none)
	endIf
endFunction
