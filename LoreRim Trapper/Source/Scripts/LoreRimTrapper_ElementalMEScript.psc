Scriptname LoreRimTrapper_ElementalMEScript extends activemagiceffect

ActorBase Property SummonOnDeath Auto
LoreRimTrapper_QuestScript Property LoreRimTrapper_Quest Auto

Actor kTarget

Event OnEffectStart(Actor akTarget, Actor akCaster)
    kTarget = akTarget
EndEvent

Event OnDying(actor akKiller)
    ; GetTargetActor() is empty
    LoreRimTrapper_Quest.NewSummon(SummonOnDeath, kTarget)
EndEvent