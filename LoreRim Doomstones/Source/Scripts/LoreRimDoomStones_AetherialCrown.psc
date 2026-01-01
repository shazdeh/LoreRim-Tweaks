Scriptname LoreRimDoomStones_AetherialCrown extends ActiveMagicEffect  

LoreRimDoomStones_Script Property QuestScript Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    If akTarget == Game.GetPlayer()
        QuestScript.OnAetherialCrownEquip()
    EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    If akTarget == Game.GetPlayer()
        QuestScript.OnAetherialCrownUnequip()
    EndIf
EndEvent