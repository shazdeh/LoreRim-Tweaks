Scriptname LoreRim_WetnessApplySpell extends activemagiceffect  

Spell Property SpellOnStart Auto
Spell Property SpellOnFinish Auto
Spell Property AbilityOnStart Auto
Spell Property AbilityOnFinish Auto

Spell Property DispelSpellOnStart Auto
Spell Property DispelSpellOnFinish Auto
Spell Property RemoveAbilityOnStart Auto
Spell Property RemoveAbilityOnFinish Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    If SpellOnStart
        SpellOnStart.Cast(akTarget)
    EndIf
    If AbilityOnStart
        akTarget.AddSpell(AbilityOnStart)
    EndIf
    If DispelSpellOnStart
        akTarget.DispelSpell(DispelSpellOnStart)
    EndIf
    If RemoveAbilityOnStart
        akTarget.RemoveSpell(RemoveAbilityOnStart)
    EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    If SpellOnFinish
        SpellOnFinish.Cast(akTarget)
    EndIf
    If AbilityOnFinish
        akTarget.AddSpell(AbilityOnFinish)
    EndIf
    If DispelSpellOnFinish
        akTarget.DispelSpell(DispelSpellOnFinish)
    EndIf
    If RemoveAbilityOnFinish
        akTarget.RemoveSpell(RemoveAbilityOnFinish)
    EndIf
EndEvent