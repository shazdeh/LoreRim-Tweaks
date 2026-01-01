Scriptname LoreRimRespec_Script extends Quest

GlobalVariable Property LoreRimRespec_Count Auto
GlobalVariable Property RequiemLite_Enabled Auto
GlobalVariable Property RespecCost Auto
Actor Property PlayerRef Auto
MiscObject Property Gold Auto
Message Property LoreRimRespec_ConfirmMsg Auto
Message Property LoreRimRespec_ConfirmLiteMsg Auto
Message Property DLC2AltarPerkPointsRefundedPlural Auto
Message Property DLC2AltarPerkPointsRefundedSingular Auto
FormList Property LoreRimRespec_PerksLists Auto
Explosion property ExplosionIllusionMassiveLight01 Auto

Function DoIt()
    Bool bIsLite = RequiemLite_Enabled.GetValueInt()
    Int choice
    If bIsLite
        choice = LoreRimRespec_ConfirmLiteMsg.Show()
    Else
        choice = LoreRimRespec_ConfirmMsg.Show()
    EndIf
    If choice == 1
        If ! bIsLite
            PlayerRef.RemoveItem(Gold, RespecCost.GetValueInt())
        EndIf
        Respec()
    EndIf
EndFunction

Function Respec()
    Game.SetInChargen(True, True, False)
    Game.ForceThirdPerson()
    Game.DisablePlayerControls(abMovement = False, abFighting = true, abCamSwitch = true, abLooking = false, abSneaking = True, abMenu = True, abActivate = True, abJournalTabs = True)
    b612.GetSpinicon().Show("Please wait...")

    Int i = 6
    Int iTotalPerks
    While i < 24
        int k = ClearPerks(ActorValueInfo.GetActorValueInfoByID(i))
        iTotalPerks += k
        i += 1
    EndWhile

    PlayerRef.PlaceAtMe(ExplosionIllusionMassiveLight01)
    Game.AddPerkPoints(iTotalPerks)

    If iTotalPerks > 1
        DLC2AltarPerkPointsRefundedPlural.Show(iTotalPerks)
    ElseIf iTotalPerks == 1
        DLC2AltarPerkPointsRefundedSingular.Show(iTotalPerks)
    EndIf
    LoreRimRespec_Count.Mod(1)

    b612.GetSpinicon().Hide()
    Game.EnablePlayerControls()
    Game.SetInChargen(False, False, False)
EndFunction

Int function ClearPerks(ActorValueInfo akAvi)
	int j = 0
    Perk[] ownedPerks = akAvi.GetPerks(PlayerRef, unowned = False, allRanks = True)
    Int ownedTotal
	While j < ownedPerks.Length
        If PlayerRef.HasPerk(ownedPerks[j])
            PlayerRef.RemovePerk(ownedPerks[j])
            ownedTotal += 1
        EndIf
		j = j + 1
	EndWhile

	Return ownedTotal
EndFunction