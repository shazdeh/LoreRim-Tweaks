Scriptname LoreRimTrapper_TrapScript extends ObjectReference

Spell Property LoreRimTrapper_InfectFireAb Auto
Spell Property LoreRimTrapper_InfectFrostAb Auto
Spell Property LoreRimTrapper_InfectStormAb Auto
Spell Property FireDamageSpell Auto
Spell Property FrostDamageSpell Auto
Spell Property ShockDamageSpell Auto
Spell Property ParalyseSpell Auto

; internal
TrapHitBase hitBase
Int Property iElementalType Auto
Bool Property bApplyParalysis Auto

Event onLoad()
    hitBase = (self as objectReference) as TrapHitBase
EndEvent

Event OnTrapHitStart(ObjectReference akTarget, float afXVel, float afYVel, float afZVel, float afXPos, float afYPos, float afZPos, int aeMaterial, bool abInitialHit, int aeMotionType)
    If hitBase.GetState() == "CanHit" && akTarget as Actor
        If iElementalType
            If iElementalType == 1
                (akTarget as Actor).AddSpell(LoreRimTrapper_InfectFireAb)
                FireDamageSpell.Cast(Game.GetPlayer(), akTarget)
            ElseIf iElementalType == 2
                (akTarget as Actor).AddSpell(LoreRimTrapper_InfectFrostAb)
                FrostDamageSpell.Cast(Game.GetPlayer(), akTarget)
            Else
                (akTarget as Actor).AddSpell(LoreRimTrapper_InfectStormAb)
                ShockDamageSpell.Cast(Game.GetPlayer(), akTarget)
            EndIf
            iElementalType = 0
        EndIf
        If bApplyParalysis
            ParalyseSpell.Cast(Game.GetPlayer(), akTarget)
        EndIf
    EndIf
EndEvent