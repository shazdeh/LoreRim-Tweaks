Scriptname DraconicBurdonRing_TrackScript extends activemagiceffect

GlobalVariable Property DraconicBurdon_SoulTrack Auto
Spell Property DraconicBurdonRing_Spell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.RemoveSpell(DraconicBurdonRing_Spell)
	akTarget.AddSpell(DraconicBurdonRing_Spell, abVerbose = False)
	DraconicBurdon_SoulTrack.SetValueInt(akTarget.GetAv("DragonSouls") as Int)
EndEvent