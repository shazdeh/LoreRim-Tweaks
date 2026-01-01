Scriptname LoreTraits_WandererMonitorScript extends activemagiceffect  

GlobalVariable Property LoreTraits_WandererCounter Auto
GlobalVariable Property LoreTraits_WandererMax Auto
GlobalVariable Property LoreTraits_WandererAttrPerLevel Auto
Spell Property LoreTraits_WandererPos1Ab Auto
Actor Property PlayerRef Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Int iTotal = Game.QueryStat("Locations Discovered")
    If iTotal > LoreTraits_WandererMax.GetValueInt()
        iTotal = LoreTraits_WandererMax.GetValueInt()
    EndIf

    PlayerRef.RemoveSpell(LoreTraits_WandererPos1Ab)
    Int i = LoreTraits_WandererPos1Ab.GetNumEffects()
    While i != 0
        i -= 1
        LoreTraits_WandererPos1Ab.SetNthEffectMagnitude(i, iTotal * LoreTraits_WandererAttrPerLevel.value)
    EndWhile
    PlayerRef.AddSpell(LoreTraits_WandererPos1Ab, abVerbose = False)

    LoreTraits_WandererCounter.SetValueInt(Game.QueryStat("Locations Discovered"))
EndEvent
