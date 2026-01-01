Scriptname Wintersun_PrayCooldownScript extends activemagiceffect  

GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property Wintersun_NextPrayTime Auto
Float Property fCooldownDays Auto
FormList Property Wintersun_NoPrayCooldownBoonsList Auto

Event OnEffectStart(actor akTarget, actor akCaster)
    If HasAnyOfBoons(akTarget, Wintersun_NoPrayCooldownBoonsList)
        Wintersun_NextPrayTime.SetValue(GameDaysPassed.value)
    Else
        Wintersun_NextPrayTime.SetValue(GameDaysPassed.value + fCooldownDays)
    EndIf
EndEvent

Bool Function HasAnyOfBoons(Actor akActor, FormList akList)
    Int i = akList.GetSize()
    While i != 0
        i -= 1
        If akActor.HasSpell(akList.GetAt(i))
            Return True
        EndIf
    EndWhile
EndFunction