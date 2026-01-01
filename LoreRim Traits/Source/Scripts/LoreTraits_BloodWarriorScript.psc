Scriptname LoreTraits_BloodWarriorScript extends ActiveMagicEffect

Import PO3_Events_AME

Spell Property LoreTraits_BloodWarriorScalingSpell Auto
GlobalVariable Property LoreTraits_BloodWarriorHealthPerLevel Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForLevelIncrease(Self)
    OnLevelIncrease(akTarget.GetLevel())
EndEvent

Event OnLevelIncrease(int aiLevel)
    GetTargetActor().RemoveSpell(LoreTraits_BloodWarriorScalingSpell)
    LoreTraits_BloodWarriorScalingSpell.SetNthEffectMagnitude(0, LoreTraits_BloodWarriorHealthPerLevel.GetValueInt() * aiLevel)
    GetTargetActor().AddSpell(LoreTraits_BloodWarriorScalingSpell, abVerbose = False)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akTarget.RemoveSpell(LoreTraits_BloodWarriorScalingSpell)
    UnregisterForLevelIncrease(Self)
EndEvent