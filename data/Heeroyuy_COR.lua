-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
require 'organizer-lib'
--[[
gs c toggle LuzafRing -- Toggles use of Luzaf Ring on and off
Offense mode is melee or ranged. Used ranged offense mode if you are engaged
for ranged weaponskills, but not actually meleeing.
Weaponskill mode, if set to 'Normal', is handled separately for melee and ranged weaponskills.
--]]
-- Initialization function for this job file.
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
include('Augments.lua')
end
-- Setup vars that are user-independent. state.Buff vars initialized here will automatically be tracked.
function job_setup()
-- Whether to use Luzaf's Ring
state.LuzafRing = M(false, "Luzaf's Ring")
-- Whether a warning has been given for low ammo
state.warned = M(false)
define_roll_values()
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('Ranged', 'Melee', 'Acc', 'DW', 'DWAcc', 'DWFullBuff')
state.RangedMode:options('Normal', 'Acc')
state.WeaponskillMode:options('Normal', 'Acc')
state.CastingMode:options('Normal', 'Resistant', 'Empy')
state.IdleMode:options('Normal', 'PDT', 'Refresh', 'RefreshPDT', 'MDT')
gear.RAbullet = "Decimating Bullet"
gear.WSbullet = "Decimating Bullet"
gear.MAbullet = "Decimating Bullet"
gear.QDbullet = "Animikii Bullet"
gear.defaultobi = "Fotia belt"
options.ammo_warning_limit = 15
-- Additional local binds
send_command('bind ^` input /ja "Double-up" <me>')
send_command('bind !` input /ja "Bolter\'s Roll" <me>')
send_command('bind !q input /ra <t>')
send_command('bind ^q input /ra <t>')
send_command('bind ^= input //gs c toggle LuzafRing')
select_default_macro_book()
end
-- Called when this job file is unloaded (eg: job change)
function user_unload()
send_command('unbind ^`')
send_command('unbind !`')
end
-- Define sets and vars used by this job file.
function init_gear_sets()

include('Augments.lua')
--------------------------------------
-- Start defining the sets
--------------------------------------
sets.Obi = {waist="Hachirin-no-Obi"}
sets.goldsmithing = {
	head="Shaded spectacles",
	neck="Goldsmith's torque",
	body="Goldsmith's smock",
	ring1="Craftkeeper's ring",
	ring2="Craftmaster's ring"}


sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
sets.precast.JA['Snake Eye'] = {legs="Lanun Culottes"}
sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +1"}
sets.precast.JA['Random Deal'] = {body="Lanun Frac"}




sets.precast.CorsairRoll = {head="Lanun Tricorne",hands="Chasseur's Gants +1",back="Camulus's mantle", legs="Desultor tassets", ring1="Barataria ring"}
sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2", ring1="Barataria ring"})
sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes +1", legs="Desultor tassets", ring1="Barataria ring"})
sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chasseur's Tricorne +1", legs="Desultor tassets", ring1="Barataria ring"})
sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1", legs="Desultor tassets", ring1="Barataria ring"})
sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1", legs="Desultor tassets", ring1="Barataria ring"})




sets.precast.LuzafRing = {ring1="Barataria ring", ring2="Luzaf's Ring"}
sets.precast.DoubleUp = {head="Lanun Tricorne",hands="Chasseur's Gants +1",back="Gunslinger's cape", ring1="Barataria ring"}
--sets.precast.CorsairShot = {head="", body="Samnuha coat", ammo="Animikii bullet"}


-- Waltz set (chr and vit)
sets.precast.Waltz = {
head="Whirlpool Mask",
body="Passion jacket",
hands="Taeon gloves",
legs="Dashing subligar",
feet="Iuitl Gaiters +1"}

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Fast cast sets for spells

sets.precast.FC = {
head="Haruspex Hat +1",
neck="Orunmila's torque",
ear1="Enchanter earring +1",
ear2="Loquacious Earring",
body="Taeon Tabard",
hands="Leyline gloves",
ring1="Prolix Ring",
waist="Goading belt",
legs="Rawhide trousers",
feet=gear.FCTaeonBoots}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Orunmila's torque"})


sets.precast.RA = {
ammo=gear.RAbullet,
head="Chasseur's Tricorne +1",
hands="Carmine Fin. Ga. +1",
back="Navarch's Mantle",
waist="Impulse Belt",
legs="Adhemar kecks",
feet="Meg. Jam. +1"}

       
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
head="Dampening Tam",
neck="Fotia gorget",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Adhemar jacket",
hands="Meg. gloves +1",
ring1="Rajas Ring",
ring2="Epona's Ring",
back=gear.CorTPBack,
waist="Fotia Belt",
legs="Adhemar kecks",
feet="Herculean boots"}

 
-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Savage Blade'] = {
head="Dampening Tam",
body="Adhemar Jacket",
hands="Meg. Gloves +1",
legs="Meg. Chausses +1",
feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+21','DEX+15','"Treasure Hunter"+1','Accuracy+20 Attack+20','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear="Cessance Earring",
right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
left_ring="Apate ring",
right_ring="Epona's Ring",
back="Letalis Mantle",
}

sets.precast.WS['Evisceration'] = sets.precast.WS

sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

sets.precast.WS['Last Stand'] = {
ammo="Decimating Bullet",
head="Meghanada Visor +1",
body="Laksamana's frac +2",
hands="Meg. Gloves +1",
legs="Meg. Chausses +1",
feet="Meg. Jam. +1",
neck="Fotia Gorget",
waist="Fotia Belt",
left_ear="Clearview Earring",
right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
left_ring="Hajduk Ring +1",
right_ring="Hajduk Ring +1",
back=gear.CorRangedWSBack}

sets.precast.WS['Last Stand'].Acc = sets.precast.WS['Last Stand']


sets.precast.WS['Leaden Salute'] = {
ammo=gear.MAbullet,
head="Pixie hairpin +1",
neck="Sanctity Necklace",
ear1="Friomisi Earring",
ear2="Moonshade Earring",
body="Samnuha coat",
hands="Carmine Fin. Ga. +1",
ring1="Archon Ring",
ring2="Arvina Ringlet +1",
back=gear.CorMagicalWSBack,
waist="Fotia belt",
legs=gear.MABWSDHerculeanTrousers,
feet=gear.MABHerculeanBoots}



sets.precast.WS['Wildfire']= {
ammo=gear.MAbullet,
head="Herculean Helm",
neck="Sanctity Necklace",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Arvina Ringlet +1",
ring2="Acumen ring",
back="Toro Cape",
waist="Fotia belt",
legs=gear.MABHerculeanTrousers,
feet=gear.MABHerculeanBoots}



-- Midcast Sets
sets.midcast.FastRecast = {
head="Haruspex hat +1",
ear1="Loquacious earring",
ear2="Enchanter earring +1",
neck="Orunmila's torque",
body=gear.FCTaeonTabard,
hands="Leyline gloves",
ring1="Prolix ring",
ring2="Weatherspoon ring",
waist="Goading belt",
legs="Rawhide trousers",
feet=gear.FCTaeonBoots}

-- Specific spells
sets.midcast.Utsusemi = sets.midcast.FastRecast
sets.midcast.Cure = {
neck="Phalaina locket",
legs="Desultor tassets"
}
sets.precast.CorsairShot = {
ammo="Animikii bullet",
head="Herculean helm",
neck="Sanctity Necklace",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Samnuha coat",
hands="Carmine Fin. Ga. +1",
ring1="Acumen Ring",
ring2="Arvina Ringlet +1",
back=gear.CorMagicalWSBack,
waist="Eschan stone",
legs=gear.MABHerculeanTrousers,
feet=gear.MABHerculeanBoots}

sets.precast.CorsairShot.Acc = {
ammo="Animikii bullet",
head="Dampening Tam",
neck="Sanctity Necklace",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Weatherspoon Ring",
ring2="Sangoma Ring",
back=gear.CorMagicalWSBack,
waist="Eschan stone",
legs="Rawhide trousers",
feet="Chasseur's bottes +1"}

sets.precast.CorsairShot.Empy = {
ammo="Animikii bullet",
head="Herculean helm",
neck="Sanctity Necklace",
ear1="Friomisi earring",
ear2="Hecate's Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Acumen Ring",
ring2="Arvina ringlet +1",
back="Gunslinger's cape",
waist="Eschan stone",
legs=gear.MABHerculeanTrousers,
feet="Chasseur's bottes +1"}


sets.precast.CorsairShot['Light Shot'] = {
ammo="Animikii bullet",
head="Dampening tam",
neck="Sanctity necklace",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Weatherspoon Ring",
ring2="Sangoma Ring",
back=gear.CorMagicalWSBack,
waist="Eschan stone",
legs="Rawhide trousers",
feet="Chasseur's bottes +1"}

sets.precast.CorsairShot['Dark Shot'] = {
ammo="Animikii bullet",
head="Dampening tam",
neck="Sanctity necklace",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Weatherspoon Ring",
ring2="Sangoma Ring",
back=gear.CorMagicalWSBack,
waist="Eschan stone",
legs="Rawhide trousers",
feet="Chasseur's bottes +1"}


-- Ranged gear
sets.midcast.RA = {
ammo=gear.RAbullet,
head="Chasseur's Tricorne +1",
neck="Ocachi Gorget",
ear1="Enervating Earring",
ear2="Telos Earring",
body="Chasseur's Frac +1",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas Ring",
ring2="Hajduk Ring +1",
back="Gunslinger's cape",
waist="Eschan Stone",
legs="Samnuha tights",
feet="Meg. Jam. +1"}

sets.midcast.RA.Acc = {
ammo=gear.RAbullet,
head="Meghanada visor +1",
neck="Marked gorget",
ear1="Enervating Earring",
ear2="Telos Earring",
body="Laksamana's frac +2",
hands="Meg. gloves +1",
ring1="Hajduk Ring +1",
ring2="Hajduk Ring +1",
back=gear.CorRangedWSBack,
waist="Kwahu kachina belt",
legs="Meg. chausses +1",
feet="Meg. Jam. +1"}


sets.midcast.RA.Acc.TripleShot = {
ammo=gear.RAbullet,
head="Meghanada visor +1",
neck="Marked gorget",
ear1="Enervating Earring",
ear2="Telos Earring",
body="Laksamana's frac +2",
hands="Meg. gloves +1",
ring1="Hajduk Ring +1",
ring2="Hajduk Ring +1",
back=gear.CorRangedWSBack,
waist="Kwahu kachina belt",
legs="Meg. chausses +1",
feet="Meg. Jam. +1"}
-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}


-- Idle sets
sets.idle = {ammo=empty,
head="Oce. Headpiece +1",
neck="Wiglen Gorget",
ear1="Infused Earring",
ear2="Telos Earring",
body="Khepri jacket",
hands="Garden bangles",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Moonbeam Cape",
waist="Flume Belt +1",
legs="Carmine Cuisses +1",
feet="Meg. Jam. +1"}

sets.idle.Refresh = {ammo=empty,
head="Rawhide mask",
neck="Wiglen Gorget",
ear1="Infused Earring",
ear2="Telos Earring",
body="Mekosu. Harness",
hands="Garden bangles",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Moonbeam Cape",
waist="Flume Belt +1",
legs="Rawhide Trousers",
feet="Skadi's Jambeaux +1"}

sets.idle.RefreshPDT = {ammo=empty,
head="Rawhide mask",
neck="Twilight Torque",
ear1="Infused Earring",
ear2="Telos Earring",
body="Mekosu. harness",
hands="Umuthi gloves",
ring1="Defending Ring",
ring2="Vocane ring",
back="Moonbeam Cape",
waist="Flume Belt +1",
legs="Rawhide trousers",
feet="Skadi's jambeaux +1"}

sets.idle.PDT = {
head="Meghanada Visor +1",
neck="Loricate Torque +1",
ear1="Infused Earring",
ear2="Telos Earring",
body="Meghanada cuirie",
hands="Meg. Gloves +1",
ring1="Defending Ring",
ring2="Vocane ring",
back="Moonbeam cape",
waist="Flume Belt +1",
legs="Carmine cuisses +1",
feet="Meg. Jam. +1"}

sets.idle.MDT = {
head="Dampening Tam",
neck="Loricate Torque +1",
ear1="Ethereal earring",
ear2="Infused earring",
body="Samnuha coat",
hands="Floral gauntlets",
ring1="Defending Ring",
ring2="Vocane ring",
back="Mubvum. Mantle",
waist="Flume Belt +1",
legs="Samnuha tights",
feet="Herculean boots"}

-- Defense sets
sets.defense.PDT = {
head="Meghanada visor +1",
neck="Loricate torque +1",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Meghanada cuirie",
hands="Meghanada gloves +1",
ring1="Defending Ring",
ring2="Vocane ring",
back="Moonbeam Cape",
waist="Flume Belt +1",
legs="Meg. Chausses +1",
feet="Meghanada jambeaux +1"}

sets.defense.MDT = {
head="Dampening Tam",
neck="Loricate Torque +1",
ear1="Clearview Earring",
ear2="Volley Earring",
body="Samnuha coat",
hands="Floral gauntlets",
ring1="Defending Ring",
ring2="Vocane ring",
back="Mubvum. Mantle",
waist="Flume Belt +1",
legs="Samnuha tights",
feet="Iuitl gaiters +1"}


sets.Kiting = {legs="Carmine cuisses +1"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Normal  group


sets.engaged.Acc = {ammo=empty,
head="Dampening Tam",
neck="Iqabi Necklace",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Mekosu. harness",
hands="Herculean gloves",
ring1="Enlivened Ring",
ring2="Oneiros Annulet",
back="Letalis mantle",
waist="Anguinus belt",
legs="Taeon tights",
feet=gear.TPHerculeanBoots}

sets.engaged.DW = {ammo=empty,
head=gear.TPTaeonChapeau,
neck="Asperity Necklace",
ear1="Suppanomimi",
ear2="Telos Earring",
body="Adhemar jacket",
hands=gear.TPTaeonGloves,
ring1="Epona's Ring",
ring2="Oneiros Ring",
back=gear.CorTPBack,
waist="Windbuffet belt +1",
legs="Carmine cuisses +1",
feet=gear.TPTaeonBoots}


sets.engaged.DWAcc = {ammo=empty,
head="Dampening Tam",
neck="Ej Necklace",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Adhemar jacket",
hands=gear.AdhemarWristbandsMelee,
ring1="Chirich Ring",
ring2="Chirich Ring",
back=gear.CorTPBack,
waist="Kentarch belt +1",
legs="Carmine cuisses +1",
feet="Herculean Boots"}

sets.engaged.DWFullBuff = {ammo=empty,
head="Dampening Tam",
neck="Lissome Necklace",
ear1="Cessance Earring",
ear2="Telos Earring",
body="Adhemar jacket",
hands=gear.AdhemarWristbandsMelee,
ring1="Chirich Ring",
ring2="Chirich ring",
back=gear.CorTPBack,
waist="Kentarch belt +1",
legs="Adhemar kecks",
feet=gear.TAHerculeanBoots}

sets.engaged.Ranged = {ammo=empty,
head="Whirlpool Mask",neck="Twilight Torque",ear1="Clearview Earring",ear2="Volley Earring",
body="Lanun frac",hands="Iuitl Wristbands +1",ring1="Defending Ring",ring2="Roller's Ring",
back="Moonbeam Cape",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"} 

sets.TripleShot = 
{body="Chasseur's frac +1"}

sets.goldsmithing = {
head="Shaded specs.",
neck="Goldsmith's torque",
body="Goldsmith's smock",
ring1="Craftmaster's ring",
ring2="Artificer's ring"}
 

end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	
-- Check that proper ammo is available if we're using ranged attacks or similar.
if spell.action_type == 'Ranged Attack' or spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
do_bullet_checks(spell, spellMap, eventArgs)
end
-- gear sets
if (spell.type == 'CorsairRoll' or spell.english == "Double-Up") and state.LuzafRing.value then
equip(sets.precast.LuzafRing)
elseif spell.type == 'CorsairShot' and state.CastingMode.value == 'Resistant' then
classes.CustomClass = 'Acc'
elseif spell.type == 'CorsairShot' and state.CastingMode.value == 'Empy' then
classes.CustomClass = 'Empy'

elseif spell.english == 'Fold' and buffactive['Bust'] == 2 then
if sets.precast.FoldDoubleBust then
equip(sets.precast.FoldDoubleBust)
eventArgs.handled = true


end
end


function job_post_midcast (spell, action, spellMap, eventArgs)

    if spell.action_type == 'Ranged Attack' and buffactive['Triple Shot'] then
        equip(sets.TripleShot)
    end

    -- Equip obi if weather/day matches for WS/Quick Draw.
    if spell.type == 'WeaponSkill' or spell.type == 'CorsairShot' then
        if spell.english == 'Leaden Salute' then
            if world.weather_element == 'Dark' or world.day_element == 'Dark' then
                equip(sets.Obi)
            end
            
        elseif spell.english == 'Wildfire' and (world.weather_element == 'Fire' or world.day_element == 'Fire') then
            equip(sets.Obi)
		
        elseif spell.type == 'CorsairShot' and (spell.element == world.weather_element or spell.element == world.day_element) then
				equip(sets.Obi)
            
         end
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
if spell.type == 'CorsairRoll' and not spell.interrupted then
display_roll_info(spell)
end
end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
-- Return a customized weaponskill mode to use for weaponskill sets.
-- Don't return anything if you're not overriding the default value.
function get_custom_wsmode(spell, spellMap, default_wsmode)
if buffactive['Transcendancy'] then
return 'Brew'
end
end
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
if newStatus == 'Engaged' and player.equipment.main == 'Chatoyant Staff' then
state.OffenseMode:set('Ranged')
end
end
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
local msg = ''
msg = msg .. 'Off.: '..state.OffenseMode.current
msg = msg .. ', Rng.: '..state.RangedMode.current
msg = msg .. ', WS.: '..state.WeaponskillMode.current
msg = msg .. ', QD.: '..state.CastingMode.current
if state.DefenseMode.value ~= 'None' then
local defMode = state[state.DefenseMode.value ..'DefenseMode'].current
msg = msg .. ', Defense: '..state.DefenseMode.value..' '..defMode
end
if state.Kiting.value then
msg = msg .. ', Kiting'
end
if state.PCTargetMode.value ~= 'default' then
msg = msg .. ', Target PC: '..state.PCTargetMode.value
end
if state.SelectNPCTargets.value then
msg = msg .. ', Target NPCs'
end
msg = msg .. ', Roll Size: ' .. ((state.LuzafRing.value and 'Large') or 'Small')
add_to_chat(122, msg)
eventArgs.handled = true
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function define_roll_values()
rolls = {
["Corsair's Roll"] = {lucky=5, unlucky=9, bonus="Experience Points"},
["Ninja Roll"] = {lucky=4, unlucky=8, bonus="Evasion"},
["Hunter's Roll"] = {lucky=4, unlucky=8, bonus="Accuracy"},
["Chaos Roll"] = {lucky=4, unlucky=8, bonus="Attack"},
["Magus's Roll"] = {lucky=2, unlucky=6, bonus="Magic Defense"},
["Healer's Roll"] = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
["Puppet Roll"] = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
["Choral Roll"] = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
["Monk's Roll"] = {lucky=3, unlucky=7, bonus="Subtle Blow"},
["Beast Roll"] = {lucky=4, unlucky=8, bonus="Pet Attack"},
["Samurai Roll"] = {lucky=2, unlucky=6, bonus="Store TP"},
["Evoker's Roll"] = {lucky=5, unlucky=9, bonus="Refresh"},
["Rogue's Roll"] = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
["Warlock's Roll"] = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
["Fighter's Roll"] = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
["Drachen Roll"] = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
["Gallant's Roll"] = {lucky=3, unlucky=7, bonus="Defense"},
["Wizard's Roll"] = {lucky=5, unlucky=9, bonus="Magic Attack"},
["Dancer's Roll"] = {lucky=3, unlucky=7, bonus="Regen"},
["Scholar's Roll"] = {lucky=2, unlucky=6, bonus="Conserve MP"},
["Bolter's Roll"] = {lucky=3, unlucky=9, bonus="Movement Speed"},
["Caster's Roll"] = {lucky=2, unlucky=7, bonus="Fast Cast"},
["Courser's Roll"] = {lucky=3, unlucky=9, bonus="Snapshot"},
["Blitzer's Roll"] = {lucky=4, unlucky=9, bonus="Attack Delay"},
["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
["Allies's Roll"] = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
["Miser's Roll"] = {lucky=5, unlucky=7, bonus="Save TP"},
["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
["Avenger's Roll"] = {lucky=4, unlucky=8, bonus="Counter Rate"},
}
end

function display_roll_info(spell)
rollinfo = rolls[spell.english]
local rollsize = (state.LuzafRing.value and 'Large') or 'Small'
if rollinfo then
add_to_chat(104, spell.english..' provides a bonus to '..rollinfo.bonus..'. Roll size: '..rollsize)
add_to_chat(104, 'Lucky roll is '..tostring(rollinfo.lucky)..', Unlucky roll is '..tostring(rollinfo.unlucky)..'.')
end
end
-- Determine whether we have sufficient ammo for the action being attempted.
function do_bullet_checks(spell, spellMap, eventArgs)
local bullet_name
local bullet_min_count = 1
if spell.type == 'WeaponSkill' then
if spell.skill == "Marksmanship" then
if spell.element == 'None' then
-- physical weaponskills
bullet_name = gear.WSbullet
else
-- magical weaponskills
bullet_name = gear.MAbullet
end
else
-- Ignore non-ranged weaponskills
return
end
elseif spell.type == 'CorsairShot' then
bullet_name = gear.QDbullet
elseif spell.action_type == 'Ranged Attack' then
bullet_name = gear.RAbullet
if buffactive['Triple Shot'] then
bullet_min_count = 3
end
end

local available_bullets = player.inventory[bullet_name] or player.wardrobe[bullet_name]
-- If no ammo is available, give appropriate warning and end.
if not available_bullets then
if spell.type == 'CorsairShot' and player.equipment.ammo ~= 'empty' then
add_to_chat(104, 'No Quick Draw ammo left. Using what\'s currently equipped ('..player.equipment.ammo..').')
return
elseif spell.type == 'WeaponSkill' and player.equipment.ammo == gear.RAbullet then
add_to_chat(104, 'No weaponskill ammo left. Using what\'s currently equipped (standard ranged bullets: '..player.equipment.ammo..').')
return
else
add_to_chat(104, 'No ammo ('..tostring(bullet_name)..') available for that action.')
eventArgs.cancel = true
return
end
end
-- Don't allow shooting or weaponskilling with ammo reserved for quick draw.
if spell.type ~= 'CorsairShot' and bullet_name == gear.QDbullet and available_bullets.count <= bullet_min_count then
add_to_chat(104, 'No ammo will be left for Quick Draw. Cancelling.')
eventArgs.cancel = true
return
end
-- Low ammo warning.
if spell.type ~= 'CorsairShot' and state.warned.value == false
and available_bullets.count > 1 and available_bullets.count <= options.ammo_warning_limit then
local msg = '***** LOW AMMO WARNING: '..bullet_name..' *****'
--local border = string.repeat("*", #msg)
local border = ""
for i = 1, #msg do
border = border .. "*"
end
add_to_chat(104, border)
add_to_chat(104, msg)
add_to_chat(104, border)
state.warned:set()
elseif available_bullets.count > options.ammo_warning_limit and state.warned then
state.warned:reset()
end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
set_macro_page(1, 17)
end
