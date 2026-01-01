scriptName PRKF_WSN_Daedra_Mehrunes_Boo_040986C7 extends Perk hidden

Import PO3_SKSEFunctions

globalvariable property WSN_Effect_Global_MehrunesCurrentShrineBonus auto
globalvariable property WSN_ModifyFavor_Daedra_Mehrunes_FavorPerDefile auto
wsn_trackerquest_quest property WSN_TrackerQuest auto
message property WSN_Effects_Message_Mehrunes_Boon1_DefileShrine auto
keyword property WSN_IsNewShrine_Keyword auto
Float property WSN_Iterate auto
explosion property WSN_Explosion auto
FormList Property LoreRim_DagonDefiledShrinesList Auto
Message Property LoreRim_DagonDefileFix_AlreadyDoneMsg Auto

function Fragment_0(ObjectReference akTargetRef, Actor akActor)
    If LoreRim_DagonDefiledShrinesList.HasForm(akTargetRef)
        LoreRim_DagonDefileFix_AlreadyDoneMsg.Show()
        Return
    EndIf

	Int Destroy = WSN_Effects_Message_Mehrunes_Boon1_DefileShrine.Show()
	if (game.GetFormFromFile(2086, "ccqdrsse001-survivalmode.esl") as globalvariable).GetValue() != 1 as Float && !akTargetRef.HasKeyword(WSN_IsNewShrine_Keyword)
		akTargetRef.Activate(game.GetPlayer() as ObjectReference, false)
	endIf
	if Destroy == 0
        LoreRim_DagonDefiledShrinesList.AddForm(akTargetRef)
		akTargetRef.PlaceAtMe(WSN_Explosion as form, 1, false, false)
		akTargetRef.DisableNoWait(false)
		WSN_TrackerQuest.QueueFavorChange(WSN_Effect_Global_MehrunesCurrentShrineBonus.GetValue() * WSN_ModifyFavor_Daedra_Mehrunes_FavorPerDefile.GetValue(), true, true)
		WSN_Effect_Global_MehrunesCurrentShrineBonus.SetValue(WSN_Effect_Global_MehrunesCurrentShrineBonus.GetValue() * WSN_Iterate)

        Actor closestActor = PO3_SKSEFunctions.GetClosestActorFromRef(Game.GetPlayer(), abIgnorePlayer = True)
        If closestActor
            closestActor.SendAssaultAlarm()
        EndIf
	endIf
endFunction
