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

sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}


-- Fast cast sets for spells

sets.precast.FC = {
ammo="Incantor stone",
head="Nahtirah Hat",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
body="Anhur robe",
hands="Gendewitha Gages +1",
ring1="Prolix Ring",
ring2="Weatherspoon ring",
back="Swith Cape +1",
waist="Witful Belt",
legs="Artsieq hose",
feet="Pedagogy loafers"}

sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Orunmila's torque"})

sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris",back="Pahtli Cape"})

sets.precast.FC.Curaga = sets.precast.FC.Cure

sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

       
-- Midcast Sets

sets.midcast.FastRecast = {
ammo="Incantor Stone",
head="Nahtirah Hat",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
body="Anhur robe",
hands="Gendewitha Gages +1",
ring1="Prolix Ring",
ring2="Weatherspoon ring",
back="Swith Cape +1",
waist="Ninurta's sash",
legs="Artsieq hose",
feet="Academic's Loafers +1"}

sets.midcast.Cure = {
main="Tamaxchi",
sub="Genbu's Shield",
ammo="Incantor Stone",
head="Gendewitha caubeen",
neck="Colossus's Torque",
ear1="Loquacious Earring",
ear2="Enchanter Earring +1",
body="Heka's Kalasiris",
hands="Gendewitha gages +1",
ring1="Ephedra Ring",
ring2="Sirona's Ring",
back="Swith Cape +1",
waist="Ninurta's sash",
legs="Artsieq hose",
feet="Rubeus boots"}

sets.midcast.CureWithLightWeather = {
main="Tamaxchi",
sub="Genbu's Shield",
ammo="Incantor Stone",
head="Gendewitha caubeen",
neck="Colossus's Torque",
ear1="Loquacious Earring",
ear2="Enchanter Earring +1",
body="Heka's Kalasiris",
hands="Gendewitha gages +1",
ring1="Ephedra Ring",
ring2="Sirona's Ring",
back="Swith Cape +1",
waist="Ninurta's sash",
legs="Artsieq hose",
feet="Rubeus boots"}

sets.midcast.Curaga = sets.midcast.Cure

sets.midcast.Regen = {main="Bolelabunga",head="Savant's Bonnet +2"}

sets.midcast.Cursna = {
neck="Malison Medallion",
hands="Hieros Mittens",
ring1="Ephedra Ring",
feet="Gendewitha Galoshes"}

sets.midcast['Enhancing Magic'] = {
main="Kirin's pole",
sub="Fulcio grip",
ammo="Savant's Treatise",
head="Savant's Bonnet +2",
neck="Colossus's Torque",
body="Anhur Robe",
hands="Savant's bracers +2",
back="Merciful cape",
waist="Cascade belt",
legs="Scholar's Pants",
feet="Rubeus boots"}

sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers"})

sets.midcast.Protect = {ring1="Sheltered Ring"}
sets.midcast.Protectra = sets.midcast.Protect

sets.midcast.Shell = {ring1="Sheltered Ring"}
sets.midcast.Shellra = sets.midcast.Shell


-- Custom spell classes
sets.midcast.MndEnfeebles = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
range="Aureole",
head="Nahtirah Hat",
neck="Eddy necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Savant's Gown +2",
hands="Hagondes cuffs",
ring1="Sangoma Ring",
ring2="Weatherspoon Ring",
back="Bookworm's Cape",
legs="Artsieq hose",
feet="Uk'uxkaj Boots"}

sets.midcast.IntEnfeebles = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
range="Aureole",
head="Nahtirah Hat",
neck="Eddy necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Savant's gown +2",
hands="Hagondes cuffs",
ring1="Icesoul Ring",
ring2="Sangoma Ring",
back="Bookworm's Cape",
legs="Artsieq hose",
feet="Uk'uxkaj Boots"}

sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles

sets.midcast['Dark Magic'] = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Savant's gown +2",hands="Hagondes cuffs",ring1="Weatherspoon Ring",ring2="Sangoma Ring",
back="Bookworm's Cape",waist="Ninurta's sash",legs="Artsieq hose",feet="Umbani boots"}

sets.midcast.Kaustra = {
main={ name="Lehbrailg +2", augments={'DMG:+11','MND+5','"Mag.Atk.Bns."+18',}},
sub="Wizzan Grip",
ammo="Witchstone",
head="Hagondes Hat",
neck="Eddy necklace",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Icesoul Ring",
ring2="Strendu Ring",
back="Toro Cape",
waist="Oneiros sash",
legs="Hagondes Pants +1",
feet="Hagondes Sabots"}

sets.midcast.Drain = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis Grip",
ammo="Incantor Stone",
head="Nahtirah Hat",
neck="Aesir Torque",
ear1="Gwati Earring",
ear2="Hirudinea Earring",
body="Scholar's gown",
hands="Gendewitha Gages +1",
ring1="Excelsis Ring",
ring2="Sangoma Ring",
back="Bookworm's Cape",
waist="Fucho-no-obi",
legs="Pedagogy Pants",
feet="Academic's Loafers +1"}

sets.midcast.Aspir = sets.midcast.Drain

sets.midcast.Stun = {
main="Apamajas II",
sub="Arbuda Grip",
ammo="Incantor Stone",
head="Pedagogy mortarboard +1",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter Earring +1",
body="Anhur Robe",
hands="Gendewitha Gages +1",
ring1="Prolix Ring",
ring2="Weatherspoon Ring",
back="Swith cape +1",
waist="Ninurta's sash",
legs="Artsieq hose",
feet="Academic's Loafers +1"}

sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis grip",
ear1="Gwati earring"})


-- Elemental Magic sets are default for handling low-tier nukes.
sets.midcast['Elemental Magic'] = {
main={ name="Lehbrailg +2", augments={'DMG:+11','MND+5','"Mag.Atk.Bns."+18',}},
sub="Elder's Grip +1",
ammo="Witchstone",
head="Buremte Hat",
neck="Eddy necklace",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Acumen Ring",
ring2="Strendu Ring",
back="Bookworm's Cape",
waist=gear.ElementalObi,
legs="Hagondes Pants +1",
feet="Umbani boots"}

sets.midcast['Elemental Magic'].Resistant = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Elder's Grip +1",
ammo="Witchstone",
head="Hagondes Hat",
neck="Eddy necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Sangoma Ring",
ring2="Weatherspoon Ring",
back="Bookworm's Cape",
waist=gear.ElementalObi,
legs="Hagondes Pants +1",
feet="Umbani boots"}

-- Custom classes for high-tier nukes.
sets.midcast.HighTierNuke = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Elder's Grip +1",
ammo="Witchstone",
head="Hagondes Hat",
neck="Eddy necklace",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Icesoul Ring",
ring2="Strendu Ring",
back="Toro Cape",
waist=gear.ElementalObi,
legs="Hagondes Pants +1",
feet="Hagondes Sabots"}

sets.midcast.HighTierNuke.Resistant = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis Grip",
ammo="Witchstone",
head="Hagondes Hat",
neck="Eddy necklace",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Icesoul Ring",
ring2="Strendu Ring",
back="Toro Cape",
waist=gear.ElementalObi,
legs="Hagondes Pants +1",
feet="Umbani boots"}

-- Sets for helixes
sets.midcast.Helix = {
main={ name="Lehbrailg +2", augments={'DMG:+11','MND+5','"Mag.Atk.Bns."+18',}},
sub="Wizzan Grip",ammo="Witchstone",
head="Hagondes Hat",neck="Eddy necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
body="Hagondes Coat",hands="Otomi Gloves",ring1="Acumen Ring",ring2="Strendu Ring",
back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants +1",feet="Umbani boots"}

sets.midcast.Helix.Resistant = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis Grip",ammo="Witchstone",
head="Hagondes Hat",neck="Eddy necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Hagondes Coat",hands="Otomi Gloves",ring1="Icesoul Ring",ring2="Strendu Ring",
back="Toro Cape",waist=gear.ElementalObi,legs="Hagondes Pants +1",feet="Umbani boots"}

sets.midcast.Impact = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Mag. Acc.+20','Elem. magic skill +6',}},
sub="Mephitis Grip",ammo="Witchstone",
head=empty,neck="Eddy necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Twilight Cloak",hands="Hagondes cuffs",ring1="Sangoma Ring",ring2="Weatherspoon Ring",
back="Ogapepo Cape",waist=gear.ElementalObi,legs="Artsieq hose",feet="Umbani Boots"}


-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {main="Bolelabunga",sub="Genbu's shield",
head="Nefer Khat",neck="Wiglen Gorget",
body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Serpentes Sabots"}


-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

sets.idle.Town = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
head="Nahtirah hat",neck="Wiglen Gorget",ear1="Loquacious Earring",
body="Councilor's garb",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Umbra Cape",waist="Fucho-no-obi",legs="Assiduity pants +1", feet="Serpentes sabots"}


sets.idle.Field = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
head="Nefer Khat",neck="Wiglen Gorget",ear1="Loquacious Earring",
body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Umbra Cape",waist="Fucho-no-obi",legs="Assiduity pants +1",feet="Serpentes sabots"}



sets.idle.Field.PDT = {main="Terra's staff" ,sub="Oneiros grip",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Wiglen Gorget",ear1="Loquacious Earring",ear2="Gwati Earring",
body="Hagondes Coat",hands="Hagondes cuffs",ring1="Dark Ring",ring2="Defending Ring",
back="Umbra Cape",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Hagondes sabots"}

sets.idle.Field.Stun = {main="Apamajas II",sub="Mephitis Grip",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Aesir Torque",ear1="Loquacious earring",ear2="Enchanter earring +1",
body="Anhur robe",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2="Weatherspoon Ring",
back="Swith Cape +1",waist="Ninurta's sash",legs="Artsieq hose",feet="Academic's Loafers +1"}

sets.idle.Weak = {main="Bolelabunga" ,sub="Genbu's shield",ammo="Incantor Stone",
head="Hagondes Hat",neck="Wiglen Gorget",ear1="Loquacious Earring",ear2="Gwati Earring",
body="Hagondes Coat",hands="Hagondes cuffs",ring1="Dark Ring",ring2="Defending Ring",
back="Umbra Cape",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Hagondes sabots"}

-- Defense sets

sets.defense.PDT = {main="Terra's staff",sub="Oneiros Grip",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Twilight Torque", ear2="Loquacious Earring",
body="Hagondes Coat",hands="Hagondes cuffs",ring1="Dark Ring",ring2="Defending Ring",
back="Umbra Cape",waist="Fucho-no-obi",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

sets.defense.MDT = {main=gear.Staff.PDT,sub="Oneiros grip",ammo="Incantor Stone",
head="Nahtirah Hat",neck="Twilight Torque",ear2="Loquacious Earring",
body="Vanir Cotehardie",hands="Gendewitha gages +1",ring1="Dark Ring",ring2="Defending Ring", legs="Hagondes pants +1",feet="Hagondes Sabots"}

sets.Kiting = {feet="Desert boots +1"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Normal melee group
sets.engaged = {
head="Gendewitha caubeen",
body="Vanir Cotehardie",ring1="Rajas Ring",
waist="Ninurta's sash",legs="Hagondes Pants +1",feet="Hagondes Sabots"}



-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Ebullience'] = {head="Savant's Bonnet +2"}
sets.buff['Rapture'] = {head="Savant's Bonnet +2"}
sets.buff['Perpetuance'] = {hands="Savant's Bracers +2"}
sets.buff['Immanence'] = {hands="Savant's Bracers +2"}
sets.buff['Penury'] = {legs="Savant's Pants +2"}
sets.buff['Parsimony'] = {legs="Savant's Pants +2"}
sets.buff['Celerity'] = {feet="Pedagogy Loafers"}
sets.buff['Alacrity'] = {head="Nahtirah hat", feet="Pedagogy Loafers"}

sets.buff['Klimaform'] = {feet="Savant's Loafers +2"}

sets.buff.FullSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring",body="Argute Gown +2"}
sets.buff.PDTSublimation = {head="Academic's Mortarboard",ear1="Savant's Earring"}

sets.buff['Sandstorm'] = {feet="Desert Boots +1",}
