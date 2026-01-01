Scriptname AOL_ResistFreezingWaterScript extends ActiveMagicEffect

SPELL Property AOL_Proc_ResistFreezingWater Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    AOL_Proc_ResistFreezingWater.Cast(akTarget, akTarget)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akTarget.DispelSpell(AOL_Proc_ResistFreezingWater)
EndEvent
