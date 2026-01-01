;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PRKF_LoreRim_Trapper_Rank1_0C005900 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
akTargetRef.DisableNoWait()
akActor.AddItem(LoreRimTrapper_Misc)
akTargetRef.Delete()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property LoreRimTrapper_Misc Auto
