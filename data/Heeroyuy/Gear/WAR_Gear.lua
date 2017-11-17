      
        --------------------------------------
        -- Precast sets
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


       
        -- Sets to apply to arbitrary JAs
        sets.precast.JA.Berserk = {body="Pumm. Lorica +1",feet="Agoge Calligae +1"}
    sets.precast.JA['Aggressor'] = {head="Pumm. Mask +1",body="Agoge Lorica +1"}
    sets.precast.JA['Mighty Strikes'] = {hands="Agoge Mufflers +1"}
        sets.precast.JA['Blood Rage'] = {body="Rvg. Lorica +2"}
        sets.precast.JA['Warcry'] = {head="Agoge Mask +1"}
        sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk",feet="Agoge Calligae +1"}
        -- Sets to apply to any actions of spell.type
        sets.precast.Waltz = {}
               
        -- Sets for specific actions within spell.type
        sets.precast.Waltz['Healing Waltz'] = {}
 
    -- Sets for fast cast gear for spells
        sets.precast.FC = {ear2="Loquacious Earring"}
 
    -- Fast cast gear for specific spells or spell maps
        sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
 
        -- Weaponskill sets
        sets.precast.WS = {
ammo="Yetshila",
head="Otomi Helm",
neck="Asperity necklace",
ear1="Moonshade Earring",
ear2="Brutal Earring",
body="Phorcys korazin",
hands="Xaddi guantlets",
ring1="Rajas Ring",
ring2="Oneiros Ring",
back="Mauler's Mantle",
waist="Windbuffet Belt +1",
legs="Cizin breeches",
feet="Ejekamal boots"}
        sets.precast.WS.AccLow = set_combine(sets.precast.WS, {})
        sets.precast.WS.AccHigh = set_combine(sets.precast.WS.AccLow, {})
        sets.precast.WS.Attack = set_combine(sets.precast.WS, {})
        sets.precast.WS.MS = set_combine(sets.precast.WS, {ammo="Yetshila +1",back="Cavaros Mantle",feet="Huginn Gambieras"})
       
        -- Specific weaponskill sets.
        sets.precast.WS['Upheaval'] = {}
        sets.precast.WS['Upheaval'].AccLow = set_combine(sets.precast.WS['Upheaval'], {})
        sets.precast.WS['Upheaval'].AccHigh = set_combine(sets.precast.WS['Upheaval'].AccLow, {})
        sets.precast.WS['Upheaval'].Attack = set_combine(sets.precast.WS['Upheaval'], {})
        sets.precast.WS['Upheaval'].MS = set_combine(sets.precast.WS['Upheaval'], {ammo="Yetshila +1",back="Cavaros Mantle",feet="Huginn Gambieras"})
       
        sets.precast.WS['Ukko\'s Fury'] = {}
        sets.precast.WS['Ukko\'s Fury'].AccLow = set_combine(sets.precast.WS['Ukko\'s Fury'], {})
        sets.precast.WS['Ukko\'s Fury'].AccHigh = set_combine(sets.precast.WS['Ukko\'s Fury'].AccLow, {})
        sets.precast.WS['Ukko\'s Fury'].Attack = set_combine(sets.precast.WS['Ukko\'s Fury'], {})
        sets.precast.WS['Ukko\'s Fury'].MS = set_combine(sets.precast.WS['Ukko\'s Fury'], {})
       
        sets.precast.WS['King\'s Justice'] = set_combine(sets.precast.WS, {})
        sets.precast.WS['King\'s Justice'].AccLow = set_combine(sets.precast.WS['King\'s Justice'], {})
        sets.precast.WS['King\'s Justice'].AccHigh = set_combine(sets.precast.WS['King\'s Justice'].AccLow, {})
        sets.precast.WS['King\'s Justice'].Attack = set_combine(sets.precast.WS['King\'s Justice'], {})
        sets.precast.WS['King\'s Justice'].MS = set_combine(sets.precast.WS['King\'s Justice'], {ammo="Yetshila +1",back="Cavaros Mantle",feet="Huginn Gambieras"})
       
        sets.precast.WS['Metatron Torment'] = set_combine(sets.precast.WS, {})
        sets.precast.WS['Metatron Torment'].AccLow = set_combine(sets.precast.WS['Metatron Torment'], {})
        sets.precast.WS['Metatron Torment'].AccHigh = set_combine(sets.precast.WS['Metatron Torment'].AccLow, {})
        sets.precast.WS['Metatron Torment'].Attack = set_combine(sets.precast.WS['Metatron Torment'], {})
        sets.precast.WS['Metatron Torment'].MS = set_combine(sets.precast.WS['Metatron Torment'], {ammo="Yetshila +1",back="Cavaros Mantle",feet="Huginn Gambieras"})
       
        sets.precast.WS['Fell Cleave'] = set_combine(sets.precast.WS, {})
        sets.precast.WS['Fell Cleave'].AccLow = set_combine(sets.precast.WS['Fell Cleave'], {})
        sets.precast.WS['Fell Cleave'].AccHigh = set_combine(sets.precast.WS['Fell Cleave'].AccLow, {})
        sets.precast.WS['Fell Cleave'].Attack = set_combine(sets.precast.WS['Fell Cleave'], {})
        sets.precast.WS['Fell Cleave'].MS = set_combine(sets.precast.WS['Fell Cleave'], {ammo="Yetshila +1",back="Cavaros Mantle",feet="Huginn Gambieras"})
       
        sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
        sets.precast.WS['Resolution'].AccLow = set_combine(sets.precast.WS['Resolution'], {})
        sets.precast.WS['Resolution'].AccHigh = set_combine(sets.precast.WS['Resolution'].AccLow, {})
        sets.precast.WS['Resolution'].Attack = set_combine(sets.precast.WS['Resolution'], {})
        sets.precast.WS['Resolution'].MS = set_combine(sets.precast.WS['Resolution'], {ammo="Yetshila +1",back="Cavaros Mantle",feet="Huginn Gambieras"})
       
 
        --------------------------------------
        -- Midcast sets
        --------------------------------------
 
    -- Generic spell recast set
        sets.midcast.FastRecast = {}
               
        -- Specific spells
        sets.midcast.Utsusemi = {}
 
       
        --------------------------------------
        -- Idle/resting/defense/etc sets
        --------------------------------------
       
        -- Resting sets
        sets.resting = {}
       
 
        -- Idle sets
        sets.idle = {
ammo="Yetshila +1",
head="Felistris Mask",
neck="Twilight Torque",
body="Ares' cuirass +1",
hands="Agoge Mufflers +1",
ring1="Dark Ring",
ring2="Defending Ring",
back="Repulse Mantle",
waist="Flume Belt +1",
legs="Cizin breeches",
feet="Hermes' Sandals"}
 
        sets.idle.Town = {
ammo="Yetshila +1",
head="Gavialis Helm",
neck="Twilight Torque",
ear1="Tripudio Earring",
ear2="Brutal Earring",
body="Ares' cuirass +1",
hands="Cizin Mufflers +1",
ring1="Ifrit Ring +1",
ring2="Ifrit Ring +1",
back="Mauler's Mantle",
waist="Flume Belt",
legs="Hachiryu Haidate",
feet="Hermes' Sandals"}
       
        sets.idle.Regen = {
ammo="Angha Gem",
head="Twilight helm",
neck="Wiglen Gorget",
body="Ares' cuirass +1",
ring1="Sheltered Ring",
ring2="Paguroidea Ring",
back="Repulse Mantle",
waist="Flume belt +1",
feet="Hermes' Sandals"}
       
        sets.idle.Weak = {}
       
        -- Defense sets
        sets.defense.PDT = {}
        sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})
        sets.defense.MDT = {}
 
    -- Gear to wear for kiting
        sets.Kiting = {feet="Hermes' Sandals"}
 
        --------------------------------------
        -- Engaged sets
        --------------------------------------
 
        -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
        -- sets if more refined versions aren't defined.
        -- If you create a set with both offense and defense modes, the offense mode should be first.
        -- EG: sets.engaged.Dagger.Accuracy.Evasion
       
        -- Normal melee group
        -- If using a weapon that isn't specified later, the basic engaged sets should automatically be used.
        -- Equip the weapon you want to use and engage, disengage, or force update with f12, the correct gear will be used; default weapon is whats equip when file loads.

        sets.engaged = {
ammo="Yetshila",
head="Yaoyotl helm",
neck="Asperity necklace",
ear1="Steelflash Earring",
ear2="Bladeborn Earring",
body={ name="Xaddi Mail", augments={'Attack+15','Accuracy+10','"Store TP"+3',}},
hands="Cizin Mufflers",
ring1="K'ayres Ring",
ring2="Rajas Ring",
back="Mauler's Mantle",
waist="Windbuffet Belt +1",
legs="Xaddi cuisses",
feet="Mikinaak greaves"}

        sets.engaged.AccLow = set_combine(sets.engaged, {
neck="Iqabi necklace",
hands="Buremte gloves",
ring1="Enlivened ring",
ring2="Mars's ring",
waist="Anguinus belt",
feet="Ejekamal boots"})

        sets.engaged.AccHigh = set_combine(sets.engaged.AccLow, {head="Yaoyotl Helm"})
        sets.engaged.PDT = set_combine(sets.engaged, {
head="Ighwa Cap",
neck="Agitator's collar",
body="Emet harness +1",
hands="Umuthi gloves",
ring1="Patricius ring",
legs="Cizin breeches",
feet="Ejekamal boots"})
        sets.engaged.AccLow.PDT = set_combine(sets.engaged.PDT, {})
        sets.engaged.AccHigh.PDT = set_combine(sets.engaged.AccLow.PDT, {})
       
        sets.engaged.Conqueror = {}
        sets.engaged.Conqueror.AccLow = set_combine(sets.engaged.Conqueror, {})
        sets.engaged.Conqueror.AccHigh = set_combine(sets.engaged.Conqueror.AccLow, {})
        sets.engaged.Conqueror.PDT = set_combine(sets.engaged.Conqueror, {})
        sets.engaged.Conqueror.AccLow.PDT = set_combine(sets.engaged.Conqueror.PDT, {})
        sets.engaged.Conqueror.AccHigh.PDT = set_combine(sets.engaged.Conqueror.AccLow.PDT, {})
        -- Conqueror Aftermath Lv.3 sets
        sets.engaged.Conqueror.AM3 = {}
        sets.engaged.Conqueror.AccLow.AM3 = set_combine(sets.engaged.Conqueror.AM3, {})
        sets.engaged.Conqueror.AccHigh.AM3 = set_combine(sets.engaged.Conqueror.AccLow.AM3, {})
        sets.engaged.Conqueror.PDT.AM3 = set_combine(sets.engaged.Conqueror.AM3, {})
        sets.engaged.Conqueror.AccLow.PDT.AM3 = set_combine(sets.engaged.Conqueror.PDT.AM3, {})
        sets.engaged.Conqueror.AccHigh.PDT.AM3 = set_combine(sets.engaged.Conqueror.AccLow.PDT.AM3, {})
       
        sets.engaged.Ukonvasara = {}
        sets.engaged.Ukonvasara.AccLow = set_combine(sets.engaged.Ukonvasara, {})
        sets.engaged.Ukonvasara.AccHigh = set_combine(sets.engaged.Ukonvasara.AccLow, {})
        sets.engaged.Ukonvasara.PDT = set_combine(sets.engaged.Ukonvasara, {})
        sets.engaged.Ukonvasara.AccLow.PDT = set_combine(sets.engaged.Ukonvasara.PDT, {})
        sets.engaged.Ukonvasara.AccHigh.PDT = set_combine(sets.engaged.Ukonvasara.AccLow.PDT, {})
       
        sets.engaged.Bravura = {}
        sets.engaged.Bravura.AccLow = set_combine(sets.engaged.Bravura, {})
        sets.engaged.Bravura.AccHigh = set_combine(sets.engaged.Bravura.AccLow, {})
        sets.engaged.Bravura.PDT = set_combine(sets.engaged.Bravura, {})
        sets.engaged.Bravura.AccLow.PDT = set_combine(sets.engaged.Bravura.PDT, {})
        sets.engaged.Bravura.AccHigh.PDT = set_combine(sets.engaged.Bravura.AccLow.PDT, {})
        -- Bravura Aftermath sets, will only apply if aftermath, bravura, and hybridmode are on
        sets.engaged.Bravura.PDT.AM = set_combine(sets.engaged.Bravura, {})
        sets.engaged.Bravura.AccLow.PDT.AM = set_combine(sets.engaged.Bravura.PDT.AM , {})
        sets.engaged.Bravura.AccHigh.PDT.AM = set_combine(sets.engaged.Bravura.AccLow.PDT.AM , {})
       
        sets.engaged.Ragnarok = {}
        sets.engaged.Ragnarok.AccLow = set_combine(sets.engaged.Ragnarok, {})
        sets.engaged.Ragnarok.AccHigh = set_combine(sets.engaged.Ragnarok.AccLow, {})
        sets.engaged.Ragnarok.PDT = set_combine(sets.engaged.Ragnarok, {})
        sets.engaged.Ragnarok.AccLow.PDT = set_combine(sets.engaged.Ragnarok.PDT, {})
        sets.engaged.Ragnarok.AccHigh.PDT = set_combine(sets.engaged.Ragnarok.AccLow.PDT, {})
       
        --------------------------------------
        -- Custom buff sets
        --------------------------------------
        -- Mighty Strikes TP Gear, combines with current melee set.
        sets.buff.MS = {ammo="Yetshila +1",neck="Portus Collar",back="Cavaros Mantle",feet="Huginn Gambieras"}

        -- Day/Element Helm, if helm is not in inventory or wardrobe, this will not fire, for those who do not own one
        sets.WSDayBonus = {head="Gavialis Helm"}

        -- Earrings to use with Upheaval when TP is 3000
        sets.VIT_earring = {ear1="Terra's Pearl",ear2="Brutal Earring"}

        -- Earrings to use with all other weaponskills when TP is 3000
        sets.STR_earring = {ear1="Kokou's Earring",ear2="Brutal Earring"}

        -- Mantle to use with Upheaval on Darksday
        sets.Upheaval_shadow = {back="Shadow Mantle"}