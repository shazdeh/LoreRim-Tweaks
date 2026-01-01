Scriptname AOL_UnarmedEffectScript extends activemagiceffect

Spell Property SpellToApply Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akCaster.DoCombatSpellApply(SpellToApply, akTarget) 
EndEvent