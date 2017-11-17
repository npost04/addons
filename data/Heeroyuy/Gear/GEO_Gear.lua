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

   --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life Cycle'] = {head="Azimuth Hood", body="Geomancy Tunic"}
    sets.precast.JA['Full Circle'] = {hands="Bagua Mitaines"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}

    -- Fast cast sets for spells

    sets.precast.FC = {
        --ammo="Impatiens",
        head="Nahtirah Hat",
    	ear1="Enchanter earring +1",
        ear2="Loquacious Earring",
        body="Anhur robe",
        ring1="Prolix Ring",
     	ring2="Weather. Ring",
        back="Swith Cape +1",
        waist="Witful Belt",
        legs="Geomancy Pants +1",
        feet="Helios Boots"
    }

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        --main="Tamaxchi",
        --sub="Genbu's Shield",
        --back="Pahtli Cape"
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        neck="Stoicheion Medal",
        hands="Bagua Mitaines",
    })

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nahtirah Hat",
        neck=gear.ElementalGorget,
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Vanir Cotehardie",
        hands="Yaoyotl Gloves",
        ring1="Karieyh Ring",
        ring2="Ifrit Ring +1",
        back="Buquwik Cape",
        waist=gear.ElementalBelt,
        legs="Hagondes Pants",
        feet="Hagondes Sabots"
    }

    sets.precast.WS['Flash Nova'] = {
        --ammo="Dosis Tathlum",
        head="Hagondes Hat",
        neck="Eddy Necklace",
        ear1="Friomisi Earring",
        ear2="Crematio Earring",
        body="Hagondes Coat",
        hands="Yaoyotl Gloves",
        ring1="Acumen Ring",
        ring2="Strendu Ring",
        back="Toro Cape",
        waist="Snow Belt",
        legs="Hagondes Pants",
        feet="Hagondes Sabots"
    }

    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = {
        ear2="Loquacious Earring",
        body="Helios Jacket", -- 3%
        hands="Helios gloves", -- 3%
        ring1="Prolix Ring",
	ring2="Weather. ring",
        back="Swith cape +1",
        waist="Witful Belt", -- 4%
        legs="Geomancy Pants +1", -- 10%
	feet="Helios boots"
    }

    sets.midcast.Geomancy = {
        range="Dunna", 
        head="Azimuth Hood", -- 10
		neck="Incanter's torque", --10
		body="Bagua Tunic +1", -- 12
        hands="Geomancy Mitaines", -- 15        
        back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +18','Pet: Damage taken -3%',}}, -- 15
        legs="Azimuth tights",
        feet="Azimuth gaiters +1"
    }

    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        legs="Bagua Pants",
		feet="Azimuth gaiters +1"
    })

    sets.midcast.Cure = sets.midcast.FastRecast
        --main="Tamaxchi",
        --sub="Genbu's Shield",
        --body="Heka's Kalasiris",
        --ring1="Haoma Ring",
        --ring2="Sirona's Ring",
        --back="Swith Cape +1",
        --legs="Nares Trews",
        --feet="Hagondes Sabots"
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

    sets.midcast.HighTierNuke = {
        main={ name="Lehbrailg +2", augments={'DMG:+11','MND+5','"Mag.Atk.Bns."+18',}},
        sub="Mephitis grip",
        ammo="Witchstone",
        head="Geomancy Galero",
        neck="Eddy Necklace",
        ear1="Hecate's Earring",
        ear2="Friomisi Earring",
        body="Hagondes coat",
        hands="Otomi gloves",
        ring1="Acumen Ring",
        ring2="Strendu Ring",
        back="Toro Cape",
        waist="Yamabuki-no-obi", 
        legs="Hagondes pants +1", -- "Azimuth Tights"
        feet="Umbani Boots"
    }
    
    sets.midcast.HighTierNuke.Resistant = set_combine(sets.midcast.HighTierNuke, {
	main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
        ear1="Psystorm Earring",
        ear2="Lifestorm Earring",
        ring1="Weather. Ring",
        ring2="Sangoma Ring",
        --feet="Bokwus Boots"
    })

    sets.precast.JA['Concentric Pulse'] = sets.midcast.HightTierNuke

    sets.midcast.LowTierNuke = set_combine(sets.midcast.HighTierNuke, {
	main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
	head="Buremte hat",
        ring2="Acumen Ring"
    })
    
    sets.midcast.LowTierNuke.Resistant = set_combine(sets.midcast.LowTierNuke, {
        ear1="Psystorm Earring", 
        ear2="Lifestorm Earring",
	ring1="Weather. Ring",
        ring2="Sangoma Ring"
    })

    sets.midcast.Macc = { 
        main={ name="Lehbrailg +2", augments={'DMG:+15','Elem. magic skill +6','Mag. Acc.+20',}},
        sub="Mephitis Grip", 
        ammo="Aureole",
        head="Bagua Galero",
        neck="Eddy Necklace", 
        lear="Lifestorm Earring", 
        rear="Psystorm Earring",
        body="Azimuth Coat",
        hands="Geomancy Mitaines",
        ring1="Weather. Ring", 
        ring2="Sangoma Ring",
        waist="Yamabuki-no-obi", 
    }
    
    sets.midcast.Aspir = set_combine(sets.midcast.Macc, { 
        head="Bagua Galero",
        neck="Dark Torque", 
        ring1="Excelsis Ring",
        body="Geomancy tunic +1",
        waist="Casso Sash",
        --legs="Azimuth Tights",
    })
    sets.midcast.Drain = sets.midcast.Aspir
    sets.midcast.Stun = sets.midcast.Macc
    
    sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast.Macc, {
        waist="Casso Sash",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Pet: Damage taken -3%','Damage taken-4%',}},
        lring="Globidonta Ring",
        feet="Bagua Sandals"
    })
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast.Macc, {
        waist="Casso Sash",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Pet: Damage taken -3%','Damage taken-4%',}},
        lring="Globidonta Ring",
        feet="Bagua Sandals"
    })

	sets.midcast['Enhancing Magic'] = sets.midcast.Macc
        --sub="Fulcio Grip", 
        --neck="Colossus's Torque", 
        --body="Anhur Robe",
        --hands="Ayao's Gloves"
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
        neck="Twilight Torque",
        body="Azimuth Coat",
        hands="Geomancy Mitaines",
        ring1="Dark Ring",
        ring2="Paguroidea Ring",
        --waist="Austerity Belt",
	legs="Assid. pants +1",
    }


    -- Idle sets
    sets.idle = {
        main="Bolelabunga",
        sub="Genbu's Shield",
        range="Dunna",
        head="Wivre hairpin",
        neck="Twilight Torque",
        ear1="Ethereal Earring",
        ear2="Crematio Earring",
        body="Witching Robe",
        hands="Bagua Mitaines",
        ring1="Dark Ring",
        ring2="Defending Ring",
        back="Umbra cape",
        waist="Witful Belt",
        legs="Assid. pants +1",
        feet="Geomancy Sandals"
    }
    sets.idle.PDT = set_combine(sets.idle, {
        head="Hike Khat",
        hands="Geomancy Mitaines",
	ring1="Defending ring",
        ring2="Dark Ring",
        back="Umbra cape",
    })

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {
        head="Azimuth Hood",
        hands="Geomancy Mitaines",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Pet: Damage taken -3%','Damage taken-4%',}},
        feet="Bagua Sandals"
    })

    sets.idle.PDT.Pet = set_combine(sets.idle.Pet, {
        ring2="Patricius Ring",
    })

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {
        legs="Bagua Pants", 
        feet="Geomancy Sandals",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Pet: Damage taken -3%','Damage taken-4%',}},
        feet="Azimuth Gaiters +1"
    })
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {
        legs="Bagua Pants", 
    })
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {
        legs="Bagua Pants", 
        feet="Geomancy Sandals"
    })
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {
        legs="Bagua Pants", 
    })

    sets.idle.Town = sets.idle

    sets.idle.Weak = sets.idle

    -- Defense sets

    sets.defense.PDT = {
        range="Dunna",
        head="Hike Khat",
        neck="Twilight Torque",
        ear1="Ethereal Earring",
        body="Hagondes coat",
        hands="Geomancy Mitaines",
        ring1="Defending Ring",
        ring2="Dark Ring",
        back="Umbra Cape",
        legs="Hagondes Pants +1",
        feet="Hagondes Sabots"
    }

    sets.defense.MDT = {
        range="Dunna",
        head="Nahtirah Hat",
        neck="Wiglen Gorget",
        ear1="Zennaroi Earring",
        ear2="Loquacious Earring",
        body="Azimuth Coat",
        hands="Geomancy Mitaines",
        ring1="Defending Ring",
        ring2="Shadow Ring",
        back="Umbra Cape",
        waist="Yamabuki-no-Obi",
        --legs="Bokwus Slops",
        --feet="Hagondes Sabots"
    }

    sets.Kiting = {feet="Geomancy sandals"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        range="Dunna",
        neck="Iqabi Necklace",
        ear1="Bladeborn Earring",
        ear2="Steelflash Earring",
        body="Azimuth Coat",
        --body="Vanir Cotehardie",
        hands="Geomancy Mitaines",
        ring1="Rajas Ring",
        ring2="Patricius Ring",
        back="Kayapa Cape",
        waist="Windbuffet Belt +1",
        legs="Hagondes Pants",
        feet="Hagondes Sabots"
    }

    --------------------------------------
    -- Custom buff sets