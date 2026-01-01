scriptName PRKF_WSN_Misc_Sithis_Boon2_P_040FDD4C extends Perk hidden

;-- Properties --------------------------------------
globalvariable property WSN_ModifyFavor_Daedra_Mehrunes_FavorPerDefile auto
effectshader property WSN_FXS auto
Float property WSN_Duration auto
explosion property WSN_Explosion auto
wsn_peryite_script property WSN_Sithis auto
Float property WSN_FavorMod auto
wsn_trackerquest_quest property WSN_TrackerQuest auto

function Fragment_0(ObjectReference akTargetRef, Actor akActor)

	WSN_TrackerQuest.QueueFavorChange(WSN_FavorMod, true, true)
	WSN_FXS.Play(akTargetRef, WSN_Duration)
	WSN_Sithis.SetSithisDoor(akTargetRef)
	akTargetRef.PlaceAtMe(WSN_Explosion as form, 1, false, false)
endFunction

Function Fragment_1(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
akTargetRef.Activate(Game.GetPlayer())
;END CODE
EndFunction
