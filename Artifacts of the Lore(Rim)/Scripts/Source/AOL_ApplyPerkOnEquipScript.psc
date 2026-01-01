Scriptname AOL_ApplyPerkOnEquipScript extends ObjectReference

Perk Property PerkToApply Auto

Event OnEquipped(Actor akActor)
    akActor.AddPerk(PerkToApply)
EndEvent

Event OnUnequipped(Actor akActor)
    akActor.RemovePerk(PerkToApply)
EndEvent