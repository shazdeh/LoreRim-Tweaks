Scriptname LoreTraits_WanderingStarsScript extends ObjectReference

Perk Property LoreTraits_StaffofWanderingStarsPerk Auto

Event OnEquipped(Actor akActor)
    akActor.AddPerk(LoreTraits_StaffofWanderingStarsPerk)
EndEvent

Event OnUnequipped(Actor akActor)
    akActor.RemovePerk(LoreTraits_StaffofWanderingStarsPerk)
EndEvent