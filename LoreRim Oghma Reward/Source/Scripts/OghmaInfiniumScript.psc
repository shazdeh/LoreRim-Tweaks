Scriptname OghmaInfiniumScript extends ObjectReference  

Quest Property DA04 auto
Message Property ChoiceMessage auto
int Property Advancement auto
bool Property HasBeenRead auto
Book Property MySelf auto
LoreRim_OghmaBookReward Property RewardScript Auto

Function ReadOghmaInfinium(bool fromWorld)
    GoToState("Reading")
	Utility.WaitMenuMode(2.0)
	if (HasBeenRead || !DA04.GetStageDone(200)) || ((Game.GetFormFromFile(0x010009DE, "Update.esm") as GlobalVariable).GetValue() >= 1)
    	GoToState("")
		return
	endif

    Actor player = Game.GetPlayer()

	if ChoiceMessage.Show() == 1
        PO3_SKSEFunctions.HideMenu("Book Menu")
        Utility.WaitMenuMode(1)
        PO3_SKSEFunctions.HideMenu("InventoryMenu")
        PO3_SKSEFunctions.HideMenu("TweenMenu")

        If RewardScript == None
            RewardScript = (Game.GetFormFromFile(0x800, "LoreRim Oghma Reward.esp") as Quest) as LoreRim_OghmaBookReward
        EndIf
        RewardScript.Start()
        RewardScript.OpenMenu()

        While Utility.IsInMenuMode()
            Utility.Wait(0.1)
        EndWhile

        RewardScript.Stop()

		Game.AddPerkPoints(3)
        b612.GetAnnouncement().Show("$OGHMAREWARD_TEXT", "Mora.dds", 3.5)
		HasBeenRead = True
		(Game.GetFormFromFile(0x010009DE, "Update.esm") as GlobalVariable).SetValue(1)
		Utility.Wait(0.1)
		int oghmasInfinium = Game.GetPlayer().GetItemCount(MySelf)
		Game.GetPlayer().RemoveItem(MySelf, oghmasInfinium)
		if (fromWorld && oghmasInfinium == 0) ; this trusts that the book hasn't been duped somehow
			Delete()
		endif
		utility.WaitMenuMode(0)
	endif
	GoToState("")
EndFunction

Event OnEquipped(Actor reader)
	if (reader != Game.GetPlayer())
		return
	endif

; 	Debug.Trace("DA04: Player reading Oghma Infinium from inventory.")
	ReadOghmaInfinium(false)
EndEvent

Event OnActivate(ObjectReference reader)
	if (reader != Game.GetPlayer() || IsActivationBlocked())
		return
	endif

; 	Debug.Trace("DA04: Player reading Oghma Infinium from world.")
	ReadOghmaInfinium(true)
EndEvent

State Reading
    Function ReadOghmaInfinium(Bool fromWorld)
    EndFunction
EndState