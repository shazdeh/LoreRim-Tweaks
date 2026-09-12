Scriptname LoreRimStartUp_KeyBindingHelp extends ActiveMagicEffect

SkyInteract Property SkyInteractObj Auto
Spell Property LoreRimStartUp_KeyBindingHelpSpell Auto
HotkeyReminder_Config Property HotkeyReminder Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    SkyInteractObj.Add("lorerim", "Show Key Bindings", HotkeyReminder.iActivateKey)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    SkyInteractObj.Remove("lorerim")
    Game.GetPlayer().RemoveSpell(LoreRimStartUp_KeyBindingHelpSpell)
EndEvent