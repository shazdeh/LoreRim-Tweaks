Scriptname LoreTraits_AcousticArcanistScript extends ActiveMagicEffect

GlobalVariable Property HirelingGold Auto
Float Property fMult Auto
Int iOriginalCost

Event OnEffectStart(Actor akTarget, Actor akCaster)
    iOriginalCost = HirelingGold.GetValueInt()
    HirelingGold.SetValueInt((iOriginalCost * fMult) as Int)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    HirelingGold.SetValueInt(iOriginalCost)
EndEvent