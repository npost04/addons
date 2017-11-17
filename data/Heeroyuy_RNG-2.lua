	

    -- *** Credit goes to Flippant for helping me with Gearswap *** --
    -- ** I Use Some of Motenten's Functions ** --
    -- Last Updated: 05/02/14 10:00 PM *Advanced Version* --
     
    function get_sets()
            AccIndex = 1
            AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Shooting/TP/WS. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below. Most of These Sets Are Empty So You Need To Edit Them On Your Own. Remember To Check What The Combined Set Is For Each Sets. --
            WeaponIndex = 1
            WeaponArray = {"Annihilator","Yoichinoyumi"} -- Default Ranged Weapon Is Annihilator. Can Delete Any Weapons/Sets That You Don't Need Or Replace/Add The New Weapons That You Want To Use. --
            IdleIndex = 1
            IdleArray = {"Movement","Regen"} -- Default Idle Set Is Movement --
            Armor = 'None'
            warning = false
            AutoMode = 'OFF' -- Set Default Auto RA/WS ON or OFF Here --
            Attack = 'OFF' -- Set Default Attack Set ON or OFF Here --
            Enmity = 'OFF' -- Set Default Enmity Set ON or OFF Here --
            ammo_warning_limit = 10 -- Set Ammo Limit Check Here --
            Samurai_Roll = 'ON' -- Set Default SAM Roll ON or OFF Here --
            target_distance = 5 -- Set Default Distance Here --
            select_default_macro_book() -- Change Default Macro Book At The End --
     
            sc_map = {SC1="LastStand", SC2="Coronach", SC3="Ranged"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
     
            sets.Idle = {}
            -- Idle/Town Sets --
            sets.Idle.Regen = {
                            head="Oce. Headpiece +1",
                            neck="Wiglen Gorget",
                            ear1="Black Earring",
                            ear2="Dawn Earring",
                            body="Khepri Jacket",
                            hands="Orion Bracers +1",
                            ring1="Paguroidea Ring",
                            ring2="Sheltered Ring",
                            back="Repulse Mantle",
                            waist="Lycopodium Sash",
                            legs="Orion Braccae +1",
                            feet="Skd. Jambeaux +1"}
            sets.Idle.Regen.Annihilator = set_combine(sets.Idle.Regen,{
                            main="Hurlbat",
                            sub="Moogle Guard +1",
                            range="Annihilator",
                            ammo="Achiyal. Bullet"})
            sets.Idle.Regen.Yoichinoyumi = set_combine(sets.Idle.Regen,{
                            main="Hurlbat",
                            sub="Moogle Guard +1",
                            range="Yoichinoyumi",
                            ammo="Achiyal. Arrow"})
            sets.Idle.Regen.Annihilator.NIN = set_combine(sets.Idle.Regen,{
                            main="Hurlbat",
                            sub="Courser's Pugio",
                            range="Annihilator",
                            ammo="Achiyal. Bullet"})
            sets.Idle.Regen.Yoichinoyumi.NIN = set_combine(sets.Idle.Regen,{
                            main="Hurlbat",
                            sub="Courser's Pugio",
                            range="Yoichinoyumi",
                            ammo="Achiyal. Arrow"})
     
            sets.Idle.Movement = set_combine(sets.Idle.Regen,{
                            head="Arcadian Beret +1",
                            neck="Twilight Torque",
                            ear1="Vulcan's Pearl",
                            body="Kyujutsugi",
                            ring1="Patricius Ring",
                            ring2="Defending Ring"})
            sets.Idle.Movement.Annihilator = set_combine(sets.Idle.Movement,{
                            range="Annihilator",
                            ammo="Achiyal. Bullet"})
            sets.Idle.Movement.Yoichinoyumi = set_combine(sets.Idle.Movement,{
                            range="Yoichinoyumi",
                            ammo="Achiyal. Arrow"})
            sets.Idle.Movement.Annihilator.NIN = set_combine(sets.Idle.Movement,{
                            main="Hurlbat",
                            sub="Courser's Pugio",
                            range="Annihilator",
                            ammo="Achiyal. Bullet"})
            sets.Idle.Movement.Yoichinoyumi.NIN = set_combine(sets.Idle.Movement,{
                            main="Hurlbat",
                            sub="Courser's Pugio",
                            range="Yoichinoyumi",
                            ammo="Achiyal. Arrow"})
     
            -- Preshot --
            sets.Preshot = {
                            head="Sylvan Gapette +2",
                            body="Sylvan Caban +2",
                            hands="Iuitl Wristbands +1",
                            waist="Impulse Belt",
                            legs="Nahtirah Trousers",
                            feet="Wurrukatte Boots"}
     
            -- Barrage Base Set. This Set Takes Priority Over Other Pieces. --
            Barrage = {
                            hands="Orion Bracers +1",
                            legs="Desultor Tassets"}
     
            -- Shooting Base Set --
            sets.Midshot = {}
     
            -- Annihilator(Decoy Down) Sets --
            sets.Midshot.Annihilator = {
                            main="Hurlbat",
                            sub="Moogle Guard +1",
                            range="Annihilator",
                            ammo="Achiyal. Bullet",
                            head="Arcadian Beret +1",
                            neck="Ocachi Gorget",
                            ear1="Vulcan's Pearl",
                            ear2="Volley Earring",
                            body="Kyujutsugi",
                            hands="Arc. Bracers +1",
                            ring1="Hajduk Ring +1",
                            ring2="Rajas Ring",
                            back="Lutian Cape",
                            waist="Elanid Belt",
                            legs="Nahtirah Trousers",
                            feet="Arcadian Socks +1"}
            sets.Midshot.Annihilator.MidACC = set_combine(sets.Midshot.Annihilator,{
                            ear1="Clearview Earring",
                            legs="Orion Braccae +1",
                            feet="Orion Socks +1"})
            sets.Midshot.Annihilator.HighACC = set_combine(sets.Midshot.Annihilator.MidACC,{
                            neck="Ej necklace +1",
                            hands="Sigyn's Bazubands",
                            ring2="Hajduk Ring +1"})
     
            -- Annihilator(Decoy Up) Sets --
            sets.Midshot.Annihilator.Decoy = set_combine(sets.Midshot.Annihilator,{})
            sets.Midshot.Annihilator.MidACC.Decoy = set_combine(sets.Midshot.Annihilator.MidACC,{})
            sets.Midshot.Annihilator.HighACC.Decoy = set_combine(sets.Midshot.Annihilator.HighACC,{})
     
            -- Annihilator(Enmity) Sets --
            sets.Midshot.Annihilator.Enmity = set_combine(sets.Midshot.Annihilator,{})
            sets.Midshot.Annihilator.MidACC.Enmity = set_combine(sets.Midshot.Annihilator.MidACC,{})
            sets.Midshot.Annihilator.HighACC.Enmity = set_combine(sets.Midshot.Annihilator.HighACC,{})
     
            -- Annihilator(AM) Sets --
            sets.Midshot.Annihilator.AM = set_combine(sets.Midshot.Annihilator,{})
            sets.Midshot.Annihilator.MidACC.AM = set_combine(sets.Midshot.Annihilator.MidACC,{})
            sets.Midshot.Annihilator.HighACC.AM = set_combine(sets.Midshot.Annihilator.HighACC,{})
     
            -- Annihilator(Decoy Down: Ionis) Sets --
            sets.Midshot.Annihilator.Ionis = set_combine(sets.Midshot.Annihilator,{})
            sets.Midshot.Annihilator.MidACC.Ionis = set_combine(sets.Midshot.Annihilator.MidACC,{})
            sets.Midshot.Annihilator.HighACC.Ionis = set_combine(sets.Midshot.Annihilator.HighACC,{})
     
            -- Annihilator(Decoy Up: Ionis) Sets --
            sets.Midshot.Annihilator.Decoy.Ionis = set_combine(sets.Midshot.Annihilator,{})
            sets.Midshot.Annihilator.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.MidACC,{})
            sets.Midshot.Annihilator.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.HighACC,{})
     
            -- Annihilator(Decoy Down: SAM Roll) Sets --
            sets.Midshot.Annihilator.STP = set_combine(sets.Midshot.Annihilator,{})
            sets.Midshot.Annihilator.MidACC.STP = set_combine(sets.Midshot.Annihilator.MidACC,{})
            sets.Midshot.Annihilator.HighACC.STP = set_combine(sets.Midshot.Annihilator.HighACC,{})
     
            -- Annihilator(Decoy Up: SAM Roll) Sets --
            sets.Midshot.Annihilator.Decoy.STP = set_combine(sets.Midshot.Annihilator,{})
            sets.Midshot.Annihilator.MidACC.Decoy.STP = set_combine(sets.Midshot.Annihilator.MidACC,{})
            sets.Midshot.Annihilator.HighACC.Decoy.STP = set_combine(sets.Midshot.Annihilator.HighACC,{})
     
            -- Annihilator(Decoy Down: Ionis + SAM Roll) Sets --
            sets.Midshot.Annihilator.Ionis.STP = set_combine(sets.Midshot.Annihilator,{})
            sets.Midshot.Annihilator.MidACC.Ionis.STP = set_combine(sets.Midshot.Annihilator.MidACC,{})
            sets.Midshot.Annihilator.HighACC.Ionis.STP = set_combine(sets.Midshot.Annihilator.HighACC,{})
     
            -- Annihilator(Decoy Up: Ionis + SAM Roll) Sets --
            sets.Midshot.Annihilator.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator,{})
            sets.Midshot.Annihilator.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.MidACC,{})
            sets.Midshot.Annihilator.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.HighACC,{})
     
            -- Annihilator Barrage Sets --
            sets.Midshot.Annihilator.Barrage = set_combine(sets.Midshot.Annihilator,{},Barrage)
            sets.Midshot.Annihilator.MidACC.Barrage = set_combine(sets.Midshot.Annihilator.MidACC,{},Barrage)
            sets.Midshot.Annihilator.HighACC.Barrage = set_combine(sets.Midshot.Annihilator.HighACC,{},Barrage)
     
            -- Yoichinoyumi(Decoy Down) Sets --
            sets.Midshot.Yoichinoyumi = {
                            main="Hurlbat",
                            sub="Moogle Guard +1",
                            range="Yoichinoyumi",
                            ammo="Achiyal. Arrow",
                            head="Arcadian Beret +1",
                            neck="Ocachi Gorget",
                            ear1="Vulcan's Pearl",
                            ear2="Volley Earring",
                            body="Kyujutsugi",
                            hands="Seiryu's Kote",
                            ring1="Hajduk Ring +1",
                            ring2="Rajas Ring",
                            back="Sylvan Chlamys",
                            waist="Elanid Belt",
                            legs="Nahtirah Trousers",
                            feet="Arcadian Socks +1"}
            sets.Midshot.Yoichinoyumi.MidACC = set_combine(sets.Midshot.Yoichinoyumi,{
                            ear1="Clearview Earring",
                            back="Lutian Cape",
                            legs="Orion Braccae +1",
                            feet="Orion Socks +1"})
            sets.Midshot.Yoichinoyumi.HighACC = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{
                            neck="Ej necklace +1",
                            hands="Buremte Gloves",
                            ring2="Hajduk Ring +1"})
     
            -- Yoichinoyumi(Decoy Up) Sets --
            sets.Midshot.Yoichinoyumi.Decoy = set_combine(sets.Midshot.Yoichinoyumi,{})
            sets.Midshot.Yoichinoyumi.MidACC.Decoy = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{})
            sets.Midshot.Yoichinoyumi.HighACC.Decoy = set_combine(sets.Midshot.Yoichinoyumi.HighACC,{})
     
            -- Yoichinoyumi(Enmity) Sets --
            sets.Midshot.Yoichinoyumi.Enmity = set_combine(sets.Midshot.Yoichinoyumi,{})
            sets.Midshot.Yoichinoyumi.MidACC.Enmity = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{})
            sets.Midshot.Yoichinoyumi.HighACC.Enmity = set_combine(sets.Midshot.Yoichinoyumi.HighACC,{})
     
            -- Yoichinoyumi(AM) Sets --
            sets.Midshot.Yoichinoyumi.AM = set_combine(sets.Midshot.Yoichinoyumi,{})
            sets.Midshot.Yoichinoyumi.MidACC.AM = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{})
            sets.Midshot.Yoichinoyumi.HighACC.AM = set_combine(sets.Midshot.Yoichinoyumi.HighACC,{})
     
            -- Yoichinoyumi(Decoy Down: Ionis) Sets --
            sets.Midshot.Yoichinoyumi.Ionis = set_combine(sets.Midshot.Yoichinoyumi,{})
            sets.Midshot.Yoichinoyumi.MidACC.Ionis = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{})
            sets.Midshot.Yoichinoyumi.HighACC.Ionis = set_combine(sets.Midshot.Yoichinoyumi.HighACC,{})
     
            -- Yoichinoyumi(Decoy Up: Ionis) Sets --
            sets.Midshot.Yoichinoyumi.Decoy.Ionis = set_combine(sets.Midshot.Yoichinoyumi,{})
            sets.Midshot.Yoichinoyumi.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{})
            sets.Midshot.Yoichinoyumi.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Yoichinoyumi.HighACC,{})
     
            -- Yoichinoyumi(Decoy Down: SAM Roll) Sets --
            sets.Midshot.Yoichinoyumi.STP = set_combine(sets.Midshot.Yoichinoyumi,{
                            main="Mekki Shakki",
                            sub="Bloodrain Strap",
                            ear1="Tripudio Earring",
                            hands="Arc. Bracers +1",
                            feet="Orion Socks +1"})
            sets.Midshot.Yoichinoyumi.MidACC.STP = set_combine(sets.Midshot.Yoichinoyumi.STP,{
                            hands="Seiryu's Kote",
                            back="Lutian Cape",
                            legs="Aeto. Trousers +1",})
            sets.Midshot.Yoichinoyumi.HighACC.STP = set_combine(sets.Midshot.Yoichinoyumi.MidACC.STP,{
                            ring2="Hajduk Ring +1"})
     
            -- Yoichinoyumi(Decoy Up: SAM Roll) Sets --
            sets.Midshot.Yoichinoyumi.Decoy.STP = set_combine(sets.Midshot.Yoichinoyumi,{})
            sets.Midshot.Yoichinoyumi.MidACC.Decoy.STP = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{})
            sets.Midshot.Yoichinoyumi.HighACC.Decoy.STP = set_combine(sets.Midshot.Yoichinoyumi.HighACC,{})
     
            -- Yoichinoyumi(Decoy Down: Ionis + SAM Roll) Sets --
            sets.Midshot.Yoichinoyumi.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi,{})
            sets.Midshot.Yoichinoyumi.MidACC.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{})
            sets.Midshot.Yoichinoyumi.HighACC.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.HighACC,{})
     
            -- Yoichinoyumi(Decoy Up: Ionis + SAM Roll) Sets --
            sets.Midshot.Yoichinoyumi.Decoy.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi,{})
            sets.Midshot.Yoichinoyumi.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{})
            sets.Midshot.Yoichinoyumi.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.HighACC,{})
     
            -- Yoichinoyumi Barrage Sets --
            sets.Midshot.Yoichinoyumi.Barrage = set_combine(sets.Midshot.Yoichinoyumi,{},Barrage)
            sets.Midshot.Yoichinoyumi.MidACC.Barrage = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{},Barrage)
            sets.Midshot.Yoichinoyumi.HighACC.Barrage = set_combine(sets.Midshot.Yoichinoyumi.HighACC,{},Barrage)
     
            -- Annihilator(Decoy Down) /SAM Sets --
            sets.Midshot.Annihilator.SAM = {
                            range="Annihilator",
                            ammo="Achiyal. Bullet",
                            head="Arcadian Beret +1",
                            neck="Ocachi Gorget",
                            ear1="Vulcan's Pearl",
                            ear2="Volley Earring",
                            body="Kyujutsugi",
                            hands="Arc. Bracers +1",
                            ring1="Hajduk Ring +1",
                            ring2="Rajas Ring",
                            back="Lutian Cape",
                            waist="Elanid Belt",
                            legs="Nahtirah Trousers",
                            feet="Arcadian Socks +1"}
            sets.Midshot.Annihilator.SAM.MidACC = set_combine(sets.Midshot.Annihilator.SAM,{
                            ear1="Clearview Earring",
                            back="Lutian Cape",
                            legs="Orion Braccae +1",
                            feet="Orion Socks +1"})
            sets.Midshot.Annihilator.SAM.HighACC = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{
                            neck="Ej necklace +1",
                            hands="Sigyn's Bazubands",
                            ring2="Hajduk Ring +1"})
     
            -- Annihilator(Decoy Up) /SAM Sets --
            sets.Midshot.Annihilator.SAM.Decoy = set_combine(sets.Midshot.Annihilator.SAM,{})
            sets.Midshot.Annihilator.SAM.MidACC.Decoy = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
            sets.Midshot.Annihilator.SAM.HighACC.Decoy = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})
     
            -- Annihilator(Enmity) /SAM Sets --
            sets.Midshot.Annihilator.SAM.Enmity = set_combine(sets.Midshot.Annihilator.SAM,{})
            sets.Midshot.Annihilator.SAM.MidACC.Enmity = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
            sets.Midshot.Annihilator.SAM.HighACC.Enmity = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})
     
            -- Annihilator(AM) /SAM Sets --
            sets.Midshot.Annihilator.SAM.AM = set_combine(sets.Midshot.Annihilator.SAM,{})
            sets.Midshot.Annihilator.SAM.MidACC.AM = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
            sets.Midshot.Annihilator.SAM.HighACC.AM = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})
     
            -- Annihilator(Decoy Down: Ionis) /SAM Sets --
            sets.Midshot.Annihilator.SAM.Ionis = set_combine(sets.Midshot.Annihilator.SAM,{})
            sets.Midshot.Annihilator.SAM.MidACC.Ionis = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
            sets.Midshot.Annihilator.SAM.HighACC.Ionis = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})
     
            -- Annihilator(Decoy Up: Ionis) /SAM Sets --
            sets.Midshot.Annihilator.SAM.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.SAM,{})
            sets.Midshot.Annihilator.SAM.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
            sets.Midshot.Annihilator.SAM.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})
     
            -- Annihilator(Decoy Down: SAM Roll) /SAM Sets --
            sets.Midshot.Annihilator.SAM.STP = set_combine(sets.Midshot.Annihilator.SAM,{})
            sets.Midshot.Annihilator.SAM.MidACC.STP = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
            sets.Midshot.Annihilator.SAM.HighACC.STP = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})
     
            -- Annihilator(Decoy Up: SAM Roll) /SAM Sets --
            sets.Midshot.Annihilator.SAM.Decoy.STP = set_combine(sets.Midshot.Annihilator.SAM,{
                            main="Prester",
                            sub="Bloodrain Strap",
                            ear1="Tripudio Earring",
                            hands="Seiryu's Kote",
                            waist="Patentia Sash",
                            legs="Aeto. Trousers +1",
                            feet="Orion Socks +1"})
            sets.Midshot.Annihilator.SAM.MidACC.Decoy.STP = set_combine(sets.Midshot.Annihilator.SAM.Decoy.STP,{})
            sets.Midshot.Annihilator.SAM.HighACC.Decoy.STP = set_combine(sets.Midshot.Annihilator.SAM.MidACC.Decoy.STP,{})
     
            -- Annihilator(Decoy Down: Ionis + SAM Roll) /SAM Sets --
            sets.Midshot.Annihilator.SAM.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM,{})
            sets.Midshot.Annihilator.SAM.MidACC.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
            sets.Midshot.Annihilator.SAM.HighACC.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})
     
            -- Annihilator(Decoy Up: Ionis + SAM Roll) /SAM Sets --
            sets.Midshot.Annihilator.SAM.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM,{})
            sets.Midshot.Annihilator.SAM.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{})
            sets.Midshot.Annihilator.SAM.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{})
     
            -- Annihilator /SAM Barrage Sets --
            sets.Midshot.Annihilator.SAM.Barrage = set_combine(sets.Midshot.Annihilator.SAM,{},Barrage)
            sets.Midshot.Annihilator.SAM.MidACC.Barrage = set_combine(sets.Midshot.Annihilator.SAM.MidACC,{},Barrage)
            sets.Midshot.Annihilator.SAM.HighACC.Barrage = set_combine(sets.Midshot.Annihilator.SAM.HighACC,{},Barrage)
     
            -- Yoichinoyumi(Decoy Down) /SAM Sets --
            sets.Midshot.Yoichinoyumi.SAM = {
                            main="Hurlbat",
                            sub="Moogle Guard +1",
                            range="Yoichinoyumi",
                            ammo="Achiyal. Arrow",
                            head="Arcadian Beret +1",
                            neck="Ocachi Gorget",
                            ear1="Vulcan's Pearl",
                            ear2="Volley Earring",
                            body="Kyujutsugi",
                            hands="Arc. Bracers +1",
                            ring1="Hajduk Ring +1",
                            ring2="Rajas Ring",
                            back="Lutian Cape",
                            waist="Elanid Belt",
                            legs="Nahtirah Trousers",
                            feet="Arcadian Socks +1"}
            sets.Midshot.Yoichinoyumi.SAM.MidACC = set_combine(sets.Midshot.Yoichinoyumi.SAM,{
                            ear1="Clearview Earring",
                            legs="Orion Braccae +1",
                            feet="Orion Socks +1"})
            sets.Midshot.Yoichinoyumi.SAM.HighACC = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC,{
                            neck="Ej necklace +1",
                            hands="Buremte Gloves",
                            ring2="Hajduk Ring +1"})
     
            -- Yoichinoyumi(Decoy Up) /SAM Sets --
            sets.Midshot.Yoichinoyumi.SAM.Decoy = set_combine(sets.Midshot.Yoichinoyumi.SAM,{})
            sets.Midshot.Yoichinoyumi.SAM.MidACC.Decoy = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC,{})
            sets.Midshot.Yoichinoyumi.SAM.HighACC.Decoy = set_combine(sets.Midshot.Yoichinoyumi.SAM.HighACC,{})
     
            -- Yoichinoyumi(Enmity) /SAM Sets --
            sets.Midshot.Yoichinoyumi.SAM.Enmity = set_combine(sets.Midshot.Yoichinoyumi.SAM,{})
            sets.Midshot.Yoichinoyumi.SAM.MidACC.Enmity = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC,{})
            sets.Midshot.Yoichinoyumi.SAM.HighACC.Enmity = set_combine(sets.Midshot.Yoichinoyumi.SAM.HighACC,{})
     
            -- Yoichinoyumi(AM) /SAM Sets --
            sets.Midshot.Yoichinoyumi.SAM.AM = set_combine(sets.Midshot.Yoichinoyumi.SAM,{})
            sets.Midshot.Yoichinoyumi.SAM.MidACC.AM = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC,{})
            sets.Midshot.Yoichinoyumi.SAM.HighACC.AM = set_combine(sets.Midshot.Yoichinoyumi.SAM.HighACC,{})
     
            -- Yoichinoyumi(Decoy Down: Ionis) /SAM Sets --
            sets.Midshot.Yoichinoyumi.SAM.Ionis = set_combine(sets.Midshot.Yoichinoyumi.SAM,{})
            sets.Midshot.Yoichinoyumi.SAM.MidACC.Ionis = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC,{})
            sets.Midshot.Yoichinoyumi.SAM.HighACC.Ionis = set_combine(sets.Midshot.Yoichinoyumi.SAM.HighACC,{})
     
            -- Yoichinoyumi(Decoy Up: Ionis) /SAM Sets --
            sets.Midshot.Yoichinoyumi.SAM.Decoy.Ionis = set_combine(sets.Midshot.Yoichinoyumi.SAM,{})
            sets.Midshot.Yoichinoyumi.SAM.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC,{})
            sets.Midshot.Yoichinoyumi.SAM.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Yoichinoyumi.SAM.HighACC,{})
     
            -- Yoichinoyumi(Decoy Down: SAM Roll) /SAM Sets --
            sets.Midshot.Yoichinoyumi.SAM.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM,{})
            sets.Midshot.Yoichinoyumi.SAM.MidACC.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC,{})
            sets.Midshot.Yoichinoyumi.SAM.HighACC.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM.HighACC,{})
     
            -- Yoichinoyumi(Decoy Up: SAM Roll) /SAM Sets --
            sets.Midshot.Yoichinoyumi.SAM.Decoy.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM,{
                            main="Mekki Shakki",
                            sub="Bloodrain Strap",
                            ear1="Tripudio Earring",
                            hands="Arc. Bracers +1",
                            back="Sylvan Chlamys",
                            waist="Elanid Belt",
                            feet="Orion Socks +1"})
            sets.Midshot.Yoichinoyumi.SAM.MidACC.Decoy.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM.Decoy.STP,{
                            hands="Seiryu's Kote",
                            legs="Aeto. Trousers +1"})
            sets.Midshot.Yoichinoyumi.SAM.HighACC.Decoy.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC.Decoy.STP,{})
     
            -- Yoichinoyumi(Decoy Down: Ionis + SAM Roll) /SAM Sets --
            sets.Midshot.Yoichinoyumi.SAM.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM,{})
            sets.Midshot.Yoichinoyumi.SAM.MidACC.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC,{})
            sets.Midshot.Yoichinoyumi.SAM.HighACC.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM.HighACC,{})
     
            -- Yoichinoyumi(Decoy Up: Ionis + SAM Roll) /SAM Sets --
            sets.Midshot.Yoichinoyumi.SAM.Decoy.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM,{})
            sets.Midshot.Yoichinoyumi.SAM.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC,{})
            sets.Midshot.Yoichinoyumi.SAM.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.SAM.HighACC,{})
     
            -- Yoichinoyumi /SAM Barrage Sets --
            sets.Midshot.Yoichinoyumi.SAM.Barrage = set_combine(sets.Midshot.Yoichinoyumi.SAM,{},Barrage)
            sets.Midshot.Yoichinoyumi.SAM.MidACC.Barrage = set_combine(sets.Midshot.Yoichinoyumi.SAM.MidACC,{},Barrage)
            sets.Midshot.Yoichinoyumi.SAM.HighACC.Barrage = set_combine(sets.Midshot.Yoichinoyumi.SAM.HighACC,{},Barrage)
     
            -- Annihilator(Decoy Down) /NIN Sets --
            sets.Midshot.Annihilator.NIN = {
                            main="Hurlbat",
                            sub="Courser's Pugio",
                            range="Annihilator",
                            ammo="Achiyal. Bullet",
                            head="Arcadian Beret +1",
                            neck="Ocachi Gorget",
                            ear1="Vulcan's Pearl",
                            ear2="Volley Earring",
                            body="Kyujutsugi",
                            hands="Arc. Bracers +1",
                            ring1="Hajduk Ring +1",
                            ring2="Rajas Ring",
                            back="Lutian Cape",
                            waist="Elanid Belt",
                            legs="Nahtirah Trousers",
                            feet="Arcadian Socks +1"}
            sets.Midshot.Annihilator.NIN.MidACC = set_combine(sets.Midshot.Annihilator.NIN,{
                            ear1="Clearview Earring",
                            back="Lutian Cape",
                            legs="Orion Braccae +1",
                            feet="Orion Socks +1"})
            sets.Midshot.Annihilator.NIN.HighACC = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{
                            neck="Ej necklace +1",
                            hands="Sigyn's Bazubands",
                            ring2="Hajduk Ring +1"})
     
            -- Annihilator(Decoy Up) /NIN Sets --
            sets.Midshot.Annihilator.NIN.Decoy = set_combine(sets.Midshot.Annihilator.NIN,{})
            sets.Midshot.Annihilator.NIN.MidACC.Decoy = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
            sets.Midshot.Annihilator.NIN.HighACC.Decoy = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})
     
            -- Annihilator(Enmity) /NIN Sets --
            sets.Midshot.Annihilator.NIN.Enmity = set_combine(sets.Midshot.Annihilator.NIN,{})
            sets.Midshot.Annihilator.NIN.MidACC.Enmity = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
            sets.Midshot.Annihilator.NIN.HighACC.Enmity = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})
     
            -- Annihilator(AM) /NIN Sets --
            sets.Midshot.Annihilator.NIN.AM = set_combine(sets.Midshot.Annihilator.NIN,{})
            sets.Midshot.Annihilator.NIN.MidACC.AM = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
            sets.Midshot.Annihilator.NIN.HighACC.AM = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})
     
            -- Annihilator(Decoy Down: Ionis) /NIN Sets --
            sets.Midshot.Annihilator.NIN.Ionis = set_combine(sets.Midshot.Annihilator.NIN,{})
            sets.Midshot.Annihilator.NIN.MidACC.Ionis = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
            sets.Midshot.Annihilator.NIN.HighACC.Ionis = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})
     
            -- Annihilator(Decoy Up: Ionis) /NIN Sets --
            sets.Midshot.Annihilator.NIN.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.NIN,{})
            sets.Midshot.Annihilator.NIN.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
            sets.Midshot.Annihilator.NIN.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})
     
            -- Annihilator(Decoy Down: SAM Roll) /NIN Sets --
            sets.Midshot.Annihilator.NIN.STP = set_combine(sets.Midshot.Annihilator.NIN,{})
            sets.Midshot.Annihilator.NIN.MidACC.STP = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
            sets.Midshot.Annihilator.NIN.HighACC.STP = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})
     
            -- Annihilator(Decoy Up: SAM Roll) /NIN Sets --
            sets.Midshot.Annihilator.NIN.Decoy.STP = set_combine(sets.Midshot.Annihilator.NIN,{})
            sets.Midshot.Annihilator.NIN.MidACC.Decoy.STP = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
            sets.Midshot.Annihilator.NIN.HighACC.Decoy.STP = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})
     
            -- Annihilator(Decoy Down: Ionis + SAM Roll) /NIN Sets --
            sets.Midshot.Annihilator.NIN.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN,{})
            sets.Midshot.Annihilator.NIN.MidACC.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
            sets.Midshot.Annihilator.NIN.HighACC.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})
     
            -- Annihilator(Decoy Up: Ionis + SAM Roll) /NIN Sets --
            sets.Midshot.Annihilator.NIN.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN,{})
            sets.Midshot.Annihilator.NIN.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{})
            sets.Midshot.Annihilator.NIN.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{})
     
            -- Annihilator /NIN Barrage Sets --
            sets.Midshot.Annihilator.NIN.Barrage = set_combine(sets.Midshot.Annihilator.NIN,{},Barrage)
            sets.Midshot.Annihilator.NIN.MidACC.Barrage = set_combine(sets.Midshot.Annihilator.NIN.MidACC,{},Barrage)
            sets.Midshot.Annihilator.NIN.HighACC.Barrage = set_combine(sets.Midshot.Annihilator.NIN.HighACC,{},Barrage)
     
            -- Yoichinoyumi(Decoy Down) /NIN Sets --
            sets.Midshot.Yoichinoyumi.NIN = {
                            main="Hurlbat",
                            sub="Aphotic Kukri",
                            range="Yoichinoyumi",
                            ammo="Achiyal. Arrow",
                            head="Arcadian Beret +1",
                            neck="Ocachi Gorget",
                            ear1="Vulcan's Pearl",
                            ear2="Volley Earring",
                            body="Kyujutsugi",
                            hands="Arc. Bracers +1",
                            ring1="Hajduk Ring +1",
                            ring2="Rajas Ring",
                            back="Lutian Cape",
                            waist="Elanid Belt",
                            legs="Nahtirah Trousers",
                            feet="Arcadian Socks +1"}
            sets.Midshot.Yoichinoyumi.NIN.MidACC = set_combine(sets.Midshot.Yoichinoyumi.NIN,{
                            ear1="Clearview Earring",
                            legs="Orion Braccae +1",
                            feet="Orion Socks +1"})
            sets.Midshot.Yoichinoyumi.NIN.HighACC = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{
                            neck="Ej necklace +1",
                            hands="Buremte Gloves",
                            ring2="Hajduk Ring +1"})
     
            -- Yoichinoyumi(Decoy Up) /NIN Sets --
            sets.Midshot.Yoichinoyumi.NIN.Decoy = set_combine(sets.Midshot.Yoichinoyumi.NIN,{})
            sets.Midshot.Yoichinoyumi.NIN.MidACC.Decoy = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{})
            sets.Midshot.Yoichinoyumi.NIN.HighACC.Decoy = set_combine(sets.Midshot.Yoichinoyumi.NIN.HighACC,{})
     
            -- Yoichinoyumi(Enmity) /NIN Sets --
            sets.Midshot.Yoichinoyumi.NIN.Enmity = set_combine(sets.Midshot.Yoichinoyumi.NIN,{})
            sets.Midshot.Yoichinoyumi.NIN.MidACC.Enmity = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{})
            sets.Midshot.Yoichinoyumi.NIN.HighACC.Enmity = set_combine(sets.Midshot.Yoichinoyumi.NIN.HighACC,{})
     
            -- Yoichinoyumi(AM) /NIN Sets --
            sets.Midshot.Yoichinoyumi.NIN.AM = set_combine(sets.Midshot.Yoichinoyumi.NIN,{})
            sets.Midshot.Yoichinoyumi.NIN.MidACC.AM = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{})
            sets.Midshot.Yoichinoyumi.NIN.HighACC.AM = set_combine(sets.Midshot.Yoichinoyumi.NIN.HighACC,{})
     
            -- Yoichinoyumi(Decoy Down: Ionis) /NIN Sets --
            sets.Midshot.Yoichinoyumi.NIN.Ionis = set_combine(sets.Midshot.Yoichinoyumi.NIN,{})
            sets.Midshot.Yoichinoyumi.NIN.MidACC.Ionis = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{})
            sets.Midshot.Yoichinoyumi.NIN.HighACC.Ionis = set_combine(sets.Midshot.Yoichinoyumi.NIN.HighACC,{})
     
            -- Yoichinoyumi(Decoy Up: Ionis) /NIN Sets --
            sets.Midshot.Yoichinoyumi.NIN.Decoy.Ionis = set_combine(sets.Midshot.Yoichinoyumi.NIN,{})
            sets.Midshot.Yoichinoyumi.NIN.MidACC.Decoy.Ionis = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{})
            sets.Midshot.Yoichinoyumi.NIN.HighACC.Decoy.Ionis = set_combine(sets.Midshot.Yoichinoyumi.NIN.HighACC,{})
     
            -- Yoichinoyumi(Decoy Down: SAM Roll) /NIN Sets --
            sets.Midshot.Yoichinoyumi.NIN.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN,{})
            sets.Midshot.Yoichinoyumi.NIN.MidACC.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{})
            sets.Midshot.Yoichinoyumi.NIN.HighACC.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN.HighACC,{})
     
            -- Yoichinoyumi(Decoy Up: SAM Roll) /NIN Sets --
            sets.Midshot.Yoichinoyumi.NIN.Decoy.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN,{})
            sets.Midshot.Yoichinoyumi.NIN.MidACC.Decoy.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{})
            sets.Midshot.Yoichinoyumi.NIN.HighACC.Decoy.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN.HighACC,{})
     
            -- Yoichinoyumi(Decoy Down: Ionis + SAM Roll) /NIN Sets --
            sets.Midshot.Yoichinoyumi.NIN.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN,{})
            sets.Midshot.Yoichinoyumi.NIN.MidACC.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{})
            sets.Midshot.Yoichinoyumi.NIN.HighACC.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN.HighACC,{})
     
            -- Yoichinoyumi(Decoy Up: Ionis + SAM Roll) /NIN Sets --
            sets.Midshot.Yoichinoyumi.NIN.Decoy.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN,{})
            sets.Midshot.Yoichinoyumi.NIN.MidACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{})
            sets.Midshot.Yoichinoyumi.NIN.HighACC.Decoy.Ionis.STP = set_combine(sets.Midshot.Yoichinoyumi.NIN.HighACC,{})
     
            -- Yoichinoyumi /NIN Barrage Sets --
            sets.Midshot.Yoichinoyumi.NIN.Barrage = set_combine(sets.Midshot.Yoichinoyumi.NIN,{},Barrage)
            sets.Midshot.Yoichinoyumi.NIN.MidACC.Barrage = set_combine(sets.Midshot.Yoichinoyumi.NIN.MidACC,{},Barrage)
            sets.Midshot.Yoichinoyumi.NIN.HighACC.Barrage = set_combine(sets.Midshot.Yoichinoyumi.NIN.HighACC,{},Barrage)
     
            -- PDT/MDT Sets --
            sets.PDT = {
                            head="Iuitl Headgear +1",
                            neck="Twilight Torque",
                            ear1="Black Earring",
                            ear2="Darkness Earring",
                            body="Iuitl Vest +1",
                            hands="Iuitl Wristbands +1",
                            ring1="Dark Ring",
                            ring2="Defending Ring",
                            back="Shadow Mantle",
                            waist="Flume Belt",
                            legs="Iuitl Tights +1",
                            feet="Iuitl Gaiters +1"}
     
            sets.MDT = set_combine(sets.PDT,{
                            ear1="Merman's Earring",
                            ear2="Sanare Earring",
                            ring1="Shadow Ring",
                            back="Engulfer Cape",
                            waist="Resolute Belt"})
     
            -- Melee Sets --
            sets.Melee = {}
            sets.Melee.MidACC = set_combine(sets.Melee,{})
            sets.Melee.HighACC = set_combine(sets.Melee.MidACC,{})
     
            -- WS Base Set --
            sets.WS = {}
     
            -- Coronach Sets --
            sets.WS.Coronach = {
                            ammo="Achiyal. Bullet",
                            head="Arcadian Beret +1",
                            neck="Breeze Gorget",
                            ear1="Vulcan's Pearl",
                            ear2="Vulcan's Pearl",
                            body="Khepri Jacket",
                            hands="Arc. Bracers +1",
                            ring1="Pyrosoul Ring",
                            ring2="Rajas Ring",
                            back="Buquwik Cape",
                            waist="Breeze Belt",
                            legs="Nahtirah Trousers",
                            feet="Arcadian Socks +1"}
            sets.WS.Coronach.MidACC = set_combine(sets.WS.Coronach,{
                            back="Lutian Cape",
                            feet="Orion Socks +1"})
            sets.WS.Coronach.HighACC = set_combine(sets.WS.Coronach.MidACC,{
                            hands="Sigyn's Bazubands",
                            legs="Orion Braccae +1"})
     
            -- Coronach(Attack) Set. This Set Takes Priority Over Other Sets. --
            sets.WS.Coronach.ATT = set_combine(sets.WS.Coronach,{})
     
            -- Coronach(Enmity) Sets --
            sets.WS.Coronach.Enmity = set_combine(sets.WS.Coronach,{})
            sets.WS.Coronach.MidACC.Enmity = set_combine(sets.WS.Coronach.MidACC,{})
            sets.WS.Coronach.HighACC.Enmity = set_combine(sets.WS.Coronach.HighACC,{})
     
            -- Coronach(AM) Sets --
            sets.WS.Coronach.AM = set_combine(sets.WS.Coronach,{})
            sets.WS.Coronach.MidACC.AM = set_combine(sets.WS.Coronach.MidACC,{})
            sets.WS.Coronach.HighACC.AM = set_combine(sets.WS.Coronach.HighACC,{})
     
            -- Coronach(SAM Roll) Sets --
            sets.WS.Coronach.STP = set_combine(sets.WS.Coronach,{})
            sets.WS.Coronach.MidACC.STP = set_combine(sets.WS.Coronach.MidACC,{})
            sets.WS.Coronach.HighACC.STP = set_combine(sets.WS.Coronach.HighACC,{})
     
            -- Last Stand Sets --
            sets.WS["Last Stand"] = {
                            ammo="Achiyal. Bullet",
                            head="Arcadian Beret +1",
                            neck="Flame Gorget",
                            ear1="Moonshade Earring",
                            ear2="Sylvan Earring",
                            body="Kyujutsugi",
                            hands="Arc. Bracers +1",
                            ring1="Stormsoul Ring",
                            ring2="Stormsoul Ring",
                            back="Lutian Cape",
                            waist="Flame Belt",
                            legs="Nahtirah Trousers",
                            feet="Arcadian Socks +1"}
            sets.WS["Last Stand"].MidACC = set_combine(sets.WS["Last Stand"],{
                            feet="Orion Socks +1"})
            sets.WS["Last Stand"].HighACC = set_combine(sets.WS["Last Stand"].MidACC,{
                            hands="Sigyn's Bazubands",
                            legs="Orion Braccae +1"})
     
            -- Last Stand(Attack) Set. This Set Takes Priority Over Other Sets. --
            sets.WS["Last Stand"].ATT = set_combine(sets.WS["Last Stand"],{})
     
            -- Last Stand(Enmity) Sets --
            sets.WS["Last Stand"].Enmity = set_combine(sets.WS["Last Stand"],{
                            hands="Arc. Bracers +1",
                            legs="Arc. Braccae +1",
                            feet="Arcadian Socks +1"})
            sets.WS["Last Stand"].MidACC.Enmity = set_combine(sets.WS["Last Stand"].MidACC,{})
            sets.WS["Last Stand"].HighACC.Enmity = set_combine(sets.WS["Last Stand"].HighACC,{})
     
            -- Last Stand(AM) Sets --
            sets.WS["Last Stand"].AM = set_combine(sets.WS["Last Stand"],{})
            sets.WS["Last Stand"].MidACC.AM = set_combine(sets.WS["Last Stand"].MidACC,{})
            sets.WS["Last Stand"].HighACC.AM = set_combine(sets.WS["Last Stand"].HighACC,{})
     
            -- Last Stand(SAM Roll) Sets --
            sets.WS["Last Stand"].STP = set_combine(sets.WS["Last Stand"],{})
            sets.WS["Last Stand"].MidACC.STP = set_combine(sets.WS["Last Stand"].MidACC,{})
            sets.WS["Last Stand"].HighACC.STP = set_combine(sets.WS["Last Stand"].HighACC,{})
     
            -- Namas Arrow Sets --
            sets.WS["Namas Arrow"] = {
                            ammo="Achiyal. Arrow",
                            head="Arcadian Beret +1",
                            neck="Flame Gorget",
                            ear1="Vulcan's Pearl",
                            ear2="Vulcan's Pearl",
                            body="Khepri Jacket",
                            hands="Arc. Bracers +1",
                            ring1="Pyrosoul Ring",
                            ring2="Aife's Ring",
                            back="Buquwik Cape",
                            waist="Flame Belt",
                            legs="Nahtirah Trousers",
                            feet="Arcadian Socks +1"}
            sets.WS["Namas Arrow"].MidACC = set_combine(sets.WS["Namas Arrow"],{
                            back="Lutian Cape",
                            feet="Orion Socks +1"})
            sets.WS["Namas Arrow"].HighACC = set_combine(sets.WS["Namas Arrow"].MidACC,{
                            legs="Orion Braccae +1"})
     
            -- Namas Arrow(Attack) Set. This Set Takes Priority Over Other Sets. --
            sets.WS["Namas Arrow"].ATT = set_combine(sets.WS["Namas Arrow"],{})
     
            -- Namas Arrow(Enmity) Sets --
            sets.WS["Namas Arrow"].Enmity = set_combine(sets.WS["Namas Arrow"],{})
            sets.WS["Namas Arrow"].MidACC.Enmity = set_combine(sets.WS["Namas Arrow"].MidACC,{})
            sets.WS["Namas Arrow"].HighACC.Enmity = set_combine(sets.WS["Namas Arrow"].HighACC,{})
     
            -- Namas Arrow(AM) Sets --
            sets.WS["Namas Arrow"].AM = set_combine(sets.WS["Namas Arrow"],{})
            sets.WS["Namas Arrow"].MidACC.AM = set_combine(sets.WS["Namas Arrow"].MidACC,{})
            sets.WS["Namas Arrow"].HighACC.AM = set_combine(sets.WS["Namas Arrow"].HighACC,{})
     
            -- Namas Arrow(SAM Roll) Sets --
            sets.WS["Namas Arrow"].STP = set_combine(sets.WS["Namas Arrow"],{})
            sets.WS["Namas Arrow"].MidACC.STP = set_combine(sets.WS["Namas Arrow"].MidACC,{})
            sets.WS["Namas Arrow"].HighACC.STP = set_combine(sets.WS["Namas Arrow"].HighACC,{})
     
            -- Jishnu's Radiance Sets --
            sets.WS["Jishnu's Radiance"] = {
                            ammo="Achiyal. Arrow",
                            head="Arcadian Beret +1",
                            neck="Flame Gorget",
                            ear1="Moonshade Earring",
                            ear2="Jupiter's Pearl",
                            body="Kyujutsugi",
                            hands="Arc. Bracers +1",
                            ring1="Thundersoul Ring",
                            ring2="Thundersoul Ring",
                            back="Lutian Cape",
                            waist="Flame Belt",
                            legs="Manibozho Brais",
                            feet="Arcadian Socks +1"}
            sets.WS["Jishnu's Radiance"].MidACC = set_combine(sets.WS["Jishnu's Radiance"],{
                            legs="Orion Braccae +1",
                            feet="Orion Socks +1"})
            sets.WS["Jishnu's Radiance"].HighACC = set_combine(sets.WS["Jishnu's Radiance"].MidACC,{})
     
            -- Jishnu's Radiance(Attack) Set. This Set Takes Priority Over Other Sets. --
            sets.WS["Jishnu's Radiance"].ATT = set_combine(sets.WS["Jishnu's Radiance"],{})
     
            -- Jishnu's Radiance(Enmity) Sets --
            sets.WS["Jishnu's Radiance"].Enmity = set_combine(sets.WS["Jishnu's Radiance"],{})
            sets.WS["Jishnu's Radiance"].MidACC.Enmity = set_combine(sets.WS["Jishnu's Radiance"].MidACC,{})
            sets.WS["Jishnu's Radiance"].HighACC.Enmity = set_combine(sets.WS["Jishnu's Radiance"].HighACC,{})
     
            -- Jishnu's Radiance(AM) Sets --
            sets.WS["Jishnu's Radiance"].AM = set_combine(sets.WS["Jishnu's Radiance"],{})
            sets.WS["Jishnu's Radiance"].MidACC.AM = set_combine(sets.WS["Jishnu's Radiance"].MidACC,{})
            sets.WS["Jishnu's Radiance"].HighACC.AM = set_combine(sets.WS["Jishnu's Radiance"].HighACC,{})
     
            -- Jishnu's Radiance(SAM Roll) Sets --
            sets.WS["Jishnu's Radiance"].STP = set_combine(sets.WS["Jishnu's Radiance"],{})
            sets.WS["Jishnu's Radiance"].MidACC.STP = set_combine(sets.WS["Jishnu's Radiance"].MidACC,{})
            sets.WS["Jishnu's Radiance"].HighACC.STP = set_combine(sets.WS["Jishnu's Radiance"].HighACC,{})
     
            -- Apex Arrow Sets --
            sets.WS["Apex Arrow"] = {}
            sets.WS["Apex Arrow"].MidACC = set_combine(sets.WS["Apex Arrow"],{})
            sets.WS["Apex Arrow"].HighACC = set_combine(sets.WS["Apex Arrow"].MidACC,{})
     
            -- Wildfire Set --
            sets.WS.Wildfire = {}
     
            -- JA Sets --
            sets.JA = {}
            sets.JA.Shadowbind = {
                            head="Sylvan Gapette +2",
                            neck="Ej necklace +1",
                            ear1="Clearview Earring",
                            ear2="Volley Earring",
                            body="Kyujutsugi",
                            hands="Orion Bracers +1",
                            ring1="Hajduk Ring +1",
                            ring2="Hajduk Ring +1",
                            back="Lutian Cape",
                            waist="Elanid Belt",
                            legs="Orion Braccae +1",
                            feet="Orion Socks +1"}
     
            sets.JA.Scavenge = {feet="Orion Socks +1"}
            sets.JA.Camouflage = {body="Orion Jerkin +1"}
            sets.JA.Sharpshot = {legs="Orion Braccae +1"}
            sets.JA["Bounty Shot"] = {hands="Syl. Glvltte. +2"}
            sets.JA["Eagle Eye Shot"] = {
                            head="Uk'uxkaj Cap",
                            neck="Ocachi Gorget",
                            ear1="Vulcan's Pearl",
                            ear2="Vulcan's Pearl",
                            body="Kyujutsugi",
                            hands="Arc. Bracers +1",
                            ring1="Pyrosoul Ring",
                            ring2="Rajas Ring",
                            back="Buquwik Cape",
                            waist="Elanid Belt",
                            legs="Arcadian Braccae +1",
                            feet="Arcadian Socks +1"}
     
            -- Waltz Set --
            sets.Waltz = {}
     
            sets.Precast = {}
            -- Fastcast Set --
            sets.Precast.FastCast = {
                            head="Haruspex Hat +1",
                            neck="Orunmila's Torque",
                            ear1="Loquac. Earring",
                            hands="Thaumas Gloves",
                            ring1="Prolix Ring",
                            ring2="Veneficium Ring"}
            -- Utsusemi Precast Set --
            sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Beads"})
     
            sets.Midcast = {}
            -- Magic Haste Set --
            sets.Midcast.Haste = set_combine(sets.PDT,{})
    end
     
    function pretarget(spell,action)
            if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
                    cancel_spell()
                    send_command('input /item "Echo Drops" <me>')
            elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
                    cancel_spell()
                    send_command('Aggressor')
            elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
                    cancel_spell()
                    send_command('ThirdEye')
            elseif spell.english == "Meditate" and player.tp > 290 then -- Cancel Meditate If TP Is Above 290 --
                    cancel_spell()
                    add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
            elseif spell.action_type == 'Ranged Attack' and not buffactive.amnesia then -- Auto WS/Decoy Shot/Double Shot --
                    if player.tp >= 100 and AutoMode == 'ON' then
                            cancel_spell()
                            autoWS()
                    else
                            local recasts = windower.ffxi.get_ability_recasts()
                            if recasts[52] < 1 then
                                    cancel_spell()
                                    send_command('DecoyShot')
                            elseif recasts[126] < 1 then
                                    cancel_spell()
                                    send_command('DoubleShot')
                            end
                    end
            elseif spell.action_type == 'Ranged Attack' and spell.target.distance > 24.9 then
                    cancel_spell()
                    add_to_chat(123, spell.name..' Canceled: [Out of Range]')
                    return
            elseif spell.type == 'WeaponSkill' and player.status == 'Engaged' then
                    if spell.skill == 'Archery' or spell.skill == 'Marksmanship' then
                            if spell.target.distance > 16+target_distance then
                                    cancel_spell()
                                    add_to_chat(123, spell.name..' Canceled: [Out of Range]')
                                    return
                            end
                    else
                            if spell.target.distance > target_distance then
                                    cancel_spell()
                                    add_to_chat(123, spell.name..' Canceled: [Out of Range]')
                                    return
                            end
                    end
            end
    end
     
    function precast(spell,action)
            local check_ammo
            local check_ammo_count = 1
            if spell.action_type == 'Ranged Attack' then
                    check_ammo = player.equipment.ammo
                    if player.equipment.ammo == 'empty' or player.inventory[check_ammo].count <= check_ammo_count then
                            add_to_chat(123, spell.name..' Canceled: [Out of Ammo]')
                            cancel_spell()
                            return
                    else
                            equip(sets.Preshot)
                            if player.inventory[check_ammo].count <= ammo_warning_limit and player.inventory[check_ammo].count > 1 and not warning then
                                    add_to_chat(123, '***** [Low Ammo Warning!] *****')
                                    warning = true
                            elseif player.inventory[check_ammo].count > ammo_warning_limit and warning then
                                    warning = false
                            end
                    end
            elseif spell.type == "WeaponSkill" then
                    if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
                            cancel_spell()
                            add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
                            return
                    else
                            equipSet = sets.WS
                            if equipSet[spell.english] then
                                    equipSet = equipSet[spell.english]
                            end
                            if Attack == 'ON' then
                                    equipSet = equipSet["ATT"]
                            end
                            if equipSet[AccArray[AccIndex]] then
                                    equipSet = equipSet[AccArray[AccIndex]]
                            end
                            if equipSet["Enmity"] and Enmity == 'ON' then
                                    equipSet = equipSet["Enmity"]
                            end
                            if buffactive.Aftermath and equipSet["AM"] then
                                    equipSet = equipSet["AM"]
                            end
                            if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
                                    equipSet = equipSet["STP"]
                            end
                            if player.tp > 299 or buffactive.Sekkanoki then
                                    if spell.english == "Last Stand" then -- Equip Altdorf's Earring and Wilhelm's Earring When You Have 300 TP or Sekkanoki For Last Stand --
                                            equipSet = set_combine(equipSet,{ear1="Altdorf's Earring",ear2="Wilhelm's Earring"})
                                    elseif spell.english == "Jishnu's Radiance" then -- Equip Jupiter's Pearl When You Have 300 TP or Sekkanoki For Jishnu's Radiance --
                                            equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
                                    end
                            end
                            equip(equipSet)
                    end
            elseif spell.type == "JobAbility" then
                    if sets.JA[spell.english] then
                            equip(sets.JA[spell.english])
                    end
            elseif spell.action_type == 'Magic' then
                    if string.find(spell.english,'Utsusemi') then
                            if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
                                    cancel_spell()
                                    add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
                                    return
                            else
                                    equip(sets.Precast.Utsusemi)
                            end
                    else
                            equip(sets.Precast.FastCast)
                    end
            elseif spell.type == "Waltz" then
                    equip(sets.Waltz)
            elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
                    cast_delay(0.2)
                    send_command('cancel Sneak')
            end
    end
     
    function midcast(spell,action)
            if spell.action_type == 'Ranged Attack' then
                    equipSet = sets.Midshot
                    if equipSet[WeaponArray[WeaponIndex]] then
                            equipSet = equipSet[WeaponArray[WeaponIndex]]
                    end
                    if equipSet[player.sub_job] then
                            equipSet = equipSet[player.sub_job]
                    end
                    if equipSet[AccArray[AccIndex]] then
                            equipSet = equipSet[AccArray[AccIndex]]
                    end
                    if buffactive["Decoy Shot"] and equipSet["Decoy"] then
                            equipSet = equipSet["Decoy"]
                    end
                    if equipSet["Enmity"] and Enmity == 'ON' then
                            equipSet = equipSet["Enmity"]
                    end
                    if buffactive.Aftermath and equipSet["AM"] then
                            equipSet = equipSet["AM"]
                    end
                    if buffactive.Ionis and equipSet["Ionis"] then
                            equipSet = equipSet["Ionis"]
                    end
                    if buffactive["Samurai Roll"] and equipSet["STP"] and Samurai_Roll == 'ON' then
                            equipSet = equipSet["STP"]
                    end
                    if buffactive.Barrage and equipSet["Barrage"] then
                            equipSet = equipSet["Barrage"]
                    end
                    equip(equipSet)
            elseif spell.action_type == 'Magic' then
                    if string.find(spell.english,'Utsusemi') then
                            if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
                                    send_command('@wait 1.7;cancel Copy Image*')
                            end
                            equip(sets.Midcast.Haste)
                    elseif spell.english == 'Monomi: Ichi' then
                            if buffactive['Sneak'] then
                                    send_command('@wait 1.7;cancel sneak')
                            end
                            equip(sets.Midcast.Haste)
                    else
                            equip(sets.Midcast.Haste)
                    end
            end
    end
     
    function aftercast(spell,action)
            if spell.action_type == 'Ranged Attack' and AutoMode == 'ON' then
                    autoRA()
            elseif spell.type == "WeaponSkill" and not spell.interrupted then
                    send_command('wait 0.2;gs c TP')
            else
                    status_change(player.status)
            end
    end
     
    function status_change(new,old)
            if Armor == 'PDT' then
                    equip(sets.PDT)
            elseif Armor == 'MDT' then
                    equip(sets.MDT)
            elseif new == 'Engaged' then
                    equipSet = sets.Melee
                    if equipSet[AccArray[AccIndex]] then
                            equipSet = equipSet[AccArray[AccIndex]]
                    end
                    equip(equipSet)
            else
                    equipSet = sets.Idle
                    if equipSet[IdleArray[IdleIndex]] then
                            equipSet = equipSet[IdleArray[IdleIndex]]
                    end
                    if equipSet[WeaponArray[WeaponIndex]] then
                            equipSet = equipSet[WeaponArray[WeaponIndex]]
                    end
                    if equipSet[player.sub_job] then
                            equipSet = equipSet[player.sub_job]
                    end
                    equip(equipSet)
            end
    end
     
    function buff_change(buff,gain)
            buff = string.lower(buff)
            if buff == "overkill" then -- Overkill Timer --
                    if gain then
                            send_command('timers create "Overkill" 60 down')
                    else
                            send_command('timers delete "Overkill"')
                            add_to_chat(123,'Overkill: [OFF]')
                    end
            elseif buff == "decoy shot" then -- Decoy Shot Timer --
                    if gain then
                            send_command('timers create "Decoy Shot" 180 down')
                    else
                            send_command('timers delete "Decoy Shot"')
                            add_to_chat(123,'Decoy Shot: [OFF]')
                    end
            elseif buff == 'weakness' then -- Weakness Timer --
                    if gain then
                            send_command('timers create "Weakness" 300 up')
                    else
                            send_command('timers delete "Weakness"')
                    end
            end
            if not midaction() then
                    status_change(player.status)
            end
    end
     
    -- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
    function self_command(command)
            if command == 'C1' then -- Accuracy Level Toggle --
                    AccIndex = (AccIndex % #AccArray) + 1
                    add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
                    status_change(player.status)
            elseif command == 'C17' then -- Ranged Weapon Toggle --
                    WeaponIndex = (WeaponIndex % #WeaponArray) + 1
                    add_to_chat(158,'Ranged Weapon: '..WeaponArray[WeaponIndex])
                    status_change(player.status)
            elseif command == 'C5' then -- Auto Update Gear Toggle --
                    status_change(player.status)
                    add_to_chat(158,'Auto Update Gear')
            elseif command == 'C7' then -- PDT Toggle --
                    if Armor == 'PDT' then
                            Armor = 'None'
                            add_to_chat(123,'PDT Set: [Unlocked]')
                    else
                            Armor = 'PDT'
                            add_to_chat(158,'PDT Set: [Locked]')
                    end
                    status_change(player.status)
            elseif command == 'C15' then -- MDT Toggle --
                    if Armor == 'MDT' then
                            Armor = 'None'
                            add_to_chat(123,'MDT Set: [Unlocked]')
                    else
                            Armor = 'MDT'
                            add_to_chat(158,'MDT Set: [Locked]')
                    end
                    status_change(player.status)
            elseif command == 'C11' then -- SAM Roll Toggle --
                    if Samurai_Roll == 'ON' then
                            Samurai_Roll = 'OFF'
                            add_to_chat(123,'SAM Roll: [OFF]')
                    else
                            Samurai_Roll = 'ON'
                            add_to_chat(158,'SAM Roll: [ON]')
                    end
                    status_change(player.status)
            elseif command == 'C10' then -- Enmity Toggle --
                    if Enmity == 'ON' then
                            Enmity = 'OFF'
                            add_to_chat(123,'Enmity Set: [OFF]')
                    else
                            Enmity = 'ON'
                            add_to_chat(158,'Enmity Set: [ON]')
                    end
                    status_change(player.status)
            elseif command == 'C9' then -- Attack Toggle --
                    if Attack == 'ON' then
                            Attack = 'OFF'
                            add_to_chat(123,'Attack: [OFF]')
                    else
                            Attack = 'ON'
                            add_to_chat(158,'Attack: [ON]')
                    end
                    status_change(player.status)
            elseif command == 'C3' then -- Overkill Toggle --
                    send_command('Overkill')
                    add_to_chat(158,'Overkill: [ON]')
            elseif command == 'C8' then -- Distance Toggle --
                    if player.target.distance then
                            target_distance = math.floor(player.target.distance*10)/10
                            add_to_chat(158,'Distance: '..target_distance)
                    else
                            add_to_chat(123,'No Target Selected')
                    end
            elseif command == 'C6' then -- Idle Toggle --
                    IdleIndex = (IdleIndex % #IdleArray) + 1
                    add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
                    status_change(player.status)
            elseif command == 'C2' then -- Auto RA/WS Toggle --
                    if AutoMode == 'ON' then
                            AutoMode = 'OFF'
                            add_to_chat(123,'Auto Mode: [OFF]')
                    else
                            AutoMode = 'ON'
                            add_to_chat(158,'Auto Mode: [ON]')
                    end
            elseif command == 'TP' then
                    add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
            elseif command:match('^SC%d$') then
                    send_command('//' .. sc_map[command])
            end
    end
     
    function autoRA()
            send_command('@wait 2.7; input /ra <t>')
    end
     
    function autoWS() -- Change Auto WS Here --
            send_command('input /ws "Coronach" <t>')
    end
     
    function sub_job_change(newSubjob, oldSubjob)
            select_default_macro_book()
    end
     
    function set_macro_page(set,book)
            if not tonumber(set) then
                    add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
                    return
            end
            if set < 1 or set > 10 then
                    add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
                    return
            end
            if book then
                    if not tonumber(book) then
                            add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
                            return
                    end
                    if book < 1 or book > 20 then
                            add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
                            return
                    end
                    send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
            else
                    send_command('@input /macro set '..tostring(set))
            end
    end
     
    function select_default_macro_book()
            -- Default macro set/book
            if player.sub_job == 'WAR' then
                    set_macro_page(1, 8)
            elseif player.sub_job == 'DNC' then
                    set_macro_page(5, 8)
            elseif player.sub_job == 'SAM' then
                    set_macro_page(2, 8)
            elseif player.sub_job == 'DRG' then
                    set_macro_page(3, 8)
            elseif player.sub_job == 'NIN' then
                    set_macro_page(10, 8)
            else
                    set_macro_page(1, 8)
            end
    end

