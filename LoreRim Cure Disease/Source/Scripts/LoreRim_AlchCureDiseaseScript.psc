Scriptname LoreRim_AlchCureDiseaseScript extends activemagiceffect  

Spell Property LoreRim_CureDiseaseTimer Auto
GlobalVariable Property LoreRim_CureDisaseTimerMin Auto
GlobalVariable Property LoreRim_CureDisaseTimerMax Auto
GlobalVariable Property TimeScale Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Int rand = Utility.RandomInt(LoreRim_CureDisaseTimerMin.GetValueInt() * 60 * 60 * 24, LoreRim_CureDisaseTimerMax.GetValueInt() * 60 * 60 * 24)
    LoreRim_CureDiseaseTimer.SetNthEffectDuration(0, rand / TimeScale.GetValueInt())
    LoreRim_CureDiseaseTimer.Cast(akTarget)
EndEvent