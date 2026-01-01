Scriptname LoreRim_MasterKeyScript extends Quest

Import PO3_SKSEFunctions

MiscObject[] Property Keys Auto
Actor Property PlayerRef Auto
Message Property LoreRim_MasterKeyMissingMsg Auto
Idle Property IdleLockPick Auto

Function DoTheThing(ObjectReference akRef)
    GoToState("Busy")
    Int level = SanitizeLockLevel(akref)
    If level > -1 && level < 5
        If PlayerRef.GetItemCount(Keys[level])
            PlayerRef.RemoveItem(Keys[level])
            akref.Lock(False)
            UpdateCrosshairs()
            akref.Activate(PlayerRef)
        Else
            LoreRim_MasterKeyMissingMsg.Show()
        EndIf
    EndIf
    GoToState("")
EndFunction

State Busy
    Function DoTheThing(ObjectReference akRef)
    endfunction
EndState

int function SanitizeLockLevel(ObjectReference lock)
	int level = lock.GetLockLevel()

	if !lock.IsLocked()
		return -1
	endif

	if level == 0 || level == 1 ; novice
		return 0
	elseif level >= 2 && level <= 25 ; Apprentice
		return 1
	elseif level >= 26 && level <= 50 ; Adept
		return 2
	elseif level >= 51 && level <= 75 ; Expert
		return 3
	elseif level >= 76 && level <= 254 ; Master
		return 4
	else
		return 5
	endif
endfunction
