--[[
	To Do List:

		auto echo drop (it spellcast buffactive silence not mute then use)
		auto ws (if engage tp > 1000 then ws)
		use different earring (if tp>2750 and ear1 ear2 = moonshade then equip sets.NoMoonshade
		primary ws depending on mainhand type (if main type = then this ws)
		adoulin movement for idle in adoulin only 
		doom set for all sets 
		reive set for idle only
		ftp ws neck and belt
		auto cast degrade. mp
		stna
		all modes not specific to job
		equipment lock: rings, nexus cape, warp curdgel, rr earring for all sets. in case need rr during a fight
--]]


-------------------------------------------------------------------------------------------------------------------
-- ALL YOUR JOBS NEED OR SHARE THESE
-------------------------------------------------------------------------------------------------------------------

print('Baozzer_Globals.lua Loaded')

hide_window = false
Notification_color = 200
text_color = 160
warning_text = 167

-- Map for auto Fotia Gorget and Fotia Belt
fTPweaponskills = S{
	"Jishnu's Radiance",
	'Decimation','Rampage','Ruinator',
	'Hexa Strike','Realmrazer',
	'Dancing Edge','Evisceration','Extenterator','Pyrrhic Kleos',
	'Resolution',
	"Ascetic's Fury",'Asuran Fist','Backhand Blow','Combo','Dragon Kick','Howling Fist','One Inch Punch','Raging Fists','Shijin Spiral','Shoulder Tackle','Spinning Attack','Stringing Plummel','Tornado Kick','Victory Smite',
	'Blade: Jin', 'Blade: Ku', 'Blade: Shun',
	'Last Stand',
	'Stardiver',
	'Entropy',
	'Chant du Cygne','Requiescat','Swift Blade','Vorpal Blade',}

-------------------------------------------------------------------------------------------------------------------
-- Global Augmented Gear
-------------------------------------------------------------------------------------------------------------------

function define_global_sets()

	-- Weapons
	Grioavolr_Enh			={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','MP+88','Magic Damage +8',}}
	Serenity				={ name="Serenity", augments={'MP+50','Enha.mag. skill +10','"Cure" potency +5%','"Cure" spellcasting time -10%',}}
	
	-- Armor
	Chironic_head_TP 		={ name="Nibiru Harp", augments={'Mag. Evasion+20','Phys. dmg. taken -3','Magic dmg. taken -3',}}

	Chironic_hands_DT		={ name="Chironic Gloves", augments={'Pet: STR+6','Attack+26','Damage taken-4%','Accuracy+8 Attack+8',}}
	
	Chironic_hands_MAB 		={ name="Chironic Gloves", augments={'STR+7','"Mag.Atk.Bns."+30','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}
	Chironic_feet_MAB 		={ name="Chironic Slippers", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Haste+1','Mag. Acc.+12','"Mag.Atk.Bns."+15',}}
	
	Chironic_legs_MAcc		={ name="Chironic Hose", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+2','MND+7','Mag. Acc.+13',}}
	
	Chironic_hands_Refresh	={ name="Chironic Gloves", augments={'Accuracy+7','Haste+1','"Refresh"+2','Accuracy+19 Attack+19',}}
	
	Chironic_hands_TP		={ name="Chironic Gloves", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','"Mag.Atk.Bns."+11','Quadruple Attack +1',}}
	
	Gende_hands_Cure		={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','"Cure" spellcasting time -4%',}}
	Gende_hands_Song		={ name="Gendewitha Gages", augments={'Phys. dmg. taken -3%','Song spellcasting time -4%',}}
    Gende_legs				={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Song spellcasting time -4%',}}
    Gende_feet				={ name="Gende. Galosh. +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','"Cure" potency +4%',}}
	
	Leyline_hands			={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}
	
    Lustratio_legs			={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}}
    Lustratio_feet			={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}}
	
	Mediums_feet			={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}}
	
	Telch_head_Enh			={ name="Telchine Cap", augments={'Mag. Evasion+21','"Fast Cast"+2','Enh. Mag. eff. dur. +8',}}
	Telch_body_Enh			={ name="Telchine Chas.", augments={'Mag. Evasion+23','"Fast Cast"+5','Enh. Mag. eff. dur. +8',}}
    Telch_hands_Enh			={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Cure" potency +3%','Enh. Mag. eff. dur. +10',}}
	Telch_legs_Enh			={ name="Telchine Braconi", augments={'Mag. Evasion+24','"Conserve MP"+3','Enh. Mag. eff. dur. +10',}}
	Telch_Feet_Enh			={ name="Telchine Pigaches", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
	
	Vanya_head				={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}
	Vanya_body				={ name="Vanya Robe", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}}
	Vanya_feet				={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	
	-- Accesories
	Dark_Ring				={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -5%',}}
	CP_back 				={ name="Mecisto. Mantle", augments={'Cap. Point+49%','VIT+1','Mag. Acc.+4','DEF+8',}}


	sets.buff.reive = {neck="Arciela's Grace +1"}
	sets.buff.doom = {
		neck="Nicander's Necklace",
		--ring1
		--ring2
		waist="Gishdubar Sash",}
	sets.notmoonshade = {ear1="",}
end


-------------------------------------------------------------------------------------------------------------------
--  Global Keybinds
-------------------------------------------------------------------------------------------------------------------

-- Function to bind GearSwap binds when loading a GS script.
function global_on_load()
	-- ctrl = ^
	-- alt = !
	-- windows key = @
		-- @ doesnt work with f keys

	-- Global Functions Keybinds

	-- Summons all Trusts
	send_command('bind f8 input //tru 1')
	-- Remove all Trusts
	send_command('bind !f7 input /returnfaith all')

	-- Full DT set
	send_command('bind [ gs c toggle PhysicalDefense')
	-- ACC Array
	send_command('bind ^[ gs c cycle OffenseMode')
	-- Some DT pieces
	send_command('bind ![ gs c cycle HybridMode')

	-- MDT
	send_command('bind ] gs c toggle MagicalDefense')
	-- Resistant Mode
	send_command('bind ^] gs c cycle CastingMode')
	-- Idle Set
	send_command('bind !] gs c cycle IdleMode')
	
	-- Locks CP Back
	send_command('bind @9 gs c cycle CP')

	-- Equips Warp Ring
	send_command('bind @0 input //gs equip sets.warp')

	-- Mount/dismount
	send_command('bind @m input //mr')

	-- Target NPC. Good for crowded areas.
	send_command('bind @t input /targetnpc')


	-- Default Cure HotKeys
	if player.sub_job:upper() == 'SCH' then
   		send_command('bind @1 input /ma "Cure III" <stal>')
    	send_command('bind @2 input /ma "Cure II" <stal>')
	elseif player.sub_job:upper() == 'RDM' then
   		send_command('bind @1 input /ma "Cure IV" <stal>')
    	send_command('bind @2 input /ma "Cure III" <stal>')
	elseif player.sub_job:upper() == 'WHM' then
   		send_command('bind @1 input /ma "Cure IV" <stal>')
    	send_command('bind @2 input /ma "Cure III" <stal>')
    	send_command('bind @3 input /ma "Curaga II" <stal>')

	elseif player.main_job:upper() == 'SCH' then
   		send_command('bind @1 input /ma "Cure IV" <stal>')
    	send_command('bind @2 input /ma "Cure III" <stal>')
	elseif player.main_job:upper() == 'RDM' then
   		send_command('bind @1 input /ma "Cure IV" <stal>')
    	send_command('bind @2 input /ma "Cure III" <stal>')
	elseif player.main_job:upper() == 'WHM' then
   		send_command('bind @1 input /ma "Cure V" <stal>')
    	send_command('bind @2 input /ma "Cure III" <stal>')
    	send_command('bind @3 input /ma "Curaga III" <stal>')
	elseif player.main_job:upper() == 'BLU' then
   		send_command('bind @1 input /ma "Magic Fruit" <stal>')
    	send_command('bind @2 input /ma "Wild Carrot" <stal>')
    	send_command('bind @3 input /ma "White Wind" <me>')
	end


	-- For easy memorization Priority goes to alpha key, shared letter goes to another keystroke.

	-- Default Status Healing Keybinds
    send_command('bind @b input /ma "Blindna" <stal>')
    send_command('bind @c input /ma "Cursna" <stal>')
    send_command('bind @e input /ma "Erase" <stal>')
    --send_command('bind @w input /ma "Esuna" <me>') --*** Maybe Macro for WHM
    send_command('bind @p input /ma "Paralyna" <stal>')
    send_command('bind @o input /ma "Poisona" <stal>') --***
    --send_command('bind @a input /ma "Sacrifice" <stal>') --*** Maybe Macro for WHM
    send_command('bind @x input /ma "Silena" <stal>') --***
    send_command('bind @s input /ma "Stona" <stal>')
    send_command('bind @v input /ma "Viruna" <stal>')


    -- Default Item Keybinds
    --send_command('bind @a input /item "Antidote" <me>') -- Just use remedy
	--send_command('bind @ input /item "Echo Drops" <me>') -- Auto Intercept Below
    --send_command('bind @ input /item "Eye Drops" <me>') -- Just use remedy
    send_command('bind @h input /item "Holy Water" <me>')
    send_command('bind @r input /item "Remedy" <me>')
    --send_command('bind @ input /item "Panacea" <me>') -- Oh you rich. Just use remedy.
    --send_command('bind @ input /item "Vile Elixir +1" <me>') -- Too niche to bind
    --send_command('bind @ input /item "Vile Elixir" <me>')
	if player.main_job:upper() == 'DNC' or player.sub_job:upper () == 'DNC' then
    	send_command('bind @i input /ja "Spectral Jig" <me>')
    	send_command('bind @o input /ja "Spectral Jig" <me>') --*** Nearby
	elseif player.main_job:upper() == 'NIN' or player.sub_job:upper() == 'NIN' then
    	send_command('bind @i input /ma "Tonko: ni" <me>')
    	send_command('bind @o input /ma "Monomi: Ichi" <me>') --*** Nearby
	elseif player.main_job:upper() == 'RDM' or 'WHM' or 'SCH' then
    	send_command('bind @i input /ma "Invisible" <stal>')
    	send_command('bind @o input /ma "Sneak" <stal>') --*** Nearby
	elseif player.sub_job:upper() == 'RDM' or 'WHM' or 'SCH' then
    	send_command('bind @i input /ma "Invisible" <stal>')
    	send_command('bind @o input /ma "Sneak" <stal>') --*** Nearby
	else
    	send_command('bind @i input /item "Prism Powder" <me>')
    	send_command('bind @o input /item "Silent Oil" <me>') --*** Nearby
	end


    -- Default Enfeebling Keybinds
	if player.main_job:upper() == 'RDM' then
    	send_command('bind ^a input /ma "Addle II" <stnpc>')
    	send_command('bind ^v input /ma "Blind II" <stnpc>') --*** Nearby
    	send_command('bind ^. input /ma "Dia III" <stnpc>') --*** "DOT..."
		send_command('bind ^d input /ma "Distract III" <stnpc>')
    	send_command('bind ^f input /ma "Frazzle III" <stnpc>')
    	send_command('bind ^g input /ma "Gravity II" <stnpc>')
    	send_command('bind ^p input /ma "Paralyze II" <stnpc>')
    	send_command('bind ^t input /ma "Slow II" <stnpc>')
	else
    	send_command('bind ^a input /ma "Addle" <stnpc>')
    	send_command('bind ^b input /ma "Bind" <stnpc>')
    	send_command('bind ^v input /ma "Blind" <stnpc>') --*** Nearby
    	send_command('bind ^. input /ma "Dia II" <stnpc>') --*** "DOT..."
		send_command('bind ^d input /ma "Distract" <stnpc>')
    	send_command('bind ^f input /ma "Frazzle" <stnpc>')
    	send_command('bind ^g input /ma "Gravity" <stnpc>')
    	send_command('bind ^p input /ma "Paralyze" <stnpc>')
    	send_command('bind ^x input /ma "Silence" <stnpc>') --*** "Mute = x"
    	--send_command('bind ^ input /ma "Sleep II" <stnpc>') --*** Macro These
    	send_command('bind ^t input /ma "Slow" <stnpc>') --*** "T... urtle"
	end

	if player.main_job:upper() == 'BRD' then
    	send_command('bind ^z input /ma "Magic Finale" <stnpc>') --*** "Undo"
    	send_command('bind ^s input /ma "Horde Lullaby II" <stnpc>')
	elseif player.main_job:upper() == 'BLM' then
    	send_command('bind ^s input /ma "Sleepga II" <stnpc>')
	else
    	send_command('bind ^z input /ma "Dispel" <stnpc>')  --*** "Undo"
    	send_command('bind ^s input /ma "Sleepga" <stnpc>')
	end
	

	-- Default Enhancing HotKeys	
	if player.main_job:upper() == 'RDM' then
    	send_command('bind !f input /ma "Flurry II" <stal>')
    	send_command('bind !h input /ma "Haste II" <stal>')
    	send_command('bind !p input /ma "Phalanx II" <stal>')
    	send_command('bind !r input /ma "Refresh III" <stal>')
	elseif player.main_job:upper() == 'NIN' or player.sub_job:upper() == 'NIN' then
		send_command('bind !b input /ma "utsusemi: ni" <me>') --*** Blink
		--send_command('bind ! input /ma "utsusemi: ichi" <me>') -- Auto Intercept Below
	elseif player.main_job:upper() == 'BLU' then
		send_command('bind !b input /ma "Occulation" <me>') --*** Blink
	else
    	send_command('bind !a input /ma "Aquaveil" <me>')
    	send_command('bind !b input /ma "Blink" <me>')
    	send_command('bind !f input /ma "Flurry" <stal>')
    	send_command('bind !h input /ma "Haste" <stal>')
    	send_command('bind !p input /ma "Phalanx" <me>')
    	send_command('bind !r input /ma "Refresh" <stal>')
    	send_command('bind !s input /ma "Stoneskin" <me>')
	end

	-- work on it
	--[[
	if player.sub_job:upper() == 'SMN' then
		-- i remember /smn to mew was useful
		--send_command('bind F10 input /ma "Cait Sith" <me>')
		--send_command('bind F11 input /ma "Mewing Lullaby" <stnpc>')
		
	elseif player.sub_job:upper() == 'DNC' then		
		--send_command('bind !` input /ja "Reverse Flourish" <me>')
		
		--send_command('bind F7 input /ja "Violent flourish" <t>')
		--send_command('bind ^F7 input /ja "Box step" <stnpc>')
		--send_command('bind @F7 input /ja "Stutter step" <stnpc>')
		
		--send_command('bind F9 input /ja "Animated Flourish" <stnpc>')
		--send_command('bind ^F9 input /ra <stnpc>')
		--send_command('bind @F9 input /ja "Haste Samba" <me>')
		
		--send_command('bind F10 input /ja "Curing Waltz III" <stal>')
		--send_command('bind ^F10 input /ja "Healing Waltz" <stal>')
		--send_command('bind @F10 input /ja "Divine Waltz" <me>')
		
		--send_command('bind F11 input /ja "Curing Waltz II" <stal>')
	end
	--]]

end


-- Function to re-bind Spellcast binds when unloading GearSwap.
function binds_on_unload()
	send_command('unbind @1')
	send_command('unbind @2')
	send_command('unbind @3')
	send_command('unbind @4')
	send_command('unbind @5')
	send_command('unbind @6')
	send_command('unbind @7')
	send_command('unbind @8')
	send_command('unbind @9')
	send_command('unbind @0')

	send_command('unbind ^a')
	send_command('unbind ^b')
	send_command('unbind ^c')
	send_command('unbind ^d')
	send_command('unbind ^e')
	send_command('unbind ^f')
	send_command('unbind ^g')
	send_command('unbind ^h')
	send_command('unbind ^i')
	send_command('unbind ^j')
	send_command('unbind ^k')
	send_command('unbind ^l')
	send_command('unbind ^m')
	send_command('unbind ^n')
	send_command('unbind ^o')
	send_command('unbind ^p')
	send_command('unbind ^q')
	send_command('unbind ^r')
	send_command('unbind ^s')
	send_command('unbind ^t')
	send_command('unbind ^u')
	send_command('unbind ^v')
	send_command('unbind ^w')
	send_command('unbind ^x')
	send_command('unbind ^y')
	send_command('unbind ^z')
	
	send_command('unbind !a')
	send_command('unbind !b')
	send_command('unbind !c')
	send_command('unbind !d')
	send_command('unbind !e')
	send_command('unbind !f')
	send_command('unbind !g')
	send_command('unbind !h')
	send_command('unbind !i')
	send_command('unbind !j')
	send_command('unbind !k')
	send_command('unbind !l')
	send_command('unbind !m')
	send_command('unbind !n')
	send_command('unbind !o')
	send_command('unbind !p')
	send_command('unbind !q')
	send_command('unbind !r')
	send_command('unbind !s')
	send_command('unbind !t')
	send_command('unbind !u')
	send_command('unbind !v')
	send_command('unbind !w')
	send_command('unbind !x')
	send_command('unbind !y')
	send_command('unbind !z')

	send_command('unbind @a')
	send_command('unbind @b')
	send_command('unbind @c')
	send_command('unbind @d')
	send_command('unbind @e')
	send_command('unbind @f')
	send_command('unbind @g')
	send_command('unbind @h')
	send_command('unbind @i')
	send_command('unbind @j')
	send_command('unbind @k')
	send_command('unbind @l')
	send_command('unbind @m')
	send_command('unbind @n')
	send_command('unbind @o')
	send_command('unbind @p')
	send_command('unbind @q')
	send_command('unbind @r')
	send_command('unbind @s')
	send_command('unbind @t')
	send_command('unbind @u')
	send_command('unbind @v')
	send_command('unbind @w')
	send_command('unbind @x')
	send_command('unbind @y')
	send_command('unbind @z')

	send_command('unbind ^`')
    send_command('unbind !`')
	send_command('unbind @`')

	send_command('unbind ^.')
    send_command('unbind !.')
	send_command('unbind @.')
	
	send_command('unbind f7')
	send_command('unbind ^f7')
	send_command('unbind !f7')
	send_command('unbind @f7')
	
	send_command('unbind f8')
	send_command('unbind ^f8')
	send_command('unbind !f8')
	send_command('unbind @f8')
	
	send_command('unbind f9')
	send_command('unbind ^f9')
	send_command('unbind !f9')
	send_command('unbind @f9')
	
	send_command('unbind f10')
	send_command('unbind ^f10')
	send_command('unbind !f10')
	send_command('unbind @f10')
	
	send_command('unbind f11')
	send_command('unbind ^f11')
	send_command('unbind !f11')
	send_command('unbind @f11')
	
	send_command('unbind f12')
	send_command('unbind ^f12')
	send_command('unbind !f12')
	send_command('unbind @f12')
end

-------------------------------------------------------------------------------------------------------------------
-- Global event-handling functions.
-------------------------------------------------------------------------------------------------------------------

-- Global intercept on precast.
function user_precast(spell, action, spellMap, eventArgs)
	-- Auto Echo Drop When Silenced
	if spell.action_type == 'Magic' and buffactive.silence then
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
		add_to_chat(8, '****** ['..spell.name..' CANCELED - Using Echo Drops] ******')
		return
	-- Auto Spell Tier Degradation. Recast
	elseif spell.action_type == 'Magic' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 and spellMap == 'Utsusemi' then
			if spell.en == "Utsusemi: Ni" then
				cancel_spell()
				send_command('input /ma "Utsusemi: Ichi" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			end
		elseif spell_recasts[spell.recast_id] > 0 and spellMap == 'Cure' then
			if spell.en == 'Cure IV' then
				cancel_spell()
				send_command('input /ma "Cure III" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			end
		end
	-- Add Auto Spell Tier Degration. MP cost
	end

	-- Add nonmoonshade earring TP > 2750
	-- Add Fotia Gorget and Belt for repeating fTP. WS
end

-- Global intercept on midcast.
function user_midcast(spell, action, spellMap, eventArgs)
end

-- Global intercept on buff change.
function user_buff_change(buff, gain, eventArgs)
end

-- Global intercept of idle set
function user_customize_idle_set(idleSet)
	if buffactive['Reive Mark'] then
		idleSet = set_combine(idleSet, sets.buff.reive)
	end
	if buffactive.doom then
        idleSet = set_combine(idleSet, sets.buff.doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
 	end
    return idleSet
end

--global intercept of melee set
function user_customize_melee_set(meleeSet)
	if buffactive.doom then
        idleSet = set_combine(idleSet, sets.buff.doom)
		add_to_chat(200,('__\\||//__***** '):color(Notification_color) .. (' Doomed '):color(warning_text) .. ('*****__\\||//__'):color(Notification_color) )
 	end
    return meleeSet
end


-------------------------------------------------------------------------------------------------------------------
-- Global GearInfo
-------------------------------------------------------------------------------------------------------------------

function gearinfo(cmdParams, eventArgs)

    if cmdParams[1] == 'gearinfo' then
		if type(tonumber(cmdParams[2])) == 'number' then
			if tonumber(cmdParams[2]) ~= DW_needed then
				DW_needed = tonumber(cmdParams[2])
				DW = true
			end
		elseif type(cmdParams[2]) == 'string' then
			if cmdParams[2] == 'false' then
				DW_needed = 0
				DW = false
			end
		end
		if type(tonumber(cmdParams[3])) == 'number' then
			if tonumber(cmdParams[3]) ~= Haste then
				Haste = tonumber(cmdParams[3])
			end
		end
		if type(cmdParams[4]) == 'string' then
			if cmdParams[4] == 'true' then
				moving = true
			elseif cmdParams[4] == 'false' then
				moving = false
			end
		end
		if type(tonumber(cmdParams[5])) == 'number' then
			if tonumber(cmdParams[5]) ~= MA_needed then
				MA_needed = tonumber(cmdParams[5])
				H2H = true
			end
		elseif type(cmdParams[5]) == 'string' then
			if cmdParams[5] == 'false' then
				MA_needed = 0
				H2H = false
			end
		end
		if not midaction() then
			job_update()
		end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Test function to use to avoid modifying Mote-SelfCommands.
-------------------------------------------------------------------------------------------------------------------

function user_test(params)
	
end