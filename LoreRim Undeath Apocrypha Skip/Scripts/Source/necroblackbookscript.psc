Scriptname NecroBlackBookScript extends ObjectReference
{Script for the Reward Book at the end of the custom apocrypha dungeon to ensure the globes do not play. Extended by the scripts for the specific books (see RewardAScript, RewardBScript, etc.).}

;--------------------------------------------------
;ADDITIONAL APOCRYPHA MANAGEMENT PROPERTIES
;------------------------------------------

bool Property requireRewardsShownToMove = True Auto
{Default: TRUE. If TRUE, the book won't move you back to Tamriel until it's presented the Apocrypha rewards.}

bool Property showRewardsOnActivation = True Auto
{Default: TRUE. If TRUE, the next activation of the book will show the book's rewards (if they aren't visible already).}

bool Property rewardsShown = False Auto Hidden
{Default: FALSER. If TRUE, the book's rewards are already visible.}


;--------------------------------------------------
;REWARD PROPERTIES
;-----------------

Quest property NecroBlackBookQuest01 Auto

Sound Property NPCHumanWritingTG Auto

ImageSpaceModifier Property FXReadScrollsBlindImod Auto
VisualEffect Property FXReadNecroBookEffect Auto

Book Property NecroRitualJournal01 Auto

ObjectReference property NecroBlackBookPortalRef Auto
ObjectReference property NecroBlackBookActivatorRef01 Auto

Actor property Player Auto Hidden

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto
Keyword property LinkCustom03 Auto

;VFX
Spell property DLC2ApocryphaRewardSpell Auto

bool hasOpenedBook = False	;Have we opened the book yet?


;--------------------------------------------------
;EVENTS
;-------

Event OnCellAttach()
	;See if the parent needs to do anything.
	Parent.OnCellLoad()
	
	;Store off the player object.
	Player = Game.GetPlayer()
EndEvent


Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		if (akActivator == Game.GetPlayer())
			GoToState("Busy")
			OpenBook()
			;GoToState("Waiting")
		EndIf
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do nothing.
	EndEvent
EndState


;--------------------------------------------------
;REQUEST HANDLING
;----------------

Function OpenBook()
        Player = Game.GetPlayer()
		;Open the book.
		Self.PlayAnimationAndWait("Stage1", "Open")

		;TEMP VFX
		DLC2ApocryphaRewardSpell.Cast(Player)
		Utility.wait(2)
		game.ShakeCamera(afStrength = 0.5, afDuration = 1.5)
		FxReadNecroBookEffect.play(Player, 8.1)
		FXReadScrollsBlindImod.apply()
		NecroBlackBookQuest01.setStage(10)
		NecroBlackBookQuest01.setStage(20)
		Utility.wait(6)
		NPCHumanWritingTG.play(Player)
		Utility.wait(1)
		NecroBlackBookActivatorRef01.Disable()
		NecroBlackBookPortalRef.Enable()
		Player.additem(NecroRitualJournal01, 1)

EndFunction