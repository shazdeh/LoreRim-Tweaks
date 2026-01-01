Scriptname LoreTraits_QuesterMonitorScript extends activemagiceffect  

GlobalVariable Property CounterVar Auto
GlobalVariable Property LoreTraits_QuesterMaxQuests Auto
Spell Property LoreTraits_QuesterPos1Ab Auto
Message Property LoreTraits_QuesterUpgradeMsg Auto
Int Property iAttributeGainPerLevel Auto
Int Property iQuestsPerLevel Auto
Bool Property bMisc Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Int iTotal = Game.QueryStat("Misc Objectives Completed") + Game.QueryStat("Quests Completed")
    If iTotal > LoreTraits_QuesterMaxQuests.GetValueInt()
        iTotal = LoreTraits_QuesterMaxQuests.GetValueInt()
    EndIf

    If iTotal > iQuestsPerLevel - 1 && iTotal % iQuestsPerLevel == 0
		Actor player = Game.GetPlayer()
		player.RemoveSpell(LoreTraits_QuesterPos1Ab)
		Int i = LoreTraits_QuesterPos1Ab.GetNumEffects()
		While i != 0
			i -= 1
			LoreTraits_QuesterPos1Ab.SetNthEffectMagnitude(i, Math.Ceiling(iTotal / iQuestsPerLevel) * iAttributeGainPerLevel)
		EndWhile
		player.AddSpell(LoreTraits_QuesterPos1Ab, abVerbose = False)
		LoreTraits_QuesterUpgradeMsg.Show()
	EndIf

	If bMisc
		CounterVar.SetValueInt(Game.QueryStat("Misc Objectives Completed"))
	Else
		CounterVar.SetValueInt(Game.QueryStat("Quests Completed"))
	EndIf
EndEvent