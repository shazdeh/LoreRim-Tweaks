Scriptname PortableEnchanting_MiscItemScript extends ObjectReference

Furniture Property PortableEnchanting_Furn Auto
ObjectReference Property player Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    If ! akNewContainer
        Self.DisableNoWait()
        If akOldContainer == player
            ObjectReference kFurniture = player.PlaceAtMe(PortableEnchanting_Furn)
            kFurniture.MoveTo(player, 120.0 * Math.Sin(player.GetAngleZ()), 120.0 * Math.Cos(player.GetAngleZ()), 0)
        EndIf
        Self.Delete()
    EndIf
EndEvent