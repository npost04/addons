
gear.MDTaeonChapeau = { name="Taeon Chapeau", augments={'"Mag.Atk.Bns."+20','STR+1 DEX+1',}}

gear.FCTaeonGloves = { name="Taeon Gloves", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Fast Cast"+5','STR+1 AGI+1',}}
gear.FCTaeonBoots = { name="Taeon Boots", augments={'"Mag.Atk.Bns."+19','"Fast Cast"+5','DEX+5',}}

gear.TPTaeonChapeau ={ name="Taeon Chapeau", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 AGI+7',}}
gear.TPTaeonGloves = { name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','STR+7 DEX+7',}}
gear.TPTaeonBoots = { name="Taeon Boots", augments={'Accuracy+16 Attack+16','"Triple Atk."+2','DEX+3',}}

gear.RATaeonBoots = { name="Taeon Boots", augments={'Rng.Acc.+16 Rng.Atk.+16','"Snapshot"+3','"Snapshot"+4',}}


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

sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
sets.precast.JA['Snake Eye'] = {legs="Lanun Culottes"}
sets.precast.JA['Wild Card'] = {feet="Lanun Bottes"}
sets.precast.JA['Random Deal'] = {body="Lanun Frac"}


sets.precast.CorsairRoll = {head="Lanun Tricorne",hands="Chasseur's Gants",back="Gunslinger's cape", ring1="Barataria ring"}

sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2", ring1="Barataria ring"})
sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chasseur's Bottes", ring1="Barataria ring"})
sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chasseur's Tricorne", ring1="Barataria ring"})
sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1", ring1="Barataria ring"})
sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants", ring1="Barataria ring"})

sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
sets.precast.DoubleUp = {head="Lanun Tricorne",hands="Chasseur's Gants",back="Gunslinger's cape", ring1="Barataria ring"}
sets.precast.CorsairShot = {head="Blood Mask", body="Mirke wardecors", ammo="Animikii bullet"}


-- Waltz set (chr and vit)
sets.precast.Waltz = {
head="Whirlpool Mask",
body="Taeon tabard",
hands="Taeon gloves",
legs="Nahtirah Trousers",
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
ring2="Weatherspoon ring",
waist="Pya'ekue belt",
legs="Blood cuisses",
feet=gear.FCTaeonBoots}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Orunmila's torque"})


sets.precast.RA = {
ammo=gear.RAbullet,
head="Chasseur's Tricorne",
body="Skopos jerkin",
hands="Iuitl wristbands +1",
back="Navarch's Mantle",
waist="Impulse Belt",
legs="Nahtirah trousers",
feet=gear.RATaeonBoots}

       
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
head="Whirlpool Mask",
neck="Fotia gorget",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Khepri jacket",
hands=gear.TPTaeonGloves,
ring1="Rajas Ring",
ring2="Epona's Ring",
back="Atheling Mantle",
waist="Fotia Belt",
legs="Taeon tights",
feet=gear.TPTaeonBoots}

 
-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Evisceration'] = sets.precast.WS

sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {legs="Nahtirah Trousers"})

sets.precast.WS['Last Stand'] = {
ammo=gear.WSbullet,
head="Umbani cap",
neck="Fotia Gorget",
ear1="Clearview Earring",
ear2="Moonshade Earring",
body="Khepri jacket",
hands="Iuitl Wristbands +1",
ring1="Rajas Ring",
ring2="Stormsoul Ring",
back="Gunslinger's cape",
waist="Fotia Belt",
legs="Nahtirah trousers",
feet=""}

sets.precast.WS['Last Stand'].Acc = {
ammo=gear.WSbullet,
head="Umbani cap",
neck="Fotia Gorget",
ear1="Clearview Earring",
ear2="Moonshade Earring",
body="Khepri jacket",
hands="Buremte Gloves",
ring1="Hajduk Ring",
ring2="Stormsoul Ring",
back="Gunslinger's cape",
waist="Fotia belt",
legs="Nahtirah trousers",
feet="Scopuli nails +1"}


sets.precast.WS['Wildfire'] = {
ammo=gear.MAbullet,
head=gear.MDTaeonChapeau,
neck="Stoicheion Medal",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Samnuha coat",
hands="Leyline Gloves",
ring1="Stormsoul Ring",
ring2="Stormsoul Ring",
back="Toro Cape",
waist="Fotia belt",
legs="Iuitl Tights",
feet=gear.FCTaeonBoots}

sets.precast.WS['Wildfire'].Brew = {
ammo=gear.MAbullet,
head=gear.MDTaeonChapeau,
neck="Stoicheion Medal",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Stormsoul Ring",
ring2="Acumen ring",
back="Toro Cape",
waist="Fotia belt",
legs="Iuitl Tights",
feet=gear.FCTaeonBoots}

sets.precast.WS['Leaden Salute'] = {
ammo=gear.MAbullet,
head="Pixie hairpin +1",
neck="Stoicheion Medal",
ear1="Friomisi Earring",
ear2="Moonshade Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Archon Ring",
ring2="Arvina Ringlet +1",
back="Gunslinger's Cape",
waist="Fotia belt",
legs="Iuitl Tights",
feet=gear.FCTaeonBoots}


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
waist="Pya'ekue belt",
legs="Blood cuisses",
feet=gear.FCTaeonBoots}

-- Specific spells
sets.midcast.Utsusemi = sets.midcast.FastRecast

sets.midcast.CorsairShot = {
ammo="Animikii bullet",
head="Blood Mask",
neck="Stoicheion Medal",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Mirke wardecors",
hands="Leyline gloves",
ring1="Acumen Ring",
ring2="Arvina Ringlet +1",
back="Gunslinger's Cape",
waist="Aquiline belt",
legs="Iuitl Tights",
feet=gear.FCTaeonBoots}

sets.midcast.CorsairShot.Acc = {
ammo="Animikii bullet",
head="Blood mask",
neck="Waylayer's scarf +1",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Mirke wardecors",
hands="Leyline gloves",
ring1="Weatherspoon Ring",
ring2="Sangoma Ring",
back="Gunslinger's cape",
waist="Aquiline Belt",
legs="Iuitl Tights",
feet="Chasseur's bottes"}

sets.midcast.CorsairShot.Empy = {
ammo="Animikii bullet",
head="Chasseur's tricorne",
neck="Stoicheion medal",
ear1="Friomisi earring",
ear2="Hecate's Earring",
body="Chasseur's frac +1",
hands="Chasseur's gants",
ring1="Acumen Ring",
ring2="Arvina ringlet +1",
back="Gunslinger's cape",
waist="Aquiline Belt",
legs="Iuitl Tights",
feet="Chasseur's bottes"}


sets.midcast.CorsairShot['Light Shot'] = {
ammo="Animikii bullet",
head="Laksamana's Hat",
neck="Waylayer's scarf +1",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Samnuha coat",
hands="Leyline gloves",
ring1="Weatherspoon Ring",
ring2="Sangoma Ring",
back="Gunslinger's cape",
waist="Aquiline Belt",
legs="Iuitl Tights",
feet="Chasseur's bottes"}

sets.midcast.CorsairShot['Dark Shot'] = sets.midcast.CorsairShot['Light Shot']


-- Ranged gear
sets.midcast.RA = {
ammo=gear.RAbullet,
head="Chasseur's Tricorne",
neck="Ocachi Gorget",
ear1="Clearview Earring",
ear2="Volley Earring",
body="Chasseur's Frac +1",
hands="Alruna's gloves +1",
ring1="Rajas Ring",
ring2="Hajduk Ring",
back="Libeccio Mantle",
waist="Elanid belt",
legs="Nahtirah Trousers",
feet=gear.RATaeonBoots}

sets.midcast.RA.Acc = {
ammo=gear.RAbullet,
head="Chasseur's tricorne",
neck="Iqabi necklace",
ear1="Clearview Earring",
ear2="Volley Earring",
body="Chasseur's Frac +1",
hands="Floral Gauntlets",
ring1="Hajduk Ring",
ring2="Paqichikaji Ring",
back="Gunslinger's cape",
waist="Elanid Belt",
legs="Samnuha tights",
feet=gear.RATaeonBoots}


-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}


-- Idle sets
sets.idle = {ammo=empty,
head="Oce. Headpiece +1",neck="Wiglen Gorget",ear1="Clearview Earring",ear2="Dawn Earring",
body="Khepri jacket",hands="Garden bangles",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Repulse Mantle",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Skadi's Jambeaux +1"}

sets.idle.Refresh = {ammo=empty,
head="Wivre hairpin",neck="Wiglen Gorget",ear1="Clearview Earring",ear2="Volley Earring",
body="Mekosu. Harness",hands="Garden bangles",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Repulse mantle",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Skadi's Jambeaux +1"}

sets.idle.RefreshPDT = {ammo=empty,
head="Wivre hairpin",neck="Twilight Torque",ear1="Clearview Earring",ear2="Volley Earring",
body="Mekosu. harness",hands="Umuthi gloves",ring1="Defending Ring",ring2="Dark ring",
back="Repulse Mantle",waist="Flume Belt +1",legs="Iuitl tights",feet="Skadi's jambeaux +1"}

sets.idle.PDT = {
head="Iuitl headgear +1",neck="Twilight Torque",ear1="Clearview Earring",ear2="Volley Earring",
body="Emet harness +1",hands="Umuthi gloves",ring1="Defending Ring",ring2="Dark ring",
back="Repulse Mantle",waist="Flume Belt +1",legs="Iuitl tights",feet="Skadi's jambeaux +1"}



-- Defense sets
sets.defense.PDT = {
head="Iuitl headgear +1",neck="Twilight Torque",ear1="Clearview Earring",ear2="Volley Earring",
body="Emet harness +1",hands="Umuthi gloves",ring1="Defending Ring",ring2="Dark ring",
back="Repulse Mantle",waist="Flume Belt +1",legs="Iuitl tights",feet="Iuitl Gaiters +1"}

sets.defense.MDT = {
head="Whirlpool Mask",neck="Twilight Torque",ear1="Clearview Earring",ear2="Volley Earring",
body="Iuitl Vest",hands="Iuitl Wristbands +1",ring1="Defending Ring",ring2="Shadow Ring",
back="Mubvum. Mantle",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}


sets.Kiting = {feet="Skadi's Jambeaux +1"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Normal melee group
sets.engaged.Melee = {ammo=empty,
head="Iuitl headgear +1",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Thaumas coat",hands="Buremte gloves",ring1="Epona's Ring",ring2="Oneiros Ring",
back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Taeon tights",feet=gear.TPTaeonBoots}

sets.engaged.Acc = {ammo=empty,
head=gear.TPTaeonChapeau,neck="Iqabi Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Mekosu. harness",hands=gear.TPTaeonGloves,ring1="Enlivened Ring",ring2="Mars's Ring",
back="Letalis mantle",waist="Anguinus belt",legs="Taeon tights",feet=gear.TPTaeonBoots}

sets.engaged.DW = {ammo=empty,
head=gear.TPTaeonChapeau,
neck="Asperity Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Skadi's cuirie +1",
hands=gear.TPTaeonGloves,
ring1="Epona's Ring",
ring2="Oneiros Ring",
back="Letalis Mantle",
waist="Windbuffet belt +1",
legs="Taeon tights",
feet=gear.TPTaeonBoots}

sets.engaged.DWFullBuff = {
head=gear.TPTaeonChapeau,
neck="Asperity Necklace",
ear1="Steelflash Earring",
ear2="Bladeborn Earring",
body="Thaumas coat",
hands="Herculean gloves",
ring1="Epona's Ring",
ring2="Oneiros Ring",
back="Letalis Mantle",
waist="Windbuffet belt +1",
legs="Samnuha tights",
feet=gear.TPTaeonBoots}


sets.engaged.DWAcc = {ammo=empty,
head=gear.TPTaeonChapeau,
neck="Iqabi Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Samnuha coat",
hands="Floral gauntlets",
ring1="Enlivened Ring",
ring2="Oneiros Ring",
back="Letalis mantle",
waist="Anguinus belt",
legs="Taeon tights",
feet=gear.TPTaeonBoots}


sets.engaged.Ranged = {ammo=empty,
head="Whirlpool Mask",neck="Twilight Torque",ear1="Clearview Earring",ear2="Volley Earring",
body="Lanun frac",hands="Iuitl Wristbands +1",ring1="Defending Ring",ring2="Dark Ring",
back="Repulse Mantle",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Iuitl Gaiters +1"}