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

-- Precast sets to enhance JAs on use
sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose"}

sets.precast.JA['Boost'] = {hands="Anchorite's Gloves"}

sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters"}

sets.precast.JA['Focus'] = {head="Anchorite's Crown"}

sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters"}

sets.precast.JA['Chi Blast'] = {
head="Whirlpool mask",
body="Espial gambison",
hands="Hesychast's Gloves",
legs="Quiahuiz trousers",
feet="Thurandaut boots +1"}

sets.precast.JA['Footwork'] = {feet="Tantra Gaiters +2"}

sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}

sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters"}

sets.precast.JA['Chakra'] = {
ammo="Tantra tathlum",
head="Uk'uxkaj cap",
neck="Fortitude torque",
ear1="Soil pearl",
body="Anchorite's Cyclas",
hands="Hesychast's Gloves",
ring1="Spiral Ring",
ring2="Terrasoul ring",
back="Iximulew Cape",
waist="Caudata Belt",
legs="Kaabnax trousers",
feet="Thurandaut Boots +1"}


-- Waltz set (chr and vit)
sets.precast.Waltz = {
ammo="Tantra tathlum",
head="Uk'uxkaj cap",
body="Espial gambison",
hands="Otronif Gloves +1",
ring1="Spiral Ring",
back="Iximulew Cape",
waist="Caudata Belt",
legs="Kaabnax trousers",
Feet="Thurandaut boots +1"}

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Fast cast sets for spells

sets.precast.FC = {
ammo="Impatiens",
head="Haruspex hat +1",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
hands="Thaumas Gloves",
ring1="Prolix ring",
ring2="Weatherspoon ring",
back="Mujin mantle",
legs="Kaabnax trousers",
feet="Suzaku's sune-ate"}

sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

       
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
ammo="Tantra tathlum",
head="Uk'uxkaj cap",
neck="Asperity Necklace",
ear1="Brutal Earring",
ear2="Moonshade Earring",
body="Khepri jacket",
hands="Hesychast's Gloves",
ring1="Rajas Ring",
ring2="Epona's Ring",
back="Atheling Mantle",
waist="Caudata Belt",
legs="Quiahuiz trousers",
feet="Qaaxo leggings"}

sets.precast.WS.Acc = set_combine(sets.precast.WS, {
ammo="Honed Tathlum",
neck="Iqabi necklace",
body="Emet harness +1",
back="Anchoret's Mantle"
})

sets.precast.WS.Mod = set_combine(sets.precast.WS, {
head="Felistris Mask",
legs="Hesychast's Hose +1",
feet="Qaaxo Leggings"})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS["Victory Smite"] = set_combine(sets.precast.WS, {
body="Khepri jacket",
neck="Rancor Collar",
waist="Fotia belt",
legs="Byakko's haidate"})

sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS.Acc, {
head="Whirlpool mask",
neck="Fotia gorget",
body="Manibozho Jerkin",
ring1="Mars's ring",
waist="Fotia belt",
legs="Manibozho brais"})

sets.precast.WS["Victory Smite"].Mod = set_combine(sets.precast.WS["Victory Smite"], {
waist="Fotia Belt"})

sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {
neck="Fotia gorget",
body="Khepri jacket",
hands="Hesychast's gloves",
ring1="Enlivened ring",
back="Kayapa cape",
waist="Fotia Belt",
feet="Qaaxo leggings"})

sets.precast.WS['Shijin Spiral'].Acc = set_combine(sets.precast.WS.Acc, {
neck="Fotia gorget",
back="Anchoret's mantle",
waist="Fotia Belt"
})

sets.precast.WS['Shijin Spiral'].Mod = set_combine(sets.precast.WS['Shijin Spiral'], {
head="Felistris Mask",
waist="Fotia Belt",
legs="Hesychast's Hose +1"})

sets.precast.WS['Asuran Fists'] = set_combine(sets.precast.WS, {
neck="Fotia Gorget",
ring2="Spiral Ring"})

sets.precast.WS['Asuran Fists'].Acc = set_combine(sets.precast.WS.Acc, {
neck="Fotia Gorget",
ring2="Spiral Ring"})

sets.precast.WS['Asuran Fists'].Mod = set_combine(sets.precast.WS['Asuran Fists'], {
waist="Fotia Belt",
feet="Qaaxo leggings"})

sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {
neck="Rancor Collar",
ear1="Brutal Earring",
ear2="Moonshade Earring",
ring1="Spiral Ring"})

sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS.Acc, {
neck="Rancor Collar",
ear1="Brutal Earring",
ear2="Moonshade Earring",
ring1="Spiral Ring"})

sets.precast.WS["Ascetic's Fury"].Mod = set_combine(sets.precast.WS["Ascetic's Fury"], {
waist="Fotia Belt"})

sets.precast.WS['Cataclysm'] = {
head="Thaumas Hat",
neck="Stoicheion Medal",
ear1="Friomisi Earring",
ear2="Hecate's Earring",
body="Otronif Harness +1",
hands="Otronif Gloves +1",
ring1="Acumen Ring",
ring2="Demon's Ring",
back="Toro Cape",
waist="Fotia Belt",
feet="Qaaxo Leggings"}


-- Midcast Sets
sets.midcast.FastRecast = {
head="Haruspex hat +1",
ear2="Loquacious Earring",
body="Otronif Harness +1",
hands="Thaumas Gloves",
waist="Black Belt",
feet="Suzaku's sune-ate"}

-- Specific spells
sets.midcast.Utsusemi = {
head="Whirlpool Mask",
ear2="Loquacious Earring",
body="Otronif Harness +1",
hands="Thaumas Gloves",
waist="Black Belt",
legs="Qaaxo Tights",
feet="Otronif Boots"}


-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {
head="Ocelomeh Headpiece +1",
neck="Wiglen Gorget",
body="Hesychast's Cyclas",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
feet="Hermes' sandals"}


-- Idle sets
sets.idle = {
ammo="Thew Bomblet",
head="Ocelomeh Headpiece +1",
neck="Wiglen Gorget",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Hesychast's Cyclas",
hands="Garden bangles",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Repulse mantle",
waist="Black Belt",
legs="Quiahuiz trousers",
feet="Hermes' sandals"}

sets.idle.Town = { 
ammo="Thew Bomblet",
head="Ocelomeh Headpiece +1",
neck="Wiglen Gorget",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Hesychast's Cyclas",
hands="Garden bangles",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Repulse mantle",
waist="Black Belt",
legs="Kaabnax trousers",
feet="Hermes' sandals"}


sets.idle.Weak = {
ammo="Thew Bomblet",
head="Ocelomeh Headpiece +1",
neck="Wiglen Gorget",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Hesychast's Cyclas",
hands="Garden bangles",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Repulse mantle",
waist="Black Belt",
legs="Kaabnax trousers",
feet="Hermes' sandals"}

-- Defense sets
sets.defense.PDT = {
head="Otronif Mask +1",
neck="Twilight Torque",
body="Emet harness +1",
hands="Otronif Gloves +1",
ring1="Dark Ring",
ring2="Defending Ring",
back="Repulse Mantle",
waist="Black Belt",
legs="Otronif brais +1",
feet="Qaaxo leggings"}

sets.defense.HP = {
ammo="Iron Gobbet",
head="Whirlpool Mask",
neck="Lavalier +1",
ear1="Brutal Earring",
ear2="Bloodgem Earring",
body="Hesychast's Cyclas",
hands="Hesychast's Gloves +1",
ring1="K'ayres Ring",
ring2="Meridian Ring",
back="Shadow Mantle",
waist="Black Belt",
legs="Hesychast's Hose +1",
feet="Hesychast's Gaiters"}

sets.defense.MDT = {
ammo="Demonry Stone",
head="Haruspex hat +1",
neck="Twilight Torque",
body="Otronif Harness +1",
hands="Anchorite's Gloves +1",
ring1="Dark Ring",
ring2="Shadow Ring",
back="Engulfer Cape",
waist="Black Belt",
legs="Qaaxo Tights",
feet="Daihanshi Habaki"}

sets.Kiting = {feet="Hermes' sandals"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Normal melee sets
sets.engaged = {
ammo="Honed Tathlum",
head="Uk'uxkaj cap",
neck="Asperity Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Thaumas coat",
hands="Nomkahpa mittens +1",
ring1="Oneiros Ring",
ring2="Epona's Ring",
back="Letalis Mantle",
waist="Windbuffet Belt +1",
legs="Kaabnax trousers",
feet="Manibozho boots"}

sets.engaged.Acc = {
ammo="Honed Tathlum",
head="Whirlpool Mask",
neck="Iqabi necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Emet harness +1",
hands="Hesychast's Gloves",
ring1="Mars's Ring",
ring2="Enlivened Ring",
back="Anchoret's Mantle",
waist="Anguinus Belt",
legs="Wukong's hakama +1",
feet="Qaaxo leggings"}

sets.engaged.Multi = {
ammo="Thew Bomblet",
head="Uk'uxkaj cap",
neck="Asperity Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Thaumas coat",
hands="Nomkahpa mittens +1",
ring1="Oneiros Ring",
ring2="Epona's Ring",
back="Letalis Mantle",
waist="Windbuffet Belt +1",
legs="Kaabnax trousers",
feet="Manibozho boots"}

-- Defensive melee hybrid sets
sets.engaged.PDT = {
ammo="Thew Bomblet",
head="Otronif Mask",
neck="Twilight Torque",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Emet harness +1",
hands="Otronif Gloves +1",
ring1="Patricius Ring",
ring2="Defending Ring",
back="Iximulew Cape",
waist="Windbuffet Belt +1",
legs="Otronif brais +1",
feet="Qaaxo leggings"}

sets.engaged.Acc.PDT = {
ammo="Honed Tathlum",
head="Whirlpool Mask",
neck="Twilight Torque",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Emet harness +1",
hands="Otronif Gloves +1",
ring1="Patricius Ring",
ring2="Defending Ring",
back="Anchoret's Mantle",
waist="Anguinus Belt",
legs="Otronif brais +1",
feet="Qaaxo Leggings"}

sets.engaged.Counter = {
ammo="Thew Bomblet",
head="Whirlpool Mask",
neck="Asperity Necklace",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Otronif Harness +1",
hands="Otronif Gloves +1",
ring1="K'ayres Ring",
ring2="Epona's Ring",
back="Atheling Mantle",
waist="Windbuffet Belt +1",
legs="Anchorite's Hose",
feet="Otronif Boots +1"}

sets.engaged.Acc.Counter = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Emet harness +1",hands="Hesychast's Gloves +1",ring1="Patricius Ring",ring2="Epona's Ring",
back="Letalis Mantle",waist="Anguinus Belt",legs="Anchorite's Hose",feet="Otronif Boots +1"}


-- Hundred Fists/Impetus melee set mods
sets.engaged.HF = set_combine(sets.engaged)
sets.engaged.HF.Impetus = set_combine(sets.engaged, {body="Tantra Cyclas +2"})
sets.engaged.Acc.HF = set_combine(sets.engaged.Acc)
sets.engaged.Acc.HF.Impetus = set_combine(sets.engaged.Acc, {body="Tantra Cyclas +2"})
sets.engaged.Counter.HF = set_combine(sets.engaged.Counter)
sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {body="Tantra Cyclas +2"})
sets.engaged.Acc.Counter.HF = set_combine(sets.engaged.Acc.Counter)
sets.engaged.Acc.Counter.HF.Impetus = set_combine(sets.engaged.Acc.Counter, {body="Tantra Cyclas +2"})


-- Footwork combat form
sets.engaged.Footwork = {ammo="Thew Bomblet",
head="Felistris Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Qaaxo Harness",hands="Hesychast's Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Hesychast's Hose +1",feet="Anchorite's Gaiters +1"}

sets.engaged.Footwork.Acc = {ammo="Honed Tathlum",
head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Emet harness +1",hands="Hesychast's Gloves +1",ring1="Rajas Ring",ring2="Epona's Ring",
back="Letalis Mantle",waist="Anguinus Belt",legs="Hesychast's Hose +1",feet="Anchorite's Gaiters +1"}

-- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
sets.impetus_body = {body="Tantra Cyclas +2"}
sets.footwork_kick_feet = {feet="Anchorite's Gaiters"}
