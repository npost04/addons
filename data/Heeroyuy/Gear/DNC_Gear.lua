-- Start defining the sets
--------------------------------------


gear.MDTaeonChapeau = { name="Taeon Chapeau", augments={'"Mag.Atk.Bns."+20','STR+1 DEX+1',}}

gear.FCTaeonGloves = { name="Taeon Gloves", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+5','STR+1 AGI+1',}}
gear.FCTaeonBoots = { name="Taeon Boots", augments={'"Mag.Atk.Bns."+19','"Fast Cast"+5','DEX+5',}}

gear.TPTaeonChapeau ={ name="Taeon Chapeau", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 AGI+7',}}
gear.TPTaeonGloves = { name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','STR+7 DEX+7',}}
gear.TPTaeonBoots = { name="Taeon Boots", augments={'Accuracy+16 Attack+16','"Triple Atk."+2','DEX+3',}}



-- Precast Sets
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

-- Precast sets to enhance JAs

sets.precast.JA['No Foot Rise'] = {body="Horos Casaque"}

sets.precast.JA['Trance'] = {head="Horos Tiara"}

-- Waltz set (chr and vit)

sets.precast.Waltz = {ammo="Sonia's Plectrum",
head="Horos Tiara",ear1="Roundel Earring",
body="Maxixi Casaque",hands="Buremte Gloves",ring1="Asklepian Ring",
back="Toetapper Mantle",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Maxixi Toe Shoes"}

-- Don't need any special gear for Healing Waltz.

sets.precast.Waltz['Healing Waltz'] = {}

sets.precast.Samba = {head="Dancer's Tiara"}

sets.precast.Jig = {legs="Etoile Tights", feet="Dancer's Toe Shoes"}

sets.precast.Step = {hands="Dancer's bangles", waist="Chaac Belt", feet="Etoile toe shoes"}

sets.precast.Step['Feather Step'] = {feet="Charis Shoes +2"}

sets.precast.Flourish1 = {}

sets.precast.Flourish1['Violent Flourish'] = {
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Etoile Casaque",
hands="Buremte Gloves",
ring2="Sangoma Ring",
waist="Chaac Belt",
legs="Iuitl Tights",
feet="Iuitl Gaiters +1"} -- magic accuracy

sets.precast.Flourish1['Desperate Flourish'] = {
ammo="Charis Feather",
head="Whirlpool Mask",
neck="Ej Necklace",
body="Horos Casaque",
hands="Buremte Gloves",
ring1="Beeline Ring",
back="Toetapper Mantle",
waist="Hurch'lan Sash",
legs="Kaabnax Trousers",
feet="Iuitl Gaiters +1"} -- acc gear

sets.precast.Flourish2 = {}

sets.precast.Flourish2['Reverse Flourish'] = {hands="Charis Bangles +2"}

sets.precast.Flourish3 = {}

sets.precast.Flourish3['Striking Flourish'] = {body="Charis Casaque +2"}

sets.precast.Flourish3['Climactic Flourish'] = {head="Charis Tiara +2"}

-- Fast cast sets for spells

sets.precast.FC = {
head="Haruspex Hat +1",
neck="Orunmila's torque",
ear1="Enchanter earring +1",
ear2="Loquacious Earring",
hands="Thaumas Gloves",
ring1="Prolix Ring"}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Orunmila's torque"})

-- Weaponskill sets

-- Default set for any weaponskill that isn't any more specifically defined

sets.precast.WS = {
ammo="Thew bomblet",
head="Whirlpool Mask",
neck="Fotia Gorget",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Khepri jacket",
hands="Buremte Gloves",
ring1="Rajas Ring",
ring2="Epona's Ring",
back="Letalis Mantle",
waist="Fotia Belt",
legs="Manibozho Brais",
feet="Iuitl Gaiters +1"}

sets.precast.WS.Acc = set_combine(sets.precast.WS, {
ammo="Honed Tathlum",
back="Toetapper Mantle"})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
neck="Houyi's Gorget",
hands="Iuitl Wristbands",
ring1="Stormsoul Ring",
waist="Caudata Belt",
legs="Nahtirah Trousers"})

sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {
ammo="Honed Tathlum",
back="Toetapper Mantle"})

sets.precast.WS['Exenterator'].Fodder = set_combine(sets.precast.WS['Exenterator'], {waist="Fotia Belt"})

sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {hands="Iuitl Wristbands"})

sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {hands="Iuitl Wristbands"})

sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Charis Feather",head="Uk'uxkaj Cap",neck="Rancor Collar"})

sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Honed Tathlum", back="Toetapper Mantle"})

sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {ammo="Charis Feather",ear1="Brutal Earring",ear2="Moonshade Earring"})

sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Honed Tathlum", back="Toetapper Mantle"})

sets.precast.WS['Aeolian Edge'] = {ammo="Charis Feather",
head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
back="Toro Cape",waist="Chaac Belt",legs="Shneddick Tights +1",feet="Wayfarer Clogs"}

sets.precast.Skillchain = {hands="Charis Bangles +2"}

-- Midcast Sets

sets.midcast.FastRecast = {
head="Haruspex hat",ear2="Loquacious Earring",
body="Iuitl Vest",hands="Thaumas gloves",
legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

-- Specific spells
sets.midcast.Utsusemi = {
head="Haruspex hat",
neck="Ej Necklace",
ear2="Loquacious Earring",
body="Iuitl Vest",
hands="Iuitl Wristbands",
ring1="Beeline Ring",
back="Toetapper Mantle",
legs="Kaabnax Trousers",
feet="Iuitl Gaiters +1"}

-- Sets to return to when not performing an action.
-- Resting sets
sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
ring1="Sheltered Ring",ring2="Paguroidea Ring"}
sets.ExtraRegen = {head="Ocelomeh Headpiece +1"}

-- Idle sets
sets.idle = {ammo="Iron Gobbet",
head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Khepri jacket",hands="Garden bangles",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Repulse mantle",waist="Flume Belt",legs="Kaabnax	trousers",feet="Skadi's Jambeaux +1"}

sets.idle.Town = {main="Izhiikoh", sub="Sabebus",ammo="Charis Feather",
head="Whirlpool Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Skadi's Jambeaux +1"}

sets.idle.Weak = {ammo="Iron Gobbet",
head="Felistris Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Skadi's Jambeaux +1"}

-- Defense sets
sets.defense.Evasion = {
head="Felistris Mask",neck="Ej Necklace",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2=gear.DarkRing.physical,
back="Toetapper Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

sets.defense.PDT = {ammo="Iron Gobbet",
head="Iuitl headgear +1",neck="Twilight Torque",
body="Iuitl vest",hands="Umuthi gloves",ring1="Defending Ring",ring2="Dark ring",
back="Repulse Mantle",waist="Flume Belt",legs="Iuitl tights",feet="Qaaxo leggings"}

sets.defense.MDT = {ammo="Demonry Stone",
head="Wayfarer Circlet",neck="Twilight Torque",
body="Qaaxo Harness",hands="Wayfarer Cuffs",ring1="Defending Ring",ring2="Shadow Ring",
back="Engulfer Cape",waist="Flume Belt",legs="Wayfarer Slops",feet="Wayfarer Clogs"}

sets.Kiting = {feet="Skadi's Jambeaux +1"}

-- Engaged sets
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group

sets.engaged ={
    
    ammo="Jukukik Feather",
    head={ name="Taeon Chapeau", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 AGI+7',}},
    body="Thaumas Coat",
    hands={ name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','STR+7 DEX+7',}},
    legs={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}},
    feet={ name="Taeon Boots", augments={'Accuracy+16 Attack+16','"Triple Atk."+2','DEX+3',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Epona's Ring",
    right_ring="Oneiros Ring",
    back="Toetapper mantle"
}

sets.engaged.Fodder = {ammo="Charis Feather",
head="Iuitl headgear +1",neck="Asperity necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Thaumas coat",hands="Buremte gloves",ring1="Epona's Ring",ring2="Oneiros Ring",
back="Atheling Mantle",waist="Windbuffet belt",legs="Kaabnax trousers",feet="Manibozho boots"}

sets.engaged.Fodder.Evasion = {ammo="Charis Feather",
head="Felistris Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
back="Atheling Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Horos Toe Shoes"}

sets.engaged.Acc = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Iqabi Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Charis Casaque +2",hands="Buremte gloves",ring1="Mars's Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Anguinus belt",legs="Manibozho brais",feet="Qaaxo Leggings"}

sets.engaged.Evasion = {ammo="Charis Feather",
head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

sets.engaged.PDT = {ammo="Charis Feather",
head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
back="Shadow Mantle",waist="Patentia Sash",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}

sets.engaged.Acc.Evasion = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

sets.engaged.Acc.PDT = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

-- Custom melee group: High Haste (2x March or Haste)

sets.engaged.HighHaste = sets.engaged


sets.engaged.Fodder.HighHaste = {ammo="Charis Feather",
head="Felistris Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Charis Casaque +2",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
back="Atheling Mantle",waist="Patentia Sash",legs=gear.AugQuiahuiz,feet="Horos Toe Shoes"}

sets.engaged.Fodder.Evasion.HighHaste = {ammo="Charis Feather",
head="Felistris Mask",neck="Charis Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

sets.engaged.Acc.HighHaste = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

sets.engaged.Evasion.HighHaste = {ammo="Charis Feather",
head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

sets.engaged.Acc.Evasion.HighHaste = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

sets.engaged.PDT.HighHaste = {ammo="Charis Feather",
head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
back="Shadow Mantle",waist="Patentia Sash",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}

sets.engaged.Acc.PDT.HighHaste = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

-- Custom melee group: Max Haste (2x March + Haste)

sets.engaged.MaxHaste ={
head=gear.TPTaeonChapeau,
neck="Asperity Necklace",
ear1="Steelflash Earring",
ear2="Bladeborn Earring",
body="Thaumas coat",
hands="Floral gauntlets",
ring1="Epona's Ring",
ring2="Oneiros Ring",
back="Letalis Mantle",
waist="Windbuffet belt +1",
legs="Samnuha tights",
feet=gear.TPTaeonBoots}


-- Getting Marches+Haste from Trust NPCs, doesn't cap delay.

sets.engaged.Fodder.MaxHaste = sets.enagged


sets.engaged.Fodder.Evasion.MaxHaste = {ammo="Charis Feather",
head="Felistris Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Maxixi Bangles",ring1="Rajas Ring",ring2="Epona's Ring",
back="Atheling Mantle",waist="Patentia Sash",legs="Kaabnax Trousers",feet="Manibozho Boots"}

sets.engaged.Acc.MaxHaste = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Rajas Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

sets.engaged.Evasion.MaxHaste = {ammo="Charis Feather",
head="Felistris Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Windbuffet Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

sets.engaged.Acc.Evasion.MaxHaste = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Beeline Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Kaabnax Trousers",feet="Qaaxo Leggings"}

sets.engaged.PDT.MaxHaste = {ammo="Charis Feather",
head="Felistris Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Qaaxo Harness",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
back="Shadow Mantle",waist="Windbuffet Belt",legs="Qaaxo Tights",feet="Iuitl Gaiters +1"}

sets.engaged.Acc.PDT.MaxHaste = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Iuitl Vest",hands="Iuitl Wristbands",ring1="Patricius Ring",ring2="Epona's Ring",
back="Toetapper Mantle",waist="Hurch'lan Sash",legs="Qaaxo Tights",feet="Qaaxo Leggings"}

-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.

sets.buff['Saber Dance'] = {legs="Horos Tights"}

sets.buff['Climactic Flourish'] = {head="Charis Tiara +2"}
