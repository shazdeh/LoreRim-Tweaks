;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname PRKF_PortableEnchanting_Acti_01001D8B Extends Perk Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
If akActor.HasPerk(REQ_Enchanting_Artifact_100_ArtifactEnchanter)
    PortableEnchanting_UnusableMsg.Show()
Else
    akTargetRef.Activate(akActor)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
akTargetRef.DisableNoWait()
akTargetRef.Delete()
akActor.AddItem(PortableEnchanting_Misc)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property PortableEnchanting_Misc Auto
Message Property PortableEnchanting_UnusableMsg Auto
Perk Property REQ_Enchanting_Artifact_100_ArtifactEnchanter Auto