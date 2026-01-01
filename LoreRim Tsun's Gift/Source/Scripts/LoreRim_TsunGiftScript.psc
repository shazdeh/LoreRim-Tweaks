;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname LoreRim_TsunGiftScript Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
    If TsunsGiftIsGiven.GetValueInt() == 0
        Game.GetPlayer().AddItem(Traits_HiddenPotentialPotion)
        TsunsGiftIsGiven.SetValueInt(1)
    EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property Traits_HiddenPotentialPotion Auto
GlobalVariable Property TsunsGiftIsGiven Auto