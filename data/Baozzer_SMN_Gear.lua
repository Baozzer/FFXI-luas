--[[
	-- to beat an espiritus you need over...
	5 bpd and 30 mab
	6 bpd and 27.5 mab
	7 bpd and 25 mab
	8 bpd and 22.5 mab
	9 bpd and 20 mab
	10 bpd and 17.5 mab
	augmented on grio.

	-- get siren
	
--]]

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
	
	Relic_head		    ={ name="Smn. Horn +2"}
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
    -- Precast Sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head=Relic_head}
    
	-- Siphon +, Smn Skill +
    sets.precast.JA['Elemental Siphon'] = {
		--main="Chantoyant Staff",
		main="Espiritus",sub="Vox Grip",ammo="Esper Stone +1",
		--ear1="Ludurr Earring",--ear2="C. Palug Earring",
		head="Baayami Hat",neck="Incanter's Torque",ear1="Smn. Earring",ear2="Andoaa Earring",
		body="Baayami Robe",hands="Baayami Cuffs",ring1="Evoker's Ring",ring2="Zodiac Ring",
		back="Conveyance Cape",waist="Kobo Obi",legs="Baayami Slops",feet=Empy_feet,}

    sets.precast.JA['Mana Cede'] = {hands=Empy_hands}

    -- Pact delay reduction gear

	-- 670 Skill Tier. 21s
    --[[
	sets.precast.BloodPactWard = { 
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet +1", -- -7 ii
		head=Empy_head,
		neck="Incanter's Torque",
		ear1="Ludurr Earring",
		ear2="C. Palug Earring",
		body="Baayami Robe",
		hands="Baayami Cuffs", -- -6 i
		ring1="Evoker's Ring",
		ring2="Stikini Ring",
		back="Conveyance Cape", -- -3 ii
		back="Kobo Obi",
		legs="Baayami Slops", -- -7 i
		feet="Baayami Sabots",
		}
		-- Totals: -10iii | -10ii | -13i = -33, Skill
	--]]

	-- 512 Skill Tier. 22s. Use minimal skill pieces to use more Pet pieces from idle/engaged sets.
    sets.precast.BloodPactWard = { 
		ammo="Sancus Sachet +1", -- -7 ii
		head=Empy_head,
		neck="Caller's Pendant", -- can't reach new tier, regain is good
		body=AF_body, -- -15 i
		ring1="Evoker's Ring",
		back="Conveyance Cape", -- -3 ii
		back="Kobo Obi",
		}
		-- Totals: -10iii | -10ii | -15i = -35, Skill

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		main="",
		sub="",
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
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','CHR+10',}}
		}
		-- Total = % Cast Speed + % Quick Cast
	
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		})
		-- Total = % Cast Speed + % Quick Cast

	sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		})
		-- Total = % Cast Speed + % Quick Cast

	sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {
		})
		-- Total = % Cast Speed + % Quick Cast
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC['Enfeebling Magic'], {
		main="Daybreak", 
		sub="Ammurapi Shield", 
		--waist="Shinjutsu-no-Obi +1"
		})
		-- Total = % Cast Speed + % Quick Cast

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		})
		-- Total = % Cast Speed + % Quick Cast
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
		})
		-- Total = % Cast Speed + % Quick Cast

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {
		})
		-- Total % FC | % QM


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		neck="Fotia Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
		waist="Fotia Belt",}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	-- MAB MND/STR
	sets.precast.WS['Garland of Bliss'] = {
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
			feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+30','Magic burst dmg.+5%','INT+14',}}}

	-- MP+
	sets.precast.WS['Myrkr'] = {
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
			feet="Amalric Nails",}
	
	sets.precast.WS['Retribution'] = set_combine(sets.precast.WS,{})	
	sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, { })

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------
	
	-- Same as Precast
    sets.midcast.FastRecast = {
		main="",
		sub="",
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
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+5','"Fast Cast"+6','CHR+10',}}
		}
	
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

	-- add meva set
	sets.midcast['Summoning Magic'] = {
		body="Baayami Robe",
		}

	sets.midcast['Divine Magic'] = {
		--head="Ipoca Beret",
		neck="Jokushu Chain",
		--ring1="Fenian Ring",
		--back="Disperser's Cape",
		}

    sets.midcast.Cure = {
			main="Serenity",
			sub="Enki Strap",
			head="Vanya Hood",
			body="Inyanga Jubbah +1",
			hands="Inyan. Dastanas +1",
			ring1="Haoma's Ring",
			ring2="Haoma's Ring",
			legs="Inyanga Shalwar +2",
			feet="Medium's Sabots",}
			
	sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {
			neck="Phalaina Locket",
			waist="Gishdubar Sash",})
	
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
			neck="Malison Medallion",
			hands="Hieros Mittens",
			waist="Gishdubar Sash",
			feet="Gende. Galosh. +1"})
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {
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
			feet="Telchine Pigaches",})
	
	-- Skill+
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {
			neck="Incanter's Torque",
			ear1="Andoaa Earring",
			hands="Inyan. Dastanas +1",
			ring1="Stikini Ring",
			ring2="Stikini Ring",
			back="Fi Follet Cape +1",
			waist="Olympus Sash",
			legs="Shedir Seraweels",
        })
	
	sets.midcast.bar_status	= sets.midcast.BarElement
	
	-- no skill bassed buffs

	sets.midcast['Aquaveil'] = set_combine(sets.midcast['Enhancing Magic'], {
			head="Amalric Coif",
			waist="Emphatikos Rope",
			legs="Shedir Seraweels",
		})
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
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
			feet="Telchine Pigaches",
		})
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {
			head="Amalric Coif",
			waist="Gishdubar Sash",
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

	-- Need to earring 1
	
    sets.midcast['Mnd Enfeebles'] = {
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
		
	sets.midcast['Mnd Enfeebles'].Resistant 	= set_combine(sets.midcast['Mnd Enfeebles'], {})

    sets.midcast['Int Enfeebles'] = {
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
		
	sets.midcast['Int Enfeebles'].Resistant 	= set_combine(sets.midcast['Int Enfeebles'], {})
	
	sets.midcast.ElementalEnfeeble				= sets.midcast['Int Enfeebles']
	sets.midcast.ElementalEnfeeble.Resistant 	= sets.midcast['Int Enfeebles'].Resistant

	-- Unresistable. Might as well put TH
	sets.midcast['Dia II'] 	= set_combine(sets.midcast['Mnd Enfeebles'],{
		head="Wh. Rarab Cap +1",
		waist="Chaac Belt",})
		
	sets.midcast.Dispelga = set_combine(sets.midcast['Int Enfeebles'], {
		--waist="Shinjutsu-no-Obi +1" -- unity aug
		--feet=something with macc
		})
	
    sets.midcast['Dark Magic'] = {main=Grioavolr_Enh,sub={name="Niobid Strap",priority=-1},ammo="Hydrocera",
        head=Merl_head_Burst,neck="Incanter's Torque",ear2="Enchanter Earring +1",
        body="Inyanga jubbah +2",hands=Merl_hands_Asp,ring1="Perception Ring",ring2="Kishar Ring",
        back="Perimede cape",waist="Eschan Stone",legs=Psycloth_legs,feet=Merl_feet_Nuke}

	sets.midcast.Drain = {main=Rubicundity,sub={name="Genbu's Shield",priority=-1},ammo="Hydrocera",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear2="Enchanter Earring +1",
        body="Inyanga jubbah +2",hands="Lurid Mitts",ring1="Evanescence Ring",ring2="Kishar Ring",
        back="Perimede cape",waist="Fucho-no-obi",legs=Merl_legs_Asp,feet=Merl_feet_Asp}
		
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Drain.Resistant  =  set_combine(sets.midcast.Drain, {})
	
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant


    -- Avatar pact sets.  All pacts are Ability type.
	
	sets.midcast.Pet['BuffBloodPactWard'] = {
			main="Espiritus",
			sub="Vox Grip",
			ammo="Sancus Sachet +1",
			head="Baayami Hat",
			neck="Incanter's Torque",
			--ear1="C. Palug Earring",
			ear1="Smn. Earring",
			--ear2="Lodurr Earring",
			ear2="Andoaa Earring",
			body="Baayami Robe",
			hands="Baayami Cuffs",
			ring1="Evoker's Ring",
			ring2="Stikini Ring",
			back="Conveyance Cape",
			waist="Kobo Obi",
			legs="Baayami Slops",
			feet="Baayami Sabots",}
	
	sets.midcast.Pet['OtherBloodPactWard'] = {}

    sets.midcast.Pet['DebuffBloodPactWard'] = {
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
			feet="Tali'ah Crackows +1"}
		  
    sets.midcast.Pet['PhysicalBloodPactRage'] = {
			main="Nirvana",
			sub="Elan Strap +1",
			--ammo="Epitaph",
			ammo="Sancus Sachet +1",
			head={ name="Helios Band", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
			--neck="Smn. Collar +2",
			neck="Shulmanu Collar",
			--ear1"Sroda Earring",
			ear1="Lugalbanda Earring",
			--ear2="Beck. Earring +2",
			--ear2="Kyrene's Earring",
			ear2="Gelos Earring",
			body="Con. Doublet +3",
			hands={ name="Merlinic Dastanas", augments={'Pet: Attack+26 Pet: Rng.Atk.+26','Blood Pact Dmg.+10','Pet: STR+8','Pet: Mag. Acc.+2','Pet: "Mag.Atk.Bns."+14',}},
			ring1="Varar Ring",
			--ring2="C. Palug Ring",
			ring2="Varar Ring",
			back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: Haste+10',}},
			waist="Incarnation Sash",
			legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
			feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},}

    sets.midcast.Pet['PhysicalBloodPactRage'].Acc = set_combine(sets.midcast.Pet['PhysicalBloodPactRage'], {
			body=AF_body,
			feet="Convo. Pigaches +3",})

    sets.midcast.Pet['MagicalBloodPactRage'] = {
			main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+1','Pet: Mag. Acc.+19','Pet: "Mag.Atk.Bns."+22',}},
			sub="Elan Strap +1",
			--ammo="Epitaph",
			ammo="Sancus Sachet +1",
			--head="C. Palug Crown",
			head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
			--neck="Smn. Collar +2",
			neck="Adad Amulet",
			ear1="Lugalbanda Earring",
			ear2="Gelos Earring",
			body={ name="Apogee Dalmatica", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
			hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+10',}},
			ring1="Varar Ring",
			ring2="Varar Ring",
			back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
			waist="Regal Belt",
			--legs={ name="Apogee Slacks", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}}, --enticer better?
			legs="Enticer's Pants",
			feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},}

    sets.midcast.Pet['MagicalBloodPactRage'].Acc = set_combine(sets.midcast.Pet['MagicalBloodPactRage'], {
			body="Con. Doublet +3",})

	 sets.midcast.Pet['HybridlBloodPactRage'] = {
			main="Nirvana",
			sub="Elan Strap +1",
			--ammo="Epitaph",
			--head="C. Palug Crown",
			head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
			--neck="Smn. Collar +2",
			neck="Adad Amulet",
			ear1="Lugalbanda Earring",
			ear2="Gelos Earring",
			--body="Apogee Dalmatica +1",
			body="Con. Doublet +3",
			hands={ name="Merlinic Dastanas", augments={'Pet: "Mag.Atk.Bns."+25','Blood Pact Dmg.+10',}},
			ring1="Varar Ring",
			ring2="Varar Ring",
			back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10','"Fast Cast"+10',}},
			waist="Regal Belt",
			--legs="Apogee Slacks +1",
			legs={ name="Apogee Slacks", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
			feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},}
	
	
    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = set_combine(sets.midcast.Pet['BuffBloodPactWard'], {})
    
    sets.midcast.Pet['Elemental Magic'] = set_combine( sets.midcast.Pet['MagicalBloodPactRage'], {})

    sets.midcast.Pet['Elemental Magic'].Resistant = set_combine( sets.midcast.Pet['MagicalBloodPactRage'].Acc, {})
    

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {
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
			feet="Baayami Sabots",}
    
    -- Idle sets
    sets.idle = {
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
			feet="Baayami Sabots",}

    sets.idle.DT = {
			main="Terra's Staff",
			sub="Oneiros Grip",
			neck="Loricate Torque +1",
			ear1="Genmei Earring",
			ear2="Ethereal Earring",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Solemnity Cape",
			waist="Lieutenant's Sash",
			feet="Herald's Gaiters"}

	-- Meva > DT > Refresh
	sets.idle.MEva = {
		main="Daybreak",sub="Ammurapi Shield",range='Nibiru Harp',
		head="Inyanga Tiara +2",neck="Warder's Charm +1",ear1="Hearty Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Purity Ring",ring2="Vengeful Ring",
		back="Felicitas Cape +1",waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2",
		}

	-- Avatra Idle sets
   --Requires Perp -14 (or refresh whatever is higher) and 512 or 575 Skill 
    sets.idle.Avatar = {
			main="Nirvana", -- -8
			sub="Elan Strap +1",
			--ammo="Epitaph",
			ammo="Sancus Sachet +1",
			--head="Convoker's Horn +3", -- +3
			head="Beckoner's Horn +1", -- +2
			neck="Caller's Pendant",
			ear1="Evans Earring", -- -2
			--ear2="C. Palug Earring",
			ear2="Enmerkar Earring",
			--body="Apogee Dalmatica +1",
			body={ name="Apogee Dalmatica", augments={'Summoning magic skill +15','Enmity-5','Pet: Damage taken -3%',}},
			hands="Asteria Mitts +1",
			ring1="Evoker's Ring", -- -1
			--ring2="Stikini Ring +1", -- +1
			ring2="Defending Ring",
			--back=DT
			back={ name="Campestres's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10',}},
			--latent=Fuchi-no-Obo
			--waist="Lucidity Sash",
			waist="Lieutenant's Sash",
			legs="Assiduity Pants +1", -- -3
			--feet={ name="Apogee Pumps", augments={'MP+60','Summoning magic skill +15','Blood Pact Dmg.+7',}},} -- -8
			feet="Baayami Sabots", -- +3
			}

    sets.idle.DT.Avatar = {
		main="Daybreak",sub="Ammurapi Shield",range='Nibiru Harp',
		head="Inyanga Tiara +2",neck="Warder's Charm +1",ear1="Hearty Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Purity Ring",ring2="Vengeful Ring",
		back="Felicitas Cape +1",waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2",
		}

	-- Meva > DT > Refresh
	sets.idle.MEva.Avatar = {
		main="Daybreak",sub="Ammurapi Shield",range='Nibiru Harp',
		head="Inyanga Tiara +2",neck="Warder's Charm +1",ear1="Hearty Earring",ear2="Sanare Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Purity Ring",ring2="Vengeful Ring",
		back="Felicitas Cape +1",waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyan. Crackows +2",
		}

    sets.idle.Spirit = {
			--Requires Perp -6. Use more -DT and Refresh
			neck="Loricate Torque +1",
			ear1="Genmei Earring",
			ring1="Dark Ring",
			back="Solemnity Cape",}

    sets.idle.Avatar.Favor = set_combine(sets.idle.Avatar, {head=Empy_head})
	
    sets.idle.Avatar.Melee = {
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
			feet="Tali'ah Crackows +1",}
        
    sets.perp = {}
    sets.perp.Day = {hands=Empy_hands}
    sets.perp.Weather = {hands=Empy_hands}
	sets.perp["Carbuncle"] = {
			--Requires Perp -5
			ring1="Dark Ring", -- +1
			feet="Herald's Gaiters"} -- +8
	sets.perp["Cait Sith"] = {
			--Requires Perp -10
			ear1="Genmei Earring", -- +2
			hands="Lamassu Mitts +1",
			ring1="Dark Ring",} -- +1
    sets.perp.Alexander = sets.midcast.Pet['BuffBloodPactWard']
    
    -- Defense sets
    sets.defense.PDT = {}

    sets.defense.MDT = {}

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
	sets.engaged = {main="Nirvana",sub="Elan Strap +1",
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
		
	sets.engaged.acc = {}

	sets.Locked_Main_Sub = {main="Nirvana",sub="Elan Strap +1",}
	-- Should Never Need This but it's here. 
	sets.Locked_Main_Sub_DW = {main="Nirvana",sub="Elan Strap +1",}
			
end
 