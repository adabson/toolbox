/cast
Casts the ability, item or spell
/cast [Conditonal] First Spell; [Conditional] Second Spell

/use
Casts the ability, item or spell
/use [Conditional] First Spell; [Conditional] Second Spell
Identical to /cast

/castsequence
Casts the abilities in order, then repeats
/castsequence reset=ResetFunctions [Conditional] First Spell; Second Spell
Can use reset= to determine when to return to the first ability

/castrandom Casts a random ability
/castrandom [Conditional] First Spell; Second Spell

/stopmacro
Stops the macro /stopmacro [Conditional]
Useful for creating if->then sequences

/target
Targets the named unit
/target Name

/assist
Switches your target to your target’s target
/assist [Conditional]

/targetlasttarget
Switches your target to your previous target
/targetlasttarget [Conditional]

/cleartarget
Clears your target
/cleartarget [Conditional]

/focus
Focuses your target
/focus [Conditional]

/clearfocus
Clears your focus target
/clearfocus [Conditional]

/targetenemy
Targets your closest enemy

/targetenemy [Conditional]
Functionally identical to tab-target

/targetparty
Targets your closest party member
/targetparty [Conditional]

/targetraid Targets your closest raid member
/targetraid [Conditional]

/equip  Equips the named item
/equip Name of Item

/equipslot  Equips the named item in the selected slot
/equip # Name of Item Full list of item slots

/cancelaura
Cancels the named buff/aura
/cancelbuff [Conditional] Buff Name

/cancelform
Cancels your current form
/cancelform [Conditional]
Primarily used by Druids to return to Caster form

/dismount
Cancels your current mount
/dismount [Conditional]
