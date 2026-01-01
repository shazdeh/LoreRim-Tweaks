Scriptname ArcaneArsenal_AddSpellOnEquip extends ObjectReference

SPELL Property SpellToAdd Auto

Event OnEquipped(Actor akActor)
    akActor.AddSpell(SpellToAdd, False)
EndEvent

Event OnUnequipped(Actor akActor)
    akActor.RemoveSpell(SpellToAdd)
EndEvent