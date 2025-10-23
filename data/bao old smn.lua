include('organizer-lib')
function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC"} -- 2 Levels Of Accuracy Sets For TP & Physical/Magical BloodPactRage. First Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- First Set Is Default --
	Armor = 'None'
	PetArmor = 'None'
	PetDT = 'OFF'
	select_default_macro_book() -- Change Default Macro Book At The End --
	
	-- Available Pacts --
	Avatars = S{
			"Ramuh","Garuda","Alexander","Fenrir","Titan","Shiva","Ifrit","Diabolos",
			"Leviathan","Carbuncle","Odin","Cait Sith","Atomos"}
	SpiritPacts = S{
			"FireSpirit","IceSpirit","AirSpirit","EarthSpirit","ThunderSpirit",
			"WaterSpirit","LightSpirit","DarkSpirit"}
			
	-- Auto Siphon -- *Use Same Spirit Again To Trigger
	spirit_element= {
			Fire='Fire Spirit',Earth='Earth Spirit',Water='Water Spirit',Wind='Air Spirit',
			Ice='Ice Spirit',Lightning='Thunder Spirit',Light='Light Spirit',Dark='Dark Spirit'}		
	spirit_conflict= {Fire='Ice',Earth='Lightning',Water='Fire',Wind='Earth',Ice='Wind',
			Lightning='Water',Light='Dark',Dark='Light'}
			
	-- Blood Pact Rage --
	Hybrid_BloodPactRage = S{
			--Ifrit
			'Burning Strike','Flaming Crush'}
	Physical_BloodPactRage = { --Everything Else
			}
	Physical_TP_BloodPactRage = S{ 
			'Mountain Buster','Rock Buster','Crescent Fang','Blindside'}
	Physical_xHit_BloodPactRage	= S{
			'Chaotic Strike','Volt Strike','Rush','Predator Claws'}
	Physical_xHit_TP_BloodPactRage = S{
			'Eclipse Bite','Double Punch'}
	Magical_BloodPactRage = S{
			--Astral Flow
			'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgement Bolt',
			
			'Lunar Bay','Searing Light','Thunderspark',
			'Howling Moon','Ruinous Omen','Level ? Holy',
			
			--No MACC required. Stack MAB
			'Nether Blast','Night Terror'}
	Magical_TP_BloodPactRage = S{
			--Merit
			'Heavenly Strike','Geocrush','Thunderstorm','Wind Blade','Meteor Strike','Grand Fall',
			
			--T2/4
			'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
			'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
			
			'Meteorite','Holy Mist','Impact','Conflag Strike'}

	-- Blood Pact Ward --
	Debuff_BloodPactWard = S{
			'Diamond Storm','Sleepga','Slowga','Tidal Roar','Nightmare','Pavor Nocturnus',
			'Ultimate Terror','Somnolence','Lunar Cry','Lunar Roar','Mewing Lullaby','Eerie Eye','Shock Squall',}
	TP_BloodPactWard = S{
			--Carbuncle
			'Healing Ruby','Healing Ruby II'}
	
	-- Cure Degradation --
	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} 
	Curaga_Spells = {"Curaga","Curaga II"}

	-- Items --
	organizer_items = {
			i1="Klouskap Sash",}
			
	-- Reive Neck Lock --
	sets.Reive = {
			neck="Arciela's Grace +1"}
			
-- Master's Sets ----------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.Idle = {}
	-- Idle Sets -- *Use macro "/console gs c C6" to toggle
	sets.Idle.Refresh = {
			main="Terra's Staff",
			sub="Oneiros Grip",
			ammo="Staunch Tathlum",
			head="Beckoner's Horn +1",
			neck="Sanctity Necklace",
			ear1="Genmei Earring",
			ear2="Ethereal Earring",
			body={ name="Apogee Dalmatica", augments={'Summoning magic skill +15','Enmity-5','Pet: Damage taken -3%',}},
			hands="Asteria Mitts +1",
			ring1="Sheltered Ring",
			ring2="Paguroidea Ring",
			back="Kumbira Cape",
			waist="Fucho-no-obi",
			legs="Assiduity Pants +1",
			feet="Baayami Sabots"}
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			main="Terra's Staff",
			sub="Oneiros Grip",
			neck="Loricate Torque +1",
			ear1="Genmei Earring",
			ear2="Ethereal Earring",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Solemnity Cape",
			waist="Lieutenant's Sash",
			feet="Herald's Gaiters"})

	-- PDT Set --
	--*Use macro "/console gs c C7" to toggle PDT ON/OFF
	sets.PDT = {}
	--*Use macro "/console gs c C15" to toggle MEVA ON/OFF
	sets.MEVA = set_combine(sets.PDT,{ 
			main="Reikikon",
			sub="Enki Strap",
			ammo="Staunch Tathlum",
			head="Inyanga Tiara +1",
			neck="Warder's Charm +1",
			ear1="Lugalbanda Earring",
			ear2="Hearty Earring",
			body="Inyanga Jubbah +1",
			hands="Inyan. Dastanas +1",
			ring1="Purity Ring",
			ring2="Vengeful Ring",
			back={ name="Campestres's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10',}},
			waist="Carrier's Sash",
			legs="Inyanga Shalwar +2",
			feet="Inyan. Crackows +1"})
	
	-- Melee Set --  *** Only Active When Pet Isn't Out
	sets.TP = {
			ammo="Vanir Battery",
			head="Tali'ah Turban +1",
			neck="Shulmanu Collar",
			ear1="Cessance Earring",
			ear2="Telos Earring",
			body="Tali'ah Manteel +1",
			hands="Regimen Mittens",
			ring1="Petrov Ring",
			ring2="Hetairoi Ring",
			back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
			waist="Olseni Belt",
			legs="Tali'ah Seraweels +1",
			feet="Tali'ah Crackows +1"}
	
	-- WS Base Set --
	sets.WS = {
			neck="Fotia Gorget",
			ear1="Brutal Earring",
			ear2="Moonshade Earring",
			waist="Fotia Belt"}

	sets.WS["Garland of Bliss"] = set_combine(sets.WS,{
			ammo="Pemphredo Tathlum",
			head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+6%','CHR+10','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			neck="Saevus Pendant +1",
			ear1="Crematio Earring",
			ear2="Friomisi Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+4%','"Mag.Atk.Bns."+15',}},
			hands="Amalric Gages",
			ring1="Shiva Ring +1",
			ring2="Weather. Ring",
			back="Toro Cape",
			waist="Yamabuki-no-Obi",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Mag. crit. hit dmg. +3%','INT+8','Mag. Acc.+12','"Mag.Atk.Bns."+12',}},
			feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+30','Magic burst dmg.+5%','INT+14',}}})
	sets.WS.Myrkr = set_combine(sets.WS,{
			ammo="Psilomene",
			head="Amalric Coif",
			neck="Orunmila's Torque",
			ear1="Etiolation Earring",
			body="Amalric Doublet",
			hands="Otomi Gloves",
			ring1="Mephitas's Ring",
			ring2="Mephitas's Ring +1",
			back="Fi Follet Cape +1",
			waist="Luminary Sash",
			legs="Amalric Slops",
			feet="Amalric Nails"})
	sets.WS.Retribution = set_combine(sets.WS,{})
	sets.WS.Shattersoul = set_combine(sets.WS,{})
	
	-- Precast --
	sets.Precast = {}
	
	sets.Precast.FastCast = {
			main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+1','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+22',}},
			sub="Clerisy Strap",
			ammo="Impatiens",
			head={ name="Merlinic Hood", augments={'Mag. Acc.+16','"Fast Cast"+6','MND+7',}},
			neck="Orunmila's Torque",
			ear1="Enchntr. Earring +1",
			ear2="Loquac. Earring",
			body="Inyanga Jubbah +1",
			hands={ name="Merlinic Dastanas", augments={'Accuracy+3 Attack+3','Pet: Phys. dmg. taken -3%','"Fast Cast"+7',}},
			ring1="Lebeche Ring",
			ring2="Weather. Ring",
			back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
			waist="Witful Belt",
			legs="Psycloth Lappas",
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','CHR+10',}}}
			
	sets.Precast.Cure = set_combine(sets.Precast.FastCast,{})		
			
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{})

	-- Midcast Base Set --
	sets.Midcast = set_combine(sets.PDT,{
			-- Spell Interruption And Conserve MP
			main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+1','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+22',}},
			ammo="Staunch Tathlum",
			head="Vanya Hood",
			neck="Incanter's Torque",
			ear2="Gwati Earring",
			body="Baayami Robe",
			hands="Amalric Gages",
			back="Fi Follet Cape +1",
			waist="Luminary Sash",
			legs="Telchine Braconi",
			feet="Medium's Sabots"})
			
	-- Cure Set --
	sets.Midcast.Cure = set_combine(sets.Midcast,{
			main="Serenity",
			sub="Enki Strap",
			head="Vanya Hood",
			body="Inyanga Jubbah +1",
			hands="Inyan. Dastanas +1",
			ring1="Haoma's Ring",
			ring2="Haoma's Ring",
			legs="Inyanga Shalwar +2",
			feet="Medium's Sabots"})
	sets.Midcast.SelfCure = set_combine(sets.Midcast.Cure,{
			neck="Phalaina Locket",
			waist="Gishdubar Sash"})
	
	-- -na Sets --
	sets.Midcast.Na = set_combine(sets.Precast.FastCast,{
			main="Serenity",
			sub="Clemency Grip",
			neck="Incanter's Torque",
			hands="Inyan. Dastanas +1",
			ring1="Haoma's Ring",
			ring2="Haoma's Ring",})
	sets.Midcast.Cursna = set_combine(sets.Midcast.Na,{
			neck="Malison Medallion",
			hands="Hieros Mittens",
			waist="Gishdubar Sash",
			feet="Gende. Galosh. +1"})

	-- Elemental Magic Sets --
	sets.Midcast['Elemental Magic'] = {
			main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+1','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+22',}},
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+6%','CHR+10','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			neck="Saevus Pendant +1",
			ear1="Crematio Earring",
			ear2="Friomisi Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+4%','"Mag.Atk.Bns."+15',}},
			hands="Amalric Gages",
			ring1="Shiva Ring +1",
			ring2="Shiva Ring +1",
			back="Toro Cape",
			waist="Yamabuki-no-Obi",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Mag. crit. hit dmg. +3%','INT+8','Mag. Acc.+12','"Mag.Atk.Bns."+12',}},
			feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+30','Magic burst dmg.+5%','INT+14',}}}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{
			neck="Eddy Necklace"})
	
	-- Enfeebling Magic Sets --
	sets.Midcast['Enfeebling Magic'] = {
			main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+1','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+22',}},
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head={ name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst dmg.+6%','CHR+10','Mag. Acc.+6','"Mag.Atk.Bns."+13',}},
			neck="Incanter's Torque",
			ear1="Enchntr. Earring +1",
			ear2="Gwati Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Magic burst dmg.+4%','"Mag.Atk.Bns."+15',}},
			hands="Inyan. Dastanas +1",
			ring1="Stikini Ring",
			ring2="Stikini Ring",
			back="Kumbira Cape",
			waist="Luminary Sash",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','Mag. crit. hit dmg. +3%','INT+8','Mag. Acc.+12','"Mag.Atk.Bns."+12',}},
			feet="Medium's Sabots"}
	sets.Midcast['Enfeebling Magic'].MidACC = set_combine(sets.Midcast['Enfeebling Magic'],{
			neck="Eddy Necklace"})
			
	-- Enhancing Magic Set --
	sets.Midcast['Enhancing Magic'] = set_combine(sets.Midcast,{
			main="Gada",
			sub="Ammurapi Shield",
			head="Telchine Cap",
			ear1="Loquac. Earring",
			ear2="Enchntr. Earring +1",
			body="Telchine Chas.",
			hands="Telchine Gloves",
			ring1="Kishar Ring",
			ring2="Weather. Ring",
			legs="Telchine Braconi",
			feet="Telchine Pigaches"})
	sets.Midcast.Aquaveil = set_combine(sets.Midcast['Enhancing Magic'],{
			head="Amalric Coif",
			waist="Emphatikos Rope",
			legs="Shedir Seraweels"})			
	sets.Midcast.Bar = set_combine(sets.Midcast['Enhancing Magic'],{
			neck="Incanter's Torque",
			ear1="Andoaa Earring",
			hands="Inyan. Dastanas +1",
			ring1="Stikini Ring",
			ring2="Stikini Ring",
			back="Fi Follet Cape +1",
			waist="Olympus Sash",
			legs="Shedir Seraweels"})
	sets.Midcast.Phalanx = set_combine(sets.Midcast.Bar,{})	
	sets.Midcast.ProShell = set_combine(sets.Midcast['Enhancing Magic'],{
			ring1="Sheltered Ring",})		
	sets.Midcast.Refresh = set_combine(sets.Midcast['Enhancing Magic'],{
			head="Amalric Coif",
			waist="Gishdubar Sash",})	
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{
			main="Serenity",
			sub="Enki Strap",
			neck="Nodens Gorget",
			ear1="Earthcry Earring",
			ear2="Enchntr. Earring +1",
			ring1="Stikini Ring",
			ring2="Stikini Ring",
			back="Fi Follet Cape +1",
			waist="Siegel Sash",
			legs="Shedir Seraweels",
			feet="Telchine Pigaches"})

-- Pet's Sets -------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Idle When Pet Is Present --
	sets.Avatars = { 
			--Requires Perp -14 and 512 or 575 Skill
			--main="Terra's Staff",
			main="Nirvana", -- -8
			sub="Oneiros Grip",
			ammo="Sancus Sachet +1",
			head="Beckoner's Horn +1",
			neck="Caller's Pendant",
			ear1="Evans Earring", -- -2
			--ear1="Genmei Earring",
			ear2="Enmerkar Earring",
			body={ name="Apogee Dalmatica", augments={'Summoning magic skill +15','Enmity-5','Pet: Damage taken -3%',}},
			hands="Asteria Mitts +1",
			--ring1="Dark Ring",
			ring1="Evoker's Ring", -- -1
			ring2="Defending Ring",
			back={ name="Campestres's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10',}},
			waist="Lieutenant's Sash",
			legs="Assiduity Pants +1", -- -3
			--feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},} -- -8
			feet="Baayami Sabots"}
	sets.Avatars['Cait Sith'] =set_combine(sets.Avatars, { 
			--Requires Perp -10
			ear1="Genmei Earring", -- +2
			hands="Lamassu Mitts +1",
			ring1="Dark Ring",}) -- +1
	sets.Avatars['Carbuncle'] = set_combine(sets.Avatars,{ 
			--Requires Perp -5
			ring1="Dark Ring", -- +1
			feet="Herald's Gaiters"}) -- +8
			
	--sets.Avatars['Diabolos'] = set_combine(sets.Avatars,{waist="Diabolos's Rope"}) -- Only Use If This -1 Perp Cost Will Benefit You More In Another Slot. e.g. Caller's Earring
	sets.Avatars['Fenrir'] = set_combine(sets.Avatars,{ 
			--Requires Perp -12
			ear1="Genmei Earring",}) -- +2
	sets["Fleet Wind"] = set_combine(sets.Avatars,{
			--Perp -14 and Movement Speed
			main="Nirvana", -- -8
			ear1="Evans Earring", -- -2
			ring1="Evoker's Ring", -- -1
			legs="Assiduity Pants +1", -- -3
			feet="Herald's Gaiters"})
	sets.Spirits = set_combine(sets.Avatars,{ 
			--Requires Perp -6. Use more -DT and Refresh
			neck="Loricate Torque +1",
			ear1="Genmei Earring",
			ring1="Dark Ring",
			back="Solemnity Cape",})
	
	-- Pet Melee/TP Set -- *Use macro "/gs console c C9" to toggle petTP ON/OFF. **This Toggle Will Override Avatars Idle Set
	sets.petTP = {
			main="Gridarvor", -- -5
			ammo="Sancus Sachet +1",
			head="Tali'ah Turban +1",
			neck="Caller's Pendant",
			ear1="Domes. Earring",
			ear2="Enmerkar Earring",
			body="Beck. Doublet +1", -- -6
			--body="Tali'ah Manteel +1",
			hands="Regimen Mittens",
			ring1="Varar Ring",
			ring2="Varar Ring",
			back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
			waist="Incarnation Sash",
			legs="Enticer's Pants",
			--legs="Tali'ah Seraweels +1",
			feet="Tali'ah Crackows +1"}
	
	-- Pet DT Set -- *Use macro "/gs console c C8" to toggle petDT ON/OFF **This Toggle Will Combine With Avatar/petTP Set
	sets.petDT = {
			main="Espiritus", -- -4
			ear1="Handler's Earring +1", -- -4
			ear2="Enmerkar Earring", -- -3
			body={ name="Apogee Dalmatica", augments={'Summoning magic skill +15','Enmity-5','Pet: Damage taken -3%',}}, -- -3
			back={ name="Campestres's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10',}},
			waist="Isa Belt", -- -3
			legs="Tali'ah Seraweels +1",}  -- -4
	
	-- Pet Precast --
	sets.Precast.BloodPact = {  -- Need 512 skill (Currently). -31BP Cap: -13 i, -9 ii, -10 iii (Caps: -15 i, -15 ii, -10 iii)
			main="Terra's Staff",
			--main="Espiritus", -- -2 ii
			sub="Vox Grip",
			ammo="Sancus Sachet +1", -- -7 ii
			head="Beckoner's Horn +1",
			neck="Caller's Pendant",
			ear1="Handler's Earring +1",
			--ear1="Evans Earring", -- -2 i
			ear2="Enmerkar Earring",
			--ear2="Caller's Earring", -- -1 i
			body={ name="Apogee Dalmatica", augments={'Summoning magic skill +15','Enmity-5','Pet: Damage taken -3%',}}, -- -2 ii
			hands="Baayami Cuffs", -- -6 i
			ring1="Evoker's Ring",
			ring2="Stikini Ring",
			back="Solemnity Cape",
			--back="Conveyance Cape", -- -3 ii
			waist="Isa Belt", 
			legs="Baayami Slops", -- -7 i
			--feet="Glyph. Pigaches +1"} -- -1 ii
			feet="Baayami Sabots"}
	
	-- Pet Midcast
	sets.Midcast.Pet = {}
	
	-- Blood Pact Rage --------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.Midcast.Pet.Physical_BloodPactRage = {}
	-- Physical BloodPactRage Sets --
	sets.Midcast.Pet.Physical_BloodPactRage.LowACC = {
			main="Nirvana",
			sub="Elan Strap +1",
			ammo="Sancus Sachet +1",
			head={ name="Helios Band", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
			neck="Shulmanu Collar",
			ear1="Lugalbanda Earring",
			ear2="Gelos Earring",
			body="Con. Doublet +3",
			hands={ name="Merlinic Dastanas", augments={'Pet: Attack+26 Pet: Rng.Atk.+26','Blood Pact Dmg.+10','Pet: STR+8','Pet: Mag. Acc.+2','Pet: "Mag.Atk.Bns."+14',}},
			ring1="Varar Ring",
			ring2="Varar Ring",
			back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
			waist="Regal Belt",
			legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
			feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},}
			--feet={ name="Helios Boots", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},}
	sets.Midcast.Pet.Physical_BloodPactRage.MidACC = set_combine(sets.Midcast.Pet.Physical_BloodPactRage.LowACC,{
			feet="Convo. Pigaches +3",})
	
	sets.Midcast.Pet.Physical_TP_BloodPactRage = {}
	-- Physical BloodPactRage Affected By TP --
	sets.Midcast.Pet.Physical_TP_BloodPactRage.LowACC = set_combine(sets.Midcast.Pet.Physical_BloodPactRage.LowACC,{
			legs="Enticer's Pants",})
	sets.Midcast.Pet.Physical_TP_BloodPactRage.MidACC = set_combine(sets.Midcast.Pet.Physical_TP_BloodPactRage.LowACC,{
			feet="Convo. Pigaches +3",})
	
	sets.Midcast.Pet.Physical_xHit_BloodPactRage = {}
	-- Physical xHit BloodPactRage Sets --
	sets.Midcast.Pet.Physical_xHit_BloodPactRage.LowACC = set_combine(sets.Midcast.Pet.Physical_BloodPactRage.LowACC,{
			waist="Incarnation Sash",})
	sets.Midcast.Pet.Physical_xHit_BloodPactRage.MidACC = set_combine(sets.Midcast.Pet.Physical_xHit_BloodPactRage.LowACC,{
			feet="Convo. Pigaches +3",})
	
	sets.Midcast.Pet.Physical_xHit_TP_BloodPactRage = {}
	-- Physical BloodPactRage Affected By TP --
	sets.Midcast.Pet.Physical_xHit_TP_BloodPactRage.LowACC = set_combine(sets.Midcast.Pet.Physical_xHit_BloodPactRage.LowACC,{
			legs="Enticer's Pants",})
	sets.Midcast.Pet.Physical_TP_BloodPactRage.MidACC = set_combine(sets.Midcast.Pet.Physical_xHit_TP_BloodPactRage.LowACC,{
			feet="Convo. Pigaches +3",})

	sets.Midcast.Pet.Magical_BloodPactRage = {}
	-- Magical BloodPactRage Sets --
	sets.Midcast.Pet.Magical_BloodPactRage.LowACC = set_combine(sets.Midcast.Pet.Physical_BloodPactRage.LowACC,{
			main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+1','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+22',}},
			--HQ Magic
			head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
			neck="Adad Amulet",
			body={ name="Apogee Dalmatica", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
			hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+10',}},
			back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
			waist="Regal Belt",
			legs={ name="Apogee Slacks", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
			feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},})
	sets.Midcast.Pet.Magical_BloodPactRage.MidACC = set_combine(sets.Midcast.Pet.Magical_BloodPactRage.LowACC,{
			body="Con. Doublet +3",})

	sets.Midcast.Pet.Magical_TP_BloodPactRage = {}
	-- Magical BloodPactRage Affected By TP --
	sets.Midcast.Pet.Magical_TP_BloodPactRage.LowACC = set_combine(sets.Midcast.Pet.Magical_BloodPactRage.LowACC,{
			legs="Enticer's Pants",})
	sets.Midcast.Pet.Magical_TP_BloodPactRage.MidACC = set_combine(sets.Midcast.Pet.Magical_TP_BloodPactRage.LowACC,{
			body="Con. Doublet +3",})

	sets.Midcast.Pet.Hybrid_BloodPactRage ={}
	-- BP Hybrid Set --
	sets.Midcast.Pet.Hybrid_BloodPactRage.LowACC = set_combine(sets.Midcast.Pet.Physical_BloodPactRage.LowACC,{
			--main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+1','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+22',}},
			head={ name="Helios Band", augments={'Pet: "Mag.Atk.Bns."+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
			neck="Adad Amulet",
			body="Con. Doublet +3",
			waist="Regal Belt",
			--NQ Magic
			--legs={ name="Apogee Slacks", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
			--HQ Physical 
			legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
			feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},})
	sets.Midcast.Pet.Hybrid_BloodPactRage.MidACC = set_combine(sets.Midcast.Pet.Hybrid_BloodPactRage,{})
	
	--Specific Rages
	-- *** Doesn't Work
	--sets.Midcast.Pet["Perfect Defense"] = set_combine(sets.Midcast.Pet.BloodPactWard,{})
	--sets.Midcast.Pet["Tail Whip"] = set_combine(sets.Midcast.Pet.DeBuff_BloodPactWard,{})

	-- Blood Pact Ward -------------------------------------------------------------------------------------------------------------------------------------------------------	
	-- BloodPactWard --
	sets.Midcast.Pet.BloodPactWard = {
			main="Espiritus",
			sub="Vox Grip",
			ammo="Sancus Sachet +1",
			head="Baayami Hat",
			neck="Incanter's Torque",
			ear1="Smn. Earring",
			ear2="Andoaa Earring",
			body="Baayami Robe",
			hands="Baayami Cuffs",
			ring1="Evoker's Ring",
			ring2="Stikini Ring",
			back="Conveyance Cape",
			waist="Kobo Obi",
			legs="Baayami Slops",
			feet="Baayami Sabots"}

	-- Magic Accuracy For The Listed Debuff BloodPactWard --
	sets.Midcast.Pet.Debuff_BloodPactWard = set_combine(sets.Midcast.Pet.BloodPactWard,{
			main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+1','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+22',}},
			ammo="Sancus Sachet +1",
			head="Tali'ah Turban +1",
			neck="Adad Amulet",
			ear1="Enmerkar Earring",
			ear2="Lugalbanda Earring",
			body="Con. Doublet +3",
			hands="Apogee Mitts",
			ring1="Varar Ring",
			ring2="Varar Ring",
			back="Conveyance Cape",
			back={ name="Campestres's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10',}},
			waist="Incarnation Sash",
			legs="Tali'ah Seraweels +1",
			feet="Tali'ah Crackows +1"})
	
	-- BloodPactWard Affected By TP --
	sets.Midcast.Pet.TP_BloodPactWard = set_combine(sets.Midcast.Pet.BloodPactWard,{
			legs="Enticer's Pants",})
		

	sets.JA = {}
	-- JA Sets --
	sets.JA['Astral Flow'] = {head="Smn. Horn +2"}
	sets.JA['Elemental Siphon'] = set_combine(sets.Midcast.Pet.BloodPactWard,{
			ammo="Esper Stone +1",
			ring2="Zodiac Ring",
			feet="Beck. Pigaches +1"})
	sets.JA['Mana Cede'] = {hands="Beckoner's Bracers"}
	
	sets.Pet = {}
	sets.Pet["Avatar's Favor"] = { -- -14 perp
			main="Nirvana", -- -8
			feet="Apogee Pumps +1",} -- -9

end

function pretarget(spell,action)
	if midaction() or pet_midaction() then
		cancel_spell()
		return
	-- Auto Echo Drops -- *If you are silenced, attempt to Cast any spell to trigger
	elseif (spell.type:endswith('Magic') or spell.type == "Ninjutsu" or spell.type == "Trust" or spell.type == "SummonerPact") and buffactive.silence then
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	-- Cure Degradation -- *Will cast lower tier Cure spell if not enough MP
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	-- Auto Siphon -- *Use any Spirit again to auto siphon and release Spirit
	elseif spell.name:endswith('Spirit') and pet.isvalid then
		cancel_spell()
		send_command('ElementalSiphon;wait 2;Release')
	-- Auto Addendum -- *Use Light or Dark Arts again ao activate appropriate Addendum --
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		end
	-- Auto Skill Up 
	-- *Summon Carbuncle and use "Release" to start it
	-- **Need to disable at minimum body slot and equip Temachtiani Shirt for it to work 
	-- ***Remove the body piece to stop 
	elseif spell.english == "Release" and player.equipment.body == "Temachtiani Shirt" then
		skillup()
	end
end

function precast(spell,action)
	if (midaction() or pet_midaction()) and not (buffactive['Astral Conduit'] or buffactive.Apogee) then
		cancel_spell()
		return
	elseif spell.action_type == 'Magic' then
		if buffactive.silence then -- Cancel Magic or Ninjutsu If You Are Silenced --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced]')
			return
		else
			if spell.type == "SummonerPact" then
				equip(sets.Precast.FastCast)
				-- Will summon the best Elemental depending on weather/day if casting Dark Spirit
				if spell.name == 'Dark Spirit' then
					if world.weather_element == 'Dark' then
					elseif world.weather_element ~= 'None' and spirit_conflict[world.day_element] ~= world.weather_element then
						cancel_spell()
						send_command('input /ma "%s" <me>':format(spirit_element[world.weather_element]))
					elseif world.day_element == 'Dark' then
					else
						cancel_spell()              
						send_command('input /ma "%s" <me>':format(spirit_element[world.day_element]))
					end
				end
			elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == 'Utsusemi: Ni' then
				if buffactive['Copy Image (3)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.english] then
				equip(sets.Precast[spell.english])
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "WeaponSkill" then
		if sets.WS[spell.english] then
			equip(sets.WS[spell.english])
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type:startswith('BloodPact') then
		if buffactive['Astral Conduit'] or buffactive.Apogee then
		pet_midcast(spell)
		else
		equip(sets.Precast.BloodPact)
		end
	elseif spell.type == "PetCommand" then
		equip(sets.Pet[spell.english])
	end
end

function midcast(spell,action)
	equipSet = {}
	if pet_midaction() then
		return
	elseif spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			if spell.target.name == player.name then
				equipSet = equipSet.SelfCure
			else
				equipSet = equipSet.Cure
			end
		elseif string.find(spell.english,'Bar') then
			equipSet = equipSet.Bar
		elseif string.find(spell.english,'na') and spell.english ~= "Cursna" then
			equipSet = equipSet.Na
		elseif string.find(spell.english,'Pro') or string.find(spell.english,'She')then 
			equipSet = equipSet.ProShell
		elseif string.find(spell.english,'Refresh') then 
			equipSet = equipSet.Refresh
		else 
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]	
			end
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if sets.Midcast[spell.type] then
				equip(sets.Midcast[spell.type])
			end
		end	
		-- Purity Ring
		if spell.english == "Cursna" and spell.target.name == player.name then
			equipSet = set_combine(equipSet,{ring1="Purity Ring"})
		end
	end
	equip(equipSet)
end

function aftercast(spell,action)
	if pet_midaction() then
		return
	elseif not (spell.type == 'BloodPactWard' or spell.type == 'BloodPactRage') then
		status_change(player.status)
	end
	select_default_macro_book()
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MEVA' then
		equip(sets.MEVA)
	elseif pet.isvalid then
		if SpiritPacts:contains(pet.name) then
			equip(sets.Spirits)
		else
			equip(sets.Avatars)
			if sets.Avatars[pet.name] then
				equip(sets.Avatars[pet.name])
			end
			if buffactive.Quickening and not buffactive.Mounted then
				equip(sets["Fleet Wind"])
			end	
		end
	elseif new == 'Engaged' then
		equip(sets.TP)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if world.area:endswith('Adoulin') then -- Equip Councilor's Garb When In Adoulin
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		if buffactive['Reive Mark'] then -- Equip Arciela's Grace +1 During Reive --
			equipSet = set_combine(equipSet,sets.Reive)
		end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Idle.Refresh)
	end
	if PetArmor == 'petTP' and pet.isvalid and not SpiritPacts:contains(pet.name) then
		equip(sets.petTP)
	end
	if PetDT == 'ON' and pet.isvalid and not SpiritPacts:contains(pet.name) then
		equip(sets.petDT)
	end
	select_default_macro_book()
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if not (midaction() or pet_midaction()) then
		status_change(player.status)
	end
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	select_default_macro_book()
end

function pet_midcast(spell)
	if spell.type == 'BloodPactWard' then
		if Debuff_BloodPactWard:contains(spell.english) then
			equip(sets.Midcast.Pet.Debuff_BloodPactWard)
		elseif TP_BloodPactWard:contains(spell.english) then
			equip(sets.Midcast.Pet.TP_BloodPactWard)
		-- ***Doesn't Work for BPs
		--elseif sets.Midcast.Pet[spell.english] then
			--equip(sets.Midcast.Pet[spell.english])
		else
			equip(sets.Midcast.Pet.BloodPactWard)
		end
	-- *** The check for pet.tp is not working at the moment. Needs fixing
	elseif spell.type == 'BloodPactRage' then
		if spell.english == 'Tail Whip' then
			equip(sets.Midcast.Pet.Debuff_BloodPactWard)
		elseif spell.english == 'Perfect Defense' then
			equip(sets.Midcast.Pet.BloodPactWard)
		elseif Hybrid_BloodPactRage:contains(spell.english) then
			--if buff == "aftermath: lv.3"  then
			--equip(sets.Midcast.Pet.Hybrid_BloodPactRage_AM[AccArray[AccIndex]])
			--else
			equip(sets.Midcast.Pet.Hybrid_BloodPactRage[AccArray[AccIndex]])
			--if pet.tp > 2350 then
				--equip({legs={ name="Apogee Slacks", augments={'Pet: STR+15','Blood Pact Dmg.+13','Pet: "Dbl. Atk."+3',}},})
			--end
			--end
		elseif Physical_TP_BloodPactRage:contains(spell.english) then
			--if buff == "aftermath: lv.3"  then
			--equip(sets.Midcast.Pet.Physical_TP_BloodPactRage_AM[AccArray[AccIndex]])
			--else
			equip(sets.Midcast.Pet.Physical_TP_BloodPactRage[AccArray[AccIndex]])
			--if pet.tp > 2350 then
				--equip({legs={ name="Apogee Slacks", augments={'Pet: STR+15','Blood Pact Dmg.+13','Pet: "Dbl. Atk."+3',}},})
			--end
			--end
		elseif Physical_xHit_BloodPactRage:contains(spell.english) then
			--if buff == "aftermath: lv.3"  then
			--equip(sets.Midcast.Pet.Physical_xHit_BloodPactRage_AM[AccArray[AccIndex]])
			--else
			equip(sets.Midcast.Pet.Physical_xHit_BloodPactRage[AccArray[AccIndex]])
			--end
		elseif Physical_xHit_TP_BloodPactRage:contains(spell.english) then
			--if buff == "aftermath: lv.3"  then
			--equip(sets.Midcast.Pet.Physical_xHit_TP_BloodPactRage_AM[AccArray[AccIndex]])
			--else
			equip(sets.Midcast.Pet.Physical_xHit_TP_BloodPactRage[AccArray[AccIndex]])
			--if pet.tp > 2350 then
				--equip({legs={ name="Apogee Slacks", augments={'Pet: STR+15','Blood Pact Dmg.+13','Pet: "Dbl. Atk."+3',}},})
			--end
			--end
		elseif Magical_BloodPactRage:contains(spell.english) then
			equip(sets.Midcast.Pet.Magical_BloodPactRage[AccArray[AccIndex]])
		elseif Magical_TP_BloodPactRage:contains(spell.english) then
			equip(sets.Midcast.Pet.Magical_TP_BloodPactRage[AccArray[AccIndex]])
			--if pet.tp > 1 then
			--	equip({legs={ name="Apogee Slacks", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},})
			--end
		--elseif sets.Midcast.Pet[spell.english] then
			--equip(sets.Midcast.Pet[spell.english])
		else
			equip(sets.Midcast.Pet.Physical_BloodPactRage[AccArray[AccIndex]])
		end
	end
end

function pet_aftercast(spell)
	if not spell.interrupted then
		if spell.english == "Ecliptic Howl" then
			if world.moon_pct > 89 then
				send_command('input /p [Ecliptic Howl] ACC +25 | EVA +1')
			elseif world.moon_pct > 74 then
				send_command('input /p [Ecliptic Howl] ACC +21 | EVA +5')
			elseif world.moon_pct > 59 then
				send_command('input /p [Ecliptic Howl] ACC +17 | EVA +9')
			elseif world.moon_pct > 39 then
				send_command('input /p [Ecliptic Howl] ACC +13 | EVA +13')
			elseif world.moon_pct > 24 then
				send_command('input /p [Ecliptic Howl] ACC +9 | EVA +17')
			elseif world.moon_pct > 9 then
				send_command('input /p [Ecliptic Howl] ACC +5 | EVA +21')
			else
				send_command('input /p [Ecliptic Howl] ACC +1 | EVA +25')
			end
		elseif spell.english == "Ecliptic Growl" then
			if world.moon_pct > 89 then
				send_command('input /p [Ecliptic Growl] STR/DEX/VIT 7 | INT/MND/CHR/AGI 1')
			elseif world.moon_pct > 74 then
				send_command('input /p [Ecliptic Growl] STR/DEX/VIT 6 | INT/MND/CHR/AGI 2')
			elseif world.moon_pct > 59 then
				send_command('input /p [Ecliptic Growl] STR/DEX/VIT 5 | INT/MND/CHR/AGI 3')
			elseif world.moon_pct > 39 then
				send_command('input /p [Ecliptic Growl] STR/DEX/VIT 4 | INT/MND/CHR/AGI 4')
			elseif world.moon_pct > 24 then
				send_command('input /p [Ecliptic Growl] STR/DEX/VIT 3 | INT/MND/CHR/AGI 5')
			elseif world.moon_pct > 9 then
				send_command('input /p [Ecliptic Growl] STR/DEX/VIT 2 | INT/MND/CHR/AGI 6')
			else
				send_command('input /p [Ecliptic Growl] STR/DEX/VIT 1 | INT/MND/CHR/AGI 7')
			end   
		elseif spell.english == "Lunar Cry" then
			if world.moon_pct > 89 then
				send_command('input /p [Lunar Cry] Enemy ACC -31 | Enemy EVA -1')
			elseif world.moon_pct > 74 then
				send_command('input /p [Lunar Cry] Enemy ACC -26 | Enemy EVA -6')
			elseif world.moon_pct > 59 then
				send_command('input /p [Lunar Cry] Enemy ACC -21 | Enemy EVA -11')
			elseif world.moon_pct > 39 then
				send_command('input /p [Lunar Cry] Enemy ACC -16 | Enemy EVA -16')
			elseif world.moon_pct > 24 then
				send_command('input /p [Lunar Cry] Enemy ACC -11 | Enemy EVA -21')
			elseif world.moon_pct > 9 then
				send_command('input /p [Lunar Cry] Enemy ACC -6 | Enemy EVA -26')
			else
				send_command('input /p [Lunar Cry] Enemy ACC -1 | Enemy EVA -31')
			end
		elseif spell.english == "Dream Shroud" then
			if world.time <= (0*60) or world.time >= (1*60) then
				send_command('input /p [Dream Shroud] MAB +13 | MDB +1')
			elseif (world.time <= (1*60) or world.time >= (2*60)) or (world.time <= (23*60) or world.time >= (0*60)) then
				send_command('input /p [Dream Shroud] MAB +12 | MDB +2')
			elseif (world.time <= (2*60) or world.time >= (3*60)) or (world.time <= (22*60) or world.time >= (23*60)) then
				send_command('input /p [Dream Shroud] MAB +11 | MDB +3')
			elseif (world.time <= (3*60) or world.time >= (4*60)) or (world.time <= (21*60) or world.time >= (22*60)) then
				send_command('input /p [Dream Shroud] MAB +10 | MDB +4')
			elseif (world.time <= (4*60) or world.time >= (5*60)) or (world.time <= (20*60) or world.time >= (21*60)) then
				send_command('input /p [Dream Shroud] MAB +9 | MDB +5')
			elseif (world.time <= (5*60) or world.time >= (6*60)) or (world.time <= (19*60) or world.time >= (20*60)) then
				send_command('input /p [Dream Shroud] MAB +8 | MDB +6')
			elseif (world.time <= (6*60) or world.time >= (7*60)) or (world.time <= (18*60) or world.time >= (19*60)) then
				send_command('input /p [Dream Shroud] MAB +7 | MDB +7')
			elseif (world.time <= (7*60) or world.time >= (8*60)) or (world.time <= (17*60) or world.time >= (18*60)) then
				send_command('input /p [Dream Shroud] MAB +6 | MDB +8')
			elseif (world.time <= (8*60) or world.time >= (9*60)) or (world.time <= (16*60) or world.time >= (17*60)) then
				send_command('input /p [Dream Shroud] MAB +5 | MDB +9')
			elseif (world.time <= (9*60) or world.time >= (10*60)) or (world.time <= (15*60) or world.time >= (16*60)) then
				send_command('input /p [Dream Shroud] MAB +4 | MDB +10')
			elseif (world.time <= (10*60) or world.time >= (11*60)) or (world.time <= (14*60) or world.time >= (15*60)) then
				send_command('input /p [Dream Shroud] MAB +3 | MDB +11')
			elseif (world.time <= (11*60) or world.time >= (12*60)) or (world.time <= (13*60) or world.time >= (14*60)) then
				send_command('input /p [Dream Shroud] MAB +2 | MDB +12')
			elseif world.time <= (12*60) or world.time >= (13*60) then
				send_command('input /p [Dream Shroud] MAB +1 | MDB +13')
			end
		elseif spell.english == "Sleepga" then
			send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		end
	end
	status_change(player.status)
end

function pet_change(pet,gain)
	status_change(player.status)
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- BloodPact Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'BloodPact Accuracy Level: '..AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C7' then
		if Armor == 'PDT' then -- PDT Toggle --
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then
		if PetDT == 'ON' then -- petDT Toggle --
			PetDT = 'OFF'
			add_to_chat(123,'Pet DT Set: [OFF]')
		else
			PetDT = 'ON'
			add_to_chat(158,'Pet DT Set: [ON]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MEVA Toggle --
		if Armor == 'MEVA' then
			Armor = 'None'
			add_to_chat(123,'MEVA Set: [Unlocked]')
		else
			Armor = 'MEVA'
			add_to_chat(158,'MEVA Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- Pet TP Toggle --
		if PetArmor == 'petTP' then
			PetArmor = 'None'
			add_to_chat(123,'Pet TP: [OFF]')
		else
			PetArmor = 'petTP'
			add_to_chat(158,'Pet TP: [ON]')
		end
		status_change(player.status)
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	end
end

--Stops the appropriate slot from changing when "" is equiped
function check_equip_lock()
	if 
		player.equipment.left_ring == "Warp Ring" or 
		player.equipment.left_ring == "Capacity Ring" or 
		player.equipment.left_ring == "Facility Ring" or 
		player.equipment.left_ring == "Vocation Ring" or 
		player.equipment.left_ring == "Emperor Band" or 
		player.equipment.left_ring == "Duodec. Ring" or 
		player.equipment.left_ring == "Trizek Ring" or 
		player.equipment.left_ring == "Echad Ring" then
			disable('ring1')
	else
		enable('ring1')
	end
	if  
		player.equipment.right_ring == "Warp Ring" or 
		player.equipment.right_ring == "Capacity Ring" or 
		player.equipment.right_ring == "Facility Ring" or 
		player.equipment.right_ring == "Vocation Ring" or 
		player.equipment.right_ring == "Emperor Band" or 
		player.equipment.right_ring == "Duodec. Ring" or 
		player.equipment.right_ring == "Trizek Ring" or 
		player.equipment.right_ring == "Echad Ring" then
			disable('ring2')
	else
		enable('ring2')
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
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
	if pet.name == "Carbuncle" then
		set_macro_page(2, 8)
	elseif pet.name == "Ifrit" then
		set_macro_page(3, 8)
	elseif pet.name == "Titan" then
		set_macro_page(4, 8)
	elseif pet.name == "Leviathan" then
		set_macro_page(5, 8)
	elseif pet.name == "Garuda" then
		set_macro_page(6, 8)
	elseif pet.name == "Shiva" then
		set_macro_page(7, 8)
	elseif pet.name == "Ramuh" then
		set_macro_page(8, 8)
	elseif pet.name == "Diabolos" then
		set_macro_page(9, 8)
	elseif pet.name == "Cait Sith" then
		set_macro_page(10, 8)
	elseif pet.name == "Fenrir" then
		set_macro_page(1, 17)
	else
		set_macro_page(1, 8)
	end
end

function skillup()
    local recasts = windower.ffxi.get_ability_recasts()
	if not buffactive.food then
		cancel_spell()
		send_command('input /item "B.E.W. Pitaru" <me>;wait 5;Release')
	elseif recasts[176] < 1 and not buffactive["Avatar's Favor"] then
		cancel_spell()
		send_command("Avatar's Favor <me>;wait 3;Release;wait 2;Carbuncle;wait 7;Release")
	elseif recasts[174] < 1 then
		cancel_spell()
		send_command('Healing Ruby <me>;wait 3;Release;wait 2;Carbuncle;wait 7;Release')
	else
		send_command('wait 2;Carbuncle;wait 7;Release')
	end
end