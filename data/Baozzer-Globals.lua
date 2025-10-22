-------------------------------------------------------------------------------------------------------------------
-- Tables and functions for commonly-referenced gear that job files may need, but
-- doesn't belong in the global Mote-Include file since they'd get clobbered on each
-- update.
-- Creates the 'gear' table for reference in other files.
--
-- Note: Function and table definitions should be added to user, but references to
-- the contained tables via functions (such as for the obi function, below) use only
-- the 'gear' table.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Modify the sets table.  Any gear sets that are added to the sets table need to
-- be defined within this function, because sets isn't available until after the
-- include is complete.  It is called at the end of basic initialization in Mote-Include.
-------------------------------------------------------------------------------------------------------------------

print('Baozzer_Globals.lua Loaded')

hide_window = false
Notification_color = 200
text_color = 160
warning_text = 167

function define_global_sets()
	-- Augmented Universal Gear

	-- Weapons
	Grioavolr_Enh		={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +9','MP+88','Magic Damage +8',}}
	Serenity			={ name="Serenity", augments={'MP+50','Enha.mag. skill +10','"Cure" potency +5%','"Cure" spellcasting time -10%',}}
	
	-- Armor
	Chironic_hands_DT	={ name="Chironic Gloves", augments={'Pet: STR+6','Attack+26','Damage taken-4%','Accuracy+8 Attack+8',}}
	
	Chironic_hands_MAB 	={name="Chironic Gloves", augments={'STR+7','"Mag.Atk.Bns."+30','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}
	Chironic_feet_MAB 	={name="Chironic Slippers", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Haste+1','Mag. Acc.+12','"Mag.Atk.Bns."+15',}}
	
	Chironic_legs_Macc	={ name="Chironic Hose", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','"Fast Cast"+2','MND+7','Mag. Acc.+13',}}
	
	Chironic_hands_Refresh	={ name="Chironic Gloves", augments={'Accuracy+7','Haste+1','"Refresh"+2','Accuracy+19 Attack+19',}}
	
	Chironic_hands_TP	={ name="Chironic Gloves", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','"Mag.Atk.Bns."+11','Quadruple Attack +1',}}
	
	Gende_hands_Cure	={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','"Cure" spellcasting time -4%',}}
	Gende_hands_Song	={ name="Gendewitha Gages", augments={'Phys. dmg. taken -3%','Song spellcasting time -4%',}}
    Gende_legs			={ name="Gende. Spats +1", augments={'Phys. dmg. taken -3%','Song spellcasting time -4%',}}
    Gende_feet			={ name="Gende. Galosh. +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','"Cure" potency +4%',}}
	
	Leyline_hands		={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}
	
    Lustratio_legs		={ name="Lustratio Subligar", augments={'Accuracy+15','DEX+5','Crit. hit rate+2%',}}
    Lustratio_feet		={ name="Lustratio Leggings", augments={'HP+50','STR+10','DEX+10',}}
	
	Mediums_feet		={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}}
	
	Telch_head_Enh		={ name="Telchine Cap", augments={'Mag. Evasion+21','"Fast Cast"+2','Enh. Mag. eff. dur. +8',}}
	Telch_body_Enh		={ name="Telchine Chas.", augments={'Mag. Evasion+23','"Fast Cast"+5','Enh. Mag. eff. dur. +8',}}
    Telch_hands_Enh		={ name="Telchine Gloves", augments={'Mag. Evasion+25','"Cure" potency +3%','Enh. Mag. eff. dur. +10',}}
	Telch_legs_Enh		={ name="Telchine Braconi", augments={'Mag. Evasion+24','"Conserve MP"+3','Enh. Mag. eff. dur. +10',}}
	Telch_Feet_Enh		={ name="Telchine Pigaches", augments={'Mag. Evasion+25','"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
	
	Vanya_head			={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}
	Vanya_body			={ name="Vanya Robe", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}}
	Vanya_feet			={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
	
	-- Accesories
	Dark_Ring			={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -5%',}}
end

-------------------------------------------------------------------------------------------------------------------
-- Functions to set user-specified binds, generally on load and unload.
-- Kept separate from the main include so as to not get clobbered when the main is updated.
-------------------------------------------------------------------------------------------------------------------

-- Function to bind GearSwap binds when loading a GS script.
function global_on_load()
	-- ctrl = ^
	-- alt = !
	-- windows key = @
	
-------------------------------------------------------------------------------------------------------------------	
	-- send_command('bind f9 gs c cycle OffenseMode')
	-- send_command('bind ^f9 gs c cycle DefenseMode')
	-- send_command('bind !f9 gs c cycle WeaponskillMode')
	-- send_command('bind f10 gs c activate PhysicalDefense')
	-- send_command('bind ^f10 gs c cycle PhysicalDefenseMode')
	-- send_command('bind !f10 gs c toggle kiting')
	-- send_command('bind f11 gs c activate MagicalDefense')
	-- send_command('bind ^f11 gs c cycle CastingMode')
	-- send_command('bind !f11 gs c set CastingMode Dire')
	-- send_command('bind f12 gs c update user')
	-- send_command('bind ^f12 gs c cycle IdleMode')
	-- send_command('bind !f12 gs c reset defense')
	-- send_command('bind [ gs c toggle PhysicalDefense')
	-- send_command('bind ] gs c toggle MagicalDefense')
	
	-- send_command('bind ^- gs c toggle selectnpctargets')
	-- send_command('bind ^= gs c cycle pctargetmode')
-------------------------------------------------------------------------------------------------------------------	

-------------------------------------------------------------------------------------------------------------------
--  Global Mode Keybinds
-------------------------------------------------------------------------------------------------------------------
	-- @ doesnt work with f keys
	
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
	-- Macc Array
	send_command('bind ^] gs c cycle CastingMode')
	-- Idle Set
	send_command('bind !] gs c cycle IdleMode')
	
	-- Locks CP Back
	send_command('bind @] gs c cycle CP')


	--send_command('bind ^ gs c cycle DefenseMode')

-------------------------------------------------------------------------------------------------------------------
--  Global Keybinds
-------------------------------------------------------------------------------------------------------------------

	-- work on it
	if player.sub_job:upper() == 'SMN' then
		
		--send_command('bind F10 input /ma "Cait Sith" <me>')
		--send_command('bind F11 input /ma "Mewing Lullaby" <stnpc>')
		
	elseif player.sub_job:upper() == 'DNC' then		
		--send_command('bind ^` input /ja "spectral jig" <me>')
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
	
	--elseif player.sub_job:upper() == 'NIN' then	
		--send_command('bind ^` input /ma "utsusemi: ichi" <me>')
		--send_command('bind !` input /ma "utsusemi: ni" <me>')
		
	end
end

	-- Cure Map
	if player.main_job:upper() == 'WHM' then
   		send_command('bind @1 input /ma "Cure V" <stal>')
    	send_command('bind @2 input /ma "Cure III" <stal>')
    	send_command('bind @3 input /ma "Curaga III" <stal>')
	else
   		send_command('bind @1 input /ma "Cure IV" <stal>')
    	send_command('bind @2 input /ma "Cure III" <stal>')
    	send_command('bind @3 input /ma "Curaga II" <stal>')
	end

	-- Default Status Healing HotKeys
    send_command('bind !b input /ma "Blindna" <stal>')
    send_command('bind !c input /ma "Cursna" <stal>')
    send_command('bind !e input /ma "Erase" <stal>')
    --send_command('bind ! input /ma "Esuna" <me>')
    send_command('bind !p input /ma "Paralyna" <stal>')
    --send_command('bind ! input /ma "Poisona" <stal>')
    --send_command('bind ! input /ma "Sacrifice" <stal>')
    --send_command('bind ! input /ma "Silena" <stal>')
    send_command('bind !s input /ma "Stona" <stal>')
    send_command('bind !v input /ma "Viruna" <stal>')

    

    -- Default Status Enfeebling HotKeys
	if player.main_job:upper() == 'RDM' then
    	send_command('bind ^a input /ma "Addle II" <t>')
    	--send_command('bind ^ input /ma "Blind II" <t>')
    	--send_command('bind ^ input /ma "Dia III" <t>')
		--send_command('bind ^ input /ma "Distract III" <t>')
    	send_command('bind ^f input /ma "Frazzle III" <t>')
    	send_command('bind ^g input /ma "Gravity II" <t>')
    	send_command('bind ^p input /ma "Paralyze II" <t>')
	else
    	send_command('bind ^a input /ma "Addle" <t>')
    	send_command('bind ^b input /ma "Bind" <stnpc>')
    	--send_command('bind ^ input /ma "Blind" <t>')
    	--send_command('bind ^ input /ma "Dia II" <t>')
		--send_command('bind ^ input /ma "Distract" <t>')
    	send_command('bind ^f input /ma "Frazzle" <t>')
    	send_command('bind ^g input /ma "Gravity" <t>')
    	send_command('bind ^p input /ma "Paralyze" <t>')
    	--send_command('bind ^ input /ma "Silence" <t>')
    	send_command('bind ^s input /ma "Sleep II" <stnpc>')
    	--send_command('bind ^ input /ma "Slow" <t>')
	end

	if player.main_job:upper() == 'BRD' then
    	send_command('bind ^d input /ma "Magic Finale" <t>')
    	send_command('bind ^s input /ma "Horde Lullaby II" <stnpc>')
	else
    	send_command('bind ^d input /ma "Dispel" <t>')
    	send_command('bind ^s input /ma "Sleep II" <stnpc>')
	end
	
	-- Default Enhancing HotKeys	
	if player.main_job:upper() == 'RDM' then
    	send_command('bind !b input /ma "Blink" <me>')
    	send_command('bind !p input /ma "Phalanx II" <stal>')
    	send_command('bind !h input /ma "Haste II" <stal>')
    	send_command('bind !r input /ma "Refresh II" <stal>')
	else
    	send_command('bind !a input /ma "Aquaveil" <me>')
    	send_command('bind !b input /ma "Blink" <me>')
    	send_command('bind !p input /ma "Phalanx" <me>')
    	send_command('bind !s input /ma "Stoneskin" <me>')
    	send_command('bind !h input /ma "Haste" <stal>')
    	send_command('bind !r input /ma "Refresh" <stal>')
	end

    -- Default Item HotKeys
    send_command('bind @a input /item "Antidote" <me>')
    send_command('bind @e input /item "Echo Drops" <me>')
    --send_command('bind @numpad9 input /item "Eye Drops" <me>')
    send_command('bind @h input /item "Holy Water" <me>')
    send_command('bind @r input /item "Remedy" <me>')
    send_command('bind @p input /item "Panacea" <me>')
    send_command('bind @v input /item "Vile Elixir +1" <me>')
    send_command('bind @c input /item "Vile Elixir" <me>')

-- Function to re-bind Spellcast binds when unloading GearSwap.
function binds_on_unload()

	send_command('unbind ^`')
    send_command('unbind !`')
	send_command('unbind @`')
	
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
		if spell.type == 'WeaponSkill' then
			-- Abort WS if TP < 1000
			if player.tp < 950 then
				add_to_chat(123,('[Abort WS: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> TP: '..player.tp..' / 3000'):color(text_color) .. (']'):color(warning_text))
				eventArgs.cancel = true
				return
			end
		elseif spell.action_type == 'Magic' then
            local spell_recasts = windower.ffxi.get_spell_recasts()
            if spell_recasts[spell.recast_id] > 1.5 then
                add_to_chat(123,('[Abort Spell: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> Waiting on recast ['..math.floor(spell_recasts[spell.recast_id] / 60)..' s]'):color(text_color) .. (']'):color(warning_text))
                eventArgs.cancel = true
                return
            end
        -- elseif spell.action_type == 'Ability' then
            -- local abil_recasts = windower.ffxi.get_ability_recasts()
            -- if abil_recasts[spell.recast_id] > 0 then
                -- add_to_chat(123,('[Abort Ability: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> Waiting on recast ['..math.floor(abil_recasts[spell.recast_id] / 60)..' s]'):color(text_color) .. (']'):color(warning_text))
                -- eventArgs.cancel = true
                -- return
            -- end
		end
		
	-- else
		-- add_to_chat(123,('[Abort Action: '):color(warning_text) .. ('\"' .. spell.name .. '\"'):color(Notification_color) .. (' -> Action in progress'):color(text_color) .. (']'):color(warning_text))
		-- eventArgs.cancel = true
	-- end
	cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
	refine_waltz(spell, action, spellMap, eventArgs)
end

-- Global intercept on midcast.
function user_midcast(spell, action, spellMap, eventArgs)
	-- Default base equipment layer of fast recast.
	if spell.action_type == 'Magic' and sets.midcast and sets.midcast.FastRecast then
		equip(sets.midcast.FastRecast)
	end
end

function user_buff_change(buff, gain, eventArgs)
	-- Create a timer when we gain weakness.  Remove it when weakness is gone.
	if buff:lower() == 'weakness' then
		if gain then
			send_command('timers create "Weakness" 300 up abilities/00255.png')
		else
			send_command('timers delete "Weakness"')
		end
	end
end

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