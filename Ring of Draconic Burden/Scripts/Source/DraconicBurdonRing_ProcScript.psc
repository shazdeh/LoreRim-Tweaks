Scriptname DraconicBurdonRing_ProcScript extends activemagiceffect  

Spell Property DraconicBurdonRing_Spell Auto  
Perk Property DraconicBurdonRing_Perk Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddPerk(DraconicBurdonRing_Perk)
	akTarget.AddSpell(DraconicBurdonRing_Spell, abVerbose = False)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akTarget.RemovePerk(DraconicBurdonRing_Perk)
	akTarget.RemoveSpell(DraconicBurdonRing_Spell)
EndEvent