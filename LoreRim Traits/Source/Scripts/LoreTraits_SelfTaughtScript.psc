Scriptname LoreTraits_SelfTaughtScript extends activemagiceffect

Message Property LoreTraits_SelfTaughtGainMsg Auto
Spell Property LoreTraits_SelfTaughtPos1Ab Auto
GlobalVariable Property LoreTraits_SelfTaughtMax Auto
GlobalVariable Property LoreTraits_SelfTaughtSteps Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForMenu("Book Menu")
    OnMenuOpen("")
EndEvent

Event OnMenuOpen(String asMenu)
    Int iBooksRead = Game.QueryStat("Books Read")
    If iBooksRead > LoreTraits_SelfTaughtMax.GetValueInt()
        iBooksRead = LoreTraits_SelfTaughtMax.GetValueInt()
    EndIf

    If iBooksRead > 2 && iBooksRead % LoreTraits_SelfTaughtSteps.GetValueInt() == 0
        LoreTraits_SelfTaughtGainMsg.Show()
        Actor Player = GetTargetActor()
        Player.RemoveSpell(LoreTraits_SelfTaughtPos1Ab)
        LoreTraits_SelfTaughtPos1Ab.SetNthEffectMagnitude(0, Math.Ceiling(iBooksRead / LoreTraits_SelfTaughtSteps.GetValueInt()))
        Player.AddSpell(LoreTraits_SelfTaughtPos1Ab, abVerbose = False)
    EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    UnregisterForAllMenus()
    akTarget.RemoveSpell(LoreTraits_SelfTaughtPos1Ab)
EndEvent