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
sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama"}
sets.precast.JA['Futae'] = {legs="Iga Tekko +2"}
sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail"}

-- Waltz set (chr and vit)
sets.precast.Waltz = {ammo="Sonia's Plectrum",
head="Felistris Mask",
body="Hachiya Chainmail +1",hands="Buremte Gloves",ring1="Spiral Ring",
back="Iximulew Cape",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}
-- Uk'uxkaj Cap, Daihanshi Habaki

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Set for acc on steps, since Yonin drops acc a fair bit
sets.precast.Step = {
head="Whirlpool Mask",neck="Ej Necklace",
body="Otronif Harness +1",hands="Buremte Gloves",ring1="Patricius Ring",
back="Yokaze Mantle",waist="Chaac Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}

sets.precast.Flourish1 = {waist="Chaac Belt"}

-- Fast cast sets for spells
sets.precast.FC = {ammo="Impatiens",neck="Orunmila's torque",ear1="Loquacious Earring",ear2="Enchanter earring +1",hands="Thaumas Gloves",ring1="Prolix Ring", ring2="Weatherspoon ring"}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga beads",body="Mochizuki Chainmail"})

-- Snapshot for ranged
sets.precast.RA = {hands="Manibozho Gloves",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}

-- Weaponskill sets

-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {ammo="Yetshila",
head="Whirlpool Mask",neck=gear.ElementalGorget,ear1="Brutal Earring",ear2="Moonshade Earring",
body="Khepri jacket",hands="Otronif gloves +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Atheling Mantle",waist=gear.ElementalBelt,legs="Manibozho Brais",feet="Otronif Boots +1"}

sets.precast.WS.Acc = set_combine(sets.precast.WS, {hands="Buremte Gloves",
back="Yokaze Mantle"})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS,
{head="Uk'uxkaj cap",neck="Rancor Collar",ear1="Brutal Earring",ear2="Moonshade Earring",hands="Seiryu's kote",legs="Kaabnax trousers",feet="Manibozho boots"})

sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS,
{ammo="Yetshila", head="Uk'uxkaj cap",neck="Rancor collar",body="Khepri jacket",hands="Seiryu's kote",ring1="Stormsoul Ring", ring2="Stormsoul ring", waist="Windbuffet belt +1", legs="Kaabnax Trousers",feet="Manibozho boots"})

sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {feet="Daihanshi Habaki"})

sets.precast.WS['Aeolian Edge'] = {
head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
back="Toro Cape",waist="Thunder Belt",legs="Shneddick Tights +1",feet="Daihanshi Habaki"}

--------------------------------------
-- Midcast sets
--------------------------------------
sets.midcast.FastRecast = {
head="Felistris Mask",ear2="Loquacious Earring",
body="Hachiya Chainmail +1",hands="Mochizuki Tekko",ring1="Prolix Ring",
legs="Hachiya Hakama",feet="Qaaxo Leggings"}

sets.midcast.Utsusemi = {
ammo="Impatiens",
head="Athos's chapeau",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
body="Mochizuki chainmail",
hands="Thaumas Gloves",
ring1="Prolix Ring",
ring2="Weatherspoon ring",
waist="Goading belt",
legs="Wukong's hakama +1",
feet="Iga Kyahan +2"}

sets.midcast.ElementalNinjutsu = {
head="Hachiya Hatsuburi",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
body="Hachiya Chainmail +1",hands="Iga Tekko +2",ring1="Icesoul Ring",ring2="Acumen Ring",
back="Toro Cape",waist=gear.ElementalObi,legs="Nahtirah Trousers",feet="Hachiya Kyahan"}

sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.Ninjutsu, {ear1="Lifestorm Earring",ear2="Psystorm Earring",
back="Yokaze Mantle"})

sets.midcast.NinjutsuDebuff = {
head="Hachiya Hatsuburi",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
hands="Mochizuki Tekko",ring2="Sangoma Ring",
back="Yokaze Mantle",feet="Hachiya Kyahan"}

sets.midcast.NinjutsuBuff = {head="Hachiya Hatsuburi",neck="Ej Necklace",back="Yokaze Mantle"}

sets.midcast.RA = {
head="Felistris Mask",neck="Ej Necklace",
body="Hachiya Chainmail +1",hands="Hachiya Tekko",ring1="Beeline Ring",
back="Yokaze Mantle",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}
-- Hachiya Hakama/Thurandaut Tights +1

--------------------------------------
-- Idle/resting/defense/etc sets
--------------------------------------
-- Resting sets

sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
ring1="Sheltered Ring",ring2="Paguroidea Ring"}

-- Idle sets

sets.idle = {
head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Khepri jacket",hands="Nomkahpa mittens +1" ,ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt +1",legs="Mochizuki Hakama",feet=gear.MovementFeet}


sets.idle.Weak = {
head="Whirlpool Mask",neck="Wiglen Gorget",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt +1",legs="Hachiya Hakama",feet=gear.MovementFeet}

-- Defense sets

sets.defense.Evasion = {
head="Felistris Mask",neck="Ej Necklace",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Beeline Ring",
back="Yokaze Mantle",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

sets.defense.PDT = {ammo="Iron Gobbet",
head="Otronif Mask +1",neck="Twilight Torque",
body="Emet Harness +1",hands="Umuthi gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
back="Shadow Mantle",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

sets.defense.MDT = {ammo="Demonry Stone",
head="Whirlpool Mask",neck="Twilight Torque",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
back="Engulfer Cape",waist="Flume Belt +1",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

sets.Kiting = {feet=gear.MovementFeet}
--------------------------------------
-- Engaged sets
--------------------------------------
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group

sets.engaged = {ammo="Happo shuriken",
head="Uk'uxkaj cap",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Mochizuki Chainmail",hands="Otronif Gloves +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Nusku's Sash",legs="Mochizuki Hakama",feet="Manibozho boots"}

sets.engaged.MultiHit = {ammo="Happo shuriken",
head="Uk'uxkaj cap",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
body="Thaumas coat",hands="Nomkahpa mittens +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Letalis Mantle",waist="Windbuffet belt +1",legs="Mochizuki Hakama",feet="Manibozho boots"}

sets.engaged.Acc = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Iqabi Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Mochizuki Chainmail",hands="Otronif Gloves +1",ring1="Enlivened Ring",ring2="Patricius Ring",
back="Yokaze Mantle",waist="Anguinus belt",legs="Hachiya Hakama",feet="Qaaxo leggings"}

sets.engaged.MultiHitAcc = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
body="Mochizuki chainmail",hands="Otronif Gloves +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Anguinus belt",legs="Hachiya Hakama",feet="Manibozho Boots"}


sets.engaged.Evasion = {ammo="Happo shuriken",
head="Felistris Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.Evasion = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.PDT = {ammo="Happo shuriken",
head="Felistris Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Emet Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.PDT = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

-- Custom melee group: High Haste (~20% DW)

sets.engaged.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Hachiya Chainmail",hands="Otronif Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
back="Atheling Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Manibozho Boots"}

sets.engaged.Acc.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Mochizuki Chainmail",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Anguinus belt",legs="Hachiya Hakama",feet="Manibozho Boots"}

sets.engaged.Evasion.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Hachiya Chainmail +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.Evasion.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.PDT.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Patentia Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.PDT.HighHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

-- Custom melee group: Embrava Haste (7% DW)

sets.engaged.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Qaaxo Harness",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
back="Atheling Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Manibozho Boots"}

sets.engaged.Acc.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Mochizuki Chainmail",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Manibozho Boots"}

sets.engaged.Evasion.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.Evasion.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.PDT.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}

sets.engaged.Acc.PDT.EmbravaHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Otronif Boots +1"}

-- Custom melee group: Max Haste (0% DW)

sets.engaged.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Thaumas coat",hands="Nomkahpa mittens +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Mochizuki hakama",feet="Manibozho Boots"}

sets.engaged.MultiHit.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Thaumas coat",hands="Nomkahpa mittens +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Mochizuki hakama",feet="Manibozho Boots"}

sets.engaged.MultiHitAcc.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Thaumas coat",hands="Nomkahpa mittens +1",ring1="Oneiros Ring",ring2="Epona's Ring",
back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Mochizuki hakama",feet="Manibozho Boots"}


sets.engaged.Acc.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Manibozho Boots"}

sets.engaged.Evasion.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Windbuffet Belt",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.Acc.Evasion.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}

sets.engaged.PDT.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Windbuffet Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}

sets.engaged.Acc.PDT.MaxHaste = {ammo="Happo shuriken",
head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Otronif Boots +1"}

--------------------------------------
-- Custom buff sets
--------------------------------------
sets.buff.Migawari = {body="Iga Ningi +2"}
sets.buff.Doom = {ring2="Saida Ring"}
sets.buff.Yonin = {}
sets.buff.Innin = {}

