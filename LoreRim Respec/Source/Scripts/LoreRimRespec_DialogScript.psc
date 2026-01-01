;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname LoreRimRespec_DialogScript Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CloseMenu("Dialogue Menu")
Utility.Wait(0.3)
QuestScript.DoIt()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LoreRimRespec_Script Property QuestScript Auto

Function CloseMenu(String asMenuName) Global
    UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", asMenuName)
EndFunction
