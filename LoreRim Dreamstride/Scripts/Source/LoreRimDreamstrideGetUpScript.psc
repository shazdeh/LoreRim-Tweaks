Scriptname LoreRimDreamstrideGetUpScript extends activemagiceffect

Event OnGetUp(ObjectReference akFurniture)
    If akFurniture as LoreRimDreamstrideBenchScript
        (akFurniture as LoreRimDreamstrideBenchScript).OnEndTrade()
    EndIf
EndEvent