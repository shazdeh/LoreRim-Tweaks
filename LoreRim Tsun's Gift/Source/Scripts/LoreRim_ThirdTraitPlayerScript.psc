Scriptname LoreRim_ThirdTraitPlayerScript extends ReferenceAlias  

Potion Property GiftPotion  Auto  
GlobalVariable Property GlobalFlag  Auto  

Event OnInit()
    AddInventoryEventFilter(GiftPotion)
    GoToState("Listening")
EndEvent

State Listening
    Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
        GlobalFlag.value = 1
        GoToState("Done")
    EndEvent
EndState

State Done
EndState