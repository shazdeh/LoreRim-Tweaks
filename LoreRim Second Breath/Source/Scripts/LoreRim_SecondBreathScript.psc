Scriptname LoreRim_SecondBreathScript Extends ActiveMagicEffect

Traits_QuestScript Property QuestScript Auto
Spell Property LoreRim_SecondBreathAb Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Game.GetPlayer().RemoveSpell(LoreRim_SecondBreathAb)
    QuestScript.ShowTraitsMenu(0, 1)
EndEvent