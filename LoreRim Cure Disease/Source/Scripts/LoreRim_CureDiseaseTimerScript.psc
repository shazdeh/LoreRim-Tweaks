Scriptname LoreRim_CureDiseaseTimerScript extends activemagiceffect  

Spell Property LoreRim_CureDiseaseSpell Auto

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    LoreRim_CureDiseaseSpell.Cast(akTarget)
EndEvent