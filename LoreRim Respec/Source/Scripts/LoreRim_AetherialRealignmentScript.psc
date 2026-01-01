Scriptname LoreRim_AetherialRealignmentScript extends activemagiceffect  

LoreRimRespec_Script Property QuestScript Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "InventoryMenu")
    UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "TweenMenu")
    UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "FavoritesMenu")

    QuestScript.Respec()
EndEvent