;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname NocturnalsFavor_DialogScript Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().AddSpell(FavorSpell)
(NocturnalsFavor.GetAlias(0) as NocturnalsFavor_PlayerScript).GoToState("Listening")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property FavorSpell Auto
Quest Property NocturnalsFavor Auto