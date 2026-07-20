Scriptname LoreRim_ThirdTraitPotionScript extends ActiveMagicEffect  

GlobalVariable Property LoreRim_ThirdTraitReceived  Auto
GlobalVariable Property LoreRim_ThirdTraitTaken  Auto
Traits_QuestScript Property QuestScript Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    If LoreRim_ThirdTraitTaken.value == 0
        UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "InventoryMenu")
        UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "TweenMenu")
        Utility.Wait(0.5)
        QuestScript.ShowTraitsMenu(0, 1)
        LoreRim_ThirdTraitReceived.value = 1
        LoreRim_ThirdTraitTaken.value = 1
    Else
        Debug.Notification("Nothing happened.")
    EndIf
EndEvent

