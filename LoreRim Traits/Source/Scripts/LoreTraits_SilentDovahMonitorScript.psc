Scriptname LoreTraits_SilentDovahMonitorScript extends activemagiceffect

GlobalVariable Property LoreTraits_SilentDovahTracker Auto
Spell Property LoreTraits_SilentDovahPosSpell Auto
Perk Property LoreTraits_SilentDovahScalingPerk Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddPerk(LoreTraits_SilentDovahScalingPerk)
	akTarget.RemoveSpell(LoreTraits_SilentDovahPosSpell)
	akTarget.AddSpell(LoreTraits_SilentDovahPosSpell, abVerbose = False)
	LoreTraits_SilentDovahTracker.SetValueInt(akTarget.GetAv("DragonSouls") as Int)
EndEvent