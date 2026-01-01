Scriptname LoreTraits_UnshakablePlayerScript extends Traits_BasePlayerScript

Float Property fMult Auto

Function ApplyModification()
    Game.SetGameSettingFloat("fStaminaBashBase", Game.GetGameSettingFloat("fStaminaBashBase") * fMult )
EndFunction

Function ResetModification()
    Game.SetGameSettingFloat("fStaminaBashBase", Game.GetGameSettingFloat("fStaminaBashBase") / fMult )
EndFunction