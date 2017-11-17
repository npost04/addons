---------------------------------------
-- Last Revised: May 28th, 2017 --
---------------------------------------
--
-- Newest updates:
-- Altered any keybinds that involved the Windows Key.
-- Added a new LagMode (Ctrl + = to toggle).
----- Conducts most swaps during Ready precast, and handles Axe/Leg swaps afterwards.
----- Prevents Charmer's Merlin usage while single-wielding.
----- Intended to increase performance during Omen, Sinister Reign, Vagary, Delve, etc. when latency is poor.
-- Added sets.midcast.Pet.Buff for Bubble Curtain, Scissor Guard, Secretion, Rage, Rhino Guard, Zealous Snort, Wild Carrot.
--
-- Other previous update additions:
-- Added Axe swaps for when Pet TP is 3000 after bonuses (sets.UnleashAtkAxes, sets.UnleashMABAxes).
-- Divided Pet Only gearsets into 'TPBonus' and 'non-TPBonus' sets (to maximize dmg for Sweeping Gouge vs Chomp Rush, as an example).
-- Equips Frenzy Sallet when you're asleep & engaged.
-- Started using Nukumi Manoplas+1 for Magic Ready Attacks when below a certain TP threshold.
-- The name of PetMode has been changed to AxeMode (is either NoSwaps or PetOnly). alt+= is the default keybind.
-- Added a cycleback keybind (ctrl+F8) to cycle backward through the JugMode list.
-- Changed Correlation Mode keybind to Alt+F11
-- Added Pet:Subtle Blow and Pet:Store TP options to Hybrid Modes (ctrl+F9 to toggle).
-- Added more gearsets/rules for PetOnly idle Axe swaps (TP, PDT, PetPDT, PetMDT, Idle).
-- Added Verda's pet_tp function to the lua.
-- Added a call_beast_cancel list to prevent usage of HQ jug pets with Call Beast JugModes.
-- Moved pet_midcast rules to job_aftercast to help reduce issues due to lag or missed pet_midcast packets.
-- Added Random Lockstyle Generator - set RandomLockstyleGenerator to 'false' to disable.
-- Added on-screen indicators for Modes [requires the Text add-on] - set DisplayModeInfo to 'false' to disable
-- Added Buff Timers for Reward, Spur, Run Wild - set DisplayPetBuffTimers to 'false' to disable
--
---------------------------------------------
-- Gearswap Commands Specific to this File --
---------------------------------------------
-- Universal Ready Move Commands -
-- //gs c Ready one
-- //gs c Ready two
-- //gs c Ready three
--
-- alt+F8 cycles through designated Jug Pets
-- ctrl+F8 cycles backwards through designated Jug Pets
-- alt+F11 toggles Monster Correlation between Neutral and Favorable
-- ctrl+F9 cycles through Pet stances for Subtle Blow and Store TP modes
-- alt+= switches between Pet-Only (Axe Swaps) and Master (no Axe Swap) modes
-- ctrl+` can swap in the usage of Chaac Belt for Treasure Hunter on common subjob abilities.
-- ctrl+F11 cycles between Magical Defense Modes
-- ctrl+= activates a LagMode which swaps in most pet gear during precast.
--
-------------------------------
-- General Gearswap Commands --
-------------------------------
-- F9 cycles Accuracy modes
-- ctrl+F9 cycles Hybrid modes
-- F10 equips Physical Defense
-- alt+F10 toggles Kiting on or off
-- ctrl+F10 cycles Physical Defense modes
-- F11 equips Magical Defense
-- alt+F12 turns off Defense modes
-- ctrl+F12 cycles Idle modes
--
-- Keep in mind that any time you Change Jobs/Subjobs, your Pet/Correlation/etc reset to default options.
-- F12 will list your current options.
--
-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

function job_setup()
    -- Display and Random Lockstyle Generator options
    DisplayPetBuffTimers = 'true'
    DisplayModeInfo = 'true'
    RandomLockstyleGenerator = 'true'

    PetName = 'None';PetJob = 'None';PetInfo = 'None';ReadyMoveOne = 'None';ReadyMoveTwo = 'None';ReadyMoveThree = 'None'
    pet_info_update()

    -- Input Pet:TP Bonus values for Skirmish Axes used during Pet Buffs
    TP_Bonus_Main = 200
    TP_Bonus_Sub = 200

    -- 1200 Job Point Gift Bonus (Set equal to 0 if below 1200 Job Points)
    TP_Gift_Bonus = 40

    -- (Adjust Run Wild Duration based on # of Job Points)
    RunWildDuration = 340;RunWildIcon = 'abilities/00121.png'
    RewardRegenIcon = 'spells/00023.png'
    SpurIcon = 'abilities/00037.png'
    BubbleCurtainDuration = 180;BubbleCurtainIcon = 'spells/00048.png'
    ScissorGuardIcon = 'spells/00043.png'
    SecretionIcon = 'spells/00053.png'
    RageIcon = 'abilities/00002.png'
    RhinoGuardIcon = 'spells/00053.png'
    ZealousSnortIcon = 'spells/00057.png'

    -- Display Mode Info as on-screen Text
    TextBoxX = 1075
    TextBoxY = 47
    TextSize = 10

    -- List of Equipment Sets created for Random Lockstyle Generator
    -- (If you want to have the same Lockstyle every time, reduce the list to a single Equipset #)
    random_lockstyle_list = {1,2,3,4,5,6,7,8,9,10}

    state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff['Killer Instinct'] = buffactive['Killer Instinct'] or false

    if DisplayModeInfo == 'true' then
        DisplayTrue = 1
    end

    get_combat_form()
    get_melee_groups()
end

function user_setup()
    state.OffenseMode:options('Normal', 'MedAcc', 'HighAcc', 'MaxAcc')
    state.WeaponskillMode:options('Normal', 'WSMedAcc', 'WSHighAcc')
    state.HybridMode:options('Normal', 'Hybrid', 'PetSB', 'PetSTP')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal', 'Reraise')
    state.RestingMode:options('Normal')
    state.PhysicalDefenseMode:options('PetPDT', 'PDT')
    state.MagicalDefenseMode:options('PetMDT', 'MDTShell', 'MEva')

    -- Set up Jug Pet cycling and keybind Alt+F8/Ctrl+F8
    -- INPUT PREFERRED JUG PETS HERE
    state.JugMode = M{['description']='Jug Mode', 'Bug-Ridden Broth', 'Meaty Broth', 'Bubbly Broth', 'Livid Broth',
        'Tant. Broth', 'Blackwater Broth', 'Windy Greens'}
    send_command('bind !f8 gs c cycle JugMode')
    send_command('bind ^f8 gs c cycleback JugMode')

    -- Set up Monster Correlation Modes and keybind Alt+F11
    state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
    send_command('bind !f11 gs c cycle CorrelationMode')

    -- Set up Axe Swapping Modes and keybind alt+=
    state.AxeMode = M{['description']='Axe Mode', 'PetOnly', 'NoSwaps'}
    send_command('bind != gs c cycle AxeMode')

    -- Keybind Ctrl+F11 to cycle Magical Defense Modes
    send_command('bind ^f11 gs c cycle MagicalDefenseMode')

    -- Set up Treasure Modes and keybind Ctrl+`
    state.TreasureMode = M{['description']='Treasure Mode', 'Tag', 'Normal'}
    send_command('bind ^` gs c cycle TreasureMode')

    -- Set up Lag Modes and keybind Ctrl+=
    state.LagMode = M{['description']='Lag Mode', 'Normal', 'Lag'}
    send_command('bind ^= gs c cycle LagMode')

    -- 'Out of Range' distance; Melee WSs will auto-cancel
    target_distance = 8

-- Categorized list of Ready moves
physical_ready_moves = S{'Foot Kick','Whirl Claws','Sheep Charge','Lamb Chop','Head Butt','Wild Oats',
    'Leaf Dagger','Claw Cyclone','Razor Fang','Nimble Snap','Cyclotail','Rhino Attack','Power Attack',
    'Mandibular Bite','Big Scissors','Grapple','Spinning Top','Double Claw','Frogkick','Blockhead',
    'Brain Crush','Tail Blow','??? Needles','Needleshot','Scythe Tail','Ripper Fang','Chomp Rush',
    'Recoil Dive','Sudden Lunge','Spiral Spin','Wing Slap','Beak Lunge','Suction','Back Heel',
    'Choke Breath','Fantod','Tortoise Stomp','Sensilla Blades','Tegmina Buffet','Swooping Frenzy',
    'Pentapeck','Sweeping Gouge','Somersault','Tickling Tendrils','Pecking Flurry','Sickle Slash'}

magic_atk_ready_moves = S{'Dust Cloud','Cursed Sphere','Venom','Toxic Spit','Bubble Shower','Drainkiss',
    'Silence Gas','Dark Spore','Fireball','Plague Breath','Snow Cloud','Charged Whisker','Purulent Ooze',
    'Corrosive Ooze','Aqua Breath','Stink Bomb','Nectarous Deluge','Nepenthic Plunge','Pestilent Plume',
    'Foul Waters','Acid Spray','Infected Leech','Gloom Spray'}

magic_acc_ready_moves = S{'Sheep Song','Scream','Dream Flower','Roar','Gloeosuccus','Palsy Pollen',
    'Soporific','Geist Wall','Toxic Spit','Numbing Noise','Spoil','Hi-Freq Field','Sandpit','Sandblast',
    'Venom Spray','Filamented Hold','Queasyshroom','Numbshroom','Spore','Shakeshroom','Infrasonics',
    'Chaotic Eye','Blaster','Intimidate','Noisome Powder','Acid Mist','TP Drainkiss','Jettatura',
    'Molting Plumage','Spider Web'}

multi_hit_ready_moves = S{'Pentapeck','Tickling Tendrils','Sweeping Gouge','Chomp Rush','Wing Slap',
    'Pecking Flurry'}

tp_based_ready_moves = S{'Foot Kick','Dust Cloud','Snow Cloud','Sheep Song','Sheep Charge','Lamb Chop',
    'Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang','Roar',
    'Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Somersault','Geist Wall','Numbing Noise',
    'Frogkick','Nimble Snap','Cyclotail','Spoil','Rhino Attack','Hi-Freq Field','Sandpit','Sandblast',
    'Mandibular Bite','Metallic Body','Bubble Shower','Grapple','Spinning Top','Double Claw','Spore',
    'Filamented Hold','Blockhead','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics',
    'Needleshot','Chaotic Eye','Blaster','Ripper Fang','Intimidate','Recoil Dive','Water Wall',
    'Sudden Lunge','Noisome Powder','Wing Slap','Beak Lunge','Suction','Drainkiss','Acid Mist',
    'TP Drainkiss','Back Heel','Jettatura','Choke Breath','Fantod','Charged Whisker','Purulent Ooze',
    'Corrosive Ooze','Tortoise Stomp','Aqua Breath','Sensilla Blades','Tegmina Buffet','Sweeping Gouge',
    'Tickling Tendrils','Pecking Flurry','Pestilent Plume','Foul Waters','Spider Web','Gloom Spray'}

-- List of Pet Buffs and Ready moves exclusively modified by Pet TP Bonus gear.
pet_buff_moves = S{'Reward','Spur','Run Wild','Wild Carrot','Bubble Curtain','Scissor Guard','Secretion','Rage',
    'Harden Shell','Rhino Guard','Zealous Snort'}

-- List of Jug Modes that will cancel if Call Beast is used (Bestial Loyalty-only jug pets, HQs generally).
call_beast_cancel = S{'Vis. Broth','Ferm. Broth','Bubbly Broth','Windy Greens','Bug-Ridden Broth','Tant. Broth',
    'Glazed Broth','Slimy Webbing','Deepwater Broth','Venomous Broth','Heavenly Broth'}

-- List of abilities to reference for applying Treasure Hunter gear.
abilities_to_check = S{'Feral Howl','Quickstep','Box Step','Stutter Step','Desperate Flourish',
    'Violent Flourish','Animated Flourish','Provoke','Dia','Dia II','Flash','Bio','Bio II',
    'Sleep','Sleep II','Drain','Aspir','Dispel','Stun','Steal','Mug'}

enmity_plus_moves = S{'Provoke','Berserk','Warcry','Aggressor','Holy Circle','Sentinel','Last Resort',
    'Souleater','Vallation','Swordplay'}

-- Random Lockstyle generator.
    if RandomLockstyleGenerator == 'true' then
        local randomLockstyle = random_lockstyle_list[math.random(1, #random_lockstyle_list)]
        send_command('@wait 5;input /lockstyleset '.. randomLockstyle)
    end

    display_mode_info()
end

function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end

    -- Unbinds the Reward, Correlation, JugMode, AxeMode and Treasure hotkeys.
    send_command('unbind !=')
    send_command('unbind ^=')
    send_command('unbind @=')
    send_command('unbind !f8')
    send_command('unbind ^f8')
    send_command('unbind @f8')
    send_command('unbind ^f11')

    -- Removes any Text Info Boxes
    send_command('text JugPetText delete')
    send_command('text CorrelationText delete')
    send_command('text AxeModeText delete')
    send_command('text AccuracyText delete')
end

-- BST gearsets
function init_gear_sets()

    --------------------
    -- AUGMENTED GEAR --
    --------------------

    Pet_Idle_AxeMain = "Izizoeksi"
    Pet_Idle_AxeSub = {name="Digirbalag", augments={'Pet: Damage taken -5%','Pet: Accuracy+1 Pet: Rng. Acc.+1','Pet: Attack+8 Pet: Rng.Atk.+8',}}
    Pet_PDT_AxeMain = "Izizoeksi"
    Pet_PDT_AxeSub = {name="Astolfo", augments={'VIT+11','Pet: Phys. dmg. taken -11%',}}
    Pet_MDT_AxeMain = "Izizoeksi"
    Pet_MDT_AxeSub = {name="Digirbalag", augments={'Pet: Damage taken -5%','Pet: Accuracy+1 Pet: Rng. Acc.+1','Pet: Attack+8 Pet: Rng.Atk.+8',}}
    Pet_TP_AxeMain = "Skullrender"
    Pet_TP_AxeSub = "Skullrender"
    Pet_Regen_AxeMain = "Buramgh +1"
    Pet_Regen_AxeSub = {name="Kumbhakarna", augments={'Pet: Mag. Evasion+20','Pet: "Regen"+3','MND+17',}}

    Ready_Atk_Axe = "Aymur"
    Ready_Atk_Axe2 = "Arktoi"
    Ready_Atk_TPBonus_Axe = "Aymur"
    Ready_Atk_TPBonus_Axe2 = {name="Kumbhakarna", augments={'Pet: Attack+20 Pet: Rng.Atk.+20','Pet: "Dbl.Atk."+3 Pet: Crit.hit rate +3','Pet: TP Bonus+200',}}

    Ready_Acc_Axe = "Arktoi"
    Ready_Acc_Axe2 = {name="Digirbalag", augments={'"Store TP"+3','Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: Attack+29 Pet: Rng.Atk.+29','DMG:+14',}}
    Ready_Acc_TPBonus_Axe = {name="Kumbhakarna", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2','Pet: TP Bonus+180',}}

    Ready_MAB_Axe = {name="Digirbalag", augments={'Pet: Mag. Acc.+21','Pet: "Mag.Atk.Bns."+30','INT+2 MND+2 CHR+2',}}
    Ready_MAB_Axe2 = "Deacon Tabar"
    Ready_MAB_TPBonus_Axe = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+20','Pet: TP Bonus+200',}}
    Ready_MAB_TPBonus_Axe2 = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+20','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+180',}}

    Ready_MAcc_Axe = {name="Kumbhakarna", augments={'Pet: Mag. Acc.+20','"Cure" potency +15%','Pet: TP Bonus+180',}}
    Ready_MAcc_Axe2 = {name="Digirbalag", augments={'Pet: Mag. Acc.+21','Pet: "Mag.Atk.Bns."+30','INT+2 MND+2 CHR+2',}}

    Reward_Axe = "Farsha"
    Reward_Axe2 = {name="Kumbhakarna", augments={'Pet: Mag. Evasion+20','Pet: "Regen"+3','MND+17',}}
    Reward_hands = "Totemic Gloves +3"
    Reward_back = {name="Artio's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}

    Pet_PDT_head = "Anwig Salade"
    Pet_PDT_body = "Totemic Jackcoat +3"
    Pet_PDT_hands = {name="Valorous Mitts", augments={'Pet: "Mag.Atk.Bns."+3','Pet: Phys. dmg. taken -5%','Pet: VIT+8','Pet: Accuracy+9 Pet: Rng. Acc.+9','Pet: Attack+4 Pet: Rng.Atk.+4',}}
    Pet_PDT_legs = {name="Valor. Hose", augments={'Pet: Phys. dmg. taken -5%','Pet: VIT+7','Pet: Accuracy+14 Pet: Rng. Acc.+14','Pet: Attack+12 Pet: Rng.Atk.+12',}}
    Pet_PDT_feet = {name="Valorous Greaves", augments={'Pet: Attack+12 Pet: Rng.Atk.+12','Pet: Phys. dmg. taken -5%','Pet: VIT+9',}}
    Pet_PDT_back = {name="Pastoralist's Mantle", augments={'STR+1 DEX+1','Accuracy+1','Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: Damage taken -5%',}}

    Pet_MDT_head = "Anwig Salade"
    Pet_MDT_body = "Totemic Jackcoat +3"
    Pet_MDT_hands = {name="Taeon Gloves", augments={'Pet: Mag. Evasion+25','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_MDT_legs = {name="Taeon Tights", augments={'Pet: Mag. Evasion+19','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_MDT_feet = {name="Taeon Boots", augments={'Pet: Mag. Evasion+22','Pet: "Regen"+3','Pet: Damage taken -4%',}}

    Pet_DT_head = "Anwig Salade"
    Pet_DT_body = {name="Acro Surcoat", augments={'Pet: DEF+22','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_DT_hands = {name="Acro Gauntlets", augments={'Pet: DEF+22','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_DT_legs = {name="Acro Breeches", augments={'Pet: DEF+25','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_DT_feet = {name="Acro Leggings", augments={'Pet: DEF+25','Pet: "Regen"+3','Pet: Damage taken -4%',}}

    Pet_Regen_head = {name="Valorous Mask", augments={'Pet: "Regen"+5','Pet: Accuracy+13 Pet: Rng. Acc.+13',}}
    Pet_Regen_body = {name="Valorous Mail", augments={'Pet: Accuracy+27 Pet: Rng. Acc.+27','Pet: "Regen"+5','Pet: Attack+4 Pet: Rng.Atk.+4',}}
    Pet_Regen_hands = {name="Valorous Mitts", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: "Regen"+5','Pet: DEX+7','Pet: Attack+15 Pet: Rng.Atk.+15',}}
    Pet_Regen_legs = {name="Valor. Hose", augments={'Pet: "Regen"+5','Pet: Attack+1 Pet: Rng.Atk.+1',}}
    Pet_Regen_feet = "Emicho Gambieras +1"
    Pet_Regen_back = {name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10',}}

    Ready_Atk_head = "Emicho Coronet +1"
    Ready_Atk_body = {name="Valorous Mail", augments={'Pet: Attack+27 Pet: Rng.Atk.+27','Pet: STR+14','Pet: Accuracy+14 Pet: Rng. Acc.+14',}}
    Ready_Atk_hands = "Emicho Gauntlets +1"
    Ready_Atk_legs = "Totemic Trousers +3"
    Ready_Atk_feet = "Totemic Gaiters +3"
    Ready_Atk_back = {name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}}

    Ready_Acc_head = "Totemic Helm +3"
    Ready_Acc_body = {name="Valorous Mail", augments={'Pet: Accuracy+27 Pet: Rng. Acc.+27','Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','Pet: DEX+10','Pet: Attack+14 Pet: Rng.Atk.+14',}}
    Ready_Acc_hands = {name="Valorous Mitts", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: "Regen"+5','Pet: DEX+7','Pet: Attack+15 Pet: Rng.Atk.+15',}}
    Ready_Acc_legs = {name="Valor. Hose", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: Phys. dmg. taken -2%','Pet: DEX+8','Pet: Attack+15 Pet: Rng.Atk.+15',}}
    Ready_Acc_feet = {name="Valorous Greaves", augments={'Pet: Accuracy+28 Pet: Rng. Acc.+28','Pet: "Dbl.Atk."+1 Pet: Crit.hit rate +1','Pet: DEX+9','Pet: Attack+15 Pet: Rng.Atk.+15',}}
    Ready_Acc_back = {name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}}

    Ready_MAB_head = {name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+30','Pet: "Store TP"+2','Pet: INT+8','Pet: Attack+6 Pet: Rng.Atk.+6',}}
    Ready_MAB_body = "Emicho Haubert +1"
    Ready_MAB_hands = {name="Valorous Mitts", augments={'Pet: "Mag.Atk.Bns."+29','Pet: "Store TP"+9','Pet: INT+12','Pet: Attack+4 Pet: Rng.Atk.+4',}}
    Ready_MAB_legs = {name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+10','Pet: Accuracy+7 Pet: Rng. Acc.+7','Pet: Attack+6 Pet: Rng.Atk.+6',}}
    Ready_MAB_feet = {name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+30','Pet: INT+13','Pet: Accuracy+9 Pet: Rng. Acc.+9','Pet: Attack+15 Pet: Rng.Atk.+15',}}

    Ready_MAcc_head = "Tali'ah Turban +1"
    Ready_MAcc_body = "Tali'ah Manteel +1"
    Ready_MAcc_hands = "Tali'ah Gages +1"
    Ready_MAcc_legs = "Tali'ah Seraweels +1"
    Ready_MAcc_feet = "Tali'ah Crackows +1"
    Ready_MAcc_back = {name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10',}}

    Ready_DA_axe = {name="Kumbhakarna", augments={'Pet: Attack+20 Pet: Rng.Atk.+20','Pet: "Dbl.Atk."+3 Pet: Crit.hit rate +3','Pet: TP Bonus+200',}}
    Ready_DA_head = "Emicho Coronet +1"
    Ready_DA_body = {name="Valorous Mail", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Dbl. Atk."+5','Pet: STR+6','Pet: Attack+14 Pet: Rng.Atk.+14',}}
    Ready_DA_hands = "Emicho Gauntlets +1"
    Ready_DA_legs = "Emicho Hose +1"
    Ready_DA_feet = {name="Taeon Boots", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+5','Pet: Haste+5',}}

    Pet_Melee_head = "Emicho Coronet +1"
    Pet_Melee_body = {name="Valorous Mail", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Dbl. Atk."+5','Pet: STR+6','Pet: Attack+14 Pet: Rng.Atk.+14',}}
    Pet_Melee_hands = "Emicho Gauntlets +1"
    Pet_Melee_legs = "Emicho Hose +1"
    Pet_Melee_feet = {name="Taeon Boots", augments={'Pet: Attack+23 Pet: Rng.Atk.+23','Pet: "Dbl. Atk."+5','Pet: Haste+5',}}

    Pet_SB_body = {name="Valorous Mail", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: "Subtle Blow"+11','Pet: Accuracy+15 Pet: Rng. Acc.+15',}}

    Hybrid_head = {name="Valorous Mask", augments={'Pet: "Regen"+5','Pet: Accuracy+13 Pet: Rng. Acc.+13',}}
    Hybrid_body = Pet_PDT_body
    Hybrid_hands = Pet_PDT_hands
    Hybrid_legs = {name="Taeon Tights", augments={'Accuracy+20 Attack+20','"Triple Atk."+2','Pet: Damage taken -4%',}}
    Hybrid_feet = {name="Taeon Boots", augments={'Accuracy+25','"Triple Atk."+2','Pet: Damage taken -4%',}}

    DW_head = {name="Taeon Chapeau", augments={'Accuracy+19 Attack+19','"Dual Wield"+5','STR+3 VIT+3',}}
    DW_body = {name="Taeon Tabard", augments={'Accuracy+20 Attack+20','"Dual Wield"+5','Crit. hit damage +2%',}}
    DW_hands = {name="Taeon Gloves", augments={'Accuracy+18 Attack+18','"Dual Wield"+5','MND+9',}}
    DW_legs = {name="Taeon Tights", augments={'Accuracy+22','"Dual Wield"+5','Crit. hit damage +2%',}}
    DW_feet = {name="Taeon Boots", augments={'Accuracy+23','"Dual Wield"+5','Crit. hit damage +2%',}}
    DW_back = {name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10',}}

    MAB_head = "Jumalik Helm"
    MAB_body = "Jumalik Mail"
    MAB_hands = "Leyline Gloves"
    MAB_legs = {name="Taeon Tights", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+5','STR+10',}}
    MAB_feet = {name="Valorous Greaves", augments={'"Mag.Atk.Bns."+17','AGI+7','"Fast Cast"+7','Accuracy+14 Attack+14',}}

    FC_head = {name="Taeon Chapeau", augments={'"Mag.Atk.Bns."+19','"Fast Cast"+5','Weapon skill damage +2%',}}
    FC_body = {name="Taeon Tabard", augments={'"Mag.Atk.Bns."+20','"Fast Cast"+5','Weapon skill damage +2%',}}
    FC_hands = "Leyline Gloves"
    FC_legs = {name="Taeon Tights", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+5','STR+10',}}
    FC_feet = {name="Valorous Greaves", augments={'"Mag.Atk.Bns."+17','AGI+7','"Fast Cast"+7','Accuracy+14 Attack+14',}}
    FC_back = {name="Artio's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}

    MAcc_head = "Tali'ah Turban +1"
    MAcc_body = "Tali'ah Manteel +1"
    MAcc_hands = "Tali'ah Gages +1"
    MAcc_legs = "Tali'ah Seraweels +1"
    MAcc_feet = "Tali'ah Crackows +1"
    MAcc_back = {name="Artio's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity+10',}}

    MEva_Axe_main = {name="Kumbhakarna", augments={'Mag. Evasion+14','Magic dmg. taken -5%','INT+15',}}
    MEva_Axe_sub = {name="Astolfo", augments={'CHR+11','Mag. Evasion+16',}}
    MEva_head = {name="Taeon Chapeau", augments={'Mag. Evasion+19','"Cure" potency +4%',}}
    MEva_body = {name="Taeon Tabard", augments={'Mag. Evasion+20',}}
    MEva_hands = "Leyline Gloves"
    MEva_legs = "Sombra Tights +1"
    MEva_feet = "Sombra Leggings +1"
    MEva_back = {name="Artio's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}

    CB_head = {name="Acro Helm", augments={'Pet: Mag. Acc.+25','"Call Beast" ability delay -5',}}
    CB_body = "Mirke Wardecors"
    CB_hands = "Ankusa Gloves +1"
    CB_legs = {name="Acro Breeches", augments={'Pet: Mag. Acc.+25','"Call Beast" ability delay -5',}}
    CB_feet = "Armada Sollerets"

    Cure_Potency_axe = {name="Kumbhakarna", augments={'Pet: Mag. Acc.+20','"Cure" potency +15%','Pet: TP Bonus+180',}}
    Cure_Potency_head = "Emicho Coronet +1"
    Cure_Potency_body = "Jumalik Mail"
    Cure_Potency_hands = "Buremte Gloves"
    Cure_Potency_legs = "Totemic Trousers +3"
    Cure_Potency_feet = {name="Taeon Boots", augments={'"Cure" potency +5%',}}
    Cure_Potency_back = {name="Artio's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}

    Waltz_back = {name="Artio's Mantle", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','CHR+10','Weapon skill damage +10%',}}

    STR_DA_back = {name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
    STR_WS_back = {name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    Onslaught_back = {name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
    Primal_back = {name="Artio's Mantle", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','CHR+10','Weapon skill damage +10%',}}
    Cloud_back = {name="Artio's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}

    TH_hands = {name="Valorous Mitts", augments={'Pet: STR+6','"Fast Cast"+3','"Treasure Hunter"+1','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}
    TH_legs = {name="Valor. Hose", augments={'"Mag.Atk.Bns."+5','STR+6','"Treasure Hunter"+1','Mag. Acc.+2 "Mag.Atk.Bns."+2',}}

    Enmity_plus_feet = {name="Acro Leggings", augments={'Pet: Mag. Acc.+23','Enmity+10',}}
    Enmity_plus_back = {name="Artio's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity+10',}}

    sets.Enmity = {ammo="Paeapua",
        head="Halitus Helm",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Cryptic Earring",
        body="Emet Harness +1",hands="Macabre Gauntlets +1",ring1="Provocare Ring",ring2="Eihwaz Ring",
        back=Enmity_plus_back,waist="Trance Belt",legs="Zoar Subligar +1",feet=Enmity_plus_feet}
    sets.EnmityNE = set_combine(sets.Enmity, {main="Freydis",sub="Evalach +1"})
    sets.EnmityNEDW = set_combine(sets.Enmity, {main="Freydis",sub="Evalach +1"})

    ---------------------
    -- JA PRECAST SETS --
    ---------------------
    -- Most gearsets are divided into 3 categories:
    -- 1. Default - No Axe swaps involved.
    -- 2. NE (Not engaged) - Axe/Shield swap included, for use with Pet Only mode.
    -- 3. NEDW (Not engaged; Dual-wield) - Axe swaps included, for use with Pet Only mode.

    sets.precast.JA.Familiar = {legs="Ankusa Trousers +1"}
    sets.precast.JA['Call Beast'] = {head=CB_head,
        body=CB_body,
        hands=CB_hands,
        legs=CB_legs,
        feet=CB_feet}
    sets.precast.JA['Bestial Loyalty'] = sets.precast.JA['Call Beast']

    sets.precast.JA.Tame = {head="Totemic Helm +3",ear1="Tamer's Earring",legs="Stout Kecks"}

    sets.precast.JA.Spur = {back="Artio's Mantle",feet="Nukumi Ocreae +1"}
    sets.precast.JA.SpurNE = set_combine(sets.precast.JA.Spur, {main="Skullrender"})
    sets.precast.JA.SpurNEDW = set_combine(sets.precast.JA.Spur, {main="Skullrender",sub="Skullrender"})

    --sets.precast.JA['Feral Howl'] = {ammo="Pemphredo Tathlum",
    --    head=MAcc_head,neck="Sanctity Necklace",ear1="Hermetic Earring",ear2="Dignitary's Earring",
    --    body=MAcc_body,hands=MAcc_hands,ring1="Rahab Ring",ring2="Sangoma Ring",
    --    back=MAcc_back,waist="Eschan Stone",legs=MAcc_legs,feet=MAcc_feet}
    sets.precast.JA['Feral Howl'] = sets.Enmity

    sets.precast.JA['Killer Instinct'] = set_combine(sets.Enmity, {head="Ankusa Helm +1"})

    sets.precast.JA.Reward = {ammo="Pet Food Theta",
        head="Stout Bonnet",neck="Aife's Medal",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
        body="Totemic Jackcoat +3",hands=Reward_hands,ring1="Leviathan Ring +1",ring2="Leviathan Ring +1",
        back=Reward_back,waist="Engraved Belt",legs="Totemic Trousers +3",feet="Shukuyu Sune-Ate"}
    sets.precast.JA.RewardNE = set_combine(sets.precast.JA.Reward, {main=Reward_Axe,sub="Matamata Shield +1"})
    sets.precast.JA.RewardNEDW = set_combine(sets.precast.JA.RewardNE, {sub=Reward_Axe2})

    sets.precast.JA.Charm = {ammo="Tsar's Egg",
        head="Totemic Helm +3",neck="Dualism Collar +1",ear1="Enchanter's Earring",ear2="Enchanter Earring +1",
        body="Totemic Jackcoat +3",hands="Ankusa Gloves +1",ring1="Dawnsoul Ring",ring2="Dawnsoul Ring",
        back=Primal_back,waist="Aristo Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}
    sets.precast.JA.CharmNE = set_combine(sets.precast.JA.Charm, {main="Buramgh +1",sub="Thuellaic Ecu +1"})
    sets.precast.JA.CharmNEDW = set_combine(sets.precast.JA.CharmNE, {sub="Buramgh"})

    ---------------------------
    -- PET SIC & READY MOVES --
    ---------------------------

    sets.ReadyRecast = {legs="Desultor Tassets"}
    sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +1"}
    sets.midcast.Pet.Neutral = {head=Ready_Atk_head}
    sets.midcast.Pet.Favorable = {head="Nukumi Cabasset +1"}

    sets.midcast.Pet.WS = {ammo="Demonry Core",
        neck="Shulmanu Collar",ear1="Hija Earring",ear2="Ruby Earring",
        body=Ready_Atk_body,
        hands=Ready_Atk_hands,
        ring1="Thurandaut Ring +1",
        ring2="Varar Ring +1",
        back=Ready_Atk_back,
        waist="Incarnation Sash",
        legs=Ready_Atk_legs,
        feet=Ready_Atk_feet}

    sets.midcast.Pet.MedAcc = set_combine(sets.midcast.Pet.WS, {
        ear2="Enmerkar Earring",
        body=Ready_Acc_body,
        back=Ready_Acc_back,
        waist="Incarnation Sash",
        legs=Ready_Acc_legs})

    sets.midcast.Pet.HighAcc = set_combine(sets.midcast.Pet.WS, {
        ear1="Ferine Earring",
        ear2="Enmerkar Earring",
        body=Ready_Acc_body,
        back=Ready_Acc_back,
        waist="Klouskap Sash +1",
        legs=Ready_Acc_legs,
        feet=Ready_Acc_feet})

    sets.midcast.Pet.MaxAcc = set_combine(sets.midcast.Pet.WS, {
        head="Totemic Helm +3",
        ear1="Ferine Earring",
        ear2="Enmerkar Earring",
        body="Tali'ah Manteel +1",
        hands="Tali'ah Gages +1",
        back=Ready_Acc_back,
        waist="Klouskap Sash +1",
        legs=Ready_Acc_legs,
        feet=Ready_Acc_feet})

    sets.midcast.Pet.MagicAtkReady = set_combine(sets.midcast.Pet.WS, {
        head=Ready_MAB_head,
        neck="Adad Amulet",
        ear1="Hija Earring",ear2="Diamond Earring",
        body=Ready_MAB_body,
        hands=Ready_MAB_hands,
        back="Argochampsa Mantle",
        legs=Ready_MAB_legs,
        feet=Ready_MAB_feet})

    sets.midcast.Pet.MagicAtkReady.MedAcc = set_combine(sets.midcast.Pet.MagicAtkReady, {
        head=Ready_MAcc_head,
        ear2="Enmerkar Earring",
        legs=Ready_MAcc_legs})

    sets.midcast.Pet.MagicAtkReady.HighAcc = set_combine(sets.midcast.Pet.MagicAtkReady, {
        head=Ready_MAcc_head,
        ear2="Enmerkar Earring",
        body=Ready_MAcc_body,
        hands=Ready_MAcc_hands,
        back=Ready_MAcc_back,
        legs=Ready_MAcc_legs})

    sets.midcast.Pet.MagicAtkReady.MaxAcc = set_combine(sets.midcast.Pet.MagicAtkReady, {
        head=Ready_MAcc_head,
        ear1="Sapphire Earring",ear2="Enmerkar Earring",
        body=Ready_MAcc_body,
        hands=Ready_MAcc_hands,
        back=Ready_MAcc_back,
        legs=Ready_MAcc_legs,
        feet=Ready_MAcc_feet})

    sets.midcast.Pet.MagicAccReady = set_combine(sets.midcast.Pet.WS, {
        head=Ready_MAcc_head,
        neck="Adad Amulet",
        ear1="Sapphire Earring",ear2="Enmerkar Earring",
        body=Ready_MAcc_body,
        hands=Ready_MAcc_hands,
        back=Ready_MAcc_back,
        legs=Ready_MAcc_legs,
        feet=Ready_MAcc_feet})

    sets.midcast.Pet.MultiStrike = set_combine(sets.midcast.Pet.WS, {
        neck="Shulmanu Collar",ear2="Domesticator's Earring",
        body=Ready_DA_body,
        hands=Ready_DA_hands,
        legs=Ready_DA_legs,
        feet=Ready_DA_feet})

    sets.midcast.Pet.SubtleBlowMNK = {ear1="Gelai Earring",
        body=Pet_SB_body,
        waist="Isa Belt"}

    sets.midcast.Pet.SubtleBlowNonMNK = set_combine(sets.midcast.Pet.WS, {
        ear1="Gelai Earring",
        body=Pet_SB_body,
        waist="Isa Belt"})

    sets.midcast.Pet.Buff = set_combine(sets.midcast.Pet.TPBonus, {
        body="Emicho Haubert +1",
        hands="Nukumi Manoplas +1"})

    --------------------------------------
    -- SINGLE WIELD PET-ONLY READY SETS --
    --------------------------------------

    sets.ReadyRecastNE = {main="Charmer's Merlin",legs="Desultor Tassets"}

    -- Physical Ready Attacks w/o TP Modifier for Damage (ex. Sickle Slash, Whirl Claws, Swooping Frenzy, etc.)
    sets.midcast.Pet.ReadyNE = set_combine(sets.midcast.Pet.WS, {main=Ready_Atk_Axe})
    sets.midcast.Pet.ReadyNE.MedAcc = set_combine(sets.midcast.Pet.MedAcc, {main=Ready_Atk_Axe})
    sets.midcast.Pet.ReadyNE.HighAcc = set_combine(sets.midcast.Pet.HighAcc, {main=Ready_Atk_Axe})
    sets.midcast.Pet.ReadyNE.MaxAcc = set_combine(sets.midcast.Pet.MaxAcc, {main=Ready_Acc_Axe})

    -- Physical TP Bonus Ready Attacks (ex. Razor Fang, Tegmina Buffet, Tail Blow, Recoil Dive, etc.)
    sets.midcast.Pet.ReadyNE.TPBonus = set_combine(sets.midcast.Pet.ReadyNE, {main=Ready_Atk_TPBonus_Axe})
    sets.midcast.Pet.ReadyNE.TPBonus.MedAcc = set_combine(sets.midcast.Pet.ReadyNE.MedAcc, {main=Ready_Atk_TPBonus_Axe})
    sets.midcast.Pet.ReadyNE.TPBonus.HighAcc = set_combine(sets.midcast.Pet.ReadyNE.HighAcc, {main=Ready_Atk_TPBonus_Axe})
    sets.midcast.Pet.ReadyNE.TPBonus.MaxAcc = set_combine(sets.midcast.Pet.ReadyNE.MaxAcc, {main=Ready_Acc_Axe})

    -- Multihit Ready Attacks w/o TP Modifier for Damage (Pentapeck, Chomp Rush)
    sets.midcast.Pet.MultiStrikeNE = set_combine(sets.midcast.Pet.MultiStrike, {main=Ready_Atk_Axe2})

    -- Multihit TP Bonus Ready Attacks (Sweeping Gouge, Tickling Tendrils, Pecking Flurry, Wing Slap)
    sets.midcast.Pet.MultiStrikeNE.TPBonus = set_combine(sets.midcast.Pet.MultiStrike, {main=Ready_Atk_TPBonus_Axe})

    -- Magical Ready Attacks w/o TP Modifier for Damage (ex. Molting Plumage, Venom, Stink Bomb, etc.)
    sets.midcast.Pet.MagicAtkReadyNE = set_combine(sets.midcast.Pet.MagicAtkReady, {main=Ready_MAB_Axe})
    sets.midcast.Pet.MagicAtkReadyNE.MedAcc = set_combine(sets.midcast.Pet.MagicAtkReady.MedAcc, {main=Ready_MAB_Axe})
    sets.midcast.Pet.MagicAtkReadyNE.HighAcc = set_combine(sets.midcast.Pet.MagicAtkReady.HighAcc, {main=Ready_MAB_Axe})
    sets.midcast.Pet.MagicAtkReadyNE.MaxAcc = set_combine(sets.midcast.Pet.MagicAtkReady.MaxAcc, {main=Ready_MAcc_Axe2})

    -- Magical TP Bonus Ready Attacks (ex. Fireball, Cursed Sphere, Corrosive Ooze, etc.)
    sets.midcast.Pet.MagicAtkReadyNE.TPBonus = set_combine(sets.midcast.Pet.MagicAtkReadyNE, {main=Ready_MAB_TPBonus_Axe})
    sets.midcast.Pet.MagicAtkReadyNE.TPBonus.MedAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.MedAcc, {main=Ready_MAB_TPBonus_Axe})
    sets.midcast.Pet.MagicAtkReadyNE.TPBonus.HighAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.HighAcc, {main=Ready_MAB_TPBonus_Axe})
    sets.midcast.Pet.MagicAtkReadyNE.TPBonus.MaxAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.MaxAcc, {main=Ready_MAcc_Axe2})

    -- Magical Ready Enfeebles (ex. Roar, Sheep Song, Infrasonics, etc.)
    sets.midcast.Pet.MagicAccReadyNE = set_combine(sets.midcast.Pet.MagicAccReady, {main=Ready_MAcc_Axe})

    -- Pet Buffs/Cures (Bubble Curtain, Scissor Guard, Secretion, Rage, Rhino Guard, Zealous Snort, Wild Carrot)
    sets.midcast.Pet.BuffNE = set_combine(sets.midcast.Pet.Buff, {main=Ready_Atk_TPBonus_Axe})

    ------------------------------------
    -- DUAL WIELD PET-ONLY READY SETS --
    ------------------------------------

    sets.ReadyRecastDWNE = {main="Aymur",sub="Charmer's Merlin",legs="Desultor Tassets"}

    -- DW Axe Swaps for Physical Ready Attacks w/o TP Modifier for Damage (ex. Sickle Slash, Whirl Claws, Swooping Frenzy, etc.)
    sets.midcast.Pet.ReadyDWNE = set_combine(sets.midcast.Pet.ReadyNE, {main=Ready_Atk_Axe,sub=Ready_Atk_Axe2})
    sets.midcast.Pet.ReadyDWNE.MedAcc = set_combine(sets.midcast.Pet.ReadyNE.MedAcc, {main=Ready_Atk_Axe,sub=Ready_Acc_Axe})
    sets.midcast.Pet.ReadyDWNE.HighAcc = set_combine(sets.midcast.Pet.ReadyNE.HighAcc, {main=Ready_Atk_Axe,sub=Ready_Acc_Axe})
    sets.midcast.Pet.ReadyDWNE.MaxAcc = set_combine(sets.midcast.Pet.ReadyNE.MaxAcc, {main=Ready_Acc_Axe,sub=Ready_Acc_Axe2})

    -- DW Axe Swaps for Physical TP Bonus Ready Attacks (ex. Razor Fang, Tegmina Buffet, Tail Blow, Recoil Dive, etc.)
    sets.midcast.Pet.ReadyDWNE.TPBonus = set_combine(sets.midcast.Pet.ReadyNE, {main=Ready_Atk_TPBonus_Axe,sub=Ready_Atk_TPBonus_Axe2})
    sets.midcast.Pet.ReadyDWNE.TPBonus.MedAcc = set_combine(sets.midcast.Pet.ReadyNE.MedAcc, {main=Ready_Atk_TPBonus_Axe,sub=Ready_Acc_TPBonus_Axe})
    sets.midcast.Pet.ReadyDWNE.TPBonus.HighAcc = set_combine(sets.midcast.Pet.ReadyNE.HighAcc, {main=Ready_Atk_TPBonus_Axe,sub=Ready_Acc_TPBonus_Axe})
    sets.midcast.Pet.ReadyDWNE.TPBonus.MaxAcc = set_combine(sets.midcast.Pet.ReadyNE.MaxAcc, {main=Ready_Acc_Axe,sub=Ready_Acc_Axe2})

    -- DW Axe Swaps for Multihit Ready Attacks w/o TP Modifier for Damage (Pentapeck, Chomp Rush)
    sets.midcast.Pet.MultiStrikeDWNE = set_combine(sets.midcast.Pet.MultiStrikeNE, {main=Ready_Atk_Axe,sub=Ready_Atk_Axe2})

    -- DW Axe Swaps for Multihit TP Bonus Ready Attacks (Sweeping Gouge, Tickling Tendrils, Pecking Flurry, Wing Slap)
    sets.midcast.Pet.MultiStrikeDWNE.TPBonus = set_combine(sets.midcast.Pet.MultiStrikeNE, {main=Ready_Atk_TPBonus_Axe,sub=Ready_Atk_TPBonus_Axe2})

    -- DW Axe Swaps for Magical Ready Attacks w/o TP Modifier for Damage (ex. Molting Plumage, Stink Bomb, Venom, etc.)
    sets.midcast.Pet.MagicAtkReadyDWNE = set_combine(sets.midcast.Pet.MagicAtkReadyNE, {main=Ready_MAB_Axe,sub=Ready_MAB_Axe2})
    sets.midcast.Pet.MagicAtkReadyDWNE.MedAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.MedAcc, {main=Ready_MAB_Axe,sub=Ready_MAB_Axe2})
    sets.midcast.Pet.MagicAtkReadyDWNE.HighAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.HighAcc, {main=Ready_MAB_Axe,sub=Ready_MAcc_Axe})
    sets.midcast.Pet.MagicAtkReadyDWNE.MaxAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.MaxAcc, {main=Ready_MAB_Axe,sub=Ready_MAcc_Axe})

    -- DW Axe Swaps for Magical TP Bonus Ready Attacks (ex. Fireball, Cursed Sphere, Corrosive Ooze, etc.)
    sets.midcast.Pet.MagicAtkReadyDWNE.TPBonus = set_combine(sets.midcast.Pet.MagicAtkReadyNE, {main=Ready_MAB_TPBonus_Axe,sub=Ready_MAB_TPBonus_Axe2})
    sets.midcast.Pet.MagicAtkReadyDWNE.TPBonus.MedAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.MedAcc, {main=Ready_MAB_TPBonus_Axe,sub=Ready_MAB_TPBonus_Axe2})
    sets.midcast.Pet.MagicAtkReadyDWNE.TPBonus.HighAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.HighAcc, {main=Ready_MAB_TPBonus_Axe,sub=Ready_MAB_TPBonus_Axe2})
    sets.midcast.Pet.MagicAtkReadyDWNE.TPBonus.MaxAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.MaxAcc, {main=Ready_MAB_Axe,sub=Ready_MAcc_Axe})

    -- DW Axe Swaps for Magical Ready Enfeebles (ex. Roar, Sheep Song, Infrasonics, etc.)
    sets.midcast.Pet.MagicAccReadyDWNE = set_combine(sets.midcast.Pet.MagicAccReadyNE, {main=Ready_MAB_Axe,sub=Ready_MAcc_Axe2})

    -- DW Axe Swaps for Pet Buffs/Cures (Bubble Curtain, Scissor Guard, Secretion, Rage, Rhino Guard, Zealous Snort, Wild Carrot)
    sets.midcast.Pet.BuffDWNE = set_combine(sets.midcast.Pet.BuffNE, {main=Ready_Atk_TPBonus_Axe,sub=Ready_Atk_TPBonus_Axe2})

    -- Axe Swaps for when Pet TP is above a certain value.
    sets.UnleashAtkAxes = {main=Ready_Atk_Axe,sub=Ready_Atk_Axe2}
    sets.UnleashAtkAxes.MedAcc = {main=Ready_Atk_Axe,sub=Ready_Atk_Axe2}
    sets.UnleashAtkAxes.HighAcc = {main=Ready_Atk_Axe,sub=Ready_Atk_Axe2}

    sets.UnleashMABAxes = {main=Ready_MAB_Axe,sub=Ready_MAB_Axe2}
    sets.UnleashMABAxes.MedAcc = {main=Ready_MAB_Axe,sub=Ready_MAB_Axe2}
    sets.UnleashMABAxes.HighAcc = {main=Ready_MAB_Axe,sub=Ready_MAB_Axe2}

    ---------------
    -- IDLE SETS --
    ---------------

    sets.idle = {ammo="Demonry Core",
        head="Meghanada Visor +2",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Dawn Earring",
        body="Meghanada Cuirie +2",hands="Meghanada Gloves +2",ring1="Meghanada Ring",ring2="Sheltered Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs="Meghanada Chausses +2",feet="Skadi's Jambeaux +1"}

    sets.idle.Refresh = set_combine(sets.idle, {head="Jumalik Helm",body="Jumalik Mail",legs="Stearc Subligar"})
    sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

    sets.idle.Pet = set_combine(sets.idle, {back=Pet_Regen_back})

    sets.idle.PetRegen = set_combine(sets.idle.Pet, {neck="Empath Necklace",feet=Pet_Regen_feet})

    sets.idle.Pet.Engaged = {ammo="Demonry Core",
        head=Pet_Melee_head,
        neck="Shulmanu Collar",ear1="Hija Earring",ear2="Domesticator's Earring",
        body=Pet_Melee_body,
        hands=Pet_Melee_hands,
        ring1="Thurandaut Ring +1",ring2="Varar Ring +1",
        back=Ready_Atk_back,
        waist="Incarnation Sash",
        legs=Pet_Melee_legs,
        feet=Pet_Melee_feet}

    sets.idle.Pet.Engaged.PetSBMNK = set_combine(sets.idle.Pet.Engaged, {
        ear1="Gelai Earring",
        body=Pet_SB_body,
        waist="Isa Belt"})

    sets.idle.Pet.Engaged.PetSBNonMNK = set_combine(sets.idle.Pet.Engaged, {
        ear1="Gelai Earring",
        body=Pet_SB_body,
        waist="Isa Belt"})

    sets.idle.Pet.Engaged.PetSTP = set_combine(sets.idle.Pet.Engaged, {
        ring2="Varar Ring +1"})

    sets.resting = {}

    ------------------
    -- DEFENSE SETS --
    ------------------

    -- Pet PDT and MDT sets:
    sets.defense.PetPDT = {
        ammo="Demonry Core",
        head="Anwig Salade",neck="Shepherd's Chain",
        ear1="Handler's Earring +1",ear2="Enmerkar Earring",
        body=Pet_PDT_body,
        hands=Pet_PDT_hands,
        ring1="Thurandaut Ring +1",ring2="Defending Ring",
        back=Pet_PDT_back,
        waist="Isa Belt",
        legs=Pet_PDT_legs,
        feet=Pet_PDT_feet}

    sets.defense.PetMDT = set_combine(sets.defense.PetPDT, {
        ear1="Rimeice Earring",ear2="Enmerkar Earring",
        body=Pet_MDT_Body,
        hands=Pet_MDT_hands,
        ring1="Thurandaut Ring +1",ring2="Defending Ring",
        legs=Pet_MDT_legs,
        feet=Pet_MDT_feet})

    -- Master PDT and MDT sets:
    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Jumalik Helm",neck="Loricate Torque +1",ear1="Impregnable Earring",ear2="Genmei Earring",
        body="Jumalik Mail",hands="Macabre Gauntlets +1",ring1="Warden's Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Meghanada Chausses +2",feet="Amm Greaves"}

    sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

    sets.defense.HybridPDT = {ammo="Sihirik",
        head="Jumalik Helm",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Enmerkar Earring",
        body="Jumalik Mail",hands=Pet_PDT_hands,ring1="Dark Ring",ring2="Defending Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs=Pet_PDT_legs,feet="Amm Greaves"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {ammo="Sihirik",
        head="Skormoth Mask",neck="Loricate Torque +1",ear1="Sanare Earring",ear2="Etiolation Earring",
        body="Jumalik Mail",hands="Leyline Gloves",
        back="Engulfer Cape +1",waist="Nierenschutz"})

    sets.defense.MDTShell = set_combine(sets.defense.MDT, {ammo="Vanir Battery",
        neck="Inquisitor Bead Necklace",ear2="Eabani Earring",
        ring1="Shadow Ring",
        waist="Asklepian Belt",legs="Sombra Tights +1",feet="Sombra Leggings +1"})

    sets.defense.MEva = set_combine(sets.defense.MDT, {ammo="Staunch Tathlum",
        head=MEva_head,
        neck="Warder's Charm +1",ear1="Hearty Earring",ear2="Eabani Earring",
        body=MEva_body,
        hands=MEva_hands,
        ring1="Vengeful Ring",ring2="Purity Ring",
        back=MEva_back,
        waist="Engraved Belt",
        legs=MEva_legs,
        feet=MEva_feet})

    sets.Kiting = {feet="Skadi's Jambeaux +1"}

    -------------------------------------------------------
    -- Single-wield Pet Only Mode Idle/Defense Axe Swaps --
    -------------------------------------------------------
    sets.IdleAxeShield = {main="Freydis",sub="Beatific Shield +1"}
    sets.PDTAxeShield = {main="Freydis",sub="Adapa Shield"}
    sets.MDTAxeShield = {main="Purgation",sub="Beatific Shield +1"}
    sets.MEvaAxeShield = {main=MEva_Axe_main,sub="Beatific Shield +1"}
    sets.PetPDTAxeShield = {main=Pet_PDT_AxeMain,sub="Beatific Shield +1"}
    sets.PetMDTAxeShield = {main=Pet_MDT_AxeMain,sub="Beatific Shield +1"}
    sets.PetTPAxeShield = {main=Pet_TP_AxeMain,sub="Beatific Shield +1"}
    sets.PetRegenAxeShield = {main=Pet_Regen_AxeMain,sub="Beatific Shield +1"}

    -----------------------------------------------------
    -- Dual-wield Pet Only Mode Idle/Defense Axe Swaps --
    -----------------------------------------------------
    sets.IdleAxes = {main="Freydis",sub="Habilitator +1"}
    sets.PDTAxes = {main="Freydis",sub="Habilitator +1"}
    sets.MDTAxes = {main="Purgation",sub="Habilitator +1"}
    sets.MEvaAxes = {main=MEva_Axe_main,sub=MEva_Axe_sub}
    sets.PetPDTAxes = {main=Pet_PDT_AxeMain,sub=Pet_PDT_AxeSub}
    sets.PetMDTAxes = {main=Pet_MDT_AxeMain,sub=Pet_MDT_AxeSub}
    sets.PetTPAxes = {main=Pet_TP_AxeMain,sub=Pet_TP_AxeSub}
    sets.PetRegenAxes = {main=Pet_Regen_AxeMain,sub=Pet_Regen_AxeSub}

    --------------------
    -- FAST CAST SETS --
    --------------------

    sets.precast.FC = {
        ammo="Sapience Orb",
        head=FC_head,
        neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
        body=FC_body,
        hands=FC_hands,
        ring1="Prolix Ring",ring2="Rahab Ring",
        back=FC_back,
        legs=FC_legs,
        feet=FC_feet}

    sets.precast.FCNE = set_combine(sets.precast.FC, {main="Shukuyu's Scythe",sub="Vivid Strap +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    ------------------
    -- MIDCAST SETS --
    ------------------

    sets.midcast.FastRecast = {
        ammo="Sapience Orb",
        head=FC_head,
        neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
        body=FC_body,
        hands=FC_hands,
        ring1="Prolix Ring",ring2="Rahab Ring",
        back=FC_back,
        legs=FC_legs,
        feet=FC_feet}

    sets.midcast.Cure = {ammo="Quartz Tathlum +1",
        head=Cure_Potency_head,
        neck="Phalaina Locket",ear1="Domesticator's Earring",ear2="Mendicant's Earring",
        body=Cure_Potency_body,
        hands=Cure_Potency_hands,
        ring1="Lebeche Ring",ring2="Asklepian Ring",
        back=Cure_Potency_back,
        waist="Gishdubar Sash",
        legs=Cure_Potency_legs,
        feet=Cure_Potency_feet}

    sets.midcast.Curaga = sets.midcast.Cure
    sets.CurePetOnly = {main=Cure_Potency_axe,sub="Matamata Shield +1"}

    sets.midcast.Stoneskin = {ammo="Quartz Tathlum +1",
        head="Jumalik Helm",neck="Stone Gorget",ear1="Earthcry Earring",ear2="Lifestorm Earring",
        body="Totemic Jackcoat +3",hands="Stone Mufflers",ring1="Leviathan Ring +1",ring2="Leviathan Ring +1",
        back=Pet_PDT_back,waist="Engraved Belt",legs="Haven Hose"}

    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {neck="Malison Medallion",
        ring1="Eshmun's Ring",ring2="Haoma's Ring",waist="Gishdubar Sash"})

    sets.midcast.Protect = {ring2="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {ring2="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell

    sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
        head=MAcc_head,neck="Sanctity Necklace",ear1="Hermetic Earring",ear2="Dignitary's Earring",
        body=MAcc_body,hands=MAcc_hands,ring1="Rahab Ring",ring2="Sangoma Ring",
        back=MAcc_back,waist="Eschan Stone",legs=MAcc_legs,feet=MAcc_feet}

    sets.midcast['Elemental Magic'] = {ammo="Pemphredo Tathlum",
        head=MAB_head,neck="Baetyl Pendant",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body=MAB_body,hands=MAB_hands,ring1="Acumen Ring",ring2="Fenrir Ring +1",
        back=MAcc_back,waist="Eschan Stone",legs=MAB_legs,feet=MAB_feet}

    sets.midcast.Flash = sets.Enmity

    --------------------------------------
    -- SINGLE-WIELD MASTER ENGAGED SETS --
    --------------------------------------

    sets.engaged = {ammo="Ginsen",
        head="Skormoth Mask",neck="Asperity Necklace",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Emicho Haubert +1",hands="Leyline Gloves",ring1="Hetairoi Ring",ring2="Epona's Ring",
        back=STR_DA_back,waist="Windbuffet Belt +1",legs="Meghanada Chausses +2",feet=Ready_Atk_feet}

    ------------------------------------
    -- DUAL-WIELD MASTER ENGAGED SETS --
    ------------------------------------

    sets.engaged.DW = {ammo="Paeapua",
        head=DW_head,neck="Asperity Necklace",ear1="Suppanomimi",ear2="Eabani Earring",
        body=DW_body,hands=DW_hands,ring1="Hetairoi Ring",ring2="Epona's Ring",
        back=DW_back,waist="Patentia Sash",legs=DW_legs,feet=DW_feet}

    sets.engaged.DW.Hybrid = {ammo="Demonry Core",
        head=Pet_PDT_head,neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Sherida Earring",
        body=Pet_PDT_body,hands=Pet_PDT_hands,ring1="Thurandaut Ring +1",ring2="Epona's Ring",
        back=DW_back,waist="Windbuffet Belt +1",legs="Meghanada Chausses +2",feet=DW_feet}

    --------------------
    -- MASTER WS SETS --
    --------------------

    sets.precast.WS['Primal Rend'] = {ammo="Pemphredo Tathlum",
        head=MAB_head,
        neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body=MAB_body,
        hands=MAB_hands,
        ring1="Acumen Ring",ring2="Fenrir Ring +1",
        back=Primal_back,
        waist="Eschan Stone",
        legs=MAB_legs,
        feet=MAB_feet}

    sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'], {back=Cloud_back})

    sets.midcast.ExtraMAB = {ear1="Hecate's Earring"}

    sets.precast.WS['Calamity'] = {ammo="Cheruski Needle",
        head="Lilitu Headpiece",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Nzingha Cuirass",hands="Totemic Gloves +3",ring1="Ifrit Ring +1",ring2="Epona's Ring",
        back=STR_WS_back,waist="Windbuffet Belt +1",legs="Meghanada Chausses +2",feet="Totemic Gaiters +3"}

    sets.precast.WS['Mistral Axe'] = {ammo="Cheruski Needle",
        head="Lilitu Headpiece",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Nzingha Cuirass",hands="Totemic Gloves +3",ring1="Ifrit Ring +1",ring2="Epona's Ring",
        back=STR_WS_back,waist="Windbuffet Belt +1",legs="Meghanada Chausses +2",feet="Totemic Gaiters +3"}

    sets.precast.WS['Ruinator'] = {ammo="Cheruski Needle",
        head="Lilitu Headpiece",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Nzingha Cuirass",hands="Totemic Gloves +3",ring1="Ifrit Ring +1",ring2="Epona's Ring",
        back=STR_DA_back,waist="Fotia Belt",legs="Meghanada Chausses +2",feet="Totemic Gaiters +3"}
    sets.precast.WS['Ruinator'].Gavialis = set_combine(sets.precast.WS['Ruinator'], {head="Gavialis Helm"})

    sets.precast.WS['Onslaught'] = {ammo="Cheruski Needle",
        head="Lilitu Headpiece",neck="Caro Necklace",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Nzingha Cuirass",hands="Totemic Gloves +3",ring1="Ilabrat Ring",ring2="Epona's Ring",
        back=Onslaught_back,waist="Windbuffet Belt +1",legs="Meghanada Chausses +2",feet="Totemic Gaiters +3"}

    ----------------
    -- OTHER SETS --
    ----------------

    --Precast Gear Sets for DNC subjob abilities:
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        ring1="Asklepian Ring",ring2="Valseur's Ring",
        back=Waltz_back}
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {ammo="Pemphredo Tathlum",
        head=MAcc_head,neck="Sanctity Necklace",ear1="Hermetic Earring",ear2="Dignitary's Earring",
        body=MAcc_body,hands=MAcc_hands,ring1="Rahab Ring",ring2="Sangoma Ring",
        back=MAcc_back,waist="Eschan Stone",legs=MAcc_legs,feet=MAcc_feet}

    --Misc Gear Sets
    sets.FrenzySallet = {head="Frenzy Sallet"}
    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}
    sets.buff['Killer Instinct'] = {body="Nukumi Gausape +1"}
    sets.THGear = {hands=TH_hands,legs=TH_legs,waist="Chaac Belt"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
-- Define class for Sic and Ready moves.
    if spell.type == "Monster" then
        classes.CustomClass = "WS"
 
        if state.LagMode.value == 'Lag' then
            if physical_ready_moves:contains(spell.name) then
                if state.AxeMode.value == 'PetOnly' then
                    if state.OffenseMode.value == 'MaxAcc' then
                        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                            equip(sets.midcast.Pet.ReadyDWNE.MaxAcc, sets.ReadyRecastDWNE)
                        else
                            equip(sets.midcast.Pet.ReadyNE.MaxAcc, sets.ReadyRecast)
                        end
                    elseif state.OffenseMode.value == 'HighAcc' then
                        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                            equip(sets.midcast.Pet.ReadyDWNE.HighAcc, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecastDWNE)
                        else
                            equip(sets.midcast.Pet.ReadyNE.HighAcc, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecast)
                        end
                    elseif state.OffenseMode.value == 'MedAcc' then
                        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                            equip(sets.midcast.Pet.ReadyDWNE.MedAcc, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecastDWNE)
                        else
                            equip(sets.midcast.Pet.ReadyNE.MedAcc, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecast)
                        end
                    else
                        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                            if multi_hit_ready_moves:contains(spell.name) then
                                if state.HybridMode.value == 'PetSB' and PetJob == 'Monk' then
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeDWNE, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowMNK, sets.ReadyRecastDWNE))
                                elseif state.HybridMode.value == 'PetSB' and PetJob ~= 'Monk' then
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeDWNE, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowNonMNK, sets.ReadyRecastDWNE))
                                else
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeDWNE, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecastDWNE))
                                end
                            else
                                equip(set_combine(sets.midcast.Pet.ReadyDWNE, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecastDWNE))
                            end
                        else
                            if multi_hit_ready_moves:contains(spell.name) then
                                if state.HybridMode.value == 'PetSB' and PetJob == 'Monk' then
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeNE, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowMNK, sets.ReadyRecast))
                                elseif state.HybridMode.value == 'PetSB' and PetJob ~= 'Monk' then
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeNE, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowNonMNK, sets.ReadyRecast))
                                else
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeNE, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecast))
                                end
                            else
                                equip(set_combine(sets.midcast.Pet.ReadyNE, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecast))
                            end
                        end
                    end
                else
                    if state.OffenseMode.value == 'MaxAcc' then
                        equip(sets.midcast.Pet.MaxAcc, sets.ReadyRecast)
                    elseif state.OffenseMode.value == 'HighAcc' then
                        equip(sets.midcast.Pet.HighAcc, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecast)
                    elseif state.OffenseMode.value == 'MedAcc' then
                        equip(sets.midcast.Pet.MedAcc, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecast)
                    else
                        if multi_hit_ready_moves:contains(spell.name) then
                            if state.HybridMode.value == 'PetSB' and PetJob == 'Monk' then
                                equip(set_combine(sets.midcast.Pet.MultiStrike, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowMNK, sets.ReadyRecast))
                            elseif state.HybridMode.value == 'PetSB' and PetJob ~= 'Monk' then
                                equip(set_combine(sets.midcast.Pet.MultiStrike, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowNonMNK, sets.ReadyRecast))
                            else
                                equip(set_combine(sets.midcast.Pet.MultiStrike, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecast))
                            end
                        else
                            equip(set_combine(sets.midcast.Pet.WS, sets.midcast.Pet[state.CorrelationMode.value], sets.ReadyRecast))
                        end
                    end
                end
            end

            if magic_atk_ready_moves:contains(spell.name) then
                if state.AxeMode.value == 'PetOnly' then
                    if state.OffenseMode.value == 'MaxAcc' then
                        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE.MaxAcc, sets.ReadyRecastDWNE)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyNE.MaxAcc, sets.ReadyRecast)
                        end
                    elseif state.OffenseMode.value == 'HighAcc' then
                        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE.HighAcc, sets.ReadyRecastDWNE)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyNE.HighAcc, sets.ReadyRecast)
                        end
                    elseif state.OffenseMode.value == 'MedAcc' then
                        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE.MedAcc, sets.ReadyRecastDWNE)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyNE.MedAcc, sets.ReadyRecast)
                        end
                    else
                        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE, sets.ReadyRecastDWNE)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyNE, sets.ReadyRecast)
                        end
                    end
                else
                    equip(sets.midcast.Pet.MagicAtkReady, sets.ReadyRecast)
                end
            end

            if magic_acc_ready_moves:contains(spell.name) then
                if state.AxeMode.value == 'PetOnly' then
                    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                        equip(sets.midcast.Pet.MagicAccReadyDWNE, sets.ReadyRecastDWNE)
                    else
                        equip(sets.midcast.Pet.MagicAccReadyNE, sets.ReadyRecast)
                    end
                else
                    equip(sets.midcast.Pet.MagicAccReady, sets.ReadyRecast)
                end
            end

            if pet_buff_moves:contains(spell.name) then
                if state.AxeMode.value == 'PetOnly' then
                    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                        equip(sets.midcast.Pet.BuffDWNE, sets.ReadyRecastDWNE)
                    else
                        equip(sets.midcast.Pet.BuffNE, sets.ReadyRecast)
                    end
                else
                    equip(sets.midcast.Pet.Buff, sets.ReadyRecast)
                end
            end

            -- If Pet TP, before bonuses, is less than a certain value then equip Nukumi Manoplas +1.
            if (physical_ready_moves:contains(spell.name) or magic_atk_ready_moves:contains(spell.name)) and state.OffenseMode.value ~= 'MaxAcc' then
                if tp_based_ready_moves:contains(spell.name) and PetJob == 'Warrior' then
                    if pet_tp < 1300 then
                        equip(sets.midcast.Pet.TPBonus)
                    end
                elseif tp_based_ready_moves:contains(spell.name) and PetJob ~= 'Warrior' then
                    if pet_tp < 1800 then
                        equip(sets.midcast.Pet.TPBonus)
                    end
                end
            end
        eventArgs.handled = true
        else
            if state.AxeMode.value == 'PetOnly' and not buffactive['Unleash']then
                if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                    equip(sets.ReadyRecastDWNE)
                else
                    equip(sets.ReadyRecastNE)
                end
            else
                equip(sets.ReadyRecast)
            end
        end
    end

    if spell.english == 'Reward' then
        if state.AxeMode.value == 'PetOnly' then
            if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                equip(sets.precast.JA.RewardNEDW)
            else
                equip(sets.precast.JA.RewardNE)
            end
        else
            equip(sets.precast.JA.Reward)
        end
    end

    if enmity_plus_moves:contains(spell.english) then
        if state.AxeMode.value == 'PetOnly' then
            if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                equip(sets.EnmityNEDW)
            else
                equip(sets.EnmityNE)
            end
        else
            equip(sets.Enmity)
        end
    end

    if spell.english == 'Spur' then
        if state.AxeMode.value == 'PetOnly' then
            if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                equip(sets.precast.JA.SpurNEDW)
            else
                equip(sets.precast.JA.SpurNE)
            end
        else
            equip(sets.precast.JA.Spur)
        end
    end

    if spell.english == 'Charm' then
        if state.AxeMode.value == 'PetOnly' then
            if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                equip(sets.precast.JA.CharmNEDW)
            else
                equip(sets.precast.JA.CharmNE)
            end
        else
            equip(sets.precast.JA.Charm)
        end
    end

    if spell.english == 'Bestial Loyalty' or spell.english == 'Call Beast' then
        JugInfo = ''
        if state.JugMode.value == 'FunguarFamiliar' or state.JugMode.value == 'Seedbed Soil' then
            JugInfo = 'Seedbed Soil'
        elseif state.JugMode.value == 'CourierCarrie' or state.JugMode.value == 'Fish Oil Broth' then
            JugInfo = 'Fish Oil Broth'
        elseif state.JugMode.value == 'AmigoSabotender' or state.JugMode.value == 'Sun Water' then
            JugInfo = 'Sun Water'
        elseif state.JugMode.value == 'NurseryNazuna' or state.JugMode.value == 'Dancing Herbal Broth' or state.JugMode.value == 'D. Herbal Broth' then
            JugInfo = 'D. Herbal Broth'
        elseif state.JugMode.value == 'CraftyClyvonne' or state.JugMode.value == 'Cunning Brain Broth' or state.JugMode.value == 'Cng. Brain Broth' then
            JugInfo = 'Cng. Brain Broth'
        elseif state.JugMode.value == 'PrestoJulio' or state.JugMode.value == 'Chirping Grasshopper Broth' or state.JugMode.value == 'C. Grass Broth' then
            JugInfo = 'C. Grass Broth'
        elseif state.JugMode.value == 'SwiftSieghard' or state.JugMode.value == 'Mellow Bird Broth' or state.JugMode.value == 'Mlw. Bird Broth' then
            JugInfo = 'Mlw. Bird Broth'
        elseif state.JugMode.value == 'MailbusterCetas' or state.JugMode.value == 'Goblin Bug Broth' or state.JugMode.value == 'Gob. Bug Broth' then
            JugInfo = 'Gob. Bug Broth'
        elseif state.JugMode.value == 'AudaciousAnna' or state.JugMode.value == 'Bubbling Carrion Broth' then
            JugInfo = 'B. Carrion Broth'
        elseif state.JugMode.value == 'TurbidToloi' or state.JugMode.value == 'Auroral Broth' then
            JugInfo = 'Auroral Broth'
        elseif state.JugMode.value == 'SlipperySilas' or state.JugMode.value == 'Wormy Broth' then
            JugInfo = 'Wormy Broth'
        elseif state.JugMode.value == 'LuckyLulush' or state.JugMode.value == 'Lucky Carrot Broth' or state.JugMode.value == 'L. Carrot Broth' then
            JugInfo = 'L. Carrot Broth'
        elseif state.JugMode.value == 'DipperYuly' or state.JugMode.value == 'Wool Grease' then
            JugInfo = 'Wool Grease'
        elseif state.JugMode.value == 'FlowerpotMerle' or state.JugMode.value == 'Vermihumus' then
            JugInfo = 'Vermihumus'
        elseif state.JugMode.value == 'DapperMac' or state.JugMode.value == 'Briny Broth' then
            JugInfo = 'Briny Broth'
        elseif state.JugMode.value == 'DiscreetLouise' or state.JugMode.value == 'Deepbed Soil' then
            JugInfo = 'Deepbed Soil'
        elseif state.JugMode.value == 'FatsoFargann' or state.JugMode.value == 'Curdled Plasma Broth' or state.JugMode.value == 'C. Plasma Broth' then
            JugInfo = 'C. Plasma Broth'
        elseif state.JugMode.value == 'FaithfulFalcorr' or state.JugMode.value == 'Lucky Broth' then
            JugInfo = 'Lucky Broth'
        elseif state.JugMode.value == 'BugeyedBroncha' or state.JugMode.value == 'Savage Mole Broth' or state.JugMode.value == 'Svg. Mole Broth' then
            JugInfo = 'Svg. Mole Broth'
        elseif state.JugMode.value == 'BloodclawShasra' or state.JugMode.value == 'Razor Brain Broth' or state.JugMode.value == 'Rzr. Brain Broth' then
            JugInfo = 'Rzr. Brain Broth'
        elseif state.JugMode.value == 'GorefangHobs' or state.JugMode.value == 'Burning Carrion Broth' then
            JugInfo = 'B. Carrion Broth'
        elseif state.JugMode.value == 'GooeyGerard' or state.JugMode.value == 'Cloudy Wheat Broth' or state.JugMode.value == 'Cl. Wheat Broth' then
            JugInfo = 'Cl. Wheat Broth'
        elseif state.JugMode.value == 'CrudeRaphie' or state.JugMode.value == 'Shadowy Broth' then
            JugInfo = 'Shadowy Broth'
        elseif state.JugMode.value == 'DroopyDortwin' or state.JugMode.value == 'Swirling Broth' then
            JugInfo = 'Swirling Broth'
        elseif state.JugMode.value == 'PonderingPeter' or state.JugMode.value == 'Viscous Broth' or state.JugMode.value == 'Vis. Broth' then
            JugInfo = 'Vis. Broth'
        elseif state.JugMode.value == 'SunburstMalfik' or state.JugMode.value == 'Shimmering Broth' then
            JugInfo = 'Shimmering Broth'
        elseif state.JugMode.value == 'AgedAngus' or state.JugMode.value == 'Fermented Broth' or state.JugMode.value == 'Ferm. Broth' then
            JugInfo = 'Ferm. Broth'
        elseif state.JugMode.value == 'WarlikePatrick' or state.JugMode.value == 'Livid Broth' then
            JugInfo = 'Livid Broth'
        elseif state.JugMode.value == 'ScissorlegXerin' or state.JugMode.value == 'Spicy Broth' then
            JugInfo = 'Spicy Broth'
        elseif state.JugMode.value == 'BouncingBertha' or state.JugMode.value == 'Bubbly Broth' then
            JugInfo = 'Bubbly Broth'
        elseif state.JugMode.value == 'RhymingShizuna' or state.JugMode.value == 'Lyrical Broth' then
            JugInfo = 'Lyrical Broth'
        elseif state.JugMode.value == 'AttentiveIbuki' or state.JugMode.value == 'Salubrious Broth' then
            JugInfo = 'Salubrious Broth'
        elseif state.JugMode.value == 'SwoopingZhivago' or state.JugMode.value == 'Windy Greens' then
            JugInfo = 'Windy Greens'
        elseif state.JugMode.value == 'AmiableRoche' or state.JugMode.value == 'Airy Broth' then
            JugInfo = 'Airy Broth'
        elseif state.JugMode.value == 'HeraldHenry' or state.JugMode.value == 'Translucent Broth' or state.JugMode.value == 'Trans. Broth' then
            JugInfo = 'Trans. Broth'
        elseif state.JugMode.value == 'BrainyWaluis' or state.JugMode.value == 'Crumbly Soil' then
            JugInfo = 'Crumbly Soil'
        elseif state.JugMode.value == 'HeadbreakerKen' or state.JugMode.value == 'Blackwater Broth' then
            JugInfo = 'Blackwater Broth'
        elseif state.JugMode.value == 'RedolentCandi' or state.JugMode.value == 'Electrified Broth' then
            JugInfo = 'Electrified Broth'
        elseif state.JugMode.value == 'AlluringHoney' or state.JugMode.value == 'Bug-Ridden Broth' then
            JugInfo = 'Bug-Ridden Broth'
        elseif state.JugMode.value == 'CaringKiyomaro' or state.JugMode.value == 'Fizzy Broth' then
            JugInfo = 'Fizzy Broth'
        elseif state.JugMode.value == 'VivaciousVickie' or state.JugMode.value == 'Tantalizing Broth' or state.JugMode.value == 'Tant. Broth' then
            JugInfo = 'Tant. Broth'
        elseif state.JugMode.value == 'HurlerPercival' or state.JugMode.value == 'Pale Sap' then
            JugInfo = 'Pale Sap'
        elseif state.JugMode.value == 'BlackbeardRandy' or state.JugMode.value == 'Meaty Broth' then
            JugInfo = 'Meaty Broth'
        elseif state.JugMode.value == 'GenerousArthur' or state.JugMode.value == 'Dire Broth' then
            JugInfo = 'Dire Broth'
        elseif state.JugMode.value == 'ThreestarLynn' or state.JugMode.value == 'Muddy Broth' then
            JugInfo = 'Muddy Broth'
        elseif state.JugMode.value == 'BraveHeroGlenn' or state.JugMode.value == 'Wispy Broth' then
            JugInfo = 'Wispy Broth'
        elseif state.JugMode.value == 'SharpwitHermes' or state.JugMode.value == 'Saline Broth' then
            JugInfo = 'Saline Broth'
        elseif state.JugMode.value == 'ColibriFamiliar' or state.JugMode.value == 'Sugary Broth' then
            JugInfo = 'Sugary Broth'
        elseif state.JugMode.value == 'ChoralLeera' or state.JugMode.value == 'Glazed Broth' then
            JugInfo = 'Glazed Broth'
        elseif state.JugMode.value == 'SpiderFamiliar' or state.JugMode.value == 'Sticky Webbing' then
            JugInfo = 'Sticky Webbing'
        elseif state.JugMode.value == 'GussyHachirobe' or state.JugMode.value == 'Slimy Webbing' then
            JugInfo = 'Slimy Webbing'
        elseif state.JugMode.value == 'AcuexFamiliar' or state.JugMode.value == 'Poisonous Broth' then
            JugInfo = 'Poisonous Broth'
        elseif state.JugMode.value == 'FluffyBredo' or state.JugMode.value == 'Venomous Broth' then
            JugInfo = 'Venomous Broth'
        elseif state.JugMode.value == 'SuspiciousAlice' or state.JugMode.value == 'Furious Broth' then
            JugInfo = 'Furious Broth'
        elseif state.JugMode.value == 'AnklebiterJedd' or state.JugMode.value == 'Crackling Broth' then
            JugInfo = 'Crackling Broth'
        elseif state.JugMode.value == 'FleetReinhard' or state.JugMode.value == 'Rapid Broth' then
            JugInfo = 'Rapid Broth'
        elseif state.JugMode.value == 'CursedAnnabelle' or state.JugMode.value == 'Creepy Broth' then
            JugInfo = 'Creepy Broth'
        elseif state.JugMode.value == 'SurgingStorm' or state.JugMode.value == 'Insipid Broth' then
            JugInfo = 'Insipid Broth'
        elseif state.JugMode.value == 'SubmergedIyo' or state.JugMode.value == 'Deepwater Broth' then
            JugInfo = 'Deepwater Broth'
        elseif state.JugMode.value == 'MosquitoFamiliar' or state.JugMode.value == 'Wetlands Broth' then
            JugInfo = 'Wetlands Broth'
        elseif state.JugMode.value == 'Left-HandedYoko' or state.JugMode.value == 'Heavenly Broth' then
            JugInfo = 'Heavenly Broth'
        end
        if spell.english == "Call Beast" and call_beast_cancel:contains(JugInfo) then
            add_to_chat(123, spell.name..' Canceled: [HQ Jug Pet]')
            return
        end
        equip({ammo=JugInfo})
    end

    if player.equipment.main == 'Aymur' then
        custom_aftermath_timers_precast(spell)
    end

    if spell.type == "WeaponSkill" and spell.name ~= 'Mistral Axe' and spell.name ~= 'Bora Axe' and spell.target.distance > target_distance then
        cancel_spell()
        add_to_chat(123, spell.name..' Canceled: [Out of Range]')
        handle_equipping_gear(player.status)
        return
    end

    if spell.type == 'CorsairRoll' or spell.english == "Double-Up" then
        equip(sets.precast.LuzafRing)
    end

    if spell.prefix == '/magic' or spell.prefix == '/ninjutsu' or spell.prefix == '/song' then
        if state.AxeMode.value == 'PetOnly' then
            equip(sets.precast.FCNE)
        else
            equip(sets.precast.FC)
        end
    end
end

function customize_melee_set(meleeSet)
    if state.AxeMode.value == 'PetOnly' and pet.status == "Engaged" and player.status == "Engaged" and state.DefenseMode.value == "None" then
        if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
            if state.HybridMode.value == 'PetSB' and PetJob == 'Monk' then
                meleeSet = set_combine(meleeSet, sets.PetTPAxes, sets.idle.Pet.Engaged.PetSBMNK)
            elseif state.HybridMode.value == 'PetSB' and PetJob ~= 'Monk' then
                meleeSet = set_combine(meleeSet, sets.PetTPAxes, sets.idle.Pet.Engaged.PetSBNonMNK)
            else
                meleeSet = set_combine(meleeSet, sets.PetTPAxes, sets.idle.Pet.Engaged)
            end
        else
            if state.HybridMode.value == 'PetSB' and PetJob == 'Monk' then
                meleeSet = set_combine(meleeSet, sets.PetTPAxeShield, sets.idle.Pet.Engaged.PetSBMNK)
            elseif state.HybridMode.value == 'PetSB' and PetJob ~= 'Monk' then
                meleeSet = set_combine(meleeSet, sets.PetTPAxeShield, sets.idle.Pet.Engaged.PetSBNonMNK)
            else
                meleeSet = set_combine(meleeSet, sets.PetTPAxeShield, sets.idle.Pet.Engaged)
            end
        end
    end
    return meleeSet
end

function job_post_precast(spell, action, spellMap, eventArgs)
-- If Killer Instinct is active during WS, equip Nukumi Gausape +1.
    if spell.type:lower() == 'weaponskill' and buffactive['Killer Instinct'] then
        equip(sets.buff['Killer Instinct'])
    end

    if spell.english == "Primal Rend" or spell.english == "Cloudsplitter" then
        if player.tp > 2750 then
            equip(sets.midcast.ExtraMAB)
        end
    end

-- Equip Chaac Belt for TH+1 on common Subjob Abilities or Spells.
    if abilities_to_check:contains(spell.english) and state.TreasureMode.value == 'Tag' then
        equip(sets.THGear)
    end
end

function job_midcast(spell, action, spellMap, eventArgs)
    if state.AxeMode.value == 'PetOnly' then
        if spell.english == "Cure" or spell.english == "Cure II" or spell.english == "Cure III" or spell.english == "Cure IV" then
            equip(sets.CurePetOnly)
        end
        if spell.english == "Curaga" or spell.english == "Curaga II" or spell.english == "Curaga III" then
            equip(sets.CurePetOnly)
        end
    end
end

-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, action, spellMap, eventArgs)
    if spell.type == "Monster" and not spell.interrupted then
        if physical_ready_moves:contains(spell.name) then
            if state.AxeMode.value == 'PetOnly' then
                if state.OffenseMode.value == 'MaxAcc' then
                    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.ReadyDWNE.TPBonus.MaxAcc)
                        else
                            equip(sets.midcast.Pet.ReadyDWNE.MaxAcc)
                        end
                    else
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.ReadyNE.TPBonus.MaxAcc)
                        else
                            equip(sets.midcast.Pet.ReadyNE.MaxAcc)
                        end
                    end
                elseif state.OffenseMode.value == 'HighAcc' then
                    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.ReadyDWNE.TPBonus.HighAcc, sets.midcast.Pet[state.CorrelationMode.value])
                        else
                            equip(sets.midcast.Pet.ReadyDWNE.HighAcc, sets.midcast.Pet[state.CorrelationMode.value])
                        end
                    else
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.ReadyNE.TPBonus.HighAcc, sets.midcast.Pet[state.CorrelationMode.value])
                        else
                            equip(sets.midcast.Pet.ReadyNE.HighAcc, sets.midcast.Pet[state.CorrelationMode.value])
                        end
                    end
                elseif state.OffenseMode.value == 'MedAcc' then
                    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.ReadyDWNE.TPBonus.MedAcc, sets.midcast.Pet[state.CorrelationMode.value])
                        else
                            equip(sets.midcast.Pet.ReadyDWNE.MedAcc, sets.midcast.Pet[state.CorrelationMode.value])
                        end
                    else
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.ReadyNE.TPBonus.MedAcc, sets.midcast.Pet[state.CorrelationMode.value])
                        else
                            equip(sets.midcast.Pet.ReadyNE.MedAcc, sets.midcast.Pet[state.CorrelationMode.value])
                        end
                    end
                else
                    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                        if multi_hit_ready_moves:contains(spell.name) then
                            if state.HybridMode.value == 'PetSB' and PetJob == 'Monk' then
                                if tp_based_ready_moves:contains(spell.name) then
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeDWNE.TPBonus, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowMNK))
                                else
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeDWNE, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowMNK))
                                end
                            elseif state.HybridMode.value == 'PetSB' and PetJob ~= 'Monk' then
                                if tp_based_ready_moves:contains(spell.name) then
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeDWNE.TPBonus, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowNonMNK))
                                else
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeDWNE, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowNonMNK))
                                end
                            else
                                if tp_based_ready_moves:contains(spell.name) then
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeDWNE.TPBonus, sets.midcast.Pet[state.CorrelationMode.value]))
                                else
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeDWNE, sets.midcast.Pet[state.CorrelationMode.value]))
                                end
                            end
                        else
                            if tp_based_ready_moves:contains(spell.name) then
                                equip(set_combine(sets.midcast.Pet.ReadyDWNE.TPBonus, sets.midcast.Pet[state.CorrelationMode.value]))
                            else
                                equip(set_combine(sets.midcast.Pet.ReadyDWNE, sets.midcast.Pet[state.CorrelationMode.value]))
                            end
                        end
                    else
                        if multi_hit_ready_moves:contains(spell.name) then
                            if state.HybridMode.value == 'PetSB' and PetJob == 'Monk' then
                                if tp_based_ready_moves:contains(spell.name) then
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeNE.TPBonus, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowMNK))
                                else
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeNE, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowMNK))
                                end
                            elseif state.HybridMode.value == 'PetSB' and PetJob ~= 'Monk' then
                                if tp_based_ready_moves:contains(spell.name) then
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeNE.TPBonus, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowNonMNK))
                                else
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeNE, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowNonMNK))
                                end
                            else
                                if tp_based_ready_moves:contains(spell.name) then
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeNE.TPBonus, sets.midcast.Pet[state.CorrelationMode.value]))
                                else
                                    equip(set_combine(sets.midcast.Pet.MultiStrikeNE, sets.midcast.Pet[state.CorrelationMode.value]))
                                end
                            end
                        else
                            if tp_based_ready_moves:contains(spell.name) then
                                equip(set_combine(sets.midcast.Pet.ReadyNE.TPBonus, sets.midcast.Pet[state.CorrelationMode.value]))
                            else
                                equip(set_combine(sets.midcast.Pet.ReadyNE, sets.midcast.Pet[state.CorrelationMode.value]))
                            end
                        end
                    end
                end
            else
                if state.OffenseMode.value == 'MaxAcc' then
                    equip(sets.midcast.Pet.MaxAcc)
                elseif state.OffenseMode.value == 'HighAcc' then
                    equip(sets.midcast.Pet.HighAcc, sets.midcast.Pet[state.CorrelationMode.value])
                elseif state.OffenseMode.value == 'MedAcc' then
                    equip(sets.midcast.Pet.MedAcc, sets.midcast.Pet[state.CorrelationMode.value])
                else
                    if multi_hit_ready_moves:contains(spell.name) then
                        if state.HybridMode.value == 'PetSB' and PetJob == 'Monk' then
                            equip(set_combine(sets.midcast.Pet.MultiStrike, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowMNK))
                        elseif state.HybridMode.value == 'PetSB' and PetJob ~= 'Monk' then
                            equip(set_combine(sets.midcast.Pet.MultiStrike, sets.midcast.Pet[state.CorrelationMode.value], sets.midcast.Pet.SubtleBlowNonMNK))
                        else
                            equip(set_combine(sets.midcast.Pet.MultiStrike, sets.midcast.Pet[state.CorrelationMode.value]))
                        end
                    else
                        equip(set_combine(sets.midcast.Pet.WS, sets.midcast.Pet[state.CorrelationMode.value]))
                    end
                end
            end
        end

        if magic_atk_ready_moves:contains(spell.name) then
            if state.AxeMode.value == 'PetOnly' then
                if state.OffenseMode.value == 'MaxAcc' then
                    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE.TPBonus.MaxAcc)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE.MaxAcc)
                        end
                    else
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.MagicAtkReadyNE.TPBonus.MaxAcc)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyNE.MaxAcc)
                        end
                    end
                elseif state.OffenseMode.value == 'HighAcc' then
                    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE.TPBonus.HighAcc)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE.HighAcc)
                        end
                    else
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.MagicAtkReadyNE.TPBonus.HighAcc)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyNE.HighAcc)
                        end
                    end
                elseif state.OffenseMode.value == 'MedAcc' then
                    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE.TPBonus.MedAcc)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE.MedAcc)
                        end
                    else
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.MagicAtkReadyNE.TPBonus.MedAcc)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyNE.MedAcc)
                        end
                    end
                else
                    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE.TPBonus)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyDWNE)
                        end
                    else
                        if tp_based_ready_moves:contains(spell.name) then
                            equip(sets.midcast.Pet.MagicAtkReadyNE.TPBonus)
                        else
                            equip(sets.midcast.Pet.MagicAtkReadyNE)
                        end
                    end
                end
            else
                equip(sets.midcast.Pet.MagicAtkReady)
            end
        end

        if magic_acc_ready_moves:contains(spell.name) then
            if state.AxeMode.value == 'PetOnly' then
                if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                    equip(sets.midcast.Pet.MagicAccReadyDWNE)
                else
                    equip(sets.midcast.Pet.MagicAccReadyNE)
                end
            else
                equip(sets.midcast.Pet.MagicAccReady)
            end
        end

        if pet_buff_moves:contains(spell.name) then
            if state.AxeMode.value == 'PetOnly' then
                if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                    equip(sets.midcast.Pet.BuffDWNE)
                else
                    equip(sets.midcast.Pet.BuffNE)
                end
            else
                equip(sets.midcast.Pet.Buff)
            end
        end

        -- If Pet TP, before bonuses, is less than a certain value then equip Nukumi Manoplas +1.
        -- Or if Pet TP, before bonuses, is more than a certain value then equip Unleash-specific Axes.
        if (physical_ready_moves:contains(spell.name) or magic_atk_ready_moves:contains(spell.name)) and state.OffenseMode.value ~= 'MaxAcc' then
            if tp_based_ready_moves:contains(spell.name) and PetJob == 'Warrior' then
                if pet_tp < 1300 then
                    equip(sets.midcast.Pet.TPBonus)
                elseif pet_tp > 2000 and state.AxeMode.value == 'PetOnly' then
                    if physical_ready_moves:contains(spell.name) then
                        if state.OffenseMode.value == 'HighAcc' then
                            equip(sets.UnleashAtkAxes.HighAcc)
                        elseif state.OffenseMode.value == 'MedAcc' then
                            equip(sets.UnleashAtkAxes.MedAcc)
                        else
                            equip(sets.UnleashAtkAxes)
                        end
                    else
                        if state.OffenseMode.value == 'HighAcc' then
                            equip(sets.UnleashMABAxes.HighAcc)
                        elseif state.OffenseMode.value == 'MedAcc' then
                            equip(sets.UnleashMABAxes.MedAcc)
                        else
                            equip(sets.UnleashMABAxes)
                        end
                    end
                end
            elseif tp_based_ready_moves:contains(spell.name) and PetJob ~= 'Warrior' then
                if pet_tp < 1800 then
                    equip(sets.midcast.Pet.TPBonus)
                elseif pet_tp > 2500 and state.AxeMode.value == 'PetOnly' then
                    if physical_ready_moves:contains(spell.name) then
                        if state.OffenseMode.value == 'HighAcc' then
                            equip(sets.UnleashAtkAxes.HighAcc)
                        elseif state.OffenseMode.value == 'MedAcc' then
                            equip(sets.UnleashAtkAxes.MedAcc)
                        else
                            equip(sets.UnleashAtkAxes)
                        end
                    else
                        if state.OffenseMode.value == 'HighAcc' then
                            equip(sets.UnleashMABAxes.HighAcc)
                        elseif state.OffenseMode.value == 'MedAcc' then
                            equip(sets.UnleashMABAxes.MedAcc)
                        else
                            equip(sets.UnleashMABAxes)
                        end
                    end
                end
            end
        end
    eventArgs.handled = true
    end

    -- Create custom timers for Pet Buffs.
    if pet_buff_moves:contains(spell.name) and DisplayPetBuffTimers == 'true' then
        if not spell.interrupted then
            pet_buff_timer(spell)
        end
    end

    if spell.english == 'Fight' or spell.english == 'Bestial Loyalty' or spell.english == 'Call Beast' then
        if not spell.interrupted then
            pet_info_update()
        end
    end

    if spell.english == "Leave" and not spell.interrupted then
        clear_pet_buff_timers()
        PetName = 'None';PetJob = 'None';PetInfo = 'None';ReadyMoveOne = 'None';ReadyMoveTwo = 'None';ReadyMoveThree = 'None'
    end

    if player.equipment.main == 'Aymur' then
        custom_aftermath_timers_aftercast(spell)
    end

    if player.status ~= 'Idle' and state.AxeMode.value == 'PetOnly' and spell.type ~= "Monster" then
        pet_only_equip_handling()
    end
end

function job_pet_midcast(spell, action, spellMap, eventArgs)

end

function job_pet_aftercast(spell, action, spellMap, eventArgs)
    if pet_buff_moves:contains(spell.name) and DisplayPetBuffTimers == 'true' then
        -- Pet TP calculations for Ready Buff Durations
        local TP_Amount = 1000
        if pet_tp < 1000 then TP_Amount = TP_Amount + TP_Gift_Bonus;end
        if pet_tp > 1000 then TP_Amount = pet_tp + TP_Gift_Bonus;end
        if player.equipment.hands == "Ferine Manoplas +1" then TP_Amount = TP_Amount + 250;end
        if player.equipment.hands == "Ferine Manoplas +2" then TP_Amount = TP_Amount + 500;end
        if player.equipment.hands == "Nukumi Manoplas" then TP_Amount = TP_Amount + 550;end
        if player.equipment.hands == "Nukumi Manoplas +1" then TP_Amount = TP_Amount + 600;end
        if player.equipment.main == "Aymur" or player.equipment.sub == "Aymur" then TP_Amount = TP_Amount + 500;end
        if player.equipment.main == "Kumbhakarna" then TP_Amount = TP_Amount + TP_Bonus_Main;end
        if player.equipment.sub == "Kumbhakarna" then TP_Amount = TP_Amount + TP_Bonus_Sub;end
        if TP_Amount > 3000 then TP_Amount = 3000;end

        if spell.english == 'Bubble Curtain' then
            local TP_Buff_Duration = math.floor((TP_Amount - 1000)* 0.09) + BubbleCurtainDuration
            send_command('timers c "'..spell.english..'" '..TP_Buff_Duration..' down '..BubbleCurtainIcon..'')
        elseif spell.english == 'Scissor Guard' then
            local TP_Buff_Duration = math.floor(TP_Amount * 0.06)
            send_command('timers c "'..spell.english..'" '..TP_Buff_Duration..' down '..ScissorGuardIcon..'')
        elseif spell.english == 'Secretion' then
            TP_Amount = TP_Amount + 500
            if TP_Amount > 3000 then TP_Amount = 3000;end
            local TP_Buff_Duration = math.floor(TP_Amount * 0.18)
            send_command('timers c "Secretion" '..TP_Buff_Duration..' down '..SecretionIcon..'')
        elseif spell.english == 'Rage' then
            TP_Amount = TP_Amount + 500
            if TP_Amount > 3000 then TP_Amount = 3000;end
            local TP_Buff_Duration = math.floor(TP_Amount * 0.18)
            send_command('timers c "'..spell.english..'" '..TP_Buff_Duration..' down '..RageIcon..'')
        elseif spell.english == 'Rhino Guard' then
            local TP_Buff_Duration = math.floor(TP_Amount * 0.18)
            send_command('timers c "Rhino Guard" '..TP_Buff_Duration..' down '..RhinoGuardIcon..'')
        elseif spell.english == 'Zealous Snort' then
            local TP_Buff_Duration = math.floor(TP_Amount * 0.06)
            send_command('timers c "'..spell.english..'" '..TP_Buff_Duration..' down '..ZealousSnortIcon..'')
        end
    end
    pet_only_equip_handling()
end

-------------------------------------------------------------------------------------------------------------------
-- Customization hook for idle sets.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
    if state.AxeMode.value == 'PetOnly' then
        if pet.status == "Engaged" then
            if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                if state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PetPDT" then
                    idleSet = set_combine(idleSet, sets.PetPDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "PetMDT" then
                    idleSet = set_combine(idleSet, sets.PetMDTAxes)
                elseif state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PDT" then
                    idleSet = set_combine(idleSet, sets.PDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MDTShell" then
                    idleSet = set_combine(idleSet, sets.MDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MEva" then
                    idleSet = set_combine(idleSet, sets.MEvaAxes)
                else
                    if state.HybridMode.value == 'PetSB' and PetJob == 'Monk' then
                        idleSet = set_combine(idleSet, sets.PetTPAxes, sets.idle.Pet.Engaged.PetSBMNK)
                    elseif state.HybridMode.value == 'PetSB' and PetJob ~= 'Monk' then
                        idleSet = set_combine(idleSet, sets.PetTPAxes, sets.idle.Pet.Engaged.PetSBNonMNK)
                    elseif state.HybridMode.value == 'PetSTP' then
                        idleSet = set_combine(idleSet, sets.PetTPAxes, sets.idle.Pet.Engaged.PetSTP)
                    else
                        idleSet = set_combine(idleSet, sets.PetTPAxes)
                    end
                end
            else
                if state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PetPDT" then
                    idleSet = set_combine(idleSet, sets.PetPDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "PetMDT" then
                    idleSet = set_combine(idleSet, sets.PetMDTAxeShield)
                elseif state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PDT" then
                    idleSet = set_combine(idleSet, sets.PDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MDTShell" then
                    idleSet = set_combine(idleSet, sets.MDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MEva" then
                    idleSet = set_combine(idleSet, sets.MEvaAxeShield)
                else
                    if state.HybridMode.value == 'PetSB' and PetJob == 'Monk' then
                        idleSet = set_combine(idleSet, sets.PetTPAxeShield, sets.idle.Pet.Engaged.PetSBMNK)
                    elseif state.HybridMode.value == 'PetSB' and PetJob ~= 'Monk' then
                        idleSet = set_combine(idleSet, sets.PetTPAxeShield, sets.idle.Pet.Engaged.PetSBNonMNK)
                    elseif state.HybridMode.value == 'PetSTP' then
                        idleSet = set_combine(idleSet, sets.PetTPAxeShield, sets.idle.Pet.Engaged.PetSTP)
                    else
                        idleSet = set_combine(idleSet, sets.PetTPAxeShield)
                    end
                end
            end
        end
        if pet.status ~= "Engaged" then
            if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                if state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PetPDT" then
                    idleSet = set_combine(idleSet, sets.PetPDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "PetMDT" then
                    idleSet = set_combine(idleSet, sets.PetMDTAxes)
                elseif state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PDT" then
                    idleSet = set_combine(idleSet, sets.PDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MDTShell" then
                    idleSet = set_combine(idleSet, sets.MDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MEva" then
                    idleSet = set_combine(idleSet, sets.MEvaAxes)
                elseif state.IdleMode.value == "PetRegen" then
                    idleSet = set_combine(idleSet, sets.PetRegenAxes)
                else
                    idleSet = set_combine(idleSet, sets.IdleAxes)
                end
            else
                if state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PetPDT" then
                    idleSet = set_combine(idleSet, sets.PetPDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "PetMDT" then
                    idleSet = set_combine(idleSet, sets.PetMDTAxeShield)
                elseif state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PDT" then
                    idleSet = set_combine(idleSet, sets.PDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MDTShell" then
                    idleSet = set_combine(idleSet, sets.MDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MEva" then
                    idleSet = set_combine(idleSet, sets.MEvaAxeShield)
                elseif state.IdleMode.value == "PetRegen" then
                    idleSet = set_combine(idleSet, sets.PetRegenAxeShield)
                else
                    idleSet = set_combine(idleSet, sets.IdleAxeShield)
                end
            end
        end
    end
    return idleSet
end

-------------------------------------------------------------------------------------------------------------------
-- Hooks for Reward, Correlation, Treasure Hunter, and Pet Mode handling.
-------------------------------------------------------------------------------------------------------------------

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Correlation Mode' then
        state.CorrelationMode:set(newValue)
    elseif stateField == 'Treasure Mode' then
        state.TreasureMode:set(newValue)
    elseif stateField == 'Pet Mode' then
        state.CombatWeapon:set(newValue)
    end
end

function get_custom_wsmode(spell, spellMap, default_wsmode)
    if default_wsmode == 'Normal' then
        if spell.english == "Ruinator" and (world.day_element == 'Water' or world.day_element == 'Wind' or world.day_element == 'Ice') then
            return 'Gavialis'
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Equipping a Capacity Points Mantle locks it until it is manually unequipped.
    if player.equipment.back == 'Mecisto. Mantle' or player.equipment.back == 'Aptitude Mantle' or player.equipment.back == 'Aptitude Mantle +1' then
        disable('back')
    else
        enable('back')
    end
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    get_combat_form()
    get_melee_groups()
    pet_info_update()
    update_display_mode_info()
    pet_only_equip_handling()
end

-- Updates gear based on pet status changes.
function job_pet_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == 'Idle' or newStatus == 'Engaged' then
        if state.DefenseMode.value ~= "Physical" and state.DefenseMode.value ~= "Magical" then
            handle_equipping_gear(player.status)
        end
    end

    if pet.hpp == 0 then
        clear_pet_buff_timers()
        PetName = 'None';PetJob = 'None';PetInfo = 'None';ReadyMoveOne = 'None';ReadyMoveTwo = 'None';ReadyMoveThree = 'None'
    end

    customize_melee_set(meleeSet)
    pet_info_update()
end 

function job_buff_change(status, gain, gain_or_loss)
    --Equip Frenzy Sallet if we're asleep and engaged.
    if (status == "sleep" and gain_or_loss) and player.status == 'Engaged' then
        if gain then
            equip(sets.FrenzySallet)
        else
            handle_equipping_gear(player.status)
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Ready Move Presets and Pet TP Evaluation Functions - Credit to Bomberto and Verda
-------------------------------------------------------------------------------------------------------------------

pet_tp=0
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'ready' then
        ready_move(cmdParams)
        eventArgs.handled = true
    end
    if cmdParams[1]:lower() == 'gearhandle' then
        pet_only_equip_handling()
    end
    if cmdParams[1] == 'pet_tp' then
	    pet_tp = tonumber(cmdParams[2])
    end
    if cmdParams[1]:lower() == 'charges' then
        charges = 3
        ready = windower.ffxi.get_ability_recasts()[102]
	    if ready ~= 0 then
	        charges = math.floor(((30 - ready) / 10))
	    end
	    add_to_chat(28,'Ready Recast:'..ready..'   Charges Remaining:'..charges..'')
    end
end
 
function ready_move(cmdParams)
    local move = cmdParams[2]:lower()
    local ReadyMove = ''
    if move == 'one' then
        ReadyMove = ReadyMoveOne
    elseif move == 'two' then
        ReadyMove = ReadyMoveTwo
    else
        ReadyMove = ReadyMoveThree
    end
    send_command('input /pet "'.. ReadyMove ..'" <me>')
end

pet_tp = 0
--Fix missing Pet.TP field by getting the packets from the fields lib
packets = require('packets')
function update_pet_tp(id,data)
    if id == 0x068 then
        pet_tp = 0
        local update = packets.parse('incoming', data)
        pet_tp = update["Pet TP"]
        windower.send_command('lua c gearswap c pet_tp '..pet_tp)
    end
end
id = windower.raw_register_event('incoming chunk', update_pet_tp)

-------------------------------------------------------------------------------------------------------------------
-- Current Job State Display
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end

    msg = msg .. ', Corr.: '..state.CorrelationMode.value

    if state.JugMode.value ~= 'None' then
        add_to_chat(8,'-- Jug Pet: '.. PetName ..' -- (Pet Info: '.. PetInfo ..', '.. PetJob ..')')
    end

    add_to_chat(28,'Ready Moves: 1.'.. ReadyMoveOne ..'  2.'.. ReadyMoveTwo ..'  3.'.. ReadyMoveThree ..'')
    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function pet_info_update()
    if pet.isvalid then
        PetName = pet.name

        if pet.name == 'DroopyDortwin' or pet.name == 'PonderingPeter' or pet.name == 'HareFamiliar' or pet.name == 'KeenearedSteffi' or pet.name == 'LuckyLulush' then
            PetInfo = "Rabbit, Beast";PetJob = 'Warrior';ReadyMoveOne = 'Foot Kick';ReadyMoveTwo = 'Whirl Claws';ReadyMoveThree = 'Wild Carrot'
        elseif pet.name == 'SunburstMalfik' or pet.name == 'AgedAngus' or pet.name == 'HeraldHenry' or pet.name == 'CrabFamiliar' or pet.name == 'CourierCarrie' then
            PetInfo = "Crab, Aquan";PetJob = 'Paladin';ReadyMoveOne = 'Big Scissors';ReadyMoveTwo = 'Scissor Guard';ReadyMoveThree = 'Bubble Curtain'
        elseif pet.name == 'WarlikePatrick' or pet.name == 'LizardFamiliar' or pet.name == 'ColdbloodedComo' or pet.name == 'AudaciousAnna' then
            PetInfo = "Lizard, Lizard";PetJob = 'Warrior';ReadyMoveOne = 'Tail Blow';ReadyMoveTwo = 'Brain Crush';ReadyMoveThree = 'Fireball'
        elseif pet.name == 'ScissorlegXerin' or pet.name == 'BouncingBertha' then
            PetInfo = "Chapuli, Vermin";PetJob = 'Warrior';ReadyMoveOne = 'Sensilla Blades';ReadyMoveTwo = 'Tegmina Buffet';ReadyMoveThree = 'Tegmina Buffet'
        elseif pet.name == 'RhymingShizuna' or pet.name == 'SheepFamiliar' or pet.name == 'LullabyMelodia' or pet.name == 'NurseryNazuna' then
            PetInfo = "Sheep, Beast";PetJob = 'Warrior';ReadyMoveOne = 'Lamb Chop';ReadyMoveTwo = 'Rage';ReadyMoveThree = 'Sheep Song'
        elseif pet.name == 'AttentiveIbuki' or pet.name == 'SwoopingZhivago' then
            PetInfo = "Tulfaire, Bird";PetJob = 'Warrior';ReadyMoveOne = 'Swooping Frenzy';ReadyMoveTwo = 'Pentapeck';ReadyMoveThree = 'Molting Plumage'
        elseif pet.name == 'AmiableRoche' or pet.name == 'TurbidToloi' then
            PetInfo = "Pugil, Aquan";PetJob = 'Warrior';ReadyMoveOne = 'Recoil Dive';ReadyMoveTwo = 'Water Wall';ReadyMoveThree = 'Intimidate'
        elseif pet.name == 'BrainyWaluis' or pet.name == 'FunguarFamiliar' or pet.name == 'DiscreetLouise' then
            PetInfo = "Funguar, Plantoid";PetJob = 'Warrior';ReadyMoveOne = 'Frogkick';ReadyMoveTwo = 'Spore';ReadyMoveThree = 'Silence Gas'              
        elseif pet.name == 'HeadbreakerKen' or pet.name == 'MayflyFamiliar' or pet.name == 'ShellbusterOrob' or pet.name == 'MailbusterCetas' then
            PetInfo = "Fly, Vermin";PetJob = 'Warrior';ReadyMoveOne = 'Somersault';ReadyMoveTwo = 'Cursed Sphere';ReadyMoveThree = 'Venom'               
        elseif pet.name == 'RedolentCandi' or pet.name == 'AlluringHoney' then
            PetInfo = "Snapweed, Plantoid";PetJob = 'Warrior';ReadyMoveOne = 'Tickling Tendrils';ReadyMoveTwo = 'Stink Bomb';ReadyMoveThree = 'Nectarous Deluge'
        elseif pet.name == 'CaringKiyomaro' or pet.name == 'VivaciousVickie' then
            PetInfo = "Raaz, Beast";PetJob = 'Monk';ReadyMoveOne = 'Sweeping Gouge';ReadyMoveTwo = 'Zealous Snort';ReadyMoveThree = 'Zealous Snort'
        elseif pet.name == 'HurlerPercival' or pet.name == 'BeetleFamiliar' or pet.name == 'PanzerGalahad' then
            PetInfo = "Beetle, Vermin";PetJob = 'Paladin';ReadyMoveOne = 'Power Attack';ReadyMoveTwo = 'Rhino Attack';ReadyMoveThree = 'Hi-Freq Field'
        elseif pet.name == 'BlackbeardRandy' or pet.name == 'TigerFamiliar' or pet.name == 'SaberSiravarde' or pet.name == 'GorefangHobs' then
            PetInfo = "Tiger, Beast";PetJob = 'Warrior';ReadyMoveOne = 'Razor Fang';ReadyMoveTwo = 'Claw Cyclone';ReadyMoveThree = 'Roar'
        elseif pet.name == 'ColibriFamiliar' or pet.name == 'ChoralLeera' then
            PetInfo = "Colibri, Bird";PetJob = 'Red Mage';ReadyMoveOne = 'Pecking Flurry';ReadyMoveTwo = 'Pecking Flurry';ReadyMoveThree = 'Pecking Flurry'
        elseif pet.name == 'SpiderFamiliar' or pet.name == 'GussyHachirobe' then
            PetInfo = "Spider, Vermin";PetJob = 'Warrior';ReadyMoveOne = 'Sickle Slash';ReadyMoveTwo = 'Acid Spray';ReadyMoveThree = 'Spider Web'
        elseif pet.name == 'GenerousArthur' or pet.name == 'GooeyGerard' then
            PetInfo = "Slug, Amorph";PetJob = 'Warrior';ReadyMoveOne = 'Purulent Ooze';ReadyMoveTwo = 'Corrosive Ooze';ReadyMoveThree = 'Corrosive Ooze'
        elseif pet.name == 'ThreestarLynn' or pet.name == 'DipperYuly' then
            PetInfo = "Ladybug, Vermin";PetJob = 'Thief';ReadyMoveOne = 'Spiral Spin';ReadyMoveTwo = 'Sudden Lunge';ReadyMoveThree = 'Noisome Powder'
        elseif pet.name == 'SharpwitHermes' or pet.name == 'FlowerpotBill' or pet.name == 'FlowerpotBen' or pet.name == 'Homunculus' or pet.name == 'FlowerpotMerle' then
            PetInfo = "Mandragora, Plantoid";PetJob = 'Monk';ReadyMoveOne = 'Head Butt';ReadyMoveTwo = 'Leaf Dagger';ReadyMoveThree = 'Wild Oats'
        elseif pet.name == 'AcuexFamiliar' or pet.name == 'FluffyBredo' then
            PetInfo = "Acuex, Amorph";PetJob = 'Black Mage';ReadyMoveOne = 'Foul Waters';ReadyMoveTwo = 'Pestilent Plume';ReadyMoveThree = 'Pestilent Plume'
        elseif pet.name == 'FlytrapFamiliar' or pet.name == 'VoraciousAudrey' or pet.name == 'PrestoJulio' then
            PetInfo = "Flytrap, Plantoid";PetJob = 'Warrior';ReadyMoveOne = 'Soporific';ReadyMoveTwo = 'Palsy Pollen';ReadyMoveThree = 'Gloeosuccus'
        elseif pet.name == 'EftFamiliar' or pet.name == 'AmbusherAllie' or pet.name == 'BugeyedBroncha' or pet.name == 'SuspiciousAlice' then
            PetInfo = "Eft, Lizard";PetJob = 'Warrior';ReadyMoveOne = 'Nimble Snap';ReadyMoveTwo = 'Cyclotail';ReadyMoveThree = 'Geist Wall'
        elseif pet.name == 'AntlionFamiliar' or pet.name == 'ChopsueyChucky' or pet.name == 'CursedAnnabelle' then
            PetInfo = "Antlion, Vermin";PetJob = 'Warrior';ReadyMoveOne = 'Mandibular Bite';ReadyMoveTwo = 'Venom Spray';ReadyMoveThree = 'Sandblast'
        elseif pet.name == 'MiteFamiliar' or pet.name == 'LifedrinkerLars' or pet.name == 'AnklebiterJedd' then
            PetInfo = "Diremite, Vermin";PetJob = 'Dark Knight';ReadyMoveOne = 'Double Claw';ReadyMoveTwo = 'Spinning Top';ReadyMoveThree = 'Filamented Hold'
        elseif pet.name == 'AmigoSabotender' then
            PetInfo = "Cactuar, Plantoid";PetJob = 'Warrior';ReadyMoveOne = 'Needle Shot';ReadyMoveTwo = '??? Needles';ReadyMoveThree = '??? Needles'
        elseif pet.name == 'CraftyClyvonne' or pet.name == 'BloodclawShashra' then
            PetInfo = "Lynx, Beast";PetJob = 'Warrior';ReadyMoveOne = 'Blaster';ReadyMoveTwo = 'Chaotic Eye';ReadyMoveThree = 'Charged Whisker'
        elseif pet.name == 'SwiftSieghard' or pet.name == 'FleetReinhard' then
            PetInfo = "Raptor, Lizard";PetJob = 'Warrior';ReadyMoveOne = 'Scythe Tail';ReadyMoveTwo = 'Ripper Fang';ReadyMoveThree = 'Chomp Rush'
        elseif pet.name == 'DapperMac' or pet.name == 'SurgingStorm' or pet.name == 'SubmergedIyo' then
            PetInfo = "Apkallu, Bird";PetJob = 'Monk';ReadyMoveOne = 'Beak Lunge';ReadyMoveTwo = 'Wing Slap';ReadyMoveThree = 'Wing Slap'
        elseif pet.name == 'FatsoFargann' then
            PetInfo = "Leech, Amorph";PetJob = 'Warrior';ReadyMoveOne = 'Suction';ReadyMoveTwo = 'Acid Mist';ReadyMoveThree = 'Drain Kiss'
        elseif pet.name == 'FaithfulFalcorr' then
            PetInfo = "Hippogryph, Bird";PetJob = 'Thief';ReadyMoveOne = 'Back Heel';ReadyMoveTwo = 'Choke Breath';ReadyMoveThree = 'Fantod'
        elseif pet.name == 'CrudeRaphie' then
            PetInfo = "Adamantoise, Lizard";PetJob = 'Paladin';ReadyMoveOne = 'Tortoise Stomp';ReadyMoveTwo = 'Harden Shell';ReadyMoveThree = 'Aqua Breath'
        elseif pet.name == 'MosquitoFamilia' or pet.name == 'Left-HandedYoko' then
            PetInfo = "Mosquito, Vermin";PetJob = 'Dark Knight';ReadyMoveOne = 'Infected Leech';ReadyMoveTwo = 'Gloom Spray';ReadyMoveThree = 'Gloom Spray'
        end
    else
        PetName = 'None';PetJob = 'None';PetInfo = 'None';ReadyMoveOne = 'None';ReadyMoveTwo = 'None';ReadyMoveThree = 'None'
    end
end

function pet_only_equip_handling()
    if player.status == 'Engaged' and state.AxeMode.value == 'PetOnly' then
        if pet.status == "Engaged" then
            if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                if state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PetPDT" then
                    equip(sets.PetPDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "PetMDT" then
                    equip(sets.PetMDTAxes)
                elseif state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PDT" then
                    equip(sets.PDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MDTShell" then
                    equip(sets.MDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MEva" then
                    equip(sets.MEvaAxes)
                else
                    equip(sets.PetTPAxes)
                end
            else
                if state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PetPDT" then
                    equip(sets.PetPDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "PetMDT" then
                    equip(sets.PetMDTAxeShield)
                elseif state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PDT" then
                    equip(sets.PDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MDTShell" then
                    equip(sets.MDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MEva" then
                    equip(sets.MEvaAxeShield)
                else
                    equip(sets.PetTPAxeShield)
                end
            end
        end
        if pet.status ~= "Engaged" then
            if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
                if state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PetPDT" then
                    equip(sets.PetPDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "PetMDT" then
                    equip(sets.PetMDTAxes)
                elseif state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PDT" then
                    equip(sets.PDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MDTShell" then
                    equip(sets.MDTAxes)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MEva" then
                    equip(sets.MEvaAxes)
                elseif state.IdleMode.value == "PetRegen" then
                    equip(sets.PetRegenAxes)
                else
                    equip(sets.IdleAxes)
                end
            else
                if state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PetPDT" then
                    equip(sets.PetPDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "PetMDT" then
                    equip(sets.PetMDTAxeShield)
                elseif state.DefenseMode.value == "Physical" and state.PhysicalDefenseMode.value == "PDT" then
                    equip(sets.PDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MDTShell" then
                    equip(sets.MDTAxeShield)
                elseif state.DefenseMode.value == "Magical" and state.MagicalDefenseMode.value == "MEva" then
                    equip(sets.MEvaAxeShield)
                elseif state.IdleMode.value == "PetRegen" then
                    equip(sets.PetRegenAxeShield)
                else
                    equip(sets.IdleAxeShield)
                end
            end
        end
    end

    handle_equipping_gear(player.status)
end

function pet_buff_timer(spell)
    if spell.english == 'Reward' then
        send_command('timers c "Pet: Regen" 180 down '..RewardRegenIcon..'')
    elseif spell.english == 'Spur' then
        send_command('timers c "Pet: Spur" 90 down '..SpurIcon..'')
    elseif spell.english == 'Run Wild' then
        send_command('timers c "'..spell.english..'" '..RunWildDuration..' down '..RunWildIcon..'')
    end
end

function clear_pet_buff_timers()
    send_command('timers c "Pet: Regen" 0 down '..RewardRegenIcon..'')
    send_command('timers c "Pet: Spur" 0 down '..SpurIcon..'')
    send_command('timers c "Run Wild" 0 down '..RunWildIcon..'')
end

function display_mode_info()
    if DisplayModeInfo == 'true' and DisplayTrue == 1 then
        local x = TextBoxX
        local y = TextBoxY
        send_command('text AccuracyText create Acc. Mode: '..state.OffenseMode.value..'')
        send_command('text AccuracyText pos '..x..' '..y..'')
        send_command('text AccuracyText size '..TextSize..'')
        y = y + (TextSize + 6)
        send_command('text CorrelationText create Corr. Mode: '..state.CorrelationMode.value..'')
        send_command('text CorrelationText pos '..x..' '..y..'')
        send_command('text CorrelationText size '..TextSize..'')
        y = y + (TextSize + 6)
        send_command('text AxeModeText create Axe Mode: '..state.AxeMode.value..'')
        send_command('text AxeModeText pos '..x..' '..y..'')
        send_command('text AxeModeText size '..TextSize..'')
        y = y + (TextSize + 6)
        send_command('text JugPetText create Jug Mode: '..state.JugMode.value..'')
        send_command('text JugPetText pos '..x..' '..y..'')
        send_command('text JugPetText size '..TextSize..'')
        DisplayTrue = DisplayTrue - 1
    end
end

function update_display_mode_info()
    if DisplayModeInfo == 'true' then
        send_command('text AccuracyText text Acc. Mode: '..state.OffenseMode.value..'')
        send_command('text CorrelationText text Corr. Mode: '..state.CorrelationMode.value..'')
        send_command('text AxeModeText text Axe Mode: '..state.AxeMode.value..'')
        send_command('text JugPetText text Jug Mode: '..state.JugMode.value..'')
    end
end

function get_melee_groups()
    classes.CustomMeleeGroups:clear()

    if buffactive['Aftermath: Lv.3'] then
        classes.CustomMeleeGroups:append('Aftermath')
    end
end

function get_combat_form()
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        state.CombatForm:set('DW')
    else
        state.CombatForm:reset()
    end
end