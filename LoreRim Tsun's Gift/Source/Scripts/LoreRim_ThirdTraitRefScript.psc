Scriptname LoreRim_ThirdTraitRefScript extends ObjectReference  

GlobalVariable Property GlobalFlag  Auto  

Event OnCellAttach()
    If GlobalFlag.value == 0
        Enable()
    Else
        Disable()
    EndIf
EndEvent