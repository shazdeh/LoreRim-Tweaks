Scriptname LoreTraits_FatalAttractionScript extends activemagiceffect

GlobalVariable Property LoreTraits_FatalAttractionGender Auto
Message Property LoreTraits_FatalAttractionChooseMsg Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Int iGender = LoreTraits_FatalAttractionChooseMsg.Show()
    LoreTraits_FatalAttractionGender.SetValueInt(iGender)
EndEvent
