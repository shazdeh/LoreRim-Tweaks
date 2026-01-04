Scriptname LoreTraits_QuesterMonitorScript extends activemagiceffect  

GlobalVariable Property CounterVar Auto
GlobalVariable Property LoreTraits_QuesterMaxQuests Auto
GlobalVariable Property LoreTraits_QuesterAttrPerLevel Auto
GlobalVariable Property LoreTraits_QuesterQuestsPerLevel Auto
GlobalVariable Property LoreTraits_DoneQuestsCount Auto
Spell Property LoreTraits_QuesterPos1Ab Auto
Message Property LoreTraits_QuesterUpgradeMsg Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Int iTotal = LoreTraits_DoneQuestsCount.GetValueInt()
    Int iQuestsPerLevel = LoreTraits_QuesterQuestsPerLevel.GetValueInt()
    If iTotal > iQuestsPerLevel - 1 && iTotal % iQuestsPerLevel == 0
		Actor player = Game.GetPlayer()
		player.RemoveSpell(LoreTraits_QuesterPos1Ab)
		Int i = LoreTraits_QuesterPos1Ab.GetNumEffects()

		While i != 0
			i -= 1
			LoreTraits_QuesterPos1Ab.SetNthEffectMagnitude(i, Math.Ceiling(iTotal / iQuestsPerLevel) * LoreTraits_QuesterAttrPerLevel.GetValueInt())
		EndWhile
		player.AddSpell(LoreTraits_QuesterPos1Ab, abVerbose = False)
		LoreTraits_QuesterUpgradeMsg.Show()
	EndIf

    CounterVar.SetValueInt(iTotal)
EndEvent