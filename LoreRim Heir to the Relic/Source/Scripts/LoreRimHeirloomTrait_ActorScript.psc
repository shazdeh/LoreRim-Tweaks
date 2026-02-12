Scriptname LoreRimHeirloomTrait_ActorScript extends ObjectReference

GlobalVariable Property LoreRim_HeirloomTraitPriceMult Auto

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	CloseMenu("GiftMenu")
    Actor PlayerRef = akDestContainer as Actor
    Form[] items = PlayerRef.GetContainerForms()
    Int i = items.Length
    While i != 0
        i -= 1
        If items[i] != akBaseItem && ! PlayerRef.IsEquipped(items[i])
            PlayerRef.RemoveItem(items[i], PlayerRef.GetItemCount(items[i]))
        EndIf
    EndWhile
EndEvent

Function CloseMenu(String asMenuName) Global
    UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", asMenuName)
EndFunction