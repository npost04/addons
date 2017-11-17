function init_gear_sets()
-- Start defining the sets
--------------------------------------
---- Precast Sets ----
-- Precast sets to enhance JAs
sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}
sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}
-- equip to maximize HP (for Tarus) and minimize MP loss before using convert
sets.precast.JA.Convert = {}
-- Fast cast sets for spells
sets.precast.FC = {
head="Nahtirah Hat",
neck="Orunmila's torque",
ear1="Enchanter earring +1",
ear2="Loquacious Earring",
body="Anhur robe",
ring1="Prolix Ring",
ring2="Weatherspoon ring",
back="Swith Cape",
waist="Goading Belt",
legs="Orvail Pants +1",
feet="Chelona Boots +1"}

sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
waist="Siegel Sash"})

sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
neck="Stoicheion Medal"})

sets.precast.FC.Cure = set_combine(sets.precast.FC, {
body="Heka's Kalasiris", 
back="Pahtli Cape"})

sets.precast.FC.Curaga = sets.precast.FC.Cure
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
head="Hagondes Hat",
neck="Asperity Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Hagondes Coat",
hands="Yaoyotl Gloves",
ring1="Rajas Ring",
ring2="Icesoul Ring",
back="Refraction Cape",
waist="Cognition Belt",
legs="Hagondes Pants +1",
feet="Hagondes Sabots"}

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Vidohunir'] = {
ammo="Dosis Tathlum",
head="Hagondes Hat",
neck="Eddy Necklace",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Hagondes Coat",
hands="Yaoyotl Gloves",
ring1="Icesoul Ring",
ring2="Acumen Ring",
back="Toro Cape",
waist="Thunder Belt",
legs="Hagondes Pants +1",
feet="Hagondes Sabots"}

---- Midcast Sets ----
sets.midcast.FastRecast = {
head="Nahtirah Hat",
ear1="Enchntr. Earring +1",
ear2="Loquacious Earring",
body="Anhur robe",
hands="Otomi gloves",
ring1="Prolix Ring",
ring2="Weather. ring",
back="Swith Cape +1",
waist="Goading Belt",
legs="Artsieq hose",
feet="Hagondes Sabots"}

sets.midcast.Cure = {
main="Tamaxchi",
sub="Genbu's Shield",
head="Nahtirah Hat",
neck="Colossus's Torque",
ear2="Loquacious Earring",
body="Heka's Kalasiris",
hands="Bokwus Gloves",
ring1="Ephedra Ring",
ring2="Sirona's Ring",
back="Pahtli Cape",
waist=gear.ElementalObi,
legs="Nares trews",
feet="Hagondes Sabots"}

sets.midcast.Curaga = sets.midcast.Cure

sets.midcast['Enhancing Magic'] = {
head="Umuthi hat",
neck="Colossus's Torque",
body="Anhur robe",
hands="Ayao's Gages",
legs="Portent Pants"}

sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

sets.midcast['Enfeebling Magic'] = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ranged="Aureole",
head="Buremte Hat",
neck="Eddy necklace",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Hagondes Coat",
hands={ name="Hagondes cuffs", augments={'Mag. Acc.+11','Phys. dmg. taken -2%',}},
ring1="Weatherspoon Ring",
ring2="Sangoma Ring",
back="Bane Cape",
waist="Ovate rope",
legs="Artsieq hose",
feet="Uk'uxkaj boots"}


sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

sets.midcast['Dark Magic'] = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ranged="Aureole",
head="Nahtirah Hat",
neck="Aesir Torque",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Vanir Cotehardie",
hands="Hagondes cuffs",
ring1="Weather. Ring",
ring2="Sangoma Ring",
back="Refraction Cape",
waist="Ovate rope",
legs="Artsieq hose",
feet="Uk'uxkaj boots"}

sets.midcast.Drain = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ammo="Sturm's Report",
head="Nahtirah Hat",
neck="Aesir Torque",
ear1="Psystorm Earring",
ear2="Lifestorm Earring",
body="Vanir Cotehardie",
hands="Hagondes cuffs",
ring1="Archon Ring",
ring2="Sangoma Ring",
back="Refraction Cape",
waist="Fucho-no-Obi",
legs="Orvail pants +1",
feet="Goetia Sabots +2"}

sets.midcast.Aspir = sets.midcast.Drain


sets.midcast.Stun = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ammo="Sturm's Report",
head="Nahtirah Hat",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchntr. Earring +1",
body="Anhur robe",
hands="Hagondes cuffs",
ring1="Prolix Ring",
ring2="Weather Ring",
back="Swith Cape +1",
waist="Witful Belt",
legs="Artsieq hose",
feet="Hagondes sabots"}

sets.midcast.BardSong = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
back="Refraction Cape",legs="Bokwus Slops",feet="Bokwus Boots"}

-- Elemental Magic sets
sets.midcast['Elemental Magic'] = {
main={ name="Lehbrailg +2", augments={'DMG:+11','MND+5','"Mag.Atk.Bns."+18',}},
sub="Wizzan Grip",
ammo="Witchstone",
head="Buremte hat",
neck="Eddy Necklace",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
body="Hagondes Coat",
hands="Otomi Gloves",
ring1="Strendu Ring",
ring2="Acumen Ring",
back="Bane Cape",
waist="Sekhmet corset",
legs="Hagondes Pants +1",
feet="Umbani boots"}

sets.midcast['Elemental Magic'].Resistant = {
main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
sub="Mephitis Grip",
ranged="Aureole",
head="Buremte hat",
neck="Eddy Necklace",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
body="Hagondes Coat",
hands="Hagondes cuffs",
ring1="Sangoma Ring",
ring2="Weather. Ring",
back="Bane cape",
waist=gear.ElementalObi,
legs="Hagondes Pants +1",
feet="Umbani boots"}

sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
sub="Elder's grip +1",
head="Hagondes Hat",
back="Toro cape",
waist=gear.ElementalObi})

sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {
sub="Wizzan Grip"})

-- Minimal damage gear for procs.
sets.midcast['Elemental Magic'].Proc = {
main="Earth Staff",
sub="Mephitis Grip",
ammo="Impatiens",
head="Nahtirah Hat",
neck="Twilight Torque",
ear1="Bloodgem Earring",
ear2="Loquacious Earring",
body="Manasa Chasuble",
hands="Serpentes Cuffs",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Swith Cape +1",
waist="Witful Belt",
legs="Nares Trews",
feet="Chelona Boots +1"}

-- Sets to return to when not performing an action.
-- Resting sets
sets.resting = {
main="Chatoyant Staff",
ammo="Clarus Stone",
head="Nefer Khat",
neck="Grandiose Chain",
body="Heka's Kalasiris",
hands="Serpentes Cuffs",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
waist="Austerity Belt",
legs="Assiduity pants +1",
feet="Serpentes Sabots"}

-- Idle sets
-- Normal refresh idle set
sets.idle = {
main="Bolelabunga",
sub="Genbu's shield",
head="Nefer Khat",
neck="Wiglen Gorget",
body="Heka's Kalasiris",
hands="Serpentes Cuffs",
ring1="Dark Ring",augments={'Phys. dmg. taken -5%','Magic dmg. taken -4%'},
ring2="Defending Ring",
back="Umbra Cape",
waist="Fucho-no-obi",
legs="Assiduity pants +1",
feet="Serpentes sabots"}

-- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
sets.idle.PDT = {
main="Terra's Staff",
sub="Mephitis Grip",
ammo="Impatiens",
head="Hagondes Hat",
neck="Twilight Torque",
ear1="Bloodgem Earring",
ear2="Loquacious Earring",
body="Hagondes Coat",
hands="Hagondes cuffs",
ring1="Defending Ring",
ring2="Dark Ring",augments={'Phys. dmg. taken -5%','Magic dmg. taken =4%'},
back="Umbra Cape",
waist="Fucho-no-obi",
legs="Hagondes Pants +1",
feet="Herald's Gaiters"}

-- Idle mode scopes:
-- Idle mode when weak.
sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
head="Hagondes Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
back="Umbra Cape",waist="Hierarch Belt",legs="Assiduity pants +1",feet="Hagondes Sabots"}


-- Defense sets
sets.defense.PDT = {main="Bolelabunga", sub="Genbu's shield",
head="Hagondes hat", neck="Twilight Torque",
body="Hagondes Coat",hands="Hagondes cuffs",ring1="Defending Ring",ring2="Dark Ring",
back="Cheviot Cape",waist="Chaac Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

sets.defense.MDT = {ammo="Demonry Stone",
head="Nahtirah Hat",neck="Twilight Torque",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

sets.Kiting = {feet="Herald's Gaiters"}

sets.latent_refresh = {waist="Fucho-no-obi"}

-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}
-- Engaged sets
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group

sets.engaged = {
head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Hagondes Coat",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

sets.engaged.PDT = {main="Bolelabunga", sub="Genbu's shield",
head="Hagondes hat", neck="Twilight Torque",
body="Hagondes Coat",hands="Hagondes cuffs",ring1="Defending Ring",ring2="Dark Ring",
back="Cheviot Cape",waist="Chaac Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}


end
