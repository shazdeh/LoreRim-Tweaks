Scriptname ThievingXP_Script extends Quest

Import PO3_SKSEFunctions
Import Experience

GlobalVariable Property ThievingXP_PickpocketMax Auto
GlobalVariable Property ThievingXP_PickpocketMin Auto
GlobalVariable Property ThievingXP_PickpocketValueMult Auto
ThievingXP_PlayerScript Property PlayerScript Auto
Actor Property PlayerRef Auto
MagicEffect Property ThievingXP_PickpocketedEffect Auto
Spell Property ThievingXP_Pickpocketed Auto
GlobalVariable Property ThievingXP_NoviceLockpickXP Auto
GlobalVariable Property ThievingXP_ApprenticeLockpickXP Auto
GlobalVariable Property ThievingXP_AdeptLockpickXP Auto
GlobalVariable Property ThievingXP_ExpertLockpickXP Auto
GlobalVariable Property ThievingXP_MasterLockpickXP Auto
Keyword Property ActorTypeNPC Auto

Int iTotalValue
Actor currentTarget
ObjectReference currentLock
Int iLockLevel

Event OnInit()
    Init()
EndEvent

Function Init()
    RegisterForMenu("ContainerMenu")
    RegisterForMenu("Lockpicking Menu")
EndFunction

Event OnMenuOpen(String asMenu)
    If asMenu == "ContainerMenu"
        If PlayerRef.IsSneaking()
            Actor target = GetMenuContainer() as Actor
            If target && ! target.IsDead() && target.HasKeyword(ActorTypeNPC) && ! target.IsPlayerTeammate() && ! UI.IsMenuOpen("Dialogue Menu") && ! target.HasMagicEffect(ThievingXP_PickpocketedEffect)
                currentTarget = target
                PlayerScript.GoToState("Listening")
            EndIf
        EndIf
    Else
        currentLock = Game.GetCurrentCrosshairRef()
		iLockLevel = currentLock.GetLockLevel()
    EndIf
EndEvent

Event OnMenuClose(String asMenu)
    If asMenu == "ContainerMenu"
        If currentTarget
            PlayerScript.GoToState("")
            If iTotalValue > 0
                AddExperience(iTotalValue)
                ThievingXP_Pickpocketed.Cast(currentTarget)
            EndIf
            iTotalValue = 0
            currentTarget = None
        EndIf
    Else
        If iLockLevel > -1 && currentLock && ! currentLock.IsLocked()
            Int XP = 0
            If iLockLevel <= 1
                XP = ThievingXP_NoviceLockpickXP.GetValueInt()
            ElseIf iLockLevel <= 25
                XP = ThievingXP_ApprenticeLockpickXP.GetValueInt()
            ElseIf iLockLevel <= 50
                XP = ThievingXP_AdeptLockpickXP.GetValueInt()
            ElseIf iLockLevel <= 75
                XP = ThievingXP_ExpertLockpickXP.GetValueInt()
            ElseIf iLockLevel <= 254
                XP = ThievingXP_MasterLockpickXP.GetValueInt()
            EndIf
            If XP > 0
                Experience.AddExperience(XP)
            EndIf
        EndIf
    EndIf
EndEvent

Function CalcValue(Form akBaseItem, Int aiItemCount)
    Int value = akBaseItem.GetGoldValue() * aiItemCount
    Int xp = (value as Float * ThievingXP_PickpocketValueMult.GetValue()) as Int
    If xp > ThievingXP_PickpocketMax.GetValueInt()
        xp = ThievingXP_PickpocketMax.GetValueInt()
    ElseIf xp < ThievingXP_PickpocketMin.GetValueInt()
        xp = ThievingXP_PickpocketMin.GetValueInt()
    EndIf
    iTotalValue += xp
EndFunction