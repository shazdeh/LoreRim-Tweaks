Scriptname NocturnalsFavor_PlayerScript extends ReferenceAlias

Import PO3_SKSEFunctions

Spell Property ProcSpell Auto

State Listening
    Event OnBeginState()
        RegisterForTrackedStatsEvent()
    EndEvent


    Event OnPlayerLoadGame()
        RegisterForTrackedStatsEvent()
    EndEvent
EndState

Event OnTrackedStatsEvent(string asStatFilter, int aiStatValue)
    If (asStatFilter == "Pockets Picked")
        ObjectReference kTarget = PO3_SKSEFunctions.GetMenuContainer()
        If kTarget
            ProcSpell.Cast(kTarget, kTarget)
        EndIf
    EndIf
EndEvent