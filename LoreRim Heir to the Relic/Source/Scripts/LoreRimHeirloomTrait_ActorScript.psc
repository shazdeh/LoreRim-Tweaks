Scriptname LoreRimHeirloomTrait_ActorScript extends ObjectReference

GlobalVariable Property _JSW_FT_GoldDebt Auto
GlobalVariable Property LoreRim_HeirloomTraitPriceMult Auto

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	CloseMenu("GiftMenu")
    Float price = akBaseItem.GetGoldValue() as Float
    Float mult = LoreRim_HeirloomTraitPriceMult.GetValue()
    Int currentDebt = _JSW_FT_GoldDebt.GetValueInt()
    _JSW_FT_GoldDebt.SetValueInt((price * mult) as Int + currentDebt)
EndEvent

Function CloseMenu(String asMenuName) Global
    UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", asMenuName)
EndFunction