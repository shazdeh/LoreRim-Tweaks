Scriptname LoreRimDoomstones_StoneScript extends ObjectReference  

LoreRimDoomStones_Script Property QuestScript Auto

Event OnActivate(ObjectReference ref)
    If ref == Game.GetPlayer()
        QuestScript.OnActivateStone(GetBaseObject() as Activator)
        SELF.playAnimation("playanim01")
    EndIf
EndEvent