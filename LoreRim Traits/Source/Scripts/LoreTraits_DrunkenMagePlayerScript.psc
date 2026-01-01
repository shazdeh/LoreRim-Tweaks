Scriptname LoreTraits_DrunkenMagePlayerScript extends ReferenceAlias

Perk Property LoreTraits_DrunkenMagePerk Auto
Keyword Property AlcoholKeyword Auto
MagicEffect Property AlcoholEffect Auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
    Potion thisPotion = akBaseObject as Potion
    If thisPotion && thisPotion.IsFood() && IsAlcohol(thisPotion)
;        debug.Notification("Alcohol consumed.")
        GetActorReference().AddPerk(LoreTraits_DrunkenMagePerk)
        GoToState("Listening")
    EndIf
EndEvent

State Listening
    Event OnSpellCast(Form akSpell)
        If akSpell as Spell
;            debug.Notification("Spell is cast, Perk reset")
            GetActorReference().RemovePerk(LoreTraits_DrunkenMagePerk)
            GoToState("")
        EndIf
    EndEvent
EndState

Bool Function IsAlcohol(Potion akPotion)
    Int i
    While i < akPotion.GetNumEffects()
        If akPotion.GetNthEffectMagicEffect(i) == AlcoholEffect
            Return True
        EndIf
        i += 1
    EndWhile
EndFunction