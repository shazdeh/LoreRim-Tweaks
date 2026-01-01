Scriptname LoreTraits_RemoveSpellOnFinish extends activemagiceffect  

Spell Property SpellName Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akTarget.RemoveSpell(SpellName)
EndEvent