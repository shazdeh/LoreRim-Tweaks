Scriptname PortableEnchanting_QuestScript extends Quest

Perk Property PortableEnchanting_ActivationPerk  Auto

Event OnInit()
    Game.GetPlayer().AddPerk(PortableEnchanting_ActivationPerk)
EndEvent