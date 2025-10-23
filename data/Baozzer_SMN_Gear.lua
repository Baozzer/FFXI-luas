-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
	 if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
	
    set_macro_page(1, 3)
end

function init_gear_sets()
	
	print('Baozzer_SMN_Gear.lua sidecar loaded')
	
	--------------------------------------
	-- Augemnted Gear
	--------------------------------------
	AF_head 			={ name="Convoker's Horn +1" }
	AF_body				={ name="Convoker's Doublet +2" }
	AF_hands			={ name="Convoker's Bracers +1" }
	AF_legs 			={ name="Convoker's Spats +1" }
	AF_feet 			={ name="Convoker's Pigaches +1" }
	
	Relic_head		    ={ name="Glyphic Horn +1", augments={'Enhances "Astral Flow" effect',}}
	Relic_body			={ name="Glyphic Doublet +1", augments={'Reduces Sp. "Blood Pact" MP cost',}}
	Relic_hands			={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}}
	Relic_legs			={ name="Glyphic Spats +1", augments={'Increases Sp. "Blood Pact" accuracy',}}
	Relic_feet			={ name="Glyph. Pigaches +1", augments={'Inc. Sp. "Blood Pact" magic crit. dmg.',}}
	
	Empy_head 			={ name="Beckoner's Horn +1" }
	Empy_body			={ name="Beckoner's Doublet +1" }
	Empy_hands			={ name="Beckoner's Bracers +1" }
	Empy_legs 			={ name="Beckoner's Spats +1" }
	Empy_feet 			={ name="Beckoner's Pigaches +1" }
	
	--------------------------------------
    -- Defaults
    --------------------------------------
	
	-- gear.perp_staff = {name = "Hoe"}
	-- gear.default.perp_staff = {name = "Hoe"}
	
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head=Relic_head}
    
    sets.precast.JA['Elemental Siphon'] = {
		main=Espiritus,sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Incanter's Torque",ear1="Evans Earring",ear2="Andoaa Earring",
        body=Apogee_body,hands="Lamassu Mitts +1",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Conveyance cape",waist="Lucidity Sash",legs="Assiduity Pants +1",feet=Apogee_feet_phys}

    sets.precast.JA['Mana Cede'] = {hands=Empy_hands}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
		main="Nirvana",sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Empy_head,neck="Caller's Pendant",ear1="Evans Earring",ear2="Andoaa Earring",
		body=AF_body,hands=Relic_hands,ring1="Evoker's Ring",ring2="Fervor ring",
		back="Conveyance Cape",waist="Kobo Obi",legs=Empy_legs,feet=Apogee_feet_phys}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		main=Grioavolr_Enh,sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +2",hands=Merl_hands_FC,ring1="Veneficium Ring", ring2="Kishar Ring", 
		back=Pet_Mag_Cape,waist="Witful Belt",legs=Psycloth_legs,feet=Merl_feet_FC}
		-- Total = % Cast Speed + % Quick Cast
	
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		})
		-- Total = % Cast Speed + % Quick Cast

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main=Serenity,back="Perimede Cape",legs="Doyen Pants",feet=Vanya_feet})

	sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {
		})
		-- Total = % Cast Speed + % Quick Cast
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC['Enfeebling Magic'], {
		ammo='Sapience Orb',  -- 2%
		main="Daybreak", 
		sub="Ammurapi Shield", 
		--waist="Shinjutsu-no-Obi +1"
		})
		-- Total = 76% Cast Speed + 6% Quick Cast

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {ring1="Veneficium Ring",waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi hat",hands="Carapacho Cuffs",back="Perimede Cape",legs="Doyen Pants"})

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		ammo='Sapience Orb',  -- 2%
		})
		-- Total % FC | % QM


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Welkin Crown",neck="Fotia Gorget",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Fenrir Ring +1",ring2="Fenrir Ring +1",
        back=WS_Cape,waist="Fotia Belt",legs=Amalric_legs,feet=Amalric_feet}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	 sets.precast.WS['Myrkr'] = set_combine(sets.precast.WS, {
        })
	
	 sets.precast.WS['Garland of Bliss'] = set_combine(sets.precast.WS, {
        })
		
	 sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {
        })

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        main=Grioavolr_Enh,sub={name="Clerisy Strap",priority=-1},ammo="Impatiens",
        head=Merl_head_FC,neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchanter Earring +1",
		body="Inyanga Jubbah +2",hands=Merl_hands_FC,ring1="Veneficium Ring", ring2="Kishar Ring", 
		back=Pet_Mag_Cape,waist="Witful Belt",legs=Psycloth_legs,feet=Merl_feet_FC}
	
	-- 101% Cap | Merits is 10%
	sets.midcast.SpellInterrupt = {
		sub="Culminus", --10 dont have yet
        ammo="Staunch Tathlum", --10
        body="Ros. Jaseran +1", --25 dont have yet
    	hands=Chironic_hands_DT, --20
    	legs="Querkening Brais", --15
        --neck="Loricate Torque +1", --5 unity aug
        ear1="Halasz Earring", --5
        ring2="Evanescence Ring", --5
		--back="Fi Follet Cape +2", -- unity aug
        waist="Emphatikos Rope", --12
        }
		--72% 

    sets.midcast.Utsusemi = sets.midcast.SpellInterrupt

	-- Unresistable. Might as well put TH
	sets.midcast['Dia II'] 	= set_combine(sets.midcast['Enfeebling Magic'],{
		main=Taming_Sari_TH,sub="Genmei Shield",
		head="Wh. Rarab Cap +1",
		waist="Chaac Belt",})

	sets.midcast['Banish II'] = set_combine(sets.midcast['Debuff'].Resistant, {
		--head="Ipoca Beret",
		neck="Jokushu Chain",
		--ring1="Fenian Ring",
		--back="Disperser's Cape",
		})

    sets.midcast.Cure = {main=Serenity,sub={name="Clerisy Strap",priority=-1},
		head=Vanya_head,neck="Incanter's Torque",ear1='Healing Earring',ear2="Beatific Earring",
		body=Vanya_body,hands=Telch_hands_Enh,ring1="Ephedra Ring",ring2="Sirona's Ring",
		back="Solemnity Cape",waist="Bishop's Sash",legs=Vanya_legs,feet=Vanya_feet}
			
	sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {})
	
	sets.midcast['Cure day / weather'] = set_combine(sets.midcast.Cure, {waist="Hachirin-no-Obi"})
        
    sets.midcast.Curaga = sets.midcast.Cure

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
	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {
		main=Grioavolr_Enh,
		head=Vanya_head,neck="Incanter's Torque",ear1='Healing Earring',
		ring1="Ephedra Ring",ring2="Sirona's Ring",
		waist="Bishop's Sash",feet=Gendewitha_feet})
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
		main=Grioavolr_Enh,sub={name="Fulcio Grip",priority=-1},
		head=Telch_head_Enh,neck="Incanter's Torque",ear1='Andoaa Earring',
		body=Telch_body_Enh,hands=Telch_hands_Enh,
		back='Merciful Cape',waist="Olympus Sash",legs=Telch_legs_Enh,feet=Telch_Feet_Enh})
	
	-- Skill+
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
		main=Grioavolr_Enh,sub="Fulcio Grip",ammo="Pemphredo Tathlum",
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
		waist="Gishdubar Sash", back="Grapevine Cape"
		})
	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {
		main=Grioavolr_Enh, sub="Fulcio Grip",
		head="Inyanga Tiara +2",
		--back="Grapevine Cape",
		})

    sets.midcast['Haste'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Reraise'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Sneak'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Invisible'] = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'],{ring1="Sheltered Ring"})
	sets.midcast.Shellra = sets.midcast.Shell
	
	sets.midcast.Trust = set_combine(sets.midcast.FastRecast, {body="Apururu Unity Shirt"})
	
	-- Custom spell classes
	
	sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {
		--waist="Shinjutsu-no-Obi +1" -- unity aug
		--feet=something with macc
		})

	-- Need to earring 1
	
    sets.midcast['Mnd Enfeebles'] = {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear2="Enchanter Earring +1",
        body=Vanya_body,hands="Lurid Mitts",ring1="Vertigo Ring",ring2="Leviathan Ring",
        back="Pahtli cape",waist="Eschan Stone",legs=Psycloth_legs,feet=Mediums_Sabots}
		
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {body="Inyanga jubbah +2"})

    sets.midcast['Int Enfeebles'] = {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Imbodla Necklace",ear2="Enchanter Earring +1",
        body=Vanya_body,hands="Lurid Mitts",ring1="Vertigo Ring",ring2="Shiva Ring",
        waist="Eschan Stone",legs=Psycloth_legs,feet=Mediums_Sabots}
		
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {body="Inyanga jubbah +2"})
	
	sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant
	
    sets.midcast['Dark Magic'] = {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Incanter's Torque",ear2="Enchanter Earring +1",
        body="Inyanga jubbah +2",hands=Merl_hands_Asp,ring1="Perception Ring",ring2="Kishar Ring",
        back="Perimede cape",waist="Eschan Stone",legs=Psycloth_legs,feet=Merl_feet_Nuke}

	sets.midcast.Drain = {main=Rubicundity,sub={name="Genbu's Shield",priority=-1},ammo="Hydrocera",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear2="Enchanter Earring +1",
        body="Inyanga jubbah +2",hands="Lurid Mitts",ring1="Evanescence Ring",ring2="Kishar Ring",
        back="Perimede cape",waist="Fucho-no-obi",legs=Merl_legs_Asp,feet=Merl_feet_Asp}
		
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Drain.Resistant  =  set_combine(sets.midcast.Drain, {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1}})
	
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant


    -- Avatar pact sets.  All pacts are Ability type.
	
	sets.midcast.Pet['BuffBloodPactWard'] = {
		main=Espiritus,sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Empy_head,neck="Incanter's Torque",ear1="Gifted Earring",ear2="Andoaa Earring",
		body=Apogee_body,hands="Lamassu Mitts +1",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Conveyance Cape",waist="Lucidity Sash",legs="Assiduity Pants +1",feet=Apogee_feet_mag}
	
	sets.midcast.Pet['OtherBloodPactWard'] = {
		main=Espiritus,sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Empy_head,neck="Incanter's Torque",ear1="Gifted Earring",ear2="Andoaa Earring",
		body=Apogee_body,hands="Lamassu Mitts +1",ring1="Evoker's Ring",ring2="Fervor Ring",
		back="Conveyance Cape",waist="Lucidity Sash",legs="Assiduity Pants +1",feet=Apogee_feet_mag}

    sets.midcast.Pet['DebuffBloodPactWard'] = {
		main=Espiritus,sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Empy_head,neck="Incanter's Torque",ear1="Lugalbanda Earring",ear2="Enmerkar Earring",
		body=AF_body,hands=Merl_hands_phys,ring1="Evoker's Ring",ring2="Fervor Ring",
		back=Pet_Mag_Cape,waist="Incarnation Sash",legs=Enticers_Pants,feet=AF_feet}
		  
    sets.midcast.Pet['PhysicalBloodPactRage'] = {
		main="Nirvana",sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Apogee_head_phys,neck="Shulmanu Collar",ear1="Lugalbanda Earring",ear2="Gelos Earring",
		body=AF_body,hands=Merl_hands_phys,ring1={name="Varar Ring +1",bag="wardrobe"},ring2={name="Varar Ring +1",bag="wardrobe4"},
		back=Pet_Phys_Cape,waist="Incarnation Sash",legs=Apogee_legs_phys,feet=Apogee_feet_phys}

    sets.midcast.Pet['PhysicalBloodPactRage'].Acc = set_combine(sets.midcast.Pet['PhysicalBloodPactRage'], {})

    sets.midcast.Pet['MagicalBloodPactRage'] = {
		main=Grioavolr_Pet,sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Apogee_head_mag,neck="Adad Amulet",ear1="Lugalbanda Earring",ear2="Gelos Earring",
		body=AF_body,hands=Merl_hands_mag,ring1={name="Varar Ring +1",bag="wardrobe"},ring2={name="Varar Ring +1",bag="wardrobe4"},
		back=Pet_Mag_Cape,waist="Incarnation Sash",legs=Enticers_Pants,feet=Apogee_feet_mag}

    sets.midcast.Pet['MagicalBloodPactRage'].Acc = set_combine(sets.midcast.Pet['MagicalBloodPactRage'], {
		head=Empy_head,neck="Incanter's Torque",ear2="Enmerkar Earring",
		ring1="Evoker's Ring",ring2="Fervor Ring",
		feet=AF_feet})

	 sets.midcast.Pet['HybridlBloodPactRage'] = {
		main="Nirvana",sub={name="Elan Strap +1",priority=-1},ammo="Sancus Sachet +1",
		head=Apogee_head_phys,neck="Shulmanu Collar",ear1="Lugalbanda Earring",ear2="Gelos Earring",
		body=AF_body,hands=Merl_hands_phys,ring1={name="Varar Ring +1",bag="wardrobe"},ring2={name="Varar Ring +1",bag="wardrobe4"},
		back=Pet_Phys_Cape,waist="Incarnation Sash",legs=Apogee_legs_phys,feet=Apogee_feet_phys}
	
	
    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = set_combine(sets.midcast.Pet['BuffBloodPactWard'], {})
    
    sets.midcast.Pet['Elemental Magic'] = set_combine( sets.midcast.Pet['MagicalBloodPactRage'], {})

    sets.midcast.Pet['Elemental Magic'].Resistant = set_combine( sets.midcast.Pet['MagicalBloodPactRage'].Acc, {})
    

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Sanctity Necklace",ear1="Infused Earring",ear2="Andoaa Earring",
        body=Apogee_body,hands="Asteria Mitts +1",ring1="Sheltered Ring",ring2="Defending Ring",
        back="Solemnity Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet=Merl_feet_Refr}
    
    -- Idle sets
    sets.idle = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Sanctity Necklace",ear1="Infused Earring",ear2="Andoaa Earring",
        body=Apogee_body,hands="Asteria Mitts +1",ring1="Sheltered Ring",ring2="Defending Ring",
        back="Solemnity Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet=Merl_feet_Refr}

    sets.idle.DT = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",
        body=Hagondes_body,hands=Hagondes_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

	-- Meva > DT > Refresh
	sets.idle.MEva = {
		main="Daybreak",sub="Ammurapi Shield",range='Nibiru Harp',
		head="Inyanga Tiara +2",neck="Warder's Charm +1",ear1="Hearty Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Purity Ring",ring2="Vengeful Ring",
		back="Felicitas Cape +1",waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2",
		}

	-- Avatra Idle sets
    
    sets.idle.Avatar = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Caller's Pendant",ear1="Gifted Earring",ear2="Evans Earring",
        body=Apogee_body,hands="Asteria Mitts +1",ring1="Evoker's Ring",ring2="Varar Ring +1",
        back=Pet_Phys_Cape,waist="Klouskap Sash",legs="Assiduity Pants +1",feet=Apogee_feet_phys}

    sets.idle.DT.Avatar = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Caller's Pendant",ear1="Gifted Earring",ear2="Evans Earring",
        body=Apogee_body,hands=Relic_hands,ring1="Evoker's Ring",ring2="Varar Ring +1",
        back=Pet_Phys_Cape,waist="Klouskap Sash",legs="Assiduity Pants +1",feet=Apogee_feet_phys}

	-- Meva > DT > Refresh
	sets.idle.MEva.Avatar = {
		main="Daybreak",sub="Ammurapi Shield",range='Nibiru Harp',
		head="Inyanga Tiara +2",neck="Warder's Charm +1",ear1="Hearty Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Purity Ring",ring2="Vengeful Ring",
		back="Felicitas Cape +1",waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2",
		}

    sets.idle.Spirit = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Caller's Pendant",ear1="Gifted Earring",ear2="Evans Earring",
        body=Apogee_body,hands=Relic_hands,ring1="Evoker's Ring",ring2="Varar Ring +1",
        back=Pet_Phys_Cape,waist="Klouskap Sash",legs="Assiduity Pants +1",feet=Apogee_feet_phys}

    sets.idle.Avatar.Favor = set_combine(sets.idle.Avatar, {head=Empy_head})
	
    sets.idle.Avatar.Melee = {main=Gridarvor,sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=Empy_head,neck="Caller's Pendant",ear1="Gifted Earring",ear2="Evans Earring",
        body=Apogee_body,hands=Relic_hands,ring1="Evoker's Ring",ring2="Varar Ring +1",
        back=Pet_Phys_Cape,waist="Klouskap Sash",legs="Assiduity Pants +1",feet=Apogee_feet_phys}
        
    sets.perp = {}
    sets.perp.Day = {hands=Empy_hands}
    sets.perp.Weather = {hands=Empy_hands}
	sets.perp["Carbuncle"] = {hands="Asteria Mitts +1"}
	sets.perp["Cait Sith"] = {hands="Lamassu Mitts +1"}
    sets.perp.Alexander = sets.midcast.Pet['BuffBloodPactWard']
    
    -- Defense sets
    sets.defense.PDT = {main="Mafic cudgel",sub={name="Genbu's Shield",priority=-1},
        head=Hagondes_head,neck="Loricate Torque +1",ear1="Ethereal Earring",
        body=Hagondes_body,hands=Hagondes_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Cheviot Cape",waist="Slipor Sash",legs=Hagondes_legs,feet="Battlecast Gaiters"}

    sets.defense.MDT = {main="Mafic cudgel",sub={name="Irenic Strap +1",priority=-1},
        head=Merl_head_Burst,neck="Loricate Torque +1",ear1="Ethereal Earring",
        body=Amalric_body,hands=Amalric_hands,ring1="Defending Ring",ring2="Patricius Ring",
        back="Solemnity Cape",waist="Slipor Sash",legs="Inyanga Shalwar +2",feet=Vanya_feet}

    sets.Kiting = {feet="Herald's Gaiters"}
	sets.Adoulin = {body="Councilor's Garb"}
    sets.CP = {back=CP_back}
	sets.warp = {ring2='Warp Ring'}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.buff.Reive = {neck="Arciela's Grace +1"}
	sets.buff.Doom = {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",}
	sets.warp = {ring2='Warp Ring'}
    

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group				
	sets.engaged = {main="Nirvana",sub={name="Oneiros Grip",priority=-1},ammo="Sancus Sachet +1",
        head=AF_head,neck="Sanctity Necklace",ear1="Mache Earring",ear2="Brutal Earring",
        body="Onca Suit",hands=empty,ring1="Rajas Ring",ring2="Petrov Ring",
        back="Kayapa Cape",waist="Klouskap Sash",legs=empty,feet=empty}
		
	sets.engaged.acc = {}

	sets.Locked_Main_Sub = {main="Nirvana",sub="Oneiros Grip"}
	sets.Locked_Main_Sub_DW = {main="Nirvana",sub="Oneiros Grip"}
			
end
 