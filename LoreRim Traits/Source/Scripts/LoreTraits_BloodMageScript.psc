Scriptname LoreTraits_BloodMageScript extends activemagiceffect  

Import PO3_Events_AME

Spell Property LoreTraits_BloodMageNeg1Ab Auto
GlobalVariable Property LoreTraits_BloodMageHealthPerLevel Auto
Actor Property PlayerRef Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForLevelIncrease(Self)
    OnLevelIncrease(akTarget.GetLevel())
EndEvent

Event OnLevelIncrease(int aiLevel)
    GoToState("Processing")

    While Utility.IsInMenuMode()
        Utility.Wait(1)
    EndWhile

    GetTargetActor().RemoveSpell(LoreTraits_BloodMageNeg1Ab)
    LoreTraits_BloodMageNeg1Ab.SetNthEffectMagnitude(0, PlayerRef.GetLevel() * LoreTraits_BloodMageHealthPerLevel.value)
    GetTargetActor().AddSpell(LoreTraits_BloodMageNeg1Ab, abVerbose = False)

    GoToState("")
EndEvent

State Processing
    Event OnLevelIncrease(int aiLevel)
    EndEvent
EndState

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akTarget.RemoveSpell(LoreTraits_BloodMageNeg1Ab)
    UnregisterForLevelIncrease(Self)
EndEvent
