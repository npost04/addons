-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
require 'organizer-lib'
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include('Augments.lua')	
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Sentinel = buffactive.sentinel or false
    state.Buff.Cover = buffactive.cover or false
    state.Buff.Doom = buffactive.Doom or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc', 'PDT', 'HP')
    state.HybridMode:options('Normal', 'HP')
    state.WeaponskillMode:options('Normal', 'Acc', 'HP')
    state.CastingMode:options('Normal', 'SID', 'HP')
    state.PhysicalDefenseMode:options('PDT', 'HP')
    state.MagicalDefenseMode:options('MDT', 'HP')
    state.IdleMode:options('Normal', 'PDT', 'HP', 'Reraise')
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode', 'None', 'MP', 'Knockback', 'MP_Knockback'}
    state.EquipShield = M(True, 'Equip Shield w/Defense')

    update_defense_mode()
    send_command('bind @f12 gs c cycle CastingMode')
    send_command('bind ^f11 gs c cycle MagicalDefenseMode')
    --send_command('bind !f11 gs c cycle ExtraDefenseMode')
    --send_command('bind @f10 gs c toggle EquipShield')
    --send_command('bind @f11 gs c toggle EquipShield')
	send_command('bind !` input /equip sub "Aegis"')
	send_command('bind ^` input /equip sub "Ochain"')
	
    select_default_macro_book()
end

function user_unload()
    send_command('unbind ^f11')
    send_command('unbind !f11')
    send_command('unbind @f10')
    send_command('unbind @f11')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
	include('Augments.lua')
    --------------------------------------
    -- Precast sets
    --------------------------------------
	sets.goldsmithing = {
	head="Shaded spectacles",
	neck="Goldsmith's torque",
	body="Goldsmith's smock",
	ring1="Craftkeeper's ring",
	ring2="Craftmaster's ring"}
	sets.precast.Reprisal = sets.engaged.HP
	
    sets.precast.Enmity = {
	    ammo="Iron gobbet",
		head="Loess barbuta +1",
		neck="Moonbeam necklace",
		body="Souveran cuirass",
		hands="Souv. Handsch. +1",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		back=gear.PldEnmityCape,
		waist="Creed Baudrier",
		legs="Souv. Diechlings +1",
		feet="Eschite greaves",
	    }
	
	sets.precast.HP = {
	    ammo="Staunch tathlum",
        head="Souveran schaller +1",
		neck="Loricate torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonbeam cape",
		waist="Gold moogle belt",
		legs="Souveran Diechlings +1",
		feet="Souveran Schuhs +1"}
	sets.precast.SID = {
	    ammo="Staunch tathlum",--10
		head="Souveran schaller +1",--20
		body="Reverence surcoat +2",
		neck="Moonbeam necklace", --10
		ear2="Knightly earring",--9
		hands="Souveran handschuhs +1", --15
		ring1="Moonbeam Ring",
		ring2="Apeile Ring +1",
		back="Moonbeam Cape",
		legs="Founder's hose",--30
		feet="Odyssean greaves"--15
		} 
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.precast.Enmity,{legs="Caballarius Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.precast.Enmity,{feet="Reverence Leggings +1"})
    sets.precast.JA['Shield Bash'] = set_combine(sets.precast.Enmity,{hands="Caballarius Gauntlets +1", "Knightly earring"})
	
    sets.precast.JA['Sentinel'] = set_combine(sets.precast.Enmity,{feet="Caballarius Leggings"})
    sets.precast.JA['Rampart'] = set_combine(sets.precast.Enmity,{head="Caballarius Coronet"})
    sets.precast.JA['Fealty'] = set_combine(sets.precast.Enmity,{body="Caballarius Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.precast.Enmity,{feet="Creed Sabatons +2"})
    sets.precast.JA['Cover'] = set_combine(sets.precast.Enmity,{head="Reverence Coronet +1"})
    sets.precast.JA['Provoke'] = sets.precast.Enmity
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
        head="Reverence Coronet +1",
        body="Reverence Surcoat +2",
		hands="Reverence Gauntlets +1",
        back="Weard Mantle",
		legs="Reverence Breeches +1",
		feet="Whirlpool Greaves"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Reverence Coronet +1",
        body="Gorney Haubert +1",hands="Reverence Gauntlets +1",ring2="Asklepian Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Reverence Breeches +1",feet="Whirlpool Greaves"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {waist="Chaac Belt"}
    sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC['Reprisal']	= sets.engaged.HP
	
    sets.precast.FC = {
	    ammo="Incantor Stone",
        head="Carmine mask +1",
		ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
		ring2="Prolix Ring",
		back=gear.PldFCCape ,
		legs="Enif Cosciales",
		feet="Odyssean greaves"}
		
	sets.midcast.Utsusemi= {
	    ammo="Incantor Stone",
        head="Carmine mask +1",
		ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
		hands="Leyline gloves",
		ring2="Prolix Ring",
		back=gear.PldFCCape ,
		legs="Founder's hose",
		feet="Odyssean greaves"}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast.FC['Enhancing Magic'].HP = sets.engaged.HP
	
    sets.precast.FC.SID = sets.precast.SID
	sets.precast.FC.HP = {
	    ammo="Staunch tathlum",
        head="Souveran schaller +1",
		neck="Loricate torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonbeam cape",
		waist="Gold moogle belt",
		legs="Souveran Diechlings +1",
		feet="Souveran Schuhs +1"}
	
	sets.precast.FC['Blue magic'] = sets.precast.SID
	sets.precast.FC['Jettatura'] = sets.precast.SID
	sets.precast.FC['Sheep Song'] = sets.precast.SID
	sets.precast.FC['Geist wall'] = sets.precast.SID
	sets.precast.FC['Soporific'] =sets.precast.SID
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined

    sets.precast.WS.Acc = {
	ammo="Ginsen",
	head="Valorous mask",
	neck="Fotia gorget",
	ear1="Brutal earring",
	ear2="Moonshade earring",
	body="Emicho Haubert",
	hands="Souveran handschuhs +1",
	ring1="Enlivened ring",
	ring2="Rajas ring",
	back="Letalis mantle",
	legs="Carmine cuisses +1",
	feet="Emicho gambieras"
	}
	
	
    sets.precast.WS.HP = sets.engaged.HP
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {ring1="Leviathan Ring",ring2="Aquasoul Ring"})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {ring1="Leviathan Ring"})

    sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS,{ waist="Zoran's Belt"})
    sets.precast.WS['Chant du Cygne'].Acc = {
	ammo="Ginsen",
	head="Valorous mask",
	neck="Fotia gorget",
	ear1="Cessance earring",
	ear2="Brutal earring",
	body="Emicho Haubert",
	hands="Souveran handschuhs +1",
	ring1="Enlivened ring",
	ring2="Rajas ring",
	back="Letalis mantle",
	legs="Carmine cuisses +1",
	feet="Emicho gambieras"
	}
    
	
	
    
    
    sets.precast.WS['Atonement'] = {ammo="Iron Gobbet",
        head="Reverence Coronet +1",neck=gear.ElementalGorget,ear1="Creed Earring",ear2="Steelflash Earring",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",ring1="Rajas Ring",ring2="Vexer Ring",
        back="Fierabras's Mantle",waist=gear.ElementalBelt,legs="Reverence Breeches +1",feet="Caballarius Leggings"}
    
	sets.precast.WS['Aeolian Edge'] =  {
	ammo="Iron Gobbet",
    head="Jumalik Helm",
    body="Found. Breastplate",
    hands="Founder's gauntlets",
    legs={ name="Odyssean Cuisses", augments={'VIT+6','"Dbl.Atk."+3','Phalanx +4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet="Founder's Greaves",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Friomisi Earring",
    left_ring="Arvina Ringlet +1",
    right_ring="Acumen Ring",
    back="Toro Cape",
}

    sets.precast.WS['Sanguine Blade'] = {
	--head={ name="Jumalik Helm", augments={'MND+5','"Mag.Atk.Bns."+10','Magic burst dmg.+6%',}},
	head="Pixie haripin +1",
    body="Found. Breastplate",
    hands="Founder's gauntlets",
    legs={ name="Odyssean Cuisses", augments={'VIT+6','"Dbl.Atk."+3','Phalanx +4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet="Founder's Greaves",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Friomisi Earring",
    left_ring="Arvina Ringlet +1",
    right_ring="Acumen Ring",
    back="Toro Cape",
}

  sets.precast.WS['Sanguine Blade'].HP = {
	--head={ name="Jumalik Helm", augments={'MND+5','"Mag.Atk.Bns."+10','Magic burst dmg.+6%',}},
	head="Pixie haripin +1",
    body="Found. Breastplate",
    hands="Founder's gauntlets",
    legs={ name="Odyssean Cuisses", augments={'VIT+6','"Dbl.Atk."+3','Phalanx +4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet="Founder's Greaves",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Friomisi Earring",
    left_ring="Arvina Ringlet +1",
    right_ring="Acumen Ring",
    back="Toro Cape",
}
sets.precast.WS['Red Lotus Blade'] =  {
	ammo="Iron Gobbet",
    head={ name="Jumalik Helm", augments={'MND+5','"Mag.Atk.Bns."+10','Magic burst dmg.+6%',}},
    body="Found. Breastplate",
    hands="Founder's gauntlets",
    legs={ name="Odyssean Cuisses", augments={'VIT+6','"Dbl.Atk."+3','Phalanx +4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    feet=="Founder's Greaves",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Friomisi Earring",
    left_ring="Arvina Ringlet +1",
    right_ring="Acumen Ring",
    back="Toro Cape",
}
sets.precast.WS['Burning Blade'] = sets.engaged.HP
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Reverence Coronet +1",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",
        waist="Zoran's Belt",legs="Enif Cosciales",feet="Reverence Leggings +1"}
		
	sets.midcast.SID = {
	    ammo="Staunch tathlum",--10
		head="Souveran schaller +1",--15
		neck="Moonbeam necklace", --10
		ear2="Knightly earring",--9
		body="Reverence surcoat +2",
		hands="Souveran handschuhs +1",
		ring1="Moonbeam ring",
		ring2="Apeile ring +1",
		back="Moonbeam Cape",
		waist="Creed Baudrier",
		legs="Founder's hose",--30
		feet="Odyssean greaves"--15
		}
    sets.midcast.Enmity = {
	    ammo="Iron gobbet",
		head="Reverence coronet +1",
		neck="Moonbeam necklace",
		body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		back=gear.PldEnmityCape,
		waist="Creed Baudrier",
		legs="Souv. Diechlings +1",
		feet="Souveran schuhs +1",
	    }

    sets.midcast.Flash = {
	    ammo="Sapience Orb",
		head="Carmine Mask +1",
		neck="Moonbeam necklace",
		ear1="Enchanter's earring +1",
		ear2="Loquacious earring",
		body="Rev. Surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Apeile ring",
		ring2="Apeile ring +1",
		back="Rudianos's Mantle",
		waist="Goading belt",
		legs="Souv. Diechlings +1",
		feet="Souveran schuhs +1",
	}
	
	sets.midcast.Flash.SID = sets.midcast.Flash.HP
    sets.midcast.Flash.HP = {
	    ammo="Staunch tathlum",
        head="Souveran schaller +1",
		neck="Loricate torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonbeam cape",
		waist="Gold moogle belt",
		legs="Souveran Diechlings +1",
		feet="Souveran Schuhs +1"}
    sets.midcast.Stun = sets.midcast.Flash
    
    sets.midcast.Cure = {
	    ammo="Iron Gobbet",
        head="Eschite helm",
		neck="Phalaina locket",
		ear1="Mendicant's Earring",
		ear2="Nourishing Earring +1",
        body="Souveran cuirass",
		hands="Souveran handschuhs +1",
		ring1="Apeile Ring",
		ring2="Apeile ring +1",
        back="Rudianos's mantle",
		waist="Creed baudrier",
		legs="Souveran diechlings +1",
		feet="Souveran schuhs +1"}
    
	sets.midcast.Cure.HP = {
	    ammo="Staunch tathlum",
        head="Souveran schaller +1",
		neck="Loricate torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonbeam cape",
		waist="Gold moogle belt",
		legs="Souveran Diechlings +1",
		feet="Souveran Schuhs +1"}
		
	sets.midcast.Cure.SID = {
	    ammo="Staunch tathlum",
        head="Souveran schaller +1",
		neck="Loricate torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonbeam cape",
		waist="Gold moogle belt",
		legs="Souveran Diechlings +1",
		feet="Souveran Schuhs +1"}
	
    sets.midcast['Enhancing Magic'] = {
	    neck="Colossus's Torque",
		waist="Olympus Sash",
		legs="Reverence Breeches +1"}
	
    sets.midcast.Phalanx = {	--28/30 from skill + 25 from gear = 53/55 total dmg reduction 
	    --sub="Priwen", --2
	    ammo="Staunch Tathlum",
        head="Yorium Barbuta", --3
        body="Odyss. Chestplate", --3
        hands="Souv. Handsch. +1", --5
        legs={ name="Odyssean Cuisses", augments={'VIT+6','"Dbl.Atk."+3','Phalanx +4','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}, --4
        feet="Souveran Schuhs +1", --3
        neck="Incanter's Torque",
        waist="Rumination Sash",
        left_ear="Halasz Earring",
        right_ear="Knightly Earring",
        left_ring="Defending Ring",
        right_ring="Vocane ring",
        back="Weard Mantle", --5
	}
	sets.midcast['Divine magic'] ={
	head="Jumalik helm",
	neck="Incanter's torque",
	ear1="Divine earring",
	ear2="Beatific earring",
	body="Rev. Surcoat +1",
	hands="Eschite gauntlets",
	ring1="Globidonta ring",
	waist="Asklepian belt",
	legs="Kaiser diechlings",
	feet="Templar sabatons"	
	}
	sets.midcast['Divine magic'].SID = sets.midcast['Divine magic']
	
	sets.midcast.Reprisal = sets.engaged.HP
	
	sets.midcast.Holy = {
	head="Jumalik Helm",
    body="Found. Breastplate",
    hands="Founder's gauntlets",
    legs="Odyssean Cuisses",
    feet="Founder's Greaves",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Arvina Ringlet +1",
    right_ring="Acumen Ring",
    back="Toro Cape",
	}
	
	sets.midcast.Enlight ={
	head="Jumalik helm",
	neck="Incanter's torque",
	ear1="Divine earring",
	ear2="Beatific earring",
	body="Rev. Surcoat +1",
	hands="Eschite gauntlets",
	ring1="Globidonta ring",
	waist="Asklepian belt",
	legs="Kaiser diechlings",
	feet="Templar sabatons"	
	}
	sets.midcast.HolyII = sets.midcast.Holy
	
	sets.midcast['Blue magic'] = sets.precast.Enmity
	sets.midcast['Blue magic'].SID = sets.midcast.SID
    sets.midcast.Protect = {ring1="Sheltered Ring"}
    sets.midcast.Shell = {ring1="Sheltered Ring"}
	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    sets.Reraise = {head="Twilight Helm", body="Twilight Mail"}
    
	
    sets.resting = {neck="Creed Collar",
        ring1="Sheltered Ring",ring2="Paguroidea Ring",}
        
    

    -- Idle sets
    sets.idle = {
	ammo="Homiliary",
    head="Jumalik helm",
	neck="Coatl gorget +1",
	ear1="Creed Earring",
	ear2="Infused Earring",
    body="Reverence surcoat +2",
	hands="Souveran Handschuhs +1",
	ring1="Defending Ring",
	ring2="Vocane Ring",
    back="Weard Mantle",
	waist="Fucho-no-obi",
	legs="Carmine Cuisses +1",
	feet="Souveran Schuhs +1"}
	
	sets.idle.PDT = {
	    ammo="Staunch tathlum",
        head="Souveran schaller +1",
		neck="Loricate torque +1",
		ear1="Creed Earring",
		ear2="Thureous Earring",
        body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Defending Ring",
		ring2="Vocane ring",
        back="Moonbeam cape",
		waist="Flume Belt +1",
		legs="Carmine cuisses +1",
		feet="Souveran schuhs +1"}
	
	sets.idle.HP = {
	    ammo="Staunch tathlum",
        head="Souveran schaller +1",
		neck="Loricate torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonbeam cape",
		waist="Gold moogle belt",
		legs="Carmine cuisses +1",
		feet="Souveran schuhs +1"}

    sets.idle.Reraise =  {
	    ammo="Staunch tathlum",
        head="Twilight Helm",
		neck="Loricate torque +1",
		ear1="Creed Earring",
		ear2="Thureous Earring",
        body="Twilight Mail",
		hands="Souv. Handsch. +1",
		ring1="Moonbeam Ring",
		ring2="Moonbeam ring",
        back="Moonbeam cape",
		waist="Gold moogle belt",
		legs="Carmine cuisses +1",
		feet="Souveran schuhs +1"}
	
	
    sets.idle.Weak = {ammo="Iron Gobbet",
        head="Reverence Coronet +1",neck="Creed Collar",ear1="Creed Earring",ear2="Thureous Earring",
        body="Reverence Surcoat +1",hands="Reverence Gauntlets +1",ring1="Sheltered Ring",ring2="Meridian Ring",
        back="Fierabras's Mantle",waist="Flume Belt +1",legs="Crimson Cuisses",feet="Reverence Leggings +1"}
    
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
    
    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}
    
	sets.org = {
	main="Brilliance",
	main="Demersel degen +1",
	sub="Aegis",
	sub="Ochain",
	}

    --------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {back="Repulse Mantle"}
    sets.MP = {neck="Creed Collar",waist="Flume Belt +1"}
    sets.MP_Knockback = {neck="Creed Collar",waist="Flume Belt +1",back="Repulse Mantle"}
    
    -- If EquipShield toggle is on (Win+F10 or Win+F11), equip the weapon/shield combos here
    -- when activating or changing defense mode:
    sets.PhysicalShield = {sub="Ochain"} -- Ochain
    sets.MagicalShield = {sub="Aegis"} -- Aegis

    -- Basic defense sets.
        
    sets.defense.PDT = {
	    ammo="Staunch tathlum",
        head="Souveran schaller +1",
		neck="Loricate torque +1",
		ear1="Creed Earring",
		ear2="Thureous Earring",
        body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Defending Ring",
		ring2="Vocane ring",
        back="Rudianos's mantle",
		waist="Flume Belt +1",
		legs="Souveran Diechlings +1",
		feet="Souveran schuhs +1"}
		--capped dt with HP gear added
		
    sets.defense.HP = {
	    ammo="Staunch tathlum",
        head="Souveran schaller +1",
		neck="Loricate torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Moonbeam Ring",
		ring2="Moonbeam Ring",
        back="Moonbeam cape",
		waist="Gold moogle belt",
		legs="Souveran Diechlings +1",
		feet="Souveran Schuhs +1"}
		
    sets.defense.Reraise = {
	    ammo="Iron Gobbet",
        head="Twilight Helm",
		neck="Twilight Torque",
		ear1="Creed Earring",
		ear2="Thureous Earring",
        body="Twilight Mail",
		hands="Reverence Gauntlets +1",
		ring1="Defending Ring",
		ring2="Vocane ring",
        back="Weard Mantle",
		waist="Nierenschutz",
		legs="Reverence Breeches +1",
		feet="Reverence Leggings +1"}
		
    sets.defense.Charm = {
	    ammo="Iron Gobbet",
        head="Reverence Coronet +1",
		neck="Lavalier +1",
		ear1="Creed Earring",
		body="Reverence Surcoat +1",
		hands="Reverence Gauntlets +1",
		ring1="Defending Ring",
		ring2="Vocane ring",
        back="Shadow Mantle",
		waist="Flume Belt +1",
		legs="Reverence Breeches +1",
		feet="Reverence Leggings +1"}
		
    -- To cap MDT with Shell IV (52/256), need 76/256 in gear.
    -- Shellra V can provide 75/256, which would need another 53/256 in gear.
    sets.defense.MDT = {
	    ammo="Demonry Stone",
        head="Reverence Coronet +1",
		neck="Twilight Torque",
		ear1="Creed Earring",
		ear2="Thureous Earring",
        body="Reverence Surcoat +1",
		hands="Reverence Gauntlets +1",
		ring1="Defending Ring",
		ring2="Shadow Ring",
        back="Engulfer Cape",
		waist="Creed Baudrier",
		legs="Osmium Cuisses",
		feet="Reverence Leggings +1"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    sets.engaged = {
	    ammo="Ginsen",
        head="Otomi Helm",
		neck="Asperity Necklace",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
        body="Gorney Haubert +1",
		hands="Cizin Mufflers",
		ring1="Rajas Ring",
		ring2="K'ayres Ring",
        back="Atheling Mantle",
		waist="Cetl Belt",
		legs="Cizin Breeches",
		feet="Whirlpool Greaves"}

    sets.engaged.Acc = {
	    ammo="Ginsen",
        head="Flamma Zucchetto +2",
		neck="Lissome Necklace",
		ear1="Cessance Earring",
		ear2="Telos Earring",
        body="Flamma Korazin +1",
		hands="Flamma Manopolas +1",
		ring1="Chirich Ring", 
		ring2="Flamma ring",
        back=gear.PldEnmityCape,
		waist="Goading Belt",
		legs="Carmine cuisses +1",
		feet="Flamma gambieras +1"}

    sets.engaged.DW = {ammo="Ginsen",
        head="Otomi Helm",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Gorney Haubert +1",hands="Cizin Mufflers",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Atheling Mantle",waist="Cetl Belt",legs="Cizin Breeches",feet="Whirlpool Greaves"}

    sets.engaged.DW.Acc = {
	    }

    sets.engaged.PDT = sets.defense.PDT
    sets.engaged.HP = {
	    ammo="Staunch tathlum",
        head="Souveran schaller +1",
		neck="Loricate torque +1",
		ear1="Odnowa Earring +1",
		ear2="Odnowa Earring",
        body="Reverence surcoat +2",
		hands="Souv. Handsch. +1",
		ring1="Moonbeam Ring",
		ring2="Moonbeam ring",
        back="Moonbeam Cape",
		waist="Gold moogle belt",
		legs="Souveran diechlings +1",
		feet="Souveran schuhs +1"}
	
    sets.engaged.DW.PDT = set_combine(sets.engaged.DW, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.DW.Acc, {body="Reverence Surcoat +1",neck="Twilight Torque",ring1="Defending Ring"})
    sets.engaged.DW.Reraise = set_combine(sets.engaged.DW, sets.Reraise)
    sets.engaged.DW.Acc.Reraise = set_combine(sets.engaged.DW.Acc, sets.Reraise)


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Doom = {ring1="Saida ring", ring2="Saida Ring", legs="Shabti Cuisses +1"}
    sets.buff.Cover = {head="Reverence Coronet +1", body="Caballarius Surcoat +1"}
	--sets.buff.Reprisal = {sub="Priwen"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_midcast(spell, action, spellMap, eventArgs)
    -- If DefenseMode is active, apply that gear over midcast
    -- choices.  Precast is allowed through for fast cast on
    -- spells, but we want to return to def gear before there's
    -- time for anything to hit us.
    -- Exclude Job Abilities from this restriction, as we probably want
    -- the enhanced effect of whatever item of gear applies to them,
    -- and only one item should be swapped out.
    if state.DefenseMode.value ~= 'None' and spell.type ~= 'JobAbility' then
        handle_equipping_gear(player.status)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when the player's status changes.
function job_state_change(field, new_value, old_value)
    classes.CustomDefenseGroups:clear()
    classes.CustomDefenseGroups:append(state.ExtraDefenseMode.current)
    if state.EquipShield.value == true then
        classes.CustomDefenseGroups:append(state.DefenseMode.current .. 'Shield')
    end

    classes.CustomMeleeGroups:clear()
    classes.CustomMeleeGroups:append(state.ExtraDefenseMode.current)
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_defense_mode()
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    
    return idleSet
end

-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    
    return meleeSet
end

function customize_defense_set(defenseSet)
    if state.ExtraDefenseMode.value ~= 'None' then
        defenseSet = set_combine(defenseSet, sets[state.ExtraDefenseMode.value])
    end
    
    if state.EquipShield.value == true then
        defenseSet = set_combine(defenseSet, sets[state.DefenseMode.current .. 'Shield'])
    end
    
    if state.Buff.Doom then
        defenseSet = set_combine(defenseSet, sets.buff.Doom)
    end
    
    return defenseSet
end


function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end

    if state.ExtraDefenseMode.value ~= 'None' then
        msg = msg .. ', Extra: ' .. state.ExtraDefenseMode.value
    end
    
    if state.EquipShield.value == true then
        msg = msg .. ', Force Equip Shield'
    end
    
    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
	
	
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_defense_mode()
    if player.equipment.main == 'Kheshig Blade' and not classes.CustomDefenseGroups:contains('Kheshig Blade') then
        classes.CustomDefenseGroups:append('Kheshig Blade')
    end
    
    if player.sub_job == 'NIN' or player.sub_job == 'DNC' then
        if player.equipment.sub and not player.equipment.sub:contains('Shield') and
           player.equipment.sub ~= 'Aegis' and player.equipment.sub ~= 'Ochain' then
            state.CombatForm:set('DW')
        else
            state.CombatForm:reset()
        end
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 7)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 7)
    else
        set_macro_page(1, 7)
    end
end
