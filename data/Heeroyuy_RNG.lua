-- Owner: AlanWarren, aka ~ OrestesOrestes
require 'organizer-lib'
-- current file resides @ https://github.com/AlanWarren/gearswap
--[[
=== Notes ===
-- Set format is as follows:
sets.midcast.RA.[CustomClass][CombatForm][CombatWeapon][RangedMode][CustomRangedGroup]
ex: sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid.SamRoll = {}
you can also append CustomRangedGroups to each other
ex: sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid.Decoy.SamRoll = {}
-- These are the available sets per category
-- CustomClass = SAM
-- CombatForm = Stave, DW
-- CombatWeapon = weapon name, ex: Yoichinoyumi (you can make new sets for any ranged weapon)
-- RangedMode = Normal, Mid, Acc
-- CustomRangedGroup = Decoy, SamRoll
-- Gear.Stave should be set to your 2-handed weapon of choice if you wish to take advantage of sets.midcast.RA.Stave
-- SamRoll is applied automatically whenever you have the roll on you.
-- SAM is used when you're RNG/SAM
-- Decoy mode helps with enmity control. I only use this with Yoichi, but if desired you can also use it with gun
by toggling GunDecoy (gs c toggle GunDecoy)
** If you do this, you'll need to create either a weapon specific set, or general set with Decoy appended.
i.e. sets.midcast.RA.Lionsquall.Decoy = {}
i.e. sets.midcast.RA.Decoy = {}
** The idea is to put -enmity gear in your regular set, and take it off in the Decoy set. So, you will be shooting
from sets.midcast.RA.Decoy when decoy is up, and sets.midcast.RA when Decoy is down.
-- If you don't own Fenrir's earring, or care to use it, then toggle NightEarring to false. (gs c toggle NightEarring)
* Auto RA
- You can use the built in hotkey (CTRL -) or create a macro. (like below) Note "AutoRA" is case sensitive
/console gs c toggle AutoRA
- You have to shoot once after toggling autora for it to begin.
- AutoRA will use weaponskills @ 1000TP, depending on which weapon you're using. However, this will only
work if you set gear.Gun or gear.Bow to the weapon you're using. You also have to specify the desired
ws it should use, with the settings auto_gun_ws and auto_bow_ws.
=== Helpful Commands ===
//gs validate
//gs showswaps
//gs debugmode
--]]
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
include('Augments.lua')
end
-- setup vars that are user-independent.
function job_setup()
end
-- setup vars that are user-dependent.
function user_setup()
-- Options: Override default values
state.OffenseMode:options('Normal', 'DW', 'DWAcc')
state.RangedMode:options('Normal', 'Mid','MidTwo', 'Acc', 'STP')
state.HybridMode:options('Normal', 'PDT')
state.IdleMode:options('Normal', 'PDT')
state.WeaponskillMode:options('Normal', 'Mid', 'Acc')
state.PhysicalDefenseMode:options('PDT')
state.MagicalDefenseMode:options('MDT')
state.Buff.Barrage = buffactive.Barrage or false
state.Buff.Camouflage = buffactive.Camouflage or false
state.Buff.Overkill = buffactive.Overkill or false
-- settings
state.CapacityMode = M(false, 'Capacity Point Mantle')
state.AutoRA = M(false, "AutoRA")
auto_gun_ws = "Coronach"
auto_bow_ws = "Namas Arrow"
state.GunDecoy = M(false, 'Use Decoy with Gun')
state.NightEarring = M(false, 'Use Fenrir Earring')
gear.Gun = "Annihilator"
gear.Bow = "Cibitshavore"
gear.Stave = "Mekki Shakki"
gear.Earring = { name="Enervating earring" }
gear.NightEarring = "Fenrir's earring"
gear.DayEarring = "Enervating earring"
rng_sub_weapons = S{'Hurlbat', 'Vanir Knife', 'Sabebus',
'Eminent Axe', 'Trailer\'s Kukri', 'Aphotic Kukri', 'Atoyac'}
sam_sj = player.sub_job == 'SAM' or false
DefaultAmmo = {[gear.Bow] = "Achiyalabopa arrow", [gear.Gun] = "Eradicating bullet"}
U_Shot_Ammo = {[gear.Bow] = "Achiyalabopa arrow", [gear.Gun] = "Eradicating bullet"}
select_earring()
get_combat_form()
get_custom_ranged_groups()
select_default_macro_book()
send_command('bind != gs c toggle CapacityMode')
send_command('bind ^= gs c toggle GunDecoy')
send_command('bind @= gs c toggle NightEarring') -- @ is the Windows key
send_command('bind f9 gs c cycle RangedMode')
send_command('bind !f9 gs c cycle OffenseMode')
send_command('bind ^f9 gs c cycle WeaponskillMode')
send_command('bind ^- gs c toggle AutoRA')

send_command('bind ^q input /ra <t>')
send_command('bind !q input /ra <t>')

-- Testing
--windower.register_event('incoming text', detect_cor_rolls)
end
-- Called when this job file is unloaded (eg: job change)
function file_unload()
send_command('unbind f9')
send_command('unbind ^f9')
send_command('unbind ^[')
send_command('unbind ![')
send_command('unbind !=')
send_command('unbind ^=')
send_command('unbind @=')
send_command('unbind ^-')
end


function init_gear_sets()
include('Augments.lua')
-- Misc. Job Ability precasts
sets.precast.JA['Bounty Shot'] = {hands="Amini Glovelettes +1", waist="Chaac belt"}
sets.precast.JA['Double Shot'] = {head="Amini Gapette +1"}
sets.precast.JA['Camouflage'] = {body="Orion Jerkin +2"}
sets.precast.JA['Sharpshot'] = {legs=" +2"}
sets.precast.JA['Velocity Shot'] = {body="Amini Caban +1"}
sets.precast.JA['Scavenge'] = {feet="Orion Socks +2"}
sets.precast.JA['Shadowbind'] ={hands="Orion bracers +2"}
sets.Obi = {waist="Hachirin-no-Obi"}

sets.goldnq={
head="Shaded specs.",
neck="Goldsm. Torque",
body="Goldsmith's smock",
ring1="Artificer's ring",
ring2="Goldsmith's ring",
back="Shaper's shawl"}

sets.goldhq={
head="Shaded specs.",
neck="Goldsm. Torque",
body="Goldsmith's smock",
ring1="Artificer's ring",
ring2="Craftmaster's ring",
back="Shaper's shawl"}

sets.precast.JA['Eagle Eye Shot'] = {
head="Uk'uxkaj Cap",
neck="Rancor Collar",
back="Buquwik Cape",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas Ring",
ring2="Ifrit Ring",
legs="Arcadian Braccae +1",
feet="Orion Socks +1"
}
sets.precast.JA['Eagle Eye Shot'].Mid = set_combine(sets.precast.JA['Eagle Eye Shot'], {
back="Lutian Cape",
ring2="Longshot Ring",
feet="Orion Socks +1"
})
sets.precast.JA['Eagle Eye Shot'].Acc = set_combine(sets.precast.JA['Eagle Eye Shot'].Mid, {
neck="Iqabi Necklace",
waist="Elanid Belt"
})
sets.precast.FC = {
head="Haruspex hat +1",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
body="Thurandaut tabard +1",
hands="Thaumas gloves",
ring1="Prolix Ring",
ring2="Weatherspoon ring",
waist="Pya'ekue belt",
legs="Blood cuisses",
feet="Suzaku's sune-ate"
}
sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, { neck="Orunmila's torque" })

sets.idle = {
head="Ocelomeh Headpiece +1",
neck="Wiglen gorget",
ear1="Infused Earring",
ear2="Telos Earring",
body="Khepri jacket",
hands="Garden bangles",
ring1="Paguroidea Ring",
ring2="Sheltered Ring",
back="Repulse Mantle",
waist="Flume Belt +1",
legs="Meg. Chausses +1",
feet="Jute boots +1"
}
sets.idle.PDT = set_combine(sets.idle, {
head="Meghanada visor +1",
ear1="Infused earring",
ear2="Telos earring",
neck="Loricate torque +1",
body="Meghanada cuirie",
hands="Meg. gloves +1",
ring1="Defending Ring",
ring2="Vocane Ring",
back="Moonbeam cape",
waist="Flume Belt +1",
legs="Meg. Chausses +1",
feet="Jute boots +1"
})

-- Engaged sets
sets.engaged = {
head="Dampening Tam",
neck="Erudition necklace",
ear1="Cessance earring",
ear2="Mache Earring",
body="Adhemar jacket",
hands=gear.AdhemarWristbandsRanged,
ring1="Chirich Ring",
ring2="Chirich Ring",
back="Lupine cape",
waist="Kentarch belt +1",
legs="Samnuha tights",
feet="Herculean boots"
}
sets.engaged.PDT = set_combine(sets.engaged, {
head="Meghanada visor +1",
ear1="Infused earring",
ear2="Telos earring",
neck="Loricate torque +1",
body="Meghanada cuirie",
hands="Meg. gloves +1",
ring1="Defending Ring",
ring2="Vocane Ring",
back="Moonbeam cape",
waist="Flume Belt +1",
legs="Meg. Chausses +1",
feet="Meg. Jam. +1"
})
sets.engaged.Yoichinoyumi = set_combine(sets.engaged, {})
sets.engaged.Melee = {
head="Dampening Tam",
neck="Asperity necklace",
ear1="Steelflash earring",
ear2="Bladeborn Earring",
body="Adhemar jacket",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas Ring",
ring2="Epona's Ring",
back="Lupine cape",
waist="Windbuffet belt +1",
legs="Adhemar kecks",
feet="Herculean boots"
}



sets.engaged.Melee.PDT = set_combine(sets.engaged.Melee, {
neck="Twilight Torque",
ring1="Defending Ring",
ring2="Dark Ring"
})
sets.engaged.DW ={
head="Dampening Tam",
neck="Lissome necklace",
ear1="Cessance earring",
ear2="Telos Earring",
body="Adhemar jacket",
hands=gear.AdhemarWristbandsRanged,
ring1="Chirich Ring",
ring2="Chirich Ring",
back="Lupine cape",
waist="Kentarch belt +1",
legs="Samnuha tights",
feet="Herculean boots"
}

sets.engaged.DW.Acc = {
head="Dampening Tam",
neck="Erudition necklace",
ear1="Cessance earring",
ear2="Telos Earring",
body="Adhemar jacket",
hands=gear.AdhemarWristbandsMelee,
ring1="Chirich Ring",
ring2="Chirich Ring",
back="Lupine cape",
waist="Kentarch belt +1",
legs="Samnuha tights",
feet="Herculean boots"
}


sets.engaged.DW.Melee ={
head=gear.TPTaeonChapeau,
neck="Iqabi Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Skadi's cuirie +1",
hands=gear.TPTaeonGloves,
ring1="Enlivened Ring",
ring2="Oneiros Ring",
back="Letalis mantle",
waist="Windbuffet belt +1",
legs="Taeon tights",
feet=gear.TPTaeonBoots
}
------------------------------------------------------------------
-- Preshot / Snapshot sets
------------------------------------------------------------------
sets.precast.RA = {
head="Amini Gapette +1", --7 snapshot
body="Amini Caban +1",  --7% delay reduction under VS
hands="Iuitl Wristbands +1", --6 snapshot
legs="Nahtirah trousers", --9 snapshot
back="Lutian cape",  --3 snapshot
waist="Impulse Belt", --3 snapshot
feet="Meghanada jambeaux +1"  --8 snapshot
}
------------------------------------------------------------------
-- Default Base Gear Sets for Ranged Attacks. Geared for Gun
------------------------------------------------------------------
sets.midcast.RA = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Enervating earring",
ear2="Telos Earring",
body="Arcadian jerkin +1",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas Ring",
ring2="K'ayres Ring",
back="Belenus's cape",
waist="Kwahu kachina Belt",
legs="Nahtirah Trousers",
feet="Orion Socks +1"
}
sets.midcast.RA.Mid = set_combine(sets.midcast.RA, {
neck="Erudition necklace",
body="Orion jerkin +2",
back="Belenus's Cape", 
legs="Samnuha tights"
})

sets.midcast.RA.MidTwo = set_combine(sets.midcast.RA.Mid, {
neck="Erudition necklace",
body="Amini Caban +1",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas Ring",
ring2="Hajduk Ring +1",
back="Belenus's Cape", 
legs="Amini brague +1",
feet="Orion socks +1"
})

sets.midcast.RA.Acc = set_combine(sets.midcast.RA.Mid, {
head="Orion beret +2",
body="Orion jerkin +2",
neck="Erudition Necklace",
hands="Orion bracers +2",
ring1="Hajduk Ring +1",
Ring2="Hajduk Ring +1",
back="Belenus's cape",
waist="Kwahu Kachina belt",
legs="Orion braccae +2",
feet="Orion socks +2"
})
sets.midcast.RA.STP = {
head="Arcadian Beret +1",
neck="Erudition necklace",
ear1="Enervating earring",
ear2="Telos Earring",
body="Orion jerkin +2",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas ring",
ring2="Hajduk ring +1",
back="Belenus's cape",
waist="Kwahu Kachina belt",
legs="Amini brague +1",
feet="Orion socks +2",
}

sets.midcast.RA.VDAcc = {
head="Amini Gapette +1",
neck="Iqabi necklace",
ear1="Enervating earring",
ear2="Telos Earring",
body="Orion jerkin +1",
hands=gear.AdhemarWristbandsRanged,
ring1="Paqichikaji ring",
Ring2="Hajduk Ring",
back="Lutian cape",
waist="Elanid Belt",
legs="Arcadian braccae +1",
feet="Orion Socks +1"
}

------------------------------------------------------------------
-- Specialized Gear Sets
------------------------------------------------------------------
-- Stave sets

sets.midcast.RA.Stave = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Enervating earring",
ear2="Telos Earring",
body="Arcadian jerkin +1",
hands="Sigyn's bazubands",
ring1="Rajas Ring",
ring2="K'ayres Ring",
back="Sylvan Chlamys",
waist="Elanid Belt",
legs="Nahtirah Trousers",
feet="Orion Socks +1"
}

sets.midcast.RA.Stave.Mid = set_combine(sets.midcast.RA.Stave, {
neck="Erudition necklace",
body="Orion jerkin +2",
hands=gear.AdhemarWristbandsRanged,
rring="Hajduk ring +1",
back="Lutian cape",
legs="Arcadian braccae +1"
})
sets.midcast.RA.Stave.Acc = set_combine(sets.midcast.RA.Acc, {
head="Amini Gapette +1",
neck="Erudition Necklace",
legs="Arcadian braccae +1",
ring1="Paqichikaji ring",
Ring2="Hajduk Ring +1",
})

sets.midcast.RA.Stave.STP = set_combine(sets.midcast.RA.STP, {
neck="Erudition necklace",
body="Orion jerkin +2",
back="Sylvan chlamys",
waist="Patentia sash",
legs="Amini brague +1",
})

sets.midcast.RA.Stave.VDAcc = {
head="Amini Gapette +1",
neck="Iqabi necklace",
ear1="Enervating earring",
ear2="Telos Earring",
body="Orion jerkin +1",
hands=gear.AdhemarWristbandsRanged,
ring1="Hajduk ring +1",
Ring2="Hajduk Ring +1",
back="Lutian cape",
waist="Elanid Belt",
legs="Arcadian braccae +1",
feet="Orion Socks +1"
}

-- Samurai Roll sets
sets.midcast.RA.SamRoll = set_combine(sets.midcast.RA, {
body="Orion jerkin +2",
ring2="K'ayres Ring",
})
sets.midcast.RA.Mid.SamRoll = set_combine(sets.midcast.RA.SamRoll, {
ring1="Paqichikaji Ring",
back="Lutian Cape",
hands=gear.AdhemarWristbandsRanged,
legs="Samnuha tights"
})
sets.midcast.RA.Acc.SamRoll = set_combine(sets.midcast.RA.Mid.SamRoll, {
body="Orion jerkin +2",
neck="Erudition Necklace",
ring1="Paqichikaji ring",
Ring2="Hajduk Ring",
legs="Arcadian Braccae +1"
})
-- Stave Sam Roll
sets.midcast.RA.Stave.SamRoll = set_combine(sets.midcast.RA.Stave, {
body="Arcadian jerkin +1",
waist="Elanid Belt"
})
sets.midcast.RA.Stave.Mid.SamRoll = set_combine(sets.midcast.RA.Stave.Mid, {
body="Arcadian jerkin +1",
legs="Samnuha tights",
hands=gear.AdhemarWristbandsRanged,
})
sets.midcast.RA.Stave.Acc.SamRoll = set_combine(sets.midcast.RA.Stave.Acc, {})
-- SAM Subjob
sets.midcast.RA.SAM = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Enervating earring",
ear2="Telos Earring",
body="Orion jerkin +2",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas Ring",
ring2="K'ayres Ring",
back="Lutian cape",
waist="Elanid Belt",
legs="Samnuha tights",
feet="Orion Socks +1"
}

sets.midcast.RA.Stave.STP.SamRoll = set_combine(sets.midcast.RA.STP, {
body="Orion jerkin +2",
back="Sylvan chlamys",
legs="Samnuha tights",
})

--Sam sets

sets.midcast.RA.SAM.Mid = set_combine(sets.midcast.RA.SAM, {
neck="Erudition necklace",
hands=gear.AdhemarWristbandsRanged,
ring2="Hajduk ring"
})
sets.midcast.RA.SAM.Acc = set_combine(sets.midcast.RA.SAM.Mid, {
back="Erudition Cape",
neck="Iqabi Necklace",
ring2="Hajduk Ring"
})
-- Stave set for SAM
sets.midcast.RA.SAM.Stave = set_combine(sets.midcast.RA.SAM, {
hands=gear.AdhemarWristbandsRanged
})
sets.midcast.RA.SAM.Stave.Mid = set_combine(sets.midcast.RA.SAM.Mid, {
hands=gear.AdhemarWristbandsRanged,
ring2="Hajduk ring",
legs="Samnuha tights"
})
sets.midcast.RA.SAM.Stave.Acc = set_combine(sets.midcast.RA.SAM.Acc, {})
-- Samurai Roll for /sam, assume we're using a staff
sets.midcast.RA.SAM.Stave.SamRoll = set_combine(sets.midcast.RA.SAM.Stave, {
hands=gear.AdhemarWristbandsRanged
})

sets.midcast.RA.SAM.Stave.STP= set_combine(sets.midcast.RA.SAM.Stave.Acc, {
neck="Ocachi gorget",
hands=gear.AdhemarWristbandsRanged,
ring2="K'ayres ring",
waist="Patentia sash",
back="Sylvan chlamys",
feet="Orion socks +1"

})

sets.midcast.RA.SAM.Stave.Mid.SamRoll = set_combine(sets.midcast.RA.SAM.Stave.Mid, {
ear1="Enervating earring",
hands=gear.AdhemarWristbandsRanged,
legs="Samnuha tights"
})
sets.midcast.RA.SAM.Stave.Acc.SamRoll = set_combine(sets.midcast.RA.SAM.Stave.Acc, {
hands=gear.AdhemarWristbandsRanged,
})
sets.midcast.RA.SAM.Stave.Acc.SamRoll = set_combine(sets.midcast.RA.SAM.Stave, {
hands=gear.AdhemarWristbandsRanged,
})
-- Bow base set.
sets.midcast.RA.Yoichinoyumi = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Novia Earring",
ear2="Tripudio Earring",
body="Orion jerkin +2",
--body="Arcadian jerkin +1",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas Ring",
ring2="K'ayres Ring",
back="Sylvan Chlamys",
waist="Elanid Belt",
legs="Arcadian Braccae +1",
feet="Arcadian Socks +1"
}
sets.midcast.RA.Yoichinoyumi.Mid = set_combine(sets.midcast.RA.Yoichinoyumi, {
ear1=gear.Earring,
back="Lutian Cape",
hands=gear.AdhemarWristbandsRanged,
legs="Samnuha tights",
feet="Orion Socks +1"
})
sets.midcast.RA.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Yoichinoyumi.Mid, {
neck="Iqabi Necklace",
ring1="Longshot Ring",
ring2="Paqichikaji Ring",
legs="Arcadian Braccae +1"
})
sets.midcast.RA.Falubeza = sets.midcast.RA.Yoichinoyumi
sets.midcast.RA.Falubeza.Mid = sets.midcast.RA.Yoichinoyumi.Mid
sets.midcast.RA.Falubeza.Acc = sets.midcast.RA.Yoichinoyumi.Acc
-- Decoy up
sets.midcast.RA.Yoichinoyumi.Decoy = set_combine(sets.midcast.RA.Yoichinoyumi, {
ear1=gear.Earring,
hands="Sylvan Glovelettes +2",
legs="Nahtirah Trousers"
})
sets.midcast.RA.Yoichinoyumi.Mid.Decoy = set_combine(sets.midcast.RA.Yoichinoyumi.Decoy, {
hands=gear.AdhemarWristbandsRanged,
legs="Samnuha tights",
feet="Orion Socks +1"
})
sets.midcast.RA.Yoichinoyumi.Acc.Decoy = set_combine(sets.midcast.RA.Yoichinoyumi.Mid.Decoy, {
ear1=gear.Earring,
neck="Iqabi Necklace",
hands=gear.AdhemarWristbandsRanged,
ring1="Longshot Ring",
ring2="Paqichikaji Ring",
legs="Arcadian Braccae +1"
})
sets.midcast.RA.Falubeza.Decoy = sets.midcast.RA.Yoichinoyumi.Decoy
sets.midcast.RA.Falubeza.Mid.Decoy = sets.midcast.RA.Yoichinoyumi.Mid.Decoy
sets.midcast.RA.Falubeza.Acc.Decoy = sets.midcast.RA.Yoichinoyumi.Acc.Decoy
-- Stave
sets.midcast.RA.Stave.Yoichinoyumi = set_combine(sets.midcast.RA.Yoichinoyumi, { hands="Iuitl Wristbands +1" })
sets.midcast.RA.Stave.Yoichinoyumi.Mid = set_combine(sets.midcast.RA.Yoichinoyumi.Mid, { legs="Nahtirah Trousers" })
sets.midcast.RA.Stave.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Yoichinoyumi.Acc, {})
-- Stave with Sam roll
sets.midcast.RA.Stave.Yoichinoyumi.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi, {
body="Arcadian jerkin +1",
hands="Arcadian Bracers +1",
ring2="Paqichikaji Ring",
back="Lutian Cape"
})
sets.midcast.RA.Stave.Yoichinoyumi.Mid.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.SamRoll, {
body="Orion jerkin +2",
})
sets.midcast.RA.Stave.Yoichinoyumi.Acc.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.Mid.SamRoll, {
neck="Iqabi Necklace",
hands=gear.AdhemarWristbandsRanged,
ring1="Longshot Ring",
feet="Orion Socks +1"
})
-- Stave / Decoy up
sets.midcast.RA.Stave.Yoichinoyumi.Decoy = set_combine(sets.midcast.RA.Stave.Yoichinoyumi, {
ear1=gear.Earring,
hands="Arcadian Bracers +1",
legs="Samnuha tights"
})
sets.midcast.RA.Stave.Yoichinoyumi.Mid.Decoy = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.Decoy, {
body="Orion jerkin +2",
hands=gear.AdhemarWristbandsRanged,
back="Lutian Cape",
legs="Nahtirah Trousers"
})
sets.midcast.RA.Stave.Yoichinoyumi.Acc.Decoy = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.Mid.Decoy, {
neck="Iqabi Necklace",
ring1="Longshot Ring",
ring2="Hajduk Ring",
legs="Samnuha tights",
feet="Orion Socks +1"
})
-- Stave + Sam roll + Decoy
sets.midcast.RA.Stave.Yoichinoyumi.Decoy.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.SamRoll, {
ear1=gear.Earring,
body="Arcadian jerkin +1",
hands="Arcadian Bracers +1",
ring2="Ifrit Ring",
back="Buquwik Cape",
legs="Nahtirah Trousers",
feet="Arcadian Socks +1"
})
sets.midcast.RA.Stave.Yoichinoyumi.Mid.Decoy.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.Decoy.SamRoll, {
body="Orion jerkin +2",
hands="Iuitl Wristbands +1",
back="Lutian Cape",
ring2="Longshot Ring"
})
sets.midcast.RA.Stave.Yoichinoyumi.Acc.Decoy.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.Mid.Decoy.SamRoll, {
neck="Iqabi Necklace",
ring1="Paqichikaji Ring",
hands=gear.AdhemarWristbandsRanged,
legs="Arcadian Braccae +1",
feet="Orion Socks +1"
})
-- Sam SJ / Bow - assuming you'll use a Stave here..
sets.midcast.RA.SAM.Stave.Yoichinoyumi = set_combine(sets.midcast.RA.SAM, {
feet="Arcadian Socks +1"
})
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid = set_combine(sets.midcast.RA.SAM.Mid, {
feet="Orion Socks +1"
})
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.SAM.Acc, {})
-- SAM SJ / Bow / Decoy doesn't matter here
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc
-- Sam SJ / Bow / Sam's Roll
sets.midcast.RA.SAM.Stave.Yoichinoyumi.SamRoll = set_combine(sets.midcast.RA.SAM.Stave.Yoichinoyumi, {
waist="Elanid Belt",
feet="Orion Socks +1"
})
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid.SamRoll = set_combine(sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid, {
waist="Elanid Belt",
})
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc.SamRoll = set_combine(sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc, {})
-- Don't care about decoy here
sets.midcast.RA.SAM.Stave.Yoichinoyumi.SamRoll.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi.SamRoll
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid.SamRoll.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid.SamRoll
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc.SamRoll.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc.SamRoll
-- Weaponskill sets
sets.precast.WS = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Telos earring",
ear2="Moonshade Earring",
body="Khepri jacket",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas Ring",
ring2="Hajduk Ring +1",
back="Buquwik Cape",
waist="Elanid Belt",
legs="Nahtirah Trousers",
feet="Orion Socks +1"
}
sets.precast.WS.Mid = set_combine(sets.precast.WS, {
head="Orion Beret +2",
neck="Ocachi Gorget",
ear1="Telos earring",
ear2="Moonshade Earring",
body="Orion jerkin +1",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas Ring",
ring2="Hajduk Ring +1",
back="Buquwik Cape",
waist="Elanid Belt",
legs="Nahtirah Trousers",
feet="Orion Socks +1"
})
sets.precast.WS.Acc = set_combine(sets.precast.WS.Mid, {
head="Orion beret +2",
back="Lutian Cape"
})
-- WILDFIRE
sets.Wildfire = {
ammo="Eradicating bullet",
head="Herculean helm",
body="Samnuha coat",
ear1="Moonshade Earring",
ear2="Friomisi Earring",
neck="Fotia gorget",
hands=gear.MABWSDHerculeanGloves,
ring1="Acumen Ring",
ring2="Arvina Ringlet +1",
waist="Fotia Belt",
legs=gear.MABHerculeanTrousers,
back="Toro Cape",
feet=gear.MABHerculeanBoots
}
sets.precast.WS['Wildfire'] = set_combine(sets.precast.WS, sets.Wildfire)
sets.precast.WS['Wildfire'].Mid = set_combine(sets.precast.WS.Mid, sets.Wildfire)
sets.precast.WS['Wildfire'].Acc = set_combine(sets.precast.WS.Acc, sets.Wildfire)

-- Trueflight
sets.Trueflight = {
ammo="Eradicating bullet",
head="Herculean Helm",
body="Samnuha coat",
ear1="Friomisi Earring",
ear2="Moonshade Earring",
neck="Fotia gorget",
hands=gear.MABWSDHerculeanGloves,
ring1="Acumen Ring",
ring2="Arvina Ringlet +1",
waist="Fotia Belt",
legs=gear.MABHerculeanTrousers,
back="Toro Cape",
--back=gear.RngMagWSDCape,
feet=gear.MABHerculeanBoots
}
sets.precast.WS['Trueflight'] = set_combine(sets.precast.WS, sets.Trueflight)
sets.precast.WS['Trueflight'].Mid = set_combine(sets.precast.WS.Mid, sets.Trueflight)
sets.precast.WS['Trueflight'].Acc = set_combine(sets.precast.WS.Acc, sets.Trueflight)


-- CORONACH
sets.Coronach = {
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Vulcan's pearl",
ear2="Moonshade Earring",
body="Amini Caban +1",
hands="Arcadian bracers +1",
waist="Fotia Belt",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Buquwik Cape",
legs="Nahtirah trousers",
feet="Arcadian socks +1"
}

sets.Coronach.Mid = {
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Vulcan's pearl",
ear2="Moonshade Earring",
body="Orion jerkin +2",
hands="Sigyn's bazubands",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Lutian cape",
waist="Fotia belt",
legs="Nahtirah trousers",
feet="Orion socks +1"
}

sets.Coronach.Acc = {
head="Umbani cap",
neck="Fotia gorget",
waist="Fotia Belt",
ring1="Rajas Ring",
hands=gear.AdhemarWristbandsRanged,
legs="Arcadian Braccae +1",
feet="Orion socks +1",
body="Orion jerkin +1",
ring2="Hajduk ring",
back="Lutian cape"
}

sets.precast.WS['Coronach'] = set_combine(sets.Coronach, {
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Vulcan's pearl",
ear2="Moonshade Earring",
body="Amini Caban +1",
hands="Arcadian bracers +1",
waist="Fotia Belt",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Buquwik Cape",
legs="Nahtirah trousers",
feet="Arcadian socks +1"
})

sets.precast.WS['Coronach'].STP = set_combine(sets.Coronach, {
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Enervating earring",
ear2="Moonshade Earring",
body="Amini Caban +1",
hands="Arcadian bracers +1",
waist="Fotia Belt",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Buquwik Cape",
legs="Nahtirah trousers",
feet="Arcadian socks +1"
})


sets.precast.WS['Coronach'].Mid = set_combine(sets.Coronach,{
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Vulcan's pearl",
ear2="Moonshade Earring",
body="Orion jerkin +2",
hands="Sigyn's bazubands",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Lutian cape",
waist="Fotia belt",
legs="Nahtirah trousers",
feet="Orion socks +1"
})

sets.precast.WS['Coronach'].Mid.STP = set_combine(sets.Coronach,{
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Vulcan's pearl",
ear2="Telos earring",
body="Orion jerkin +2",
hands=gear.AdhemarWristbandsRanged,
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Lutian cape",
waist="Fotia belt",
legs="Nahtirah trousers",
feet="Orion socks +1"
})



sets.precast.WS['Coronach'].Acc = set_combine(sets.Coronach, {
head="Umbani cap",
neck="Fotia gorget",
waist="Fotia Belt",
ring1="Rajas Ring",
hands=gear.AdhemarWristbandsRanged,
legs="Arcadian Braccae +1",
feet="Orion socks +1",
body="Orion jerkin +1",
ring2="Hajduk ring",
back="Lutian cape"
})

sets.precast.WS['Coronach'].SAM = set_combine(sets.precast.WS, {
neck="Fotia gorget",
ear1="Tripudio Earring",
ear2="Neritic Earring",
body="Orion jerkin +2",
hands="Sylvan Glovelettes +2",
ring1="Rajas ring",
waist="Fotia belt",
legs="Samnuha tights"
})
-- LAST STAND
sets.LastStand = {
neck="Fotia Gorget",
ear2="Moonshade earring",
ear1="Telos earring",
body="Amini Caban +1",
waist="Fotia Belt",
feet="Amini bottillons +1"
}
sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, sets.LastStand)
sets.precast.WS['Last Stand'].Mid = set_combine(sets.precast.WS.Mid, sets.LastStand)
sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS.Acc, sets.LastStand)
sets.precast.WS['Last Stand'].SAM = set_combine(sets.precast.WS, {
neck="Fotia Gorget",
ear1="Vulcan's pearl",
ear2="Moonshade Earring",
hands=gear.AdhemarWristbandsRanged,
ring1="Garuda Ring",
ring2="Stormsoul Ring",
waist="Fotia Belt",
legs="Samnuha tights",
})
-- DETONATOR
sets.Detonator = {
neck="Fotia Gorget",
ear1="Vulcan's pearl",
ear2="Moonshade earring",
waist="Fotia Belt",
feet="Arcadian Socks +1"
}
sets.precast.WS['Detonator'] = set_combine(sets.precast.WS, sets.Detonator)
sets.precast.WS['Detonator'].Mid = set_combine(sets.precast.WS.Mid, sets.Detonator)
sets.precast.WS['Detonator'].Acc = set_combine(sets.precast.WS.Acc, sets.Detonator)
-- SLUG SHOT
sets.SlugShot = {
neck="Fotia Gorget",
waist="Fotia Belt",
feet="Arcadian Socks +1"
}
sets.precast.WS['Slug Shot'] = set_combine(sets.precast.WS, sets.SlugShot)
sets.precast.WS['Slug Shot'].Mid = set_combine(sets.precast.WS.Mid, sets.SlugShot)
sets.precast.WS['Slug Shot'].Acc = set_combine(sets.precast.WS.Acc, sets.SlugShot)
sets.precast.WS['Heavy Shot'] = set_combine(sets.precast.WS, sets.SlugShot)
sets.precast.WS['Heavy Shot'].Mid = set_combine(sets.precast.WS.Mid, sets.SlugShot)
sets.precast.WS['Heavy Shot'].Acc = set_combine(sets.precast.WS.Acc, sets.SlugShot)
-- NAMAS
sets.Namas = {
neck="Fotia Gorget",
waist="Fotia Belt",
hands="Arcadian Bracers +1", -- override since we don't want sigyns in Mid or Acc
back="Sylvan Chlamys",
feet="Arcadian Socks +1"
}
sets.precast.WS['Namas Arrow'] = set_combine(sets.precast.WS, sets.Namas)
sets.precast.WS['Namas Arrow'].Mid = set_combine(sets.precast.WS.Mid, sets.Namas)
sets.precast.WS['Namas Arrow'].Acc = set_combine(sets.precast.WS.Acc, sets.Namas)
sets.precast.WS['Namas Arrow'].SAM = set_combine(sets.precast.WS, {
neck="Fotia Gorget",
ear1="Vulcan's pearl",
ear2="Tripudio Earring",
waist="Fotia Belt",
back="Sylvan Chlamys",
legs="Samnuha tights"
})
-- JISHNUS
sets.Jishnus = {
head="Umbani cap",
neck="Rancor collar",
body="Khepri jacket",
hands="Arcadian bracers +1",
ring1="Rajas ring",
ring2="Ramuh Ring",
back="Lutian cape",
waist="Fotia Belt",
legs="Arcadian Braccae +1",
feet="Orion socks +1"
}
sets.precast.WS['Jishnu\'s Radiance'] = set_combine(sets.precast.WS, sets.Jishnus)
sets.precast.WS['Jishnu\'s Radiance'].Mid = set_combine(sets.precast.WS.Mid, sets.Jishnus)
sets.precast.WS['Jishnu\'s Radiance'].Acc = set_combine(sets.precast.WS.Acc, sets.Jishnus)
-- SIDEWINDER
sets.Sidewinder = {
neck="Fotia Gorget",
waist="Fotia Belt",
hands="Arcadian Bracers +1",
back="Buquwik Cape",
feet="Arcadian Socks +1"
}
sets.precast.WS['Sidewinder'] = set_combine(sets.precast.WS, sets.Sidewinder)
sets.precast.WS['Sidewinder'].Mid = set_combine(sets.precast.WS.Mid, sets.Sidewinder)
sets.precast.WS['Sidewinder'].Acc = set_combine(sets.precast.WS.Acc, sets.Sidewinder)
sets.precast.WS['Refulgent Arrow'] = sets.precast.WS['Sidewinder']
sets.precast.WS['Refulgent Arrow'].Mid = sets.precast.WS['Sidewinder'].Mid
sets.precast.WS['Refulgent Arrow'].Acc = sets.precast.WS['Sidewinder'].Acc

sets.precast.WS['Aeolian Edge'] ={
ammo="Eradicating bullet",
head="Herculean Helm",
body="Samnuha coat",
ear1="Friomisi Earring",
ear2="Moonshade Earring",
neck="Fotia gorget",
hands=gear.MABWSDHerculeanGloves,
ring1="Acumen Ring",
ring2="Arvina Ringlet +1",
waist="Fotia Belt",
legs=gear.MABHerculeanTrousers,
back="Toro Cape",
--back=gear.RngMagWSDCape,
feet=gear.MABHerculeanBoots
}


-- Resting sets
sets.resting = {}
-- Defense sets
sets.defense.PDT = set_combine(sets.engaged.PDT, {})
sets.defense.MDT = set_combine(sets.idle, {})
sets.Kiting = {feet="Jute boots +1"}
sets.buff.Barrage = {
head="Mummu bonnet +1",
neck="Rancor Collar",
ear1="Moonshade earring",
ear2="Telos earring",
body="Orion Jerkin +2",
hands="Orion Bracers +2",
ring1="Hajduk Ring +1",
ring2="Hajduk Ring +1",
back="Belenus's Cape",
waist="Kwahu kachina belt",
legs="Amini brague +1",
feet="Mummu gamashes +1"
}

sets.buff.Barrage.Mid = {

head="Mummu bonnet +1",
neck="Rancor Collar",
ear1="Moonshade earring",
ear2="Telos earring",
body="Orion Jerkin +2",
hands="Orion Bracers +2",
ring1="Hajduk Ring +1",
ring2="Hajduk Ring +1",
back="Belenus's Cape",
waist="Kwahu kachina belt",
legs="Adhemar kecks",
feet="Mummu gamashes +1"
}

sets.buff.Barrage.Acc = {

head="Mummu bonnet +1",
neck="Rancor Collar",
ear1="Moonshade earring",
ear2="Telos earring",
body="Orion Jerkin +2",
hands="Orion Bracers +2",
ring1="Hajduk Ring +1",
ring2="Hajduk Ring +1",
back="Belenus's Cape",
waist="Kwahu kachina belt",
legs="Adhemar kecks",
feet="Mummu gamashes +1"
}
sets.buff.Camouflage = {body="Orion Jerkin +1"}

sets.buff.Overkill = {body="Arcadian jerkin +1"}
sets.buff.DoubleShot = {body="Arcadian jerkin +1"}
sets.midcast.DoubleShot = set_combine(sets.midcast.RA, sets.Doubleshot)
end


function job_pretarget(spell, action, spellMap, eventArgs)
-- If autora enabled, use WS automatically at 100+ TP
if spell.action_type == 'Ranged Attack' then
if player.tp >= 1000 and state.AutoRA.value and not buffactive.amnesia then
cancel_spell()
use_weaponskill()
end
end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)



if state.Buff[spell.english] ~= nil then
state.Buff[spell.english] = true
end
--add_to_chat(8, state.CombatForm)
if sam_sj then
classes.CustomClass = 'SAM'
end
if spell.action_type == 'Ranged Attack' then
state.CombatWeapon:set(player.equipment.range)
end
-- add support for RangedMode toggles to EES
if spell.english == 'Eagle Eye Shot' then
classes.JAMode = state.RangedMode.value
end
-- Safety checks for weaponskills
--if spell.type:lower() == 'weaponskill' then
--if player.tp < 1000 then
--eventArgs.cancel = true
--return
--end

if (spell.target.distance >25 and spell.skill ~= 'Archery' and spell.skill ~= 'Marksmanship')  then
-- Cancel Action if distance is too great, saving TP
add_to_chat(122,"Outside WS Range! /Canceling")
eventArgs.cancel = true
return
elseif state.DefenseMode.value ~= 'None' then
-- Don't gearswap for weaponskills when Defense is on.
eventArgs.handled = true
end

-- Ammo checks
if spell.action_type == 'Ranged Attack' or
(spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
check_ammo(spell, action, spellMap, eventArgs)
end
end
-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
-- This is where you place gear swaps you want in precast but applied on top of the precast sets
function job_post_precast(spell, action, spellMap, eventArgs)
if state.Buff.Camouflage then
equip(sets.buff.Camouflage)
elseif state.Buff.Overkill then
equip(sets.Overkill.Preshot)
end
if spell.type == 'WeaponSkill' then
if state.CapacityMode.value then
equip(sets.CapacityMantle)
end
end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
-- Barrage
if spell.action_type == 'Ranged Attack' and state.Buff.Barrage then
if state.RangedMode.current == 'Mid' then
equip(sets.buff.Barrage.Mid)
elseif state.RangedMode.current == 'Acc' then
equip(sets.buff.Barrage.Acc)
else
equip(sets.buff.Barrage.Acc)
end
eventArgs.handled = true
end
if state.Buff.Camouflage then
equip(sets.buff.Camouflage)
end
if state.Buff.DoubleShot then
equip(sets.buff.DoubleShot)
end
if state.Buff.Overkill then
equip(sets.Overkill)
end
if spell.action_type == 'Ranged Attack' then
if state.CapacityMode.value then
equip(sets.CapacityMantle)
end
end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
-- autora
if state.AutoRA.value then
use_ra(spell)
end
if state.Buff[spell.name] ~= nil then
state.Buff[spell.name] = not spell.interrupted or buffactive[spell.english]
end
end
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
--if S{"courser's roll"}:contains(buff:lower()) then
--if string.find(buff:lower(), 'samba') then
if state.Buff[buff] ~= nil then
state.Buff[buff] = gain
end
if buff == 'Velocity Shot' and gain then
windower.send_command('wait 290;input /echo **VELOCITY SHOT** Wearing off in 10 Sec.')
elseif buff == 'Double Shot' and gain then
windower.send_command('wait 90;input /echo **DOUBLE SHOT OFF**;wait 90;input /echo **DOUBLE SHOT READY**')
elseif buff == 'Decoy Shot' and gain then
windower.send_command('wait 170;input /echo **DECOY SHOT** Wearing off in 10 Sec.];wait 126;input /echo **DECOY SHOT READY**')
end
if buff == "Decoy Shot" or buff == "Samurai Roll" or buff == "Courser's Roll" or string.find(buff:lower(), 'flurry') then
classes.CustomRangedGroups:clear()
if (buff == "Decoy Shot" and gain) or buffactive['Decoy Shot'] then
-- Only append Decoy if we're using bow, or changed the setting to force it
if player.equipment.range == gear.Bow or state.GunDecoy.value then
classes.CustomRangedGroups:append('Decoy')
end
end
if (buff == "Samurai Roll" and gain) or buffactive['Samurai Roll'] then
classes.CustomRangedGroups:append('SamRoll')
end
end
if buff == "Camouflage" then
if gain then
equip(sets.buff.Camouflage)
disable('body')
else
enable('body')
end
end
if buff == "Decoy Shot" or buff == "Camouflage" or buff == "Overkill" or buff == "Samurai Roll" or buff == "Courser's Roll" then
handle_equipping_gear(player.status)
end
end
-- Called before the Include starts constructing melee/idle/resting sets.
-- Can customize state or custom melee class values at this point.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_handle_equipping_gear(status, eventArgs)
--select_earring()
end
function customize_idle_set(idleSet)
if state.HybridMode.value == 'PDT' then
state.IdleMode.value = 'PDT'
elseif state.HybridMode.value ~= 'PDT' then
state.IdleMode.value = 'Normal'
end
if state.Buff.Camouflage then
idleSet = set_combine(idleSet, sets.buff.Camouflage)
end
if player.hpp < 90 then
idleSet = set_combine(idleSet, sets.idle.Regen)
end
return idleSet
end
function customize_melee_set(meleeSet)
if state.Buff.Camouflage then
meleeSet = set_combine(meleeSet, sets.buff.Camouflage)
end
if state.Buff.Overkill then
meleeSet = set_combine(meleeSet, sets.Overkill)
end
if state.CapacityMode.value then
meleeSet = set_combine(meleeSet, sets.CapacityMantle)
end
return meleeSet
end
function job_status_change(newStatus, oldStatus, eventArgs)
if newStatus == "Engaged" then
state.CombatWeapon:set(player.equipment.range)
select_earring()
end
if camo_active() then
disable('body')
else
enable('body')
end
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------
-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
end
-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
get_combat_form()
get_custom_ranged_groups()
sam_sj = player.sub_job == 'SAM' or false
-- called here incase buff_change failed to update value
state.Buff.Camouflage = buffactive.camouflage or false
state.Buff.Overkill = buffactive.overkill or false
if camo_active() then
disable('body')
else
enable('body')
end
end
---- Job-specific toggles.
--function job_toggle_state(field)
-- if field:lower() == 'autora' then
-- state.AutoRA = not state.AutoRA
-- return state.AutoRA
-- end
--end
---- Request job-specific mode lists.
---- Return the list, and the current value for the requested field.
--function job_get_option_modes(field)
-- if field:lower() == 'autora' then
-- return state.AutoRA
-- end
--end
-- 
---- Set job-specific mode values.
---- Return true if we recognize and set the requested field.
--function job_set_option_mode(field, val)
-- if field:lower() == 'autora' then
-- state.AutoRA = val
-- return true
-- end
--end
-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
local msg = ''
if state.AutoRA.value then
msg = '[Auto RA: ON]'
else
msg = '[Auto RA: OFF]'
end
add_to_chat(122, 'Ranged: '..state.RangedMode.value..'/'..state.HybridMode.value..', WS: '..state.WeaponskillMode.value..', '..msg)
eventArgs.handled = true
end
-- Special WS mode for Sam subjob
function get_custom_wsmode(spell, spellMap, ws_mode)
if spell.skill == 'Archery' or spell.skill == 'Marksmanship' then
if player.sub_job == 'SAM' then
return 'SAM'
end
end
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function get_combat_form()
if player.equipment.main == gear.Stave then
state.CombatForm:set("Stave")
else
if S{'NIN', 'DNC'}:contains(player.sub_job) and rng_sub_weapons:contains(player.equipment.sub) then
state.CombatForm:set("DW")
else
state.CombatForm:reset()
end
end
end
function select_earring()
-- world.time is given in minutes into each day
-- 7:00 AM would be 420 minutes
-- 17:00 PM would be 1020 minutes
if world.time >= (18*60) or world.time <= (8*60) and state.NightEarring.value then
gear.Earring.name = gear.NightEarring
else
gear.Earring.name = gear.DayEarring
end
end
function get_custom_ranged_groups()
classes.CustomRangedGroups:clear()
if player.equipment.range == gear.Bow or state.GunDecoy.value then
if buffactive['Decoy Shot'] then
classes.CustomRangedGroups:append('Decoy')
end
end
if buffactive['Samurai Roll'] then
classes.CustomRangedGroups:append('SamRoll')
end
end
function use_weaponskill()
if player.equipment.range == gear.Bow then
send_command('input /ws "'..auto_bow_ws..'" <t>')
elseif player.equipment.range == gear.Gun then
send_command('input /ws "'..auto_gun_ws..'" <t>')
end
end
function use_ra(spell)
local delay = '2.2'
-- BOW
if player.equipment.range == gear.Bow then
if spell.type:lower() == 'weaponskill' then
delay = '2.25'
else
if buffactive["Courser's Roll"] then
delay = '0.7' -- MAKE ADJUSTMENT HERE
elseif buffactive["Flurry II"] or buffactive.Overkill then
delay = '0.5'
else
delay = '1.05' -- MAKE ADJUSTMENT HERE
end
end
else
-- GUN
if spell.type:lower() == 'weaponskill' then
delay = '2.25'
else
if buffactive["Courser's Roll"] then
delay = '0.7' -- MAKE ADJUSTMENT HERE
elseif buffactive.Overkill or buffactive['Flurry II'] then
delay = '0.5'
else
delay = '1.05' -- MAKE ADJUSTMENT HERE
end
end
end
send_command('@wait '..delay..'; input /ra <t>')
end
function camo_active()
return state.Buff['Camouflage']
end
-- Check for proper ammo when shooting or weaponskilling
function check_ammo(spell, action, spellMap, eventArgs)
-- Filter ammo checks depending on Unlimited Shot
if state.Buff['Unlimited Shot'] then
if player.equipment.ammo ~= U_Shot_Ammo[player.equipment.range] then
if player.inventory[U_Shot_Ammo[player.equipment.range]] or player.wardrobe[U_Shot_Ammo[player.equipment.range]] then
add_to_chat(122,"Unlimited Shot active. Using custom ammo.")
equip({ammo=U_Shot_Ammo[player.equipment.range]})
elseif player.inventory[DefaultAmmo[player.equipment.range]] or player.wardrobe[DefaultAmmo[player.equipment.range]] then
add_to_chat(122,"Unlimited Shot active but no custom ammo available. Using default ammo.")
equip({ammo=DefaultAmmo[player.equipment.range]})
else
add_to_chat(122,"Unlimited Shot active but unable to find any custom or default ammo.")
end
end
else
if player.equipment.ammo == U_Shot_Ammo[player.equipment.range] and player.equipment.ammo ~= DefaultAmmo[player.equipment.range] then
if DefaultAmmo[player.equipment.range] then
if player.inventory[DefaultAmmo[player.equipment.range]] then
add_to_chat(122,"Unlimited Shot not active. Using Default Ammo")
equip({ammo=DefaultAmmo[player.equipment.range]})
else
add_to_chat(122,"Default ammo unavailable. Removing Unlimited Shot ammo.")
equip({ammo=empty})
end
else
add_to_chat(122,"Unable to determine default ammo for current weapon. Removing Unlimited Shot ammo.")
equip({ammo=empty})
end
elseif player.equipment.ammo == 'empty' then
if DefaultAmmo[player.equipment.range] then
if player.inventory[DefaultAmmo[player.equipment.range]] then
add_to_chat(122,"Using Default Ammo")
equip({ammo=DefaultAmmo[player.equipment.range]})
else
add_to_chat(122,"Default ammo unavailable. Leaving empty.")
end
else
add_to_chat(122,"Unable to determine default ammo for current weapon. Leaving empty.")
end
elseif player.inventory[player.equipment.ammo].count < 15 then
add_to_chat(122,"Ammo '"..player.inventory[player.equipment.ammo].shortname.."' running low ("..player.inventory[player.equipment.ammo].count..")")
end
end
end
-- Orestes uses Samurai Roll. The total comes to 5!
--function detect_cor_rolls(old,new,color,newcolor)
-- if string.find(old,'uses Samurai Roll. The total comes to') then
-- add_to_chat(122,"SAM Roll")
-- end
--end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
-- Default macro set/book
if player.sub_job == 'WAR'then
set_macro_page(1, 11)
elseif player.sub_job == 'SAM' then
set_macro_page(2, 11)
else
set_macro_page(3, 11)
end
end