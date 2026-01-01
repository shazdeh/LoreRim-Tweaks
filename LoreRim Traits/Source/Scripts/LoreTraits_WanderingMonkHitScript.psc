Scriptname LoreTraits_WanderingMonkHitScript extends activemagiceffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Weapon rightWeapon = akTarget.GetEquippedWeapon(True)
    ObjectReference droppedObject
    If rightWeapon
        droppedObject = akTarget.DropObject(rightWeapon)
        droppedObject.ApplyHavokImpulse(Utility.RandomFloat(0, 2), Utility.RandomFloat(0, 2), Utility.RandomFloat(0, 2), Utility.RandomFloat(100, 300))
    EndIf
    Weapon leftWeapon = akTarget.GetEquippedWeapon(False)
    If leftWeapon
        droppedObject = akTarget.DropObject(leftWeapon)
        droppedObject.ApplyHavokImpulse(Utility.RandomFloat(0, 2), Utility.RandomFloat(0, 2), Utility.RandomFloat(0, 2), Utility.RandomFloat(100, 300))
    EndIf
    Armor equippedShield = akTarget.GetEquippedShield()
    If equippedShield
        droppedObject = akTarget.DropObject(equippedShield)
        droppedObject.ApplyHavokImpulse(Utility.RandomFloat(0, 2), Utility.RandomFloat(0, 2), Utility.RandomFloat(0, 2), Utility.RandomFloat(100, 300))
    EndIf
EndEvent