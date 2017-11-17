-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets
--------------------------------------
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

-- Precast Sets
-- Precast sets to enhance JAs
sets.precast.JA.Angon = {ammo="Angon",hands="Pteroslaver Finger Gauntlets"}
sets.CapacityMantle = {back="Mecistopins Mantle"}
sets.Berserker = {neck="Berserker's Torque"}
sets.WSDayBonus = { head="Gavialis Helm" }

sets.precast.JA.Jump = {
ammo="Ginsen",
head="Yaoyotl helm",
neck="Asperity Necklace",
ear1="Bloodborn Earring",
ear2="Steelflash Earring",
body="Peltast's plackart",
hands= "Acro Guantlets",
ring1="Rajas Ring",
ring2="Oneiros Ring",
back="Letalis Mantle",
waist="Windbuffet Belt +1",
legs="Taeon Tights",
feet="Taeon Boots"
}

sets.precast.JA['Ancient Circle'] = { legs="Vishap Brais" }
sets.TreasureHunter = {waist="Chaac Belt"}
sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {
})

sets.precast.JA['Soul Jump'] = set_combine(sets.precast.JA.Jump, {
legs="Peltast's Cuissots"
})

sets.precast.JA['Spirit Jump'] = set_combine(sets.precast.JA.Jump, {
legs="Taeon tights"
--feet="Peltast's Schynbalds"
})

sets.precast.JA['Super Jump'] = sets.precast.JA.Jump
sets.precast.JA['Spirit Link'] = {hands="Lancer's Vambraces +2", head="Vishap Armet +1"}
sets.precast.JA['Call Wyvern'] = {body="Wyrm Mail"}
sets.precast.JA['Deep Breathing'] = {}
sets.precast.JA['Spirit Surge'] = {}

-- Healing Breath sets
sets.HB = {
ammo="Ginsen",
head="Wyrm Armet",
neck="Lancer's Torque",
ear1="Steelflash Earring",
ear2="Bladeborn Earring",
body="Acro Surcoat",
hands="Cizin Mufflers +1",
ring1="Dark Ring",
ring2="K'ayres Ring",
back="Updraft mantle",
waist="Glassblower's Belt",
legs="Vishap Brais",
feet="Wym. Greaves +2"}

-- Waltz set (chr and vit)
sets.precast.Waltz = {
head="Yaoyotl Helm",
back="Bleating Mantle"}

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

-- Fast cast sets for spells
sets.precast.FC = {
ammo="Impatiens",
head="Cizin Helm",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
hands=" Gloves",
ring1="Prolix Ring"}
-- Midcast Sets

sets.midcast.FastRecast = {
head="Otomi Helm",
hands="Umuthi Gloves",
legs="Ares' Flanchard +1",
feet="Ejekamal Boots",}

sets.midcast.Breath = set_combine(sets.midcast.FastRecast, { head="Wyrm Armet"})
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {}

sets.precast.WS = {
ammo="Thew Bomblet",
head="Yaoyotl Helm",
neck="Fotia gorget",
body="Phorcys korazin",
ear1="Brutal Earring",
ear2="Moonshade Earring",
hands={name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2'}},
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Letalis Mantle",
waist="Windbuffet Belt +1",
legs="Taeon Tights",
feet="Acro leggings"}

sets.precast.WS.Acc = set_combine(sets.precast.WS, {
back="Updraft Mantle",
head="Yaoyotl Helm",
legs="Acro Breeches"})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.

sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {
neck="Fotia Gorget",
waist="Fotia Belt"})

sets.precast.WS['Stardiver'].Mid = set_combine(sets.precast.WS['Stardiver'], {
head="Yaoyotl Helm",
back="Updraft Mantle"})

sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {neck="Shadow Gorget",waist="Soil Belt"})

sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS, {
neck="Breeze Gorget",
body="Phorcys Korazin",
back="Buquwik Cape",
waist="Windbuffet Belt +1",
back="Updraft Mantle"})

sets.precast.WS["Camlann's Torment"].Mid = set_combine(sets.precast.WS["Camlann's Torment"], {
head="Yaoyotl Helm",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
back="Updraft Mantle"})

sets.precast.WS["Camlann's Torment"].Acc = set_combine(sets.precast.WS["Camlann's Torment"].Mid, {})

sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {
waist="Windbuffet Belt +1",
legs="Peltast's cuissots"})

sets.precast.WS['Drakesbane'].Mid = set_combine(sets.precast.WS['Drakesbane'], {
back={name="Updraft Mantle", augments={'STR+2','Weapon skill damage +3%','Pet: Damage taken -3%'}},
head="Yaoyotl Helm",
hands={name="Taeon Gloves", augments={'STR+9','Accuracy+18','"Triple Atk."+2'}},})

sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS['Drakesbane'].Mid, {hands="Mikinaak Gauntlets"})
-- Sets to return to when not performing an action.
-- Resting sets
sets.resting = {
head="Twilight Helm",
neck="Twilight Torque",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Twilight Mail",
hands="Cizin Mufflers +1",
ring1="Dark Ring",
ring2="Paguroidea Ring",
back="Repulse Mantle",
legs="Crimson Cuisses",
feet="Whirlpool Greaves"
}

-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)


sets.idle = {
head="Twilight Helm",
neck="Wiglen gorget",
body="Ares' Cuirass +1",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
waist="Flume Belt +1",
legs="Blood cuisses",
feet="Phorcys schuhs",
back="Repulse mantle"
}
sets.idle.Regen = set_combine(sets.idle, {
head="Twilight Helm",
body="Ares' Cuirass +1",
})
sets.idle.Weak = set_combine(sets.idle, {
head="Twilight Helm",
body="Twilight Mail",
})
sets.idle.PDT = sets.PDT
-- Defense sets
sets.PDT = {
ammo="Ginsen",
head="Cizin helm",
neck="Twilight Torque",
ear1="Bladeborn Earring",
ear2="Steelflash Earring",
body="Emet Harness +1",
hands="Umuthi gloves",
ring1="Defending Ring",
ring2="Dark Ring",
back="Repulse Mantle",
waist="Flume Belt +1",
legs="Cizin Breeches",
feet="Phorcys schuhs"
}
sets.defense.Reraise = set_combine(sets.defense.PDT, {
head="Twilight Helm",
body="Twilight Mail"
})
sets.defense.MDT = set_combine(sets.defense.PDT, {
back="Engulfer Cape +1"
})
sets.Kiting = {legs="Blood Cuisses"}
sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
-- Engaged sets
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group

sets.engaged = {
ammo="Hagneia stone",
head="Taeon chapeau",
neck="Asperity necklace",
ear1="Bladeborn earring",
ear2="Steelflash Earring",
body="Xaddi mail",
hands="Acro gauntlets",
--hands={name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2'}},
ring1="Rajas Ring",
ring2="Oneiros Ring",
back="Letalis Mantle",
waist="Windbuffet Belt +1",
legs="Taeon Tights",
feet="Acro leggings"}

sets.engaged.STP = set_combine(sets.engaged, {
head="Yaoyotl Helm",
body="Peltast's plackart",
hands="Acro guantlets",
ring2="K'ayres ring",
feet="Mikinaak greaves"
})

sets.engaged.Acc = set_combine(sets.engaged.Mid, {
head="Yaoyotl helm",
neck="Iqabi Necklace",
waist="Anguinus Belt",
ring1="Mars's Ring",
ring2="Enlivened ring",
back="Updraft Mantle",
legs="Taeon tights",
feet="Taeon boots"})

sets.engaged.PDT = set_combine(sets.engaged, {
head="Ighwa Cap",
neck="Twilight Torque",
body="Emet Harness +1",
ring2="Patricius Ring",
hands="Cizin Mufflers +1",
back="Repulse Mantle",
legs="Cizin Breeches +1",
feet="Cizin Greaves +1"})


sets.engaged.Acc.PDT = set_combine(sets.engaged.Acc, {
head="Ighwa Cap",
ring2="Patricius Ring",
body="Emet Harness +1",
hands="Cizin Mufflers +1",
back="Repulse Mantle",
legs="Cizin Breeches +1",})

sets.engaged.War = sets.engaged
sets.engaged.War.ACC= sets.engaged.Acc
sets.engaged.War.STP= sets.engaged.STP

sets.engaged.Reraise = set_combine(sets.engaged, {
head="Twilight Helm",
body="Twilight Mail"})

sets.engaged.Acc.Reraise = sets.engaged.Reraise
end
