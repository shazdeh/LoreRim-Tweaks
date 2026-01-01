Scriptname LoreRimTrapper_DeployTrapScript extends activemagiceffect  

MiscObject Property LoreRimTrapper_Misc Auto
Message Property LoreRimTrapper_MissingMsg Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    If akTarget.GetItemCount(LoreRimTrapper_Misc)
        akTarget.DropObject(LoreRimTrapper_Misc)
    Else
        LoreRimTrapper_MissingMsg.Show()
    EndIf
EndEvent