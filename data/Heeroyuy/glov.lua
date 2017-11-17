-------------------------------------------------------------------------------------------------------------------
-- Tables and functions for commonly-referenced gear that job files may need, but
-- doesn't belong in the global Mote-Include file since they'd get clobbered on each
-- update.
-- Creates the 'gear' table for reference in other files.
-- 
-- Note: Function and table definitions should be added to user, but references to
-- the contained tables via functions (such as for the obi function, below) use only
-- the 'gear' table.
-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
-- Modify the sets table. Any gear sets that are added to the sets table need to
-- be defined within this function, because sets isn't available until after the
-- include is complete. It is called at the end of basic initialization in Mote-Include.
-------------------------------------------------------------------------------------------------------------------
function define_global_sets()
-- Special gear info that may be useful across jobs.
gear.FCTaeonGloves = { name="Taeon Gloves", augments={'Mag. Acc.+11 "Mag.Atk.Bns."+11','"Fast Cast"+5',}}
gear.FCTaeonBoots = { name="Taeon Boots", augments={'Mag. Acc.+10','"Fast Cast"+5',}}
gear.TPTaeonGloves = { name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','STR+4',}}
gear.TPTaeonBoots = { name="Taeon Boots", augments={'Accuracy+16 Attack+16','"Dual Wield"+5','DEX+3',}}

-- Staffs
-- Dark Rings
-- Default items for utility gear values.
gear.default.weaponskill_neck = "Asperity Necklace"
gear.default.weaponskill_waist = "Caudata Belt"
gear.default.obi_waist= "Aquiline belt"
gear.default.obi_back = "Toro Cape"
gear.default.obi_ring = "Strendu Ring"



end
-------------------------------------------------------------------------------------------------------------------
-- Functions to set user-specified binds, generally on load and unload.
-- Kept separate from the main include so as to not get clobbered when the main is updated.
-------------------------------------------------------------------------------------------------------------------
-- Function to bind GearSwap binds when loading a GS script.
function global_on_load()
send_command('bind f9 gs c cycle OffenseMode')
send_command('bind ^f9 gs c cycle HybridMode')
send_command('bind !f9 gs c cycle WeaponskillMode')
send_command('bind f10 gs c set DefenseMode Physical')
send_command('bind ^f10 gs c cycle PhysicalDefenseMode')
send_command('bind !f10 gs c toggle Kiting')
send_command('bind f11 gs c set DefenseMode Magical')
send_command('bind ^f11 gs c cycle CastingMode')
send_command('bind f12 gs c update user')
send_command('bind ^f12 gs c cycle IdleMode')
send_command('bind !f12 gs c reset DefenseMode')
end
-- Function to revert binds when unloading.
function global_on_unload()
send_command('unbind f9')
send_command('unbind ^f9')
send_command('unbind !f9')
send_command('unbind @f9')
send_command('unbind f10')
send_command('unbind ^f10')
send_command('unbind !f10')
send_command('unbind f11')
send_command('unbind ^f11')
send_command('unbind !f11')
send_command('unbind f12')
send_command('unbind ^f12')
send_command('unbind !f12')
send_command('unbind ^-')
send_command('unbind ^=')
end
-------------------------------------------------------------------------------------------------------------------
-- Global event-handling functions.
-------------------------------------------------------------------------------------------------------------------
-- Global intercept on precast.
function user_precast(spell, action, spellMap, eventArgs)
cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
refine_waltz(spell, action, spellMap, eventArgs)
end
-- Global intercept on midcast.
function user_midcast(spell, action, spellMap, eventArgs)
-- Default base equipment layer of fast recast.
if spell.action_type == 'Magic' and sets.midcast and sets.midcast.FastRecast then
equip(sets.midcast.FastRecast)
end
end
-- Global intercept on buff change.
function user_buff_change(buff, gain, eventArgs)
-- Create a timer when we gain weakness. Remove it when weakness is gone.
if buff:lower() == 'weakness' then
if gain then
send_command('timers create "Weakness" 300 up abilities/00255.png')
else
send_command('timers delete "Weakness"')
end
end
end