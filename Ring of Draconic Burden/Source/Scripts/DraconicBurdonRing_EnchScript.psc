Scriptname DraconicBurdonRing_EnchScript extends activemagiceffect  

Spell Property DraconicBurdonRing_Spell Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddSpell(DraconicBurdonRing_Spell, abVerbose = False)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.RemoveSpell(DraconicBurdonRing_Spell)
EndEvent