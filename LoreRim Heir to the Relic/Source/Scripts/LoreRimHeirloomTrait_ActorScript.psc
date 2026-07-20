Scriptname LoreRimHeirloomTrait_ActorScript extends ObjectReference

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	CloseMenu("GiftMenu")
EndEvent

Function CloseMenu(String asMenuName) Global
    UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", asMenuName)
EndFunction