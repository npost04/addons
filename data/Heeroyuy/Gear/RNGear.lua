
gear.MDTaeonChapeau = { name="Taeon Chapeau", augments={'"Mag.Atk.Bns."+20','STR+1 DEX+1',}}
gear.FCTaeonGloves = { name="Taeon Gloves", augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','"Fast Cast"+5',}}
gear.FCTaeonBoots = { name="Taeon Boots", augments={'"Mag.Atk.Bns."+19','"Fast Cast"+5','DEX+5',}}
gear.TPTaeonChapeau ={ name="Taeon Chapeau", augments={'Accuracy+15 Attack+15','"Triple Atk."+2','STR+7 AGI+7',}}
gear.TPTaeonGloves = { name="Taeon Gloves", augments={'Accuracy+25','"Triple Atk."+2','STR+4',}}
gear.TPTaeonBoots = { name="Taeon Boots", augments={'Accuracy+16 Attack+16','"Dual Wield"+5','DEX+3',}}


function init_gear_sets()
-- Misc. Job Ability precasts
sets.precast.JA['Bounty Shot'] = {hands="Sylvan Glovelettes +2", waist="Chaac belt"}
sets.precast.JA['Double Shot'] = {head="Amini Gapette +1"}
sets.precast.JA['Camouflage'] = {body="Orion Jerkin +1"}
sets.precast.JA['Sharpshot'] = {legs="Orion Braccae"}
sets.precast.JA['Velocity Shot'] = {body="Amini Caban +1"}
sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}


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

sets.precast.JA['Eagle Eye Shot'] = {
head="Uk'uxkaj Cap",
neck="Rancor Collar",
back="Buquwik Cape",
hands="Adhemar wristbands",
ring1="Rajas Ring",
ring2="Ifrit Ring",
legs="Arcadian Braccae +1",
feet="Orion Socks +1"
}
sets.precast.JA['Eagle Eye Shot'].Mid = set_combine(sets.precast.JA['Eagle Eye Shot'], {
back="Lutian Cape",
ring2="Longshot Ring",
feet="Orion Socks +1"
})
sets.precast.JA['Eagle Eye Shot'].Acc = set_combine(sets.precast.JA['Eagle Eye Shot'].Mid, {
neck="Iqabi Necklace",
waist="Elanid Belt"
})
sets.precast.FC = {
head="Haruspex hat +1",
neck="Orunmila's torque",
ear1="Loquacious Earring",
ear2="Enchanter earring +1",
body="Thurandaut tabard +1",
hands="Thaumas gloves",
ring1="Prolix Ring",
ring2="Weatherspoon ring",
waist="Pya'ekue belt",
legs="Blood cuisses",
feet="Suzaku's sune-ate"
}
sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, { neck="Orunmila's torque" })

sets.idle = {
head="Ocelomeh Headpiece +1",
neck="Wiglen gorget",
ear1="Volley Earring",
ear2="Clearview Earring",
body="Khepri jacket",
hands="Garden bangles",
ring1="Paguroidea Ring",
ring2="Sheltered Ring",
back="Repulse Mantle",
waist="Flume Belt +1",
legs="Nahtirah trousers",
feet="Jute boots +1"
}
sets.idle.PDT = set_combine(sets.idle, {
head="Iuitl headgear +1",
body="Khepri jacket",
ring1="Defending Ring",
ring2="Dark Ring",
waist="Flume Belt +1",
feet="Skd. Jambeaux +1"
})
sets.idle.Town = set_combine(sets.idle, {
})
-- Engaged sets
sets.engaged = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Volley Earring",
ear2="Clearview Earring",
body="Orion jerkin +1",
hands="Buremte gloves",
ring1="Rajas Ring",
ring2="Oneiros Ring",
back="Lutian cape",
waist="Elanid Belt",
legs="Nahtirah Trousers",
feet="Orion Socks +1"

}
sets.engaged.PDT = set_combine(sets.engaged, {
head="Iuitl headgear +1",
neck="Twilight Torque",
body="Iuitl vest",
hands="Umuthi gloves",
ring1="Defending Ring",
ring2="Dark Ring",
back="Repulse mantle",
waist="Flume Belt +1",
legs="Iuitl tights",
feet="Qaaxo leggings"
})
sets.engaged.Yoichinoyumi = set_combine(sets.engaged, {})
sets.engaged.Melee = {
head="Iuitl Headgear +1",
neck="Asperity necklace",
ear1="Steelflash earring",
ear2="Bladeborn Earring",
body="Manibozho Jerkin",
hands="Buremte gloves",
ring1="Rajas Ring",
ring2="Epona's Ring",
back="Atheling mantle",
waist="Windbuffet belt +1",
legs="Manibozho brais",
feet="Manibozho boots"
}



sets.engaged.Melee.PDT = set_combine(sets.engaged.Melee, {
neck="Twilight Torque",
ring1="Defending Ring",
ring2="Dark Ring"
})
sets.engaged.DW ={
head=gear.TPTaeonChapeau,
neck="Iqabi necklace",
ear1="Steelflash Earring",
ear2="Bladeborn Earring",
body="Skadi's cuirie +1",
hands=gear.TPTaeonGloves,
ring1="Enlivened Ring",
ring2="Patricius Ring",
back="Letalis Mantle",
waist="Patentia sash",
legs="Taeon tights",
feet=gear.TPTaeonBoots
}

sets.engaged.DW.Acc = {
head=gear.TPTaeonChapeau,
neck="Iqabi necklace",
ear1="Steelflash earring",
ear2="Bladeborn Earring",
body="Thaumas coat",
hands=gear.TPTaeonGloves,
ring1="Enlivened Ring",
ring2="Epona's Ring",
back="Letalis mantle",
waist="Windbuffet belt +1",
legs="Taeon Tights",
feet=gear.TPTaeonBoots
}
sets.engaged.DW.Melee ={
head=gear.TPTaeonChapeau,
neck="Iqabi Necklace",
ear1="Dudgeon Earring",
ear2="Heartseeker Earring",
body="Skadi's cuirie +1",
hands=gear.TPTaeonGloves,
ring1="Enlivened Ring",
ring2="Oneiros Ring",
back="Letalis mantle",
waist="Windbuffet belt +1",
legs="Taeon tights",
feet=gear.TPTaeonBoots
}
------------------------------------------------------------------
-- Preshot / Snapshot sets
------------------------------------------------------------------
sets.precast.RA = {
head="Amini Gapette +1",
body="Amini Caban +1",
hands="Iuitl Wristbands +1",
legs="Nahtirah trousers",
back="Lutian cape",
waist="Impulse Belt",
feet="Wurrukatte boots"
}
------------------------------------------------------------------
-- Default Base Gear Sets for Ranged Attacks. Geared for Gun
------------------------------------------------------------------
sets.midcast.RA = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Volley Earring",
ear2="Clearview Earring",
body="Arcadian jerkin +1",
hands="Adhemar wristbands",
ring1="Rajas Ring",
ring2="K'ayres Ring",
back="Sylvan Chlamys",
waist="Elanid Belt",
legs="Nahtirah Trousers",
feet="Orion Socks +1"
}
sets.midcast.RA.Mid = set_combine(sets.midcast.RA, {
neck="Erudition necklace",
body="Kyujutsugi",
back="Lutian Cape", 
legs="Samnuha tights"
})

sets.midcast.RA.MidTwo = set_combine(sets.midcast.RA, {
neck="Erudition necklace",
body="Amini Caban +1",
hands="Alruna's gloves +1",
ring1="Rajas Ring",
ring2="Hajduk ring",
back="Lutian Cape", 
legs="Amini brague +1",
feet="Orion socks +1"
})

sets.midcast.RA.Acc = set_combine(sets.midcast.RA.Mid, {
head="Amini Gapette +1",
body="Amini Caban +1",
neck="Erudition Necklace",
hands="Adhemar wristbands",
ring1="Paqichikaji ring",
Ring2="Hajduk Ring",
legs="Arcadian Braccae +1"
})
sets.midcast.RA.STP = {
head="Arcadian Beret +1",
neck="Erudition necklace",
ear1="Volley earring",
ear2="Clearview earring",
body="Kyujutsugi",
hands="Adhemar wristbands",
ring1="Rajas ring",
ring2="K'ayres ring",
back="Sylvan chlamys",
waist="Patentia sash",
legs="Amini brague +1",
feet="Orion socks +1",
}

sets.midcast.RA.VDAcc = {
head="Amini Gapette +1",
neck="Iqabi necklace",
ear1="Volley Earring",
ear2="Clearview Earring",
body="Orion jerkin +1",
hands="Adhemar wristbands",
ring1="Paqichikaji ring",
Ring2="Hajduk Ring",
back="Lutian cape",
waist="Elanid Belt",
legs="Arcadian braccae +1",
feet="Orion Socks +1"
}

------------------------------------------------------------------
-- Specialized Gear Sets
------------------------------------------------------------------
-- Stave sets

sets.midcast.RA.Stave = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Volley Earring",
ear2="Clearview Earring",
body="Arcadian jerkin +1",
hands="Sigyn's bazubands",
ring1="Rajas Ring",
ring2="K'ayres Ring",
back="Sylvan Chlamys",
waist="Elanid Belt",
legs="Nahtirah Trousers",
feet="Orion Socks +1"
}

sets.midcast.RA.Stave.Mid = set_combine(sets.midcast.RA.Stave, {
neck="Erudition necklace",
body="Kyujutsugi",
hands="Adhemar wristbands",
rring="Hajduk ring",
back="Lutian cape",
legs="Arcadian braccae +1"
})
sets.midcast.RA.Stave.Acc = set_combine(sets.midcast.RA.Acc, {
head="Amini Gapette +1",
neck="Erudition Necklace",
legs="Arcadian braccae +1",
ring1="Paqichikaji ring",
Ring2="Hajduk Ring",
})

sets.midcast.RA.Stave.STP = set_combine(sets.midcast.RA.STP, {
neck="Erudition necklace",
body="Kyujutsugi",
back="Sylvan chlamys",
waist="Patentia sash",
legs="Amini brague +1",
})

sets.midcast.RA.Stave.VDAcc = {
head="Amini Gapette +1",
neck="Iqabi necklace",
ear1="Volley Earring",
ear2="Clearview Earring",
body="Orion jerkin +1",
hands="Adhemar wristbands",
ring1="Paqichikaji ring",
Ring2="Hajduk Ring",
back="Lutian cape",
waist="Elanid Belt",
legs="Arcadian braccae +1",
feet="Orion Socks +1"
}

-- Samurai Roll sets
sets.midcast.RA.SamRoll = set_combine(sets.midcast.RA, {
body="Kyujutsugi",
ring2="K'ayres Ring",
})
sets.midcast.RA.Mid.SamRoll = set_combine(sets.midcast.RA.SamRoll, {
ring1="Paqichikaji Ring",
back="Lutian Cape",
hands="Adhemar wristbands",
legs="Samnuha tights"
})
sets.midcast.RA.Acc.SamRoll = set_combine(sets.midcast.RA.Mid.SamRoll, {
body="Kyujutsugi",
neck="Erudition Necklace",
ring1="Paqichikaji ring",
Ring2="Hajduk Ring",
legs="Arcadian Braccae +1"
})
-- Stave Sam Roll
sets.midcast.RA.Stave.SamRoll = set_combine(sets.midcast.RA.Stave, {
body="Arcadian jerkin +1",
waist="Elanid Belt"
})
sets.midcast.RA.Stave.Mid.SamRoll = set_combine(sets.midcast.RA.Stave.Mid, {
body="Arcadian jerkin +1",
legs="Samnuha tights",
hands="Adhemar wristbands",
})
sets.midcast.RA.Stave.Acc.SamRoll = set_combine(sets.midcast.RA.Stave.Acc, {})
-- SAM Subjob
sets.midcast.RA.SAM = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Volley Earring",
ear2="Tripudio Earring",
body="Kyujutsugi",
hands="Adhemar wristbands",
ring1="Rajas Ring",
ring2="K'ayres Ring",
back="Lutian cape",
waist="Elanid Belt",
legs="Samnuha tights",
feet="Orion Socks +1"
}

sets.midcast.RA.Stave.STP.SamRoll = set_combine(sets.midcast.RA.STP, {
body="Kyujutsugi",
back="Sylvan chlamys",
legs="Samnuha tights",
})

--Sam sets

sets.midcast.RA.SAM.Mid = set_combine(sets.midcast.RA.SAM, {
neck="Erudition necklace",
hands="Adhemar wristbands",
ring2="Hajduk ring"
})
sets.midcast.RA.SAM.Acc = set_combine(sets.midcast.RA.SAM.Mid, {
back="Erudition Cape",
neck="Iqabi Necklace",
ring2="Hajduk Ring"
})
-- Stave set for SAM
sets.midcast.RA.SAM.Stave = set_combine(sets.midcast.RA.SAM, {
hands="Adhemar wristbands"
})
sets.midcast.RA.SAM.Stave.Mid = set_combine(sets.midcast.RA.SAM.Mid, {
hands="Adhemar wristbands",
ring2="Hajduk ring",
legs="Samnuha tights"
})
sets.midcast.RA.SAM.Stave.Acc = set_combine(sets.midcast.RA.SAM.Acc, {})
-- Samurai Roll for /sam, assume we're using a staff
sets.midcast.RA.SAM.Stave.SamRoll = set_combine(sets.midcast.RA.SAM.Stave, {
hands="Adhemar wristbands"
})

sets.midcast.RA.SAM.Stave.STP= set_combine(sets.midcast.RA.SAM.Stave.Acc, {
neck="Ocachi gorget",
hands="Adhemar wristbands",
ring2="K'ayres ring",
waist="Patentia sash",
back="Sylvan chlamys",
feet="Orion socks +1"

})

sets.midcast.RA.SAM.Stave.Mid.SamRoll = set_combine(sets.midcast.RA.SAM.Stave.Mid, {
ear1="Clearview Earring",
hands="Adhemar wristbands",
legs="Samnuha tights"
})
sets.midcast.RA.SAM.Stave.Acc.SamRoll = set_combine(sets.midcast.RA.SAM.Stave.Acc, {
hands="Adhemar wristbands",
})
sets.midcast.RA.SAM.Stave.Acc.SamRoll = set_combine(sets.midcast.RA.SAM.Stave, {
hands="Adhemar wristbands",
})
-- Bow base set.
sets.midcast.RA.Yoichinoyumi = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Novia Earring",
ear2="Tripudio Earring",
body="Kyujutsugi",
--body="Arcadian jerkin +1",
hands="Adhemar wristbands",
ring1="Rajas Ring",
ring2="K'ayres Ring",
back="Sylvan Chlamys",
waist="Elanid Belt",
legs="Arcadian Braccae +1",
feet="Arcadian Socks +1"
}
sets.midcast.RA.Yoichinoyumi.Mid = set_combine(sets.midcast.RA.Yoichinoyumi, {
ear1=gear.Earring,
back="Lutian Cape",
hands="Adhemar wristbands",
legs="Samnuha tights",
feet="Orion Socks +1"
})
sets.midcast.RA.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Yoichinoyumi.Mid, {
neck="Iqabi Necklace",
ring1="Longshot Ring",
ring2="Paqichikaji Ring",
legs="Arcadian Braccae +1"
})
sets.midcast.RA.Falubeza = sets.midcast.RA.Yoichinoyumi
sets.midcast.RA.Falubeza.Mid = sets.midcast.RA.Yoichinoyumi.Mid
sets.midcast.RA.Falubeza.Acc = sets.midcast.RA.Yoichinoyumi.Acc
-- Decoy up
sets.midcast.RA.Yoichinoyumi.Decoy = set_combine(sets.midcast.RA.Yoichinoyumi, {
ear1=gear.Earring,
hands="Sylvan Glovelettes +2",
legs="Nahtirah Trousers"
})
sets.midcast.RA.Yoichinoyumi.Mid.Decoy = set_combine(sets.midcast.RA.Yoichinoyumi.Decoy, {
hands="Adhemar wristbands",
legs="Samnuha tights",
feet="Orion Socks +1"
})
sets.midcast.RA.Yoichinoyumi.Acc.Decoy = set_combine(sets.midcast.RA.Yoichinoyumi.Mid.Decoy, {
ear1=gear.Earring,
neck="Iqabi Necklace",
hands="Adhemar wristbands",
ring1="Longshot Ring",
ring2="Paqichikaji Ring",
legs="Arcadian Braccae +1"
})
sets.midcast.RA.Falubeza.Decoy = sets.midcast.RA.Yoichinoyumi.Decoy
sets.midcast.RA.Falubeza.Mid.Decoy = sets.midcast.RA.Yoichinoyumi.Mid.Decoy
sets.midcast.RA.Falubeza.Acc.Decoy = sets.midcast.RA.Yoichinoyumi.Acc.Decoy
-- Stave
sets.midcast.RA.Stave.Yoichinoyumi = set_combine(sets.midcast.RA.Yoichinoyumi, { hands="Iuitl Wristbands +1" })
sets.midcast.RA.Stave.Yoichinoyumi.Mid = set_combine(sets.midcast.RA.Yoichinoyumi.Mid, { legs="Nahtirah Trousers" })
sets.midcast.RA.Stave.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Yoichinoyumi.Acc, {})
-- Stave with Sam roll
sets.midcast.RA.Stave.Yoichinoyumi.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi, {
body="Arcadian jerkin +1",
hands="Arcadian Bracers +1",
ring2="Paqichikaji Ring",
back="Lutian Cape"
})
sets.midcast.RA.Stave.Yoichinoyumi.Mid.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.SamRoll, {
body="Kyujutsugi",
})
sets.midcast.RA.Stave.Yoichinoyumi.Acc.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.Mid.SamRoll, {
neck="Iqabi Necklace",
hands="Adhemar wristbands",
ring1="Longshot Ring",
feet="Orion Socks +1"
})
-- Stave / Decoy up
sets.midcast.RA.Stave.Yoichinoyumi.Decoy = set_combine(sets.midcast.RA.Stave.Yoichinoyumi, {
ear1=gear.Earring,
hands="Arcadian Bracers +1",
legs="Samnuha tights"
})
sets.midcast.RA.Stave.Yoichinoyumi.Mid.Decoy = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.Decoy, {
body="Kyujutsugi",
hands="Adhemar wristbands",
back="Lutian Cape",
legs="Nahtirah Trousers"
})
sets.midcast.RA.Stave.Yoichinoyumi.Acc.Decoy = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.Mid.Decoy, {
neck="Iqabi Necklace",
ring1="Longshot Ring",
ring2="Hajduk Ring",
legs="Samnuha tights",
feet="Orion Socks +1"
})
-- Stave + Sam roll + Decoy
sets.midcast.RA.Stave.Yoichinoyumi.Decoy.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.SamRoll, {
ear1=gear.Earring,
body="Arcadian jerkin +1",
hands="Arcadian Bracers +1",
ring2="Ifrit Ring",
back="Buquwik Cape",
legs="Nahtirah Trousers",
feet="Arcadian Socks +1"
})
sets.midcast.RA.Stave.Yoichinoyumi.Mid.Decoy.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.Decoy.SamRoll, {
body="Kyujutsugi",
hands="Iuitl Wristbands +1",
back="Lutian Cape",
ring2="Longshot Ring"
})
sets.midcast.RA.Stave.Yoichinoyumi.Acc.Decoy.SamRoll = set_combine(sets.midcast.RA.Stave.Yoichinoyumi.Mid.Decoy.SamRoll, {
neck="Iqabi Necklace",
ring1="Paqichikaji Ring",
hands="Adhemar wristbands",
legs="Arcadian Braccae +1",
feet="Orion Socks +1"
})
-- Sam SJ / Bow - assuming you'll use a Stave here..
sets.midcast.RA.SAM.Stave.Yoichinoyumi = set_combine(sets.midcast.RA.SAM, {
feet="Arcadian Socks +1"
})
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid = set_combine(sets.midcast.RA.SAM.Mid, {
feet="Orion Socks +1"
})
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.SAM.Acc, {})
-- SAM SJ / Bow / Decoy doesn't matter here
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc
-- Sam SJ / Bow / Sam's Roll
sets.midcast.RA.SAM.Stave.Yoichinoyumi.SamRoll = set_combine(sets.midcast.RA.SAM.Stave.Yoichinoyumi, {
waist="Elanid Belt",
feet="Orion Socks +1"
})
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid.SamRoll = set_combine(sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid, {
waist="Elanid Belt",
})
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc.SamRoll = set_combine(sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc, {})
-- Don't care about decoy here
sets.midcast.RA.SAM.Stave.Yoichinoyumi.SamRoll.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi.SamRoll
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid.SamRoll.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi.Mid.SamRoll
sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc.SamRoll.Decoy = sets.midcast.RA.SAM.Stave.Yoichinoyumi.Acc.SamRoll
-- Weaponskill sets
sets.precast.WS = {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Altdorf's earring",
ear2="Wilhelm's earring",
body="Khepri jacket",
hands="Adhemar wristbands",
ring1="Rajas Ring",
ring2="Hajduk Ring",
back="Buquwik Cape",
waist="Elanid Belt",
legs="Nahtirah Trousers",
feet="Orion Socks +1"
}
sets.precast.WS.Mid = set_combine(sets.precast.WS, {
head="Arcadian Beret +1",
neck="Ocachi Gorget",
ear1="Altdorf's earring",
ear2="Wilhelm's earring",
body="Orion jerkin +1",
hands="Adhemar wristbands",
ring1="Rajas Ring",
ring2="Hajduk Ring",
back="Buquwik Cape",
waist="Elanid Belt",
legs="Nahtirah Trousers",
feet="Orion Socks +1"
})
sets.precast.WS.Acc = set_combine(sets.precast.WS.Mid, {
back="Lutian Cape"
})
-- WILDFIRE
sets.Wildfire = {
ammo="Iron Bullet",
head=gear.MDTaeonChapeau,
body="Samnuha coat",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
neck="Fotia gorget",
hands=gear.FCTaeonGloves,
ring1="Acumen Ring",
ring2="Arvina Ringlet +1",
waist="Fotia Belt",
legs="Iuitl Tights",
back="Toro Cape",
feet=gear.FCTaeonBoots
}
sets.precast.WS['Wildfire'] = set_combine(sets.precast.WS, sets.Wildfire)
sets.precast.WS['Wildfire'].Mid = set_combine(sets.precast.WS.Mid, sets.Wildfire)
sets.precast.WS['Wildfire'].Acc = set_combine(sets.precast.WS.Acc, sets.Wildfire)

-- Trueflight
sets.Trueflight = {
ammo="Iron Bullet",
head=gear.MDTaeonChapeau,
body="Samnuha coat",
ear1="Hecate's Earring",
ear2="Friomisi Earring",
neck="Fotia gorget",
hands=gear.FCTaeonGloves,
ring1="Arvina ringlet +1",
ring2="Weatherspoon ring",
waist="Fotia Belt",
legs="Iuitl Tights",
back="Toro Cape",
feet=gear.FCTaeonBoots
}
sets.precast.WS['Trueflight'] = set_combine(sets.precast.WS, sets.Trueflight)
sets.precast.WS['Trueflight'].Mid = set_combine(sets.precast.WS.Mid, sets.Trueflight)
sets.precast.WS['Trueflight'].Acc = set_combine(sets.precast.WS.Acc, sets.Trueflight)


-- CORONACH
sets.Coronach = {
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Vulcan's pearl",
ear2="Clearview earring",
body="Amini Caban +1",
hands="Arcadian bracers +1",
waist="Fotia Belt",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Buquwik Cape",
legs="Nahtirah trousers",
feet="Arcadian socks +1"
}

sets.Coronach.Mid = {
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Vulcan's pearl",
ear2="Clearview earring",
body="Kyujutsugi",
hands="Sigyn's bazubands",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Lutian cape",
waist="Fotia belt",
legs="Nahtirah trousers",
feet="Orion socks +1"
}

sets.Coronach.Acc = {
head="Umbani cap",
neck="Fotia gorget",
waist="Fotia Belt",
ring1="Rajas Ring",
hands="Adhemar wristbands",
legs="Arcadian Braccae +1",
feet="Orion socks +1",
body="Orion jerkin +1",
ring2="Hajduk ring",
back="Lutian cape"
}

sets.precast.WS['Coronach'] = set_combine(sets.Coronach, {
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Vulcan's pearl",
ear2="Clearview earring",
body="Amini Caban +1",
hands="Arcadian bracers +1",
waist="Fotia Belt",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Buquwik Cape",
legs="Nahtirah trousers",
feet="Arcadian socks +1"
})

sets.precast.WS['Coronach'].STP = set_combine(sets.Coronach, {
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Volley earring",
ear2="Vulcan's pearl",
body="Amini Caban +1",
hands="Arcadian bracers +1",
waist="Fotia Belt",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Buquwik Cape",
legs="Nahtirah trousers",
feet="Arcadian socks +1"
})


sets.precast.WS['Coronach'].Mid = set_combine(sets.Coronach,{
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear2="Vulcan's pearl",
body="Kyujutsugi",
hands="Sigyn's bazubands",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Lutian cape",
waist="Fotia belt",
legs="Nahtirah trousers",
feet="Orion socks +1"
})

sets.precast.WS['Coronach'].Mid.STP = set_combine(sets.Coronach,{
head="Arcadian beret +1",
neck="Ocachi Gorget",
ear1="Volley earring",
ear2="Clearview earring",
body="Kyujutsugi",
hands="Adhemar wristbands",
ring1="Rajas Ring",
ring2="Ifrit Ring",
back="Lutian cape",
waist="Fotia belt",
legs="Nahtirah trousers",
feet="Orion socks +1"
})



sets.precast.WS['Coronach'].Acc = set_combine(sets.Coronach, {
head="Umbani cap",
neck="Fotia gorget",
waist="Fotia Belt",
ring1="Rajas Ring",
hands="Adhemar wristbands",
legs="Arcadian Braccae +1",
feet="Orion socks +1",
body="Orion jerkin +1",
ring2="Hajduk ring",
back="Lutian cape"
})

sets.precast.WS['Coronach'].SAM = set_combine(sets.precast.WS, {
neck="Fotia gorget",
ear1="Tripudio Earring",
ear2="Clearview Earring",
body="Kyujutsugi",
hands="Sylvan Glovelettes +2",
ring1="Rajas ring",
waist="Fotia belt",
legs="Samnuha tights"
})
-- LAST STAND
sets.LastStand = {
neck="Fotia Gorget",
ear1="Moonshade earring",
ear2="Clearview earring",
body="Amini Caban +1",
ring1="Garuda Ring",
ring2="Stormsoul Ring",
waist="Fotia Belt",
feet="Orion Socks +1"
}
sets.precast.WS['Last Stand'] = set_combine(sets.precast.WS, sets.LastStand)
sets.precast.WS['Last Stand'].Mid = set_combine(sets.precast.WS.Mid, sets.LastStand)
sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS.Acc, sets.LastStand)
sets.precast.WS['Last Stand'].SAM = set_combine(sets.precast.WS, {
neck="Fotia Gorget",
ear1="Tripudio Earring",
ear2="Moonshade Earring",
hands="Adhemar wristbands",
ring1="Garuda Ring",
ring2="Stormsoul Ring",
waist="Fotia Belt",
legs="Samnuha tights",
})
-- DETONATOR
sets.Detonator = {
neck="Fotia Gorget",
ear1="Moonshade earring",
ear2="Clearview earring",
waist="Fotia Belt",
feet="Arcadian Socks +1"
}
sets.precast.WS['Detonator'] = set_combine(sets.precast.WS, sets.Detonator)
sets.precast.WS['Detonator'].Mid = set_combine(sets.precast.WS.Mid, sets.Detonator)
sets.precast.WS['Detonator'].Acc = set_combine(sets.precast.WS.Acc, sets.Detonator)
-- SLUG SHOT
sets.SlugShot = {
neck="Fotia Gorget",
waist="Fotia Belt",
feet="Arcadian Socks +1"
}
sets.precast.WS['Slug Shot'] = set_combine(sets.precast.WS, sets.SlugShot)
sets.precast.WS['Slug Shot'].Mid = set_combine(sets.precast.WS.Mid, sets.SlugShot)
sets.precast.WS['Slug Shot'].Acc = set_combine(sets.precast.WS.Acc, sets.SlugShot)
sets.precast.WS['Heavy Shot'] = set_combine(sets.precast.WS, sets.SlugShot)
sets.precast.WS['Heavy Shot'].Mid = set_combine(sets.precast.WS.Mid, sets.SlugShot)
sets.precast.WS['Heavy Shot'].Acc = set_combine(sets.precast.WS.Acc, sets.SlugShot)
-- NAMAS
sets.Namas = {
neck="Fotia Gorget",
waist="Fotia Belt",
hands="Arcadian Bracers +1", -- override since we don't want sigyns in Mid or Acc
back="Sylvan Chlamys",
feet="Arcadian Socks +1"
}
sets.precast.WS['Namas Arrow'] = set_combine(sets.precast.WS, sets.Namas)
sets.precast.WS['Namas Arrow'].Mid = set_combine(sets.precast.WS.Mid, sets.Namas)
sets.precast.WS['Namas Arrow'].Acc = set_combine(sets.precast.WS.Acc, sets.Namas)
sets.precast.WS['Namas Arrow'].SAM = set_combine(sets.precast.WS, {
neck="Fotia Gorget",
ear1="Volley Earring",
ear2="Tripudio Earring",
waist="Fotia Belt",
back="Sylvan Chlamys",
legs="Samnuha tights"
})
-- JISHNUS
sets.Jishnus = {
head="Umbani cap",
neck="Rancor collar",
body="Khepri jacket",
hands="Arcadian bracers +1",
ring1="Rajas ring",
ring2="Ramuh Ring",
back="Lutian cape",
waist="Fotia Belt",
legs="Arcadian Braccae +1",
feet="Orion socks +1"
}
sets.precast.WS['Jishnu\'s Radiance'] = set_combine(sets.precast.WS, sets.Jishnus)
sets.precast.WS['Jishnu\'s Radiance'].Mid = set_combine(sets.precast.WS.Mid, sets.Jishnus)
sets.precast.WS['Jishnu\'s Radiance'].Acc = set_combine(sets.precast.WS.Acc, sets.Jishnus)
-- SIDEWINDER
sets.Sidewinder = {
neck="Fotia Gorget",
waist="Fotia Belt",
hands="Arcadian Bracers +1",
back="Buquwik Cape",
feet="Arcadian Socks +1"
}
sets.precast.WS['Sidewinder'] = set_combine(sets.precast.WS, sets.Sidewinder)
sets.precast.WS['Sidewinder'].Mid = set_combine(sets.precast.WS.Mid, sets.Sidewinder)
sets.precast.WS['Sidewinder'].Acc = set_combine(sets.precast.WS.Acc, sets.Sidewinder)
sets.precast.WS['Refulgent Arrow'] = sets.precast.WS['Sidewinder']
sets.precast.WS['Refulgent Arrow'].Mid = sets.precast.WS['Sidewinder'].Mid
sets.precast.WS['Refulgent Arrow'].Acc = sets.precast.WS['Sidewinder'].Acc
-- Resting sets
sets.resting = {}
-- Defense sets
sets.defense.PDT = set_combine(sets.engaged.PDT, {})
sets.defense.MDT = set_combine(sets.idle, {})
sets.Kiting = {feet="Jute boots +1"}
sets.buff.Barrage = {
head="Uk'uxkaj Cap",
neck="Rancor Collar",
ear1="Volley earring",
ear2="Clearview earring",
body="Orion Jerkin +1",
hands="Orion Bracers +1",
ring1="Paqichikaji Ring",
ring2="Hajduk Ring",
back="Lutian Cape",
waist="Elanid Belt",
legs="Desultor tassets",
feet="Orion Socks +1"
}

sets.buff.Barrage.Mid = {
head="Uk'uxkaj Cap",
neck="Rancor Collar",
ear1="Volley earring",
ear2="Clearview earring",
body="Orion Jerkin +1",
hands="Orion Bracers +1",
ring1="Paqichikaji Ring",
ring2="Hajduk Ring",
back="Lutian Cape",
waist="Elanid Belt",
legs="Desultor tassets",
feet="Orion Socks +1"
}

sets.buff.Barrage.Acc = {
head="Umbani cap",
neck="Rancor Collar",
ear1="Volley earring",
ear2="Clearview Earring",
body="Orion Jerkin +1",
hands="Orion Bracers +1",
ring1="Paqichikaji Ring",
ring2="Hajduk Ring",
back="Lutian Cape",
waist="Elanid Belt",
legs="Desultor tassets",
feet="Orion Socks +1"
}
sets.buff.Camouflage = {body="Orion Jerkin +1"}

sets.Overkill = {body="Arcadian jerkin +1"}
sets.DoubleShot = {body="Arcadian jerkin +1"}
sets.Overkill.Preshot = set_combine(sets.precast.RA, sets.Overkill)
sets.midcast.DoubleShot = set_combine(sets.midcast.RA, sets.Doubleshot)
end