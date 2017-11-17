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
sets.precast.JA.Meditate = {head="Myochin Kabuto",hands="Saotome Kote +2"}

sets.precast.JA['Warding Circle'] = {head="Myochin Kabuto"}

sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote"}

-- Waltz set (chr and vit)
sets.precast.Waltz = {ammo="Sonia's Plectrum",
head="Yaoyotl Helm",
body="Otronif Harness",hands="Buremte Gloves",ring1="Spiral Ring",
back="Iximulew Cape",waist="Caudata Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined

sets.precast.WS = {ammo="Thew Bomblet",
head="Otomi Helm",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Moonshade Earring",
body="Phorcys Korazin",hands="Otronif Gloves +1",ring1="Rajas Ring",ring2="Ifrit Ring",
back="Buquwik cape",waist="Fotia Belt",legs="Otronif Brais +1",feet="Ejekamal boots"}

sets.precast.WS.Acc = set_combine(sets.precast.WS, {hands="Umuthi gloves",ring2="Mars's ring", back="Takaha Mantle", legs="Wukong's hakama +1"})

sets.precast.WS.Vag = sets.engaged.Adoulin.Acc
-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {neck="Fotia Gorget", ear1="Flame pearl", hands="Boor bracelets", legs="Wukong's hakama +1", back="Letalis mantle"})

sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget", hands="Otronif gloves +1", legs="Wukong's hakama +1"})

sets.precast.WS['Tachi: Fudo'].Mod = set_combine(sets.precast.WS['Tachi: Fudo'], {waist="Fotia Belt"})

sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {neck="Fotia Gorget"})

sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget"})

sets.precast.WS['Tachi: Shoha'].Mod = set_combine(sets.precast.WS['Tachi: Shoha'], {waist="Fotia Belt"})

sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})

sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})

sets.precast.WS['Tachi: Rana'].Mod = set_combine(sets.precast.WS['Tachi: Rana'], {waist="Fotia Belt"})

sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

sets.precast.WS['Tachi: Jinpu'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})

sets.precast.WS['Apex Arrow'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Altdorf's earring", ear2="Wilhelm's earring", body="Kyujutsugi", hands="Unkai kote +2",ring1="Stormsoul ring", ring2="Stormsoul ring", back="Buquwik cape",  waist="Fotia Belt", legs="Aetosaur trousers +1", feet="Wakido Sune-ate"})

-- Midcast Sets
sets.midcast.FastRecast = {
head="Yaoyotl Helm",
body="Otronif Harness +1",hands="Otronif Gloves +1",
legs="Phorcys Dirs",feet="Otronif Boots +1"}

-- Sets to return to when not performing an action.
-- Resting sets
sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}

-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle.Town = {main="Tsurumaru", sub="Bloodrain strap",ammo="Thew Bomblet",
head="Yaoyotl Helm",neck="Wiglen gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Kyujutsugi",hands="Otronif Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Repulse Mantle",waist="Flume Belt +1",legs="Otronif brais +1",feet="Danzo Sune-ate"}

sets.idle.Field = {
head="Twilight Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Mekira meikogai",hands="Otronif Gloves +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt +1",legs="Otronif brais +1",feet="Danzo Sune-ate"}

sets.idle.Weak = {
head="Twilight Helm",neck="Wiglen Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Twilight Mail",hands="Buremte Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt +1",legs="Karieyh Brayettes +1",feet="Danzo Sune-ate"}

-- Defense sets
sets.defense.PDT = {ammo="Iron Gobbet",
head="Otronif mask +1",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Mekira meikogai",hands="Umuthi gloves",ring1="Defending Ring",ring2="Patricius ring",
back="Repulse Mantle",waist="Flume Belt +1",legs="Otronif brais +1",feet="Otronif Boots +1"}

sets.defense.Reraise = {
head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Twilight Mail",hands="Buremte Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt +1",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

sets.defense.MDT = {ammo="Demonry Stone",
head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
back="Engulfer Cape",waist="Flume Belt +1",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

sets.Kiting = {feet="Danzo Sune-ate"}

sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

-- Engaged sets
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group
-- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)

sets.engaged = {head="Yaoyotl Helm",neck="Dakatsu nodowa",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Xaddi mail",hands="Otronif Gloves +1",ring1="Rajas Ring",ring2="K'ayres Ring",
back="Takaha Mantle",waist="Windbuffet Belt +1",legs="Otronif brais +1",feet="Mikinaak greaves"}

sets.engaged.Acc = {head="Yaoyotl Helm",neck="Dakatsu nodowa",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Xaddi mail",hands="Buremte gloves",ring1="Rajas Ring",ring2="Mars's Ring",
back="Takaha Mantle",waist="Anguinus Belt",legs="Wukong's hakama +1",feet="Wakido Sune-ate"}

sets.engaged.PDT = {head="Otronif mask +1",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif harness",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
back="Repulse mantle",waist="Flume Belt +1",legs="Otronif Brais +1",feet="Otronif Boots +1"}

sets.engaged.Acc.PDT = {ammo="Honed Tathlum",
head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}

sets.engaged.Reraise = {ammo="Thew Bomblet",
head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
back="Ik Cape",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}

sets.engaged.Acc.Reraise = {ammo="Thew Bomblet",
head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}

-- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
-- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (32 Store TP in gear), 0 Store TP for a 5-hit
sets.engaged.Adoulin = {
head="Yaoyotl Helm",neck="Asperity necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Xaddi mail",hands="Otronif Gloves +1",ring1="Oneiros Ring",ring2="Patricius Ring",
back="Letalis Mantle",waist="Windbuffet Belt +1",legs="Wukong's hakama +1",feet="Ejekamal boots"}

sets.engaged.Adoulin.Acc = {head="Yaoyotl Helm",neck="Iqabi necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Xaddi mail",hands="Buremte gloves",ring1="Patricius Ring",ring2="Mars's Ring",
back="Takaha Mantle",waist="Anguinus Belt",legs="Wukong's hakama +1",feet="Wakido Sune-Ate"}

sets.engaged.Adoulin.Acc.Xhit = {head="Yaoyotl Helm",neck="Iqabi necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Xaddi mail",hands="Otronif gloves +1",ring1="Rajas Ring",ring2="Mars's Ring",
back="Takaha Mantle",waist="Anguinus Belt",legs="Otronif brais +1",feet="Wakido Sune-Ate"}

sets.engaged.Adoulin.PDT = {ammo="Thew Bomblet",
head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
back="Iximulew Cape",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}

sets.engaged.Adoulin.Acc.PDT = {ammo="Honed Tathlum",
head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="K'ayres Ring",
back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}

sets.engaged.Adoulin.Reraise = {ammo="Thew Bomblet",
head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
back="Ik Cape",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}

sets.engaged.Adoulin.Acc.Reraise = {ammo="Thew Bomblet",
head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Twilight Mail",hands="Otronif Gloves",ring1="Beeline Ring",ring2="K'ayres Ring",
back="Letalis Mantle",waist="Goading Belt",legs="Unkai Haidate +2",feet="Otronif Boots +1"}

sets.buff.Sekkanoki = {hands="Unkai Kote +2"}

sets.buff.Sengikori = {feet="Unkai Sune-ate +2"}

sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate"}
