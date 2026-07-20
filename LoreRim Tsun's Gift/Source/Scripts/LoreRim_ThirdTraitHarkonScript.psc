;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname LoreRim_ThirdTraitHarkonScript Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If GlobalFlag.value == 0
    Actor harkon = PO3_SKSEFunctions.GetFormFromEditorID("DLC1HarkonRef") as Actor
    harkon.AddItem(GiftPotion)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property GiftPotion  Auto  
GlobalVariable Property GlobalFlag  Auto  
