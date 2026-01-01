Scriptname LoreRimBlackreachStartFix_Script extends ObjectReference  

Message Property MessageToShow Auto
Weapon Property WeaponToGive Auto

Event OnActivate(ObjectReference akActionRef)
    If 1 == MessageToShow.Show()
        akActionRef.AddItem(WeaponToGive)
        DisableNoWait()
        Delete()
    EndIf
EndEvent