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
-- Fast cast sets for spells
sets.precast.FC = {ammo="Incantor Stone",
head="Nahtirah hat",neck="Orison Locket",ear2="Loquacious Earring",
body="Vanir Cotehardie",hands="Gendewitha Gages",ring1="Prolix Ring",
back="Swith Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Chelona Boots"}

sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Orison Pantaloons +2"})

sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {main="Tamaxchi",sub="Sors Shield",ammo="Incantor stone",back="Pahtli cape",feet="Cure Clogs"})

sets.precast.FC.Curaga = sets.precast.FC.Cure

-- Precast sets to enhance JAs
sets.precast.JA.Benediction = {body="Piety Briault"}

-- Waltz set (chr and vit)
sets.precast.Waltz = {
head="Nahtirah Hat",ear1="Roundel Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",
back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


-- Weaponskill sets

-- Default set for any weaponskill that isn't any more specifically defined
gear.default.weaponskill_neck = "Asperity Necklace"
gear.default.weaponskill_waist = ""
sets.precast.WS = {
head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
back="Refraction Cape",waist=gear.ElementalBelt,legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

sets.precast.WS['Flash Nova'] = {
head="Nahtirah Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Strendu Ring",
back="Toro Cape",waist="Thunder Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


-- Midcast Sets

sets.midcast.FastRecast = {
head="Natirah Hat",ear2="Loquacious Earring",
body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Prolix Ring",
back="Swith Cape",waist="Goading Belt",legs="Orvail pants +1",feet="Gendewitha Galoshes"}

-- Cure sets
gear.default.obi_waist = "Goading Belt"
gear.default.obi_back = "Mending Cape"

sets.midcast.CureSolace = {main="Tamaxchi",sub="Sors Shield",ammo="Incantor Stone",
head="Gendewitha Caubeen",neck="Healing torque",ear1="Beatific Earring",ear2="Roundel earring",
body="Orison Bliaud +2",hands="Healer's mitts",ring1="Ephedra Ring",ring2="Sirona's Ring",
back="Tempered Cape +1",waist="Bishop's sash",legs="Orison Pantaloons +2",feet="Gende. Galoshes"}

sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield",ammo="Incantor Stone",
head="Gendewitha Caubeen +1",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
body="Vanir Cotehardie",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
back="Tempered Cape +1",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

sets.midcast.Curaga = {main="Tamaxchi",sub="Sors Shield",ammo="Clarus Stone",
head="Gendewitha Caubeen",neck="Healing torque",ear1="Magnetic earring",ear2="Novia Earring",
body="Gendewitha bliaut",hands="Serpentes cuffs",ring1="Ephedra Ring",ring2="Sirona's Ring",
back="Mending Cape",waist="Pythia sash +1",legs="Orison Pantaloons +2",feet="Serpentes sabots"}

sets.midcast.CureMelee = {ammo="Incantor Stone",
head="Gendewitha Caubeen +1",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

sets.midcast.Cursna = {main="Beneficus",sub="Sors Shield",
head="Orison Cap +2",neck="Malison Medallion",
body="Orison Bliaud +2",hands="Hieros Mittens",ring1="Ephedra Ring",ring2="Ephedra Ring",
back="Mending Cape",waist="Goading Belt",legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}

sets.midcast.StatusRemoval = {
head="Orison Cap +2",legs="Orison Pantaloons +2"}

-- 110 total Enhancing Magic Skill; caps even without Light Arts
sets.midcast['Enhancing Magic'] = {main="Beneficus",sub="Genbu's Shield",
head="Umuthi Hat",neck="Colossus's Torque",
body="Manasa Chasuble",hands="Dynasty Mitts",
back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}

sets.midcast.Stoneskin = {
head="Umuthi Hat",neck="Orison Locket",ear2="Loquacious Earring",
body="Vanir Cotehardie",hands="Dynasty Mitts",
back="Swith Cape",waist="Siegel Sash",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

sets.midcast.Auspice = {hands="Dynasty Mitts",feet="Orison Duckbills +2"}

sets.midcast.BarElement = {main="Beneficus",sub="Genbu's Shield",
head="Orison Cap +2",neck="Colossus's Torque",
body="Orison Bliaud +2",hands="Orison Mitts +2",
back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}

sets.midcast.Regen = {main="Bolelabunga",sub="Genbu's Shield",
body="Piety Briault",hands="Orison Mitts +2",
legs="Theophany Pantaloons"}

sets.midcast.Protectra = {ring1="Sheltered Ring",feet="Piety Duckbills"}

sets.midcast.Shellra = {ring1="Sheltered Ring",legs="Piety Pantaloons"}



sets.midcast['Divine Magic'] = {main="Bolelabunga",sub="Genbu's Shield",
head="Nahtirah Hat",neck="Colossus's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring2="Sangoma Ring",
back="Refraction Cape",waist=gear.ElementalObi,legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}


sets.midcast['Elemental Magic'] = {main="Eminent staff",sub="Wizzan grip", ammo="Witchstone",
head="Buremte Hat",neck="Stoicheion medal",ear1="Friomisi Earring",ear2="Novio Earring",
body="Artsieq jubbah",hands="Otomi Gloves",ring2="Sangoma Ring", ring1="Icesoul ring",
back="Refraction Cape",waist=gear.ElementalObi,legs="Gendewitha spats",feet="Gendewitha Galoshes"}

sets.midcast['Dark Magic'] = {main="Bolelabunga", sub="Genbu's Shield",
head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

-- Custom spell classes
sets.midcast.MndEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

sets.midcast.IntEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Sangoma Ring",
back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}


-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {main=gear.Staff.HMP, sub="Oneiros grip",
body="Gendewitha Bliaut",hands="Serpentes Cuffs",
waist="Austerity Belt",legs="Assiduity pants +1",feet="Chelona Boots +1"}


-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle = {main="Bolelabunga", sub="Genbu's Shield",ammo="Incantor Stone",
head="Nefer khat",neck="Twilight Torque",ear1="Beatific Earring",ear2="Gifted Earring",
body="Heka's kalasiris",hands="Serpentes Cuffs",ring1="Dark Ring",ring2="Dark Ring",
back="Cheviot cape",waist="Fucho-no-obi",legs="Assiduity pants",feet="Herald's gaiters"}

sets.idle.PDT = {main="Bolelabunga", sub="Genbu's Shield",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Dark Ring",ring2="Dark Ring",
back="Umbra Cape",waist="Witful Belt",legs="Gendewitha Spats",feet="Herald's Gaiters"}

sets.idle.Town = {main="Bolelabunga", sub="Genbu's Shield",ammo="Incantor Stone",
head="Gendewitha Caubeen",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Umbra Cape",waist="Witful Belt",legs="Assiduity pants",feet="Herald's Gaiters"}

sets.idle.Weak = {main="Bolelabunga", sub="Genbu's Shield",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Dark Ring",ring2="Dark Ring",
back="Umbra Cape",waist="Witful Belt",legs="Gendewitha Spats",feet="Herald's Gaiters"}

-- Defense sets

sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
head="Gendewitha Caubeen",neck="Twilight Torque",
body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Dark Ring",ring2="Dark Ring",
back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
head="Nahtirah Hat",neck="Twilight Torque",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Dark Ring",ring2="Shadow Ring",
back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

sets.Kiting = {feet="Herald's Gaiters"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Basic set for if no TP weapon is defined.
sets.engaged = {main="Sharur", sub="Genbu's shield", ammo="Hasty pinion +1",
head="Espial cap",neck="Peacock amulet",ear1="Brutal Earring",ear2="Steelflash Earring",
body="Espial gambison",hands="Espial bracers",ring1="Rajas Ring",ring2="K'ayres Ring",
back="Kayapa Cape",waist="Cetl Belt",legs="Espial Hose",feet="Espial Socks"}


-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
