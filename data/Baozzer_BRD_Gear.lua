 -- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end

function init_gear_sets()
		
	print('Baozzer_BRD_Gear.lua sidecar loaded')  
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------
	Kali_Macc			={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}}
	Taming_Sari_TH		={ name="Taming Sari", augments={'STR+10','DEX+10','DMG:+15','"Treasure Hunter"+1',}}		
	
	Linos_TP			={ name="Linos", augments={'Accuracy+15','"Store TP"+4','Quadruple Attack +3',}}
	Linos_QC			={ name="Linos", augments={'DEF+5','Occ. quickens spellcasting +4%','DEX+2',}}
	Linos_WS			={ name="Linos", augments={'Accuracy+15','Weapon skill damage +3%','DEX+8',}}
	
	--AF_head 			={ name="Brioso Roundlet +2" }
	--AF_body				={ name="Brioso Justaucorps +1" }
	AF_hands 			={ name="Brioso Cuffs +3" }
	--AF_legs 			={ name="Brioso Cannions +2" }
	AF_feet 			={ name="Brioso Slippers +3" }
	
	Relic_head			={ name="Bihu Roundlet +1"}
	Relic_body			={ name="Bihu Jstcorps +1" }
	--Relic_hands			={ name="Bihu Cuffs"}
	Relic_legs			={ name="Bihu Cannions"}
	Relic_feet			={ name="Bihu Slippers +1"}
	
	Empy_head 			={ name="Fili Calot +1" }
	Empy_body			={ name="Fili Hongreline +1" }
	Empy_hands			={ name="Fili Manchettes +1" }
	Empy_legs 			={ name="Fili Rhingrave +1" }
	Empy_feet 			={ name="Fili Cothurnes +1" }
	
	Rhapsode_back		={ name="Rhapsode's Cape", augments={'HP+19','Mag. Acc.+5','Enmity-8',}}
	JSE_back_FC			={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
	JSE_back_TP			={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	JSE_back_WS_CHR		={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','CHR+10','Weapon skill damage +10%',}}
	JSE_back_WS_DEX		={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	JSE_back_WS_STR		={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	--JSE_back_WS_Evis	={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	--JSE_back_WS_CHR		={ name="Intarabus's Cape", augments={'CHR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
	--------------------------------------
	-- Gear for organizer to get
	--------------------------------------
	organizer_items = {
			i="Aeneas",
			i="Malevolence",
			}
	--------------------------------------
    -- Start defining the sets
    --------------------------------------
	
    -- Precast Sets
	
	-- Precast sets to enhance JAs    	
    sets.precast.JA.Nightingale = {feet=Relic_feet}
    sets.precast.JA.Troubadour = {body=Relic_body}
    sets.precast.JA['Soul Voice'] = {legs=Relic_legs}

    -- Fast cast sets for spells
	-- NO range and ammo slot. Messes up bard songs. Add them into later sets
    sets.precast.FC = {
		main="Mafic Cudgel",
		sub="Genmei Shield",
		--range=
		--ammo=
		head=Vanya_head, -- 10%
		neck="Orunmila's Torque", -- 5%
		ear1="Loquac. Earring", -- 2%
		ear2="Enchntr. Earring +1", -- 2%
		body="Inyanga Jubbah +2", -- 14%
		hands=Leyline_hands, -- 8%
		ring1="Weather. Ring", -- 5% | 3%
		ring2="Kishar Ring", -- 4%
		back=JSE_back_FC, -- 10%
		waist="Witful belt", -- 3% | 3%
		legs="Aya. Cosciales +2", -- 6%
		feet=Telch_Feet_Enh, -- 5%
		}
		-- Total 74% FC | 6% QM
	
	-- NO range and ammo slot. Messes up bard songs. Add them into later sets
	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
        --range=
		--amnmo=
		head=Empy_head, -- 14% ScT
		hands=Gende_hands_Song, -- 7 % | 4% ScT
		back="Solemnity Cape",
		legs=Gende_legs, -- 9% ScT
		})
		-- Total = 81% Cast Speed + 6% Quick Cast 
	
	sets.precast.FC.BardSong['Honor March'] = set_combine(sets.precast.FC.BardSong, {range='Marsyas',})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		ammo='Sapience Orb',  -- 2%
		})
		-- Total = 76% Cast Speed + 6% Quick Cast
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		hands=Gende_hands_Cure, -- 11 CScT
		back="Perimede Cape", -- 4 QC
		legs="Doyen Pants", -- 15 CScT
		feet=Vanya_feet, -- 7 CScT
		})
		-- Total = 80% Cast Speed + 10% Quick Cast

	sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {
		ammo='Sapience Orb',  -- 2%
		})
		-- Total = 76% Cast Speed + 6% Quick Cast
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC['Enfeebling Magic'], {
		main="Daybreak", 
		sub="Ammurapi Shield", 
		--waist="Shinjutsu-no-Obi +1"
		})
		-- Total = 76% Cast Speed + 6% Quick Cast
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		ammo='Sapience Orb',  -- 2%
		waist="Siegel Sash" -- 8% EnhMcT
		})
		-- Total 81% FC | 3% QM

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
		head="Umuthi hat", -- 15%
		--hands="Carapacho Cuffs",
		back="Perimede Cape", -- 4% QC
		legs="Doyen Pants", -- 10%
		})
		-- Total 80% FC | 7% QM

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		ammo='Sapience Orb',  -- 2%
		})
		-- Total 76% FC | 6% QM

    sets.precast.FC.Daurdabla = {range='Daurdabla',}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
    
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		range=Linos_WS,
		head="Aya. Zucchetto +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Rajas Ring",ring2="Ilabrat Ring",
		back=JSE_back_WS_STR,waist="Fotia Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2",}
   
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
		neck="Fotia Gorget",
		ring1="Ramuh Ring +1",
		})

	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {
        })
	
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
		neck="Fotia Gorget",
		ring1="Ramuh Ring +1",
		feet=Lustratio_feet,
        })

	--CHR > WSD
	sets.precast.WS['Mordant Rime'] = {
		range=Linos_WS,
		head="Aya. Zucchetto +2",neck="Fotia Gorget",ear1="Regal Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=JSE_back_WS_STR,waist="Fotia Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2",}
	-- MAB > INT/DEX
    sets.precast.WS['Aeolian Edge'] =  {
		range=Linos_WS,
		head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
		body="Inyanga Jubbah +2",hands=Chironic_hands_MAB,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=JSE_back_WS_STR,waist="Eschan Stone",legs=Chironic_legs_MAcc,feet=Chironic_feet_MAB,}
	--TP Bonus > WSD > DA > STR
    sets.precast.WS['Savage Blade'] = {
		range=Linos_WS,
		head="Aya. Zucchetto +2",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Ifrit Ring +1",ring2="Shukuyu Ring",
		back=JSE_back_WS_STR,waist="Prosilio Belt +1",legs="Aya. Cosciales +2",feet=Lustratio_feet}
    
    
    -- Midcast Sets

    -- General set for recast times.
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})

    -- Songs
				
	sets.midcast.SongRecast = {
		main="Mafic Cudgel",sub={name="Genmei Shield",priority=-1},range={name='Gjallarhorn',priority = 16},
		head=Vanya_head,neck="Orunmila's Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands=Leyline_hands,ring1="Weather. Ring",ring2="Kishar Ring",
		back=JSE_back_FC,waist="Witful Belt",legs=Empy_legs,feet=Telch_Feet_Enh}
	
	sets.midcast['Buff'] = {
		main="Carnwenhan",sub="Genmei Shield",range="Gjallarhorn",
		head=Empy_head,neck="Moonbow Whistle +1",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		body=Empy_body,hands=Empy_hands,ring1="Weather. Ring",ring2="Kishar Ring",
		back=JSE_back_FC,waist="Witful Belt",legs=Empy_legs,feet=Empy_feet}

	-- Song Type Equipment
	-- dont use ballad af legs messes up timers	
	--sets.midcast['Buff']['Ballad']	 					= set_combine(sets.midcast['Buff'], {legs=AF_legs})
	sets.midcast['Buff']['Carol']	 					= set_combine(sets.midcast['Buff'], {hands="Mousai Gages",})
	sets.midcast['Buff']['Etude']	 					= set_combine(sets.midcast['Buff'], {head="Mousai Turban",})
	sets.midcast['Buff']['Madrigal']	 				= set_combine(sets.midcast['Buff'], {feet=Empy_feet,})
	sets.midcast['Buff']['March']	 					= set_combine(sets.midcast['Buff'], {})
	sets.midcast['Buff']['Honor March']					= set_combine(sets.midcast['Buff'], {range="Marsyas",})
	sets.midcast['Buff']['Mambo']	 					= set_combine(sets.midcast['Buff'], {feet="Mousai Crackows",})
	sets.midcast['Buff']['Mazurka']	 					= set_combine(sets.midcast['Buff'], {range="Daurdabla",})
	sets.midcast['Buff']['Minne']	 					= set_combine(sets.midcast['Buff'], {legs="Mou. Seraweels +1",})
	sets.midcast['Buff']['Minuet']	 					= set_combine(sets.midcast['Buff'], {})	
	sets.midcast['Buff']['Paeon']	 					= set_combine(sets.midcast['Buff'], {
														--head=AF_head, dont have yet
														})
	sets.midcast['Buff']['Prelude']	 					= set_combine(sets.midcast['Buff'], {feet=Empy_feet,})	
	sets.midcast['Buff']['Scherzo']	 					= set_combine(sets.midcast['Buff'], {feet=Empy_feet,})
	
	sets.midcast['Buff']['Extra Length']								= set_combine(sets.midcast['Buff'], {legs="Inyanga Shalwar +2",feet=AF_feet})
	sets.midcast['Buff']['Extra Length']['Ballad']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {})
	sets.midcast['Buff']['Extra Length']['Carol']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {hands="Mousai Gages",})
	sets.midcast['Buff']['Extra Length']['Etude']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {head="Mousai Turban",})
	sets.midcast['Buff']['Extra Length']['Madrigal']	 				= set_combine(sets.midcast['Buff']['Extra Length'], {feet=Empy_feet,})
	sets.midcast['Buff']['Extra Length']['March']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {})
	sets.midcast['Buff']['Extra Length']['Honor March']					= set_combine(sets.midcast['Buff']['Extra Length'], {range="Marsyas",})
	sets.midcast['Buff']['Extra Length']['Mambo']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {feet="Mousai Crackows",})
	sets.midcast['Buff']['Extra Length']['Mazurka']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {range="Daurdabla",})
	sets.midcast['Buff']['Extra Length']['Minne']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {legs="Mou. Seraweels +1",})
	sets.midcast['Buff']['Extra Length']['Minuet']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {})	
	sets.midcast['Buff']['Extra Length']['Paeon']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {
																		--head=AF_head, dont have yet
																		})	
	sets.midcast['Buff']['Extra Length']['Prelude']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {feet=Empy_feet,})	
	sets.midcast['Buff']['Extra Length']['Scherzo']	 					= set_combine(sets.midcast['Buff']['Extra Length'], {feet=Empy_feet,})
	
	-- FC then Macc
	sets.midcast['Debuff'] = {
		main="Carnwenhan",sub="Ammurapi Shield",range="Gjallarhorn",
		--head=AF_head, dont have yet
		head="Inyanga Tiara +2",neck="Moonbow Whistle +1",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		body=Empy_body,hands="Inyan. Dastanas +2",ring1="Weather. Ring",ring2="Kishar Ring",
		back=JSE_back_FC,waist="Witful Belt",legs="Inyanga Shalwar +2",feet=AF_feet
		}		
	-- Macc
	sets.midcast['Debuff'].Resistant = set_combine(sets.midcast['Debuff'], {
		ear1="Digni. Earring",ear2="Regal Earring",
		ring1="Stikini Ring",ring2="Stikini Ring",
		waist="Luminary Sash",
		})
	-- Macc
	sets.midcast['Debuff']['Macc-Lullaby']  = set_combine(sets.midcast['Debuff'].Resistant, {neck="Null Loop",waist="Null Belt"})
	-- Macc
	sets.midcast['Debuff']['Macc-Lullaby'].Resistant = set_combine(sets.midcast['Debuff'].Resistant, {neck="Null Loop",waist="Null Belt"})
	-- String Skill for range then Macc. Only For Horde II 486 skill
	sets.midcast['Debuff']['StringSkill-Lullaby'] = set_combine(sets.midcast['Debuff'].Resistant, {
		range="Daurdabla",
		--af head
        --ear1="Gersemi Earring",ear2="Darkside Earring",
		waist=="Harfner's Sash",
        })
		-- 475 skill
	-- Macc. No range
	sets.midcast['Debuff']['StringSkill-Lullaby'].Resistant	= set_combine(sets.midcast['Debuff'].Resistant, {neck="Null Loop",waist="Null Belt"})
     
    -- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast['Dummy'] = set_combine(sets.midcast.SongEnhancing, {range=info.ExtraSongInstrument})


    -- Other general spells and classes.
	
	-- 101% Cap | Merits is 10%
	sets.midcast.SpellInterrupt = {
		--sub="Culminus", --10 dont have yet
        ammo="Staunch Tathlum", --10
        --body="Ros. Jaseran +1", --25 dont have yet
    	hands=Chironic_hands_DT, --20
    	legs="Querkening Brais", --15
        --neck="Loricate Torque +1", --5 unity aug
        --ear1="Halasz Earring", --5
        ring2="Evanescence Ring", --5
		--back="Fi Follet Cape +2", -- unity aug
        waist="Emphatikos Rope", --12
        }
		--72% 

    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt
				
	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=Vanya_head,neck="Null Loop",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		body="Inyanga Jubbah +2",hands=Leyline_hands,ring1="Weather. Ring",ring2="Kishar Ring",
		back=JSE_back_FC,waist="Witful Belt",legs=Chironic_legs_MAcc,feet=Telch_Feet_Enh}
		
	sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {
		--waist="Shinjutsu-no-Obi +1" -- unity aug
		--feet=something with macc
		})
	
	-- Unresistable. Might as well put TH
	sets.midcast['Dia II'] 	= set_combine(sets.midcast['Enfeebling Magic'],{
		ammo="Per. Lucky Egg",
		main=Taming_Sari_TH,sub="Genmei Shield",
		head="Wh. Rarab Cap +1",
		waist="Chaac Belt",})

	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Debuff'].Resistant, {
		--head="Ipoca Beret",
		neck="Jokushu Chain",
		--ring1="Fenian Ring",
		--back="Disperser's Cape",
		})
	
	-- enmity+
	sets.midcast['Flash'] = {
		ammo="Sapience Orb",-- 2
		head="Aya. Zucchetto +2",
		neck="Null Loop",
		ear1="Trux Earring", -- 5
		ear2="Sanare Earring",
		body="Emet Harness +1", -- 10
		hands="Aya. Manopolas +2",
		ring1="Pernicious Ring", -- 5
		ring2="Petrov Ring", -- 4
		back="Reiki Cloak", -- 6
		waist="Goading Belt", -- 3
		legs="Aya. Cosciales +2",
		feet="Aya. Gambrieras +2",
		}

	-- 50% CP | 100 CMP | 10% CPII CAP
    sets.midcast.Cure = {
		ammo="Pemphredo Tathlum", -- 4 CMP
		head=Vanya_head, -- 10% CP | 6 CMP
		neck="Incanter's Torque",
		ear1="Mendi. Earring", -- 5% CP | 2 CMP
		ear2="Gifted Earring", -- 3 CMP
		body="Vrikodara Jupon", -- 13% CP
		hands="Inyan. Dastanas +2",
		ring1="Haoma's Ring",
		ring2="Haoma's Ring",
		back="Solemnity Cape", -- 7% CP | 5 CMP
		waist="Luminary Sash", -- 4 CMP
		legs="Gyve Trousers", -- 10% CP
		feet=Vanya_feet, -- 5% CP
        }
		--- Totals 50% CP | 24 CMP | 0% CPII
			
	sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {
		neck="Phalaina Locket", -- 4%
		ear2="Oneiros Earring", -- 5%
		--hands="Buremte Gloves", -- 13$
		waist="Gishdubar Sash", -- 10%
		})
		--- Total 19% CPR
	
	sets.midcast['Cure day / weather'] = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi"})
        
    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {})
	
	-- Only need CMP
	sets.midcast.StatusRemoval = {
        --head="Vanya Hood",
        --body="Vanya Robe",
        --legs="Aya. Cosciales +2",
        --feet="Vanya Clogs",
        --neck="Incanter's Torque",
        --ear2="Meili Earring",
        --ring1="Menelaus's Ring",
        --ring2="Haoma's Ring",
        --back=gear.BRD_Song_Cape,
        --waist="Bishop's Sash",
        }

	-- Cursna+ and Healing Magic Skill+
	sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {
		main="Prelatic Pole",
		--sub="Curatio Grip",
		neck="Debilis Medallion",
		--ear1="Meili Earring",
		--ear2="Beatific Earring",
		hands="Hieros Mittens",
		--back="Oretan. Cape +1",
		ring1="Menelaus's Ring",
		ring2="Haoma's Ring",
		feet=Gende_feet,
        })
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
		main=Grioavolr_Enh,
		head=Telch_head_Enh,
		body=Telch_body_Enh,hands=Telch_hands_Enh,
		--back='Merciful Cape',
		legs=Telch_legs_Enh,feet=Telch_Feet_Enh
		})

	-- Skill+
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		main=Grioavolr_Enh,ammo="Pemphredo Tathlum",
		head="Umuthi Hat",neck="Incanter's Torque",ear1='Andoaa Earring',
		--ear2="Mimir Earring",
		body=Telch_body_Enh,hands="Inyan. Dastanas +2",ring1="Stikini Ring", ring2="Stikini Ring",
		back='Fi Follet Cape +1',waist="Olympus Sash",legs="Shedir Seraweels",feet=Telch_Feet_Enh
        })
	
	sets.midcast.bar_status	= sets.midcast.BarElement
    
	-- no skill bassed buffs

	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {
		head=Chironic_head_TP,
		waist="Emphatikos Rope",
		legs="Shedir Seraweels",
		})
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget", ear1="Earthcry Earring",
		waist="Siegel Sash", legs="Shedir Seraweels",
		})
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Gishdubar Sash", 
		--back="Grapevine Cape"
		})
	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {
		main=Grioavolr_Enh,
		head="Inyanga Tiara +2",
		--back="Grapevine Cape",
		})

    sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Reraise'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring1="Sheltered Ring"})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Shellra = sets.midcast.Shell
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
		main="Sangoma",sub="Genmei Shield",range="Oneiros Harp",
		head=empty,neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Infused Earring",
		body="Respite Cloak",hands=Chironic_hands_Refresh,ring1="Sheltered Ring",ring2="Defending Ring",
		back="Felicitas Cape +1",waist="Null Belt",legs="Assid. Pants +1",feet=Empy_feet,
	}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	-- Regen/Refresh w/ some DT
    sets.idle = {
		main="Sangoma",sub="Genmei Shield",range="Oneiros Harp",
		head=empty,neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
		body="Respite Cloak",hands=Chironic_hands_Refresh,ring1="Sheltered Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Null Belt",legs="Assid. Pants +1",feet=Empy_feet,
        }
			
	-- DT > Refresh > Meva
    sets.idle.DT = {
		main="Sangoma",sub="Ammurapi Shield",range='Nibiru Harp',
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Infused Earring",
		body="Ayanmo Corazza +2",hands=Chironic_hands_Refresh,ring1="Sheltered Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Assid. Pants +1",feet="Aya. Gambieras +2"
		}
   
	-- Meva > DT > Refresh
	sets.idle.MEva = {
		main="Daybreak",sub="Ammurapi Shield",range='Nibiru Harp',
		head="Inyanga Tiara +2",neck="Warder's Charm +1",ear1="Hearty Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Purity Ring",ring2="Vengeful Ring",
		back="Felicitas Cape +1",waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2",
		}
   
   
	-- Defense sets

	-- DT > PDT > Mdef > Meva
	sets.defense.PDT = {
		main="Daybreak",sub="Ammurapi Shield",range='Nibiru Harp',ammo=empty,
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
		body="Ayanmo Corazza +2",hands=Chironic_hands_DT,ring1="Archon Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		-- 41 DT | 50 PDT w/o weapon

	-- Assume Shell V -29%, 31% MDT > Mdef > PDT
	sets.defense.MDT = {
		main="Mafic Cudgel",sub="Genmei Shield",range=empty,ammo="Vanir Battery",
		head="Inyanga Tiara +2",neck="Warder's Charm +1",ear1="Zennaroi Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Archon Ring",ring2="Defending Ring",
		back=Rhapsode_back,waist="Slipor Sash",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2"}
		-- 39 MDT | 30 PDT w/o weapons

	sets.Kiting = {feet=Empy_feet}
	sets.Adoulin = {body="Councilor's Garb"}
	sets.CP = {back=CP_back}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.buff.Reive = {neck="Arciela's Grace +1"}
	sets.buff.Doom = {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",}
	sets.warp = {ring1='Warp Ring'}
	--sets.crafting = {sub={name="Toreutic Ecu",priority=-1},head="Shaded Spectacles",body="Goldsmith's Smock",neck="Goldsmith's Torque",ring1="Orvail Ring",ring2="Craftmaster's Ring",}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
			main="Carnwenhan",sub="Genmei Shield",range=Linos_TP,
			head="Aya. Zucchetto +2",neck="Ainia Collar",ear1="Cessance Earring",ear2="Telos Earring",
			body="Ayanmo Corazza +2",hands=Chironic_hands_TP,ring1="Petrov Ring",ring2="Ilabrat Ring",
			back=JSE_back_TP,waist="Windbuffet Belt +1",legs="Querkening Brais",feet="Battlecast Gaiters"
        }
			
	sets.engaged.Acc = set_combine(sets.engaged,{neck="Null Loop",waist="Null Belt"})
	
	sets.engaged.DW = {
			main="Kaja Sword",sub="Carnwenhan",range=Linos_TP,
			head="Aya. Zucchetto +2",neck="Ainia Collar",ear1="Eabani Earring",ear2="Telos Earring",
			body="Ayanmo Corazza +2",hands=Chironic_hands_TP,ring1="Petrov Ring",ring2="Ilabrat Ring",
			back=JSE_back_TP,waist="Reiki Yotai",legs="Querkening Brais",feet="Battlecast Gaiters"
			}
			
	sets.engaged.DW.Acc = set_combine(sets.engaged.DW,{neck="Null Loop",waist="Null Belt"})

	
	sets.Locked_Main_Sub = {main="Carnwenhan",sub="Genmei Shield"}
	sets.Locked_Main_Sub_DW = {main="Kaja Sword",sub="Carnwenhan"}
		
end
 