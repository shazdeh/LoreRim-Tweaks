Scriptname AOL_MerchantPerkScript extends activemagiceffect

FormList Property AOL_UniqueItems Auto
Float Property fPriceReduction Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Int i = AOL_UniqueItems.GetSize()
    While i > 0
        i -= 1
        AOL_UniqueItems.GetAt(i).SetGoldValue( ( AOL_UniqueItems.GetAt(i).GetGoldValue() * fPriceReduction ) as Int )
    EndWhile
EndEvent