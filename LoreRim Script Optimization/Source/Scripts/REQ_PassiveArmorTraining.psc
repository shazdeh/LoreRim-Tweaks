Scriptname REQ_PassiveArmorTraining extends REQ_CoreScript

; nulled

Function initScript(Int currentVersion, Int nevVersion)
	UnregisterForUpdate()
    GoToState("")
EndFunction

Function shutdownScript(Int currentVersion, Int nevVersion)
	UnregisterForUpdate()
    GoToState("")
EndFunction

Event OnUpdate()
EndEvent

Event OnObjectUnEquipped(Form akBaseObject, ObjectReference akReference)
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
EndEvent