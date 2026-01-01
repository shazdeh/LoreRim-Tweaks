Scriptname LoreRimTrapper_ActorScript extends ObjectReference

ReferenceAlias Property CurrentFollower Auto

Event OnLoad()
    RegisterForSingleUpdateGameTime(0.33)
EndEvent

Event OnUpdateGameTime()
    UnloadSummon()
EndEvent

Event OnDeath()
    UnloadSummon()
EndEvent

Function UnloadSummon()
    CurrentFollower.Clear()
    DisableNoWait()
    Delete()
EndFunction