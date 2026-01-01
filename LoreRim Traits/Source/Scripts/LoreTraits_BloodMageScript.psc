Scriptname LoreTraits_BloodMageScript extends activemagiceffect  

Import PO3_Events_AME

Spell Property LoreTraits_BloodMageNeg1Ab Auto
GlobalVariable Property LoreTraits_BloodMageHealthMult Auto
Actor Property PlayerRef Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForLevelIncrease(Self)
    OnLevelIncrease(akTarget.GetLevel())
EndEvent

Event OnLevelIncrease(int aiLevel)
    GetTargetActor().RemoveSpell(LoreTraits_BloodMageNeg1Ab)
    LoreTraits_BloodMageNeg1Ab.SetNthEffectMagnitude(0, PlayerRef.GetBaseAV("Health") * LoreTraits_BloodMageHealthMult.value)
    GetTargetActor().AddSpell(LoreTraits_BloodMageNeg1Ab, abVerbose = False)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akTarget.RemoveSpell(LoreTraits_BloodMageNeg1Ab)
    UnregisterForLevelIncrease(Self)
EndEvent
