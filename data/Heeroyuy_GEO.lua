-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
require 'organizer-lib'
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')

end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 180
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant', 'Burst')
    state.IdleMode:options('Normal', 'PDT')

    gear.default.weaponskill_waist = "Windbuffet Belt +1"

    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
include('Augments.lua')

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga', 
        'Stonera', 'Watera', 'Aerora', 'Fira', 'Blizzara', 'Thundara',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

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
    sets.precast.JA['Life Cycle'] = {head="Azimuth Hood +1", body="Geomancy Tunic"}
    sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1", hands="Bagua Mitaines +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}

    -- Fast cast sets for spells

    sets.precast.FC = {
        main=gear.PetSolstice,
		sub="Culminus",
		ranged="Dunna",
        head=gear.MerlinicHoodFC,
		neck="Orunmila's torque",
    	ear1="Enchanter earring +1",
        ear2="Loquacious Earring",
        body="Anhur robe",
		hands="Helios gloves",
        ring1="Prolix Ring",
     	ring2="Weather. Ring",
        back="Lifestream cape",
        waist="Witful Belt",
        legs="Geomancy Pants +1",
        feet=gear.MerlinicCrackowsFC
    }

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        --main="Tamaxchi",
        --sub="Genbu's Shield",
        --back="Pahtli Cape"
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        hands="Bagua Mitaines +1",
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
        ammo="Dosis Tathlum",
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
	    head=gear.MerlinicHoodFC, --15%
        ear1="Enchanter earring +1", --2%
		ear2="Loquacious earring", --2%
        body="Anhur robe", -- 10%
        hands="Helios gloves", -- 5%
        ring1="Prolix Ring", --2%
	    ring2="Weather. ring", --5%
        back="Lifestream cape", --7%
        waist="Witful Belt", -- 4%
        legs="Geomancy Pants +1", -- 11%
	    feet=gear.MerlinicCrackowsFC --9%
    }

    sets.midcast.Geomancy = {
		main=gear.PetSolstice,
		sub="Genbu's shield",
        range="Dunna", 
        head="Azimuth Hood +1", -- 15
		neck="Incanter's torque", --10
		body="Bagua Tunic +1", -- 12
        hands="Geomancy Mitaines +2", -- 17 
		ring1="Stikini ring",
		ring2="Stikini ring",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +18','Pet: Damage taken -3%',}}, -- 15
        legs="Azimuth tights",
        --feet="Azimuth gaiters +1"
		feet="Medium's sabots"
    }

    sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
        legs="Bagua Pants",
		--feet="Azimuth gaiters +1"
		feet="Medium's sabots"
    })

    sets.midcast.Cure = {
     	main="Serenity",
        sub="Oneiros grip",
		body="Vrikodara jupon",
		hands="Weatherspoon cuffs +1",
		}
        
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

    sets.midcast.HighTierNuke = {
    main=gear.NukeSolstice,
	sub="Culminus",
    ammo="Witchstone",
	head=gear.MerlinicHoodMB,
	neck="Eddy necklace",
	ear1="Friomisi earring",
	ear2="Barkarole earring",
	body="Shamash Robe",
	hands="Amalric gages",
	ring1="Strendu ring",
	ring2="Mujin band",
	back="Seshaw cape",
	waist="Refoccilation stone",
	legs=gear.MerlinicShalwarMB,
	feet=gear.MerlinicCrackowsMB
    }
    
    sets.midcast.HighTierNuke.Resistant = set_combine(sets.midcast.HighTierNuke, {
	
        lear="Gwati Earring", 
        rear="Barkarole Earring",
        ring1="Weather. Ring",
        ring2="Sangoma Ring",
        --feet="Bokwus Boots"
    })
	sets.midcast.HighTierNuke.Burst = {
	main=gear.NukeSolstice,
	sub="Culminus",
    ammo="Witchstone",
	head=gear.MerlinicHoodMB,
	neck="Mizukage-no-Kubikazari",
	ear1="Friomisi earring",
	ear2="Barkarole earring",
	body="Shamash Robe",
	hands="Amalric gages",
	ring1="Strendu ring",
	ring2="Mujin band",
	back="Seshaw cape",
	waist="Refoccilation stone",
	legs=gear.MerlinicShalwarMB,
	feet=gear.MerlinicCrackowsMB
	}
	
    sets.precast.JA['Concentric Pulse'] = sets.midcast.HightTierNuke

    sets.midcast.LowTierNuke = set_combine(sets.midcast.HighTierNuke, {
	main=gear.NukeSolstice,
	sub="Culminus",
    ammo="Witchstone",
	head=gear.MerlinicHoodMB,
	neck="Eddy necklace",
	ear1="Friomisi earring",
	ear2="Barkarole earring",
	body="Shamash Robe",
	hands="Amalric gages",
	ring1="Strendu ring",
	ring2="Mujin band",
	back="Seshaw cape",
	waist="Refoccilation stone",
	legs=gear.MerlinicShalwarMB,
	feet=gear.MerlinicCrackowsMB
    })
    
    sets.midcast.LowTierNuke.Resistant = set_combine(sets.midcast.LowTierNuke, {
        lear="Gwati Earring", 
        rear="Barkarole Earring",
	ring1="Weather. Ring",
        ring2="Sangoma Ring"
    })
	
	sets.midcast.LowTierNuke.Burst = {
	main=gear.NukeSolstice,
	sub="Culminus",
    ammo="Dosis tathlum",
	head=gear.MerlinicHoodMB,
	neck="Mizukage-no-Kubikazari",
	ear1="Friomisi earring",
	ear2="Barkarole earring",
	body="Shamash Robe",
	hands="Amalric gages",
	ring1="Strendu ring",
	ring2="Mujin band",
	back="Seshaw cape",
	waist="Refoccilation stone",
	legs=gear.MerlinicShalwarMB,
	feet=gear.MerlinicCrackowsMB
	}
    sets.midcast.Macc = { 
        main=gear.PetSolstice,
        sub="Culminus", 
        ammo="Dunna",
        head="Jhakri coronal +1",
        neck="Sanctity necklace",		
        lear="Gwati Earring", 
        rear="Barkarole Earring",
        body="Shamash robe",
        hands="Jhakri cuffs +1",
        ring1="Stikini ring", 
        ring2="Stikini Ring",
        waist="Eschan stone", 
		legs=gear.MerlinicShalwarMB,
		feet="Jhakri pigaches +1"
    }

sets.midcast.Macc.Burst = { 
        main=gear.NukeSolstice,
        sub="Culminus", 
        ammo="Dunna",
        head="Jhakri coronal +1",
        neck="Sanctity necklace",		
        lear="Gwati Earring", 
        rear="Barkarole Earring",
        body="Shamash robe",
        hands="Jhakri cuffs +1",
        ring1="Stikini ring", 
        ring2="Stikini Ring",
        waist="Eschan stone", 
		legs=gear.MerlinicShalwarMB,
		feet="Jhakri pigaches +1"
    }
sets.precast.Impact = {
        main=gear.PetSolstice,
		sub="Culminus",
		ranged="Dunna",
        neck="Orunmila's torque",
    	ear1="Enchanter earring +1",
        ear2="Loquacious Earring",
        body="Twilight Cloak",
		hands="Helios gloves",
        ring1="Prolix Ring",
     	ring2="Weather. Ring",
        back="Lifestream cape",
        waist="Witful Belt",
        legs="Geomancy Pants +1",
        feet=gear.MerlinicCrackowsFC
		
    }
    
    sets.midcast.Aspir = set_combine(sets.midcast.Macc, { 
        head="Bagua Galero",
        neck="Incanter's torque", 
        body="Geomancy tunic",
        waist="Fucho-no-Obi",
        legs="Azimuth Tights",
		feet=gear.MerlinicCrackowsFC
    })
    sets.midcast.Drain = sets.midcast.Aspir
    sets.midcast.Stun = sets.midcast.Macc
    
    sets.midcast['Enfeebling Magic'] = sets.midcast.Macc
    sets.midcast.ElementalEnfeeble = sets.midcast.Macc
	
    sets.midcast.Impact = { 
        main=gear.NukeSolstice,
        sub="Culminus", 
        ammo="Dunna",
        neck="Sanctity necklace",		
        lear="Gwati Earring", 
        rear="Barkarole Earring",
        body="Twilight cloak",
        hands="Jhakri cuffs +1",
        ring1="Stikini ring", 
        ring2="Stikini Ring",
        waist="Eschan stone", 
		legs=gear.MerlinicShalwarMB,
		feet="Jhakri pigaches +1"
    }

	sets.midcast['Enhancing Magic'] = {
        neck="Colossus's Torque", 
		ear1="Andoa earring",
        body="Anhur Robe",
        hands="Ayao's Gloves",
		ring1="Stikini ring",
		ring2="Stikini ring"
		}
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {
		main="Bolelabunga",
        sub="Genbu's Shield",
        range="Dunna",
        head="Befouled crown",
        neck="Loricate torque +1",
        ear1="Ethereal Earring",
        ear2="Infused Earring",
        body="Shamash Robe",
        hands="Bagua Mitaines +1",
        ring1="Vocane Ring",
        ring2="Defending Ring",
        back="Umbra cape",
        waist="Fucho-no-Obi",
        legs="Assid. pants +1",
        feet="Geomancy Sandals +2"}


    -- Idle sets
    sets.idle = {
        main="Bolelabunga",
        sub="Genbu's Shield",
        range="Dunna",
        head="Befouled crown",
        neck="Loricate torque +1",
        ear1="Ethereal Earring",
        ear2="Infused Earring",
        body="Shamash Robe",
        hands="Bagua Mitaines +1",
        ring1="Vocane Ring",
        ring2="Defending Ring",
        back="Umbra cape",
        waist="Fucho-no-Obi",
        legs="Assid. pants +1",
        feet="Geomancy Sandals +2"
    }
    sets.idle.PDT = set_combine(sets.idle, {
        head="Hagondes hat",
		neck="Loricate torque +1",
		body="Shamash Robe",
        hands="Geomancy Mitaines +2",
	    ring1="Vocane ring",
        ring2="Defending Ring",
        back="Umbra cape",
		feet="Azimuth gaiters +1"
    })

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.idle, {
		main=gear.PetSolstice,
		sub="Genbu's shield",
        head="Azimuth Hood +1",
		ear1="Handler's earring",
		ear2="Handler's earring +1",
		body="Shamash Robe",
        hands="Geomancy Mitaines +2",
		ring1="Vocane ring",
		ring2="Defending ring",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Pet: Damage taken -3%','Damage taken-4%',}},
		waist="Isa belt",
		legs="Psycloth Lappas",
        feet="Azimuth gaiters +1"
    })

    sets.idle.PDT.Pet = {
		main="Mafic cudgel",
	    sub="Genbu's shield",
		range="Dunna",
        head="Azimuth Hood +1",
		ear1="Handler's earring",
		ear2="Handler's earring +1",
		body="Mallquis Saio",
        hands="Geomancy Mitaines +2",
		ring1="Vocane ring",
		ring2="Defending ring",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Pet: Damage taken -3%','Damage taken-4%',}},
		waist="Isa belt",
		legs="Psycloth Lappas",
        feet="Azimuth gaiters +1"}

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {
        legs="Assid. pants +1", 
        feet="Geomancy Sandals +2",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +3','Pet: Damage taken -3%','Damage taken-4%',}},
        
    })
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {
        legs="Psycloth lappas", 
    })
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {
        legs="Psycloth lappas", 
        feet="Geomancy Sandals +2"
    })
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {
        legs="Psycloth lappas", 
    })

    sets.idle.Town = sets.idle

    sets.idle.Weak = sets.idle

    -- Defense sets

    sets.defense.PDT = {
        range="Dunna",
        head="Hike Khat",
        neck="Loricate torque +1",
        ear1="Ethereal Earring",
        body="Mallquis saio",
        hands="Geomancy Mitaines +2",
        ring1="Defending Ring",
        ring2="Vocane Ring",
        back="Moonbeam Cape",
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
        hands="Geomancy Mitaines +2",
        ring1="Defending Ring",
        ring2="Shadow Ring",
        back="Umbra Cape",
        waist="Yamabuki-no-Obi",
        --legs="Bokwus Slops",
        --feet="Hagondes Sabots"
    }

    sets.Kiting = {feet="Geomancy sandals +2"}

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
        hands="Geomancy Mitaines +2",
        ring1="Rajas Ring",
        ring2="Patricius Ring",
        back="Kayapa Cape",
        waist="Windbuffet Belt +1",
        legs="Hagondes Pants",
        feet="Hagondes Sabots"
    }

    --------------------------------------
    -- Custom buff sets
		
		
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
        end
    end
end
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
function job_status_change(newStatus, oldStatus, eventArgs)
    if newStatus == 'Engaged' then
        -- nothing yet
   -- elseif newStatus == 'Idle' then
   --     determine_idle_group()
    end
end

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        elseif spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
            if lowTierNukes:contains(spell.english) then
                return 'LowTierNuke'
            else
                return 'HighTierNuke'
            end
        end

    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Handle zone specific rules
windower.register_event('Zone change', function(new,old)
    determine_idle_group()
end)

function determine_idle_group()
    classes.CustomIdleGroups:clear()
    if areas.Adoulin:contains(world.area) then
    	classes.CustomIdleGroups:append('Adoulin')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(10, 5)
end
