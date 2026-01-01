Scriptname LoreTraits_SerenePresenceScript extends activemagiceffect

GlobalVariable Property SpeechVeryEasy Auto
GlobalVariable Property SpeechEasy Auto
GlobalVariable Property SpeechAverage Auto
GlobalVariable Property SpeechHard Auto
GlobalVariable Property SpeechVeryHard Auto
Float Property fMult Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	SpeechVeryEasy.SetValueInt((SpeechVeryEasy.GetValue() * fMult ) as Int)
	SpeechEasy.SetValueInt((SpeechEasy.GetValue() * fMult ) as Int)
	SpeechAverage.SetValueInt((SpeechAverage.GetValue() * fMult ) as Int)
	SpeechHard.SetValueInt((SpeechHard.GetValue() * fMult ) as Int)
	SpeechVeryHard.SetValueInt((SpeechVeryHard.GetValue() * fMult ) as Int)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    SpeechVeryEasy.SetValueInt((SpeechVeryEasy.GetValue() / fMult ) as Int)
	SpeechEasy.SetValueInt((SpeechEasy.GetValue() / fMult ) as Int)
	SpeechAverage.SetValueInt((SpeechAverage.GetValue() / fMult ) as Int)
	SpeechHard.SetValueInt((SpeechHard.GetValue() / fMult ) as Int)
	SpeechVeryHard.SetValueInt((SpeechVeryHard.GetValue() / fMult ) as Int)
EndEvent