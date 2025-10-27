-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
--[[
    Custom commands:
    
    ExtraSongsMode may take one of these values: None, Dummy
		send_command('bind f12 gs c cycle ExtraSongsMode')
    
    You can set these via the standard 'set' and 'cycle' self-commands.  EG:
    gs c cycle ExtraSongsMode
    gs c set ExtraSongsMode Dummy
    
    The Dummy state will equip the extra song instrument and ensure non-duration gear is equipped.


	SongPotencyMode may take one of these values: Empy_Boost, Duration
		send_command('bind f11 gs c cycle SongPotencyMode')

    The Duration state will equip max duration+ equipment. This is default.
	The Empy_Boost state will equip full Empy_gear for stat+ bonus when duration isn't needed. Short Fights.
    
    
    Simple macro to cast a dummy Daurdabla song:
    /console gs c set ExtraSongsMode Dummy
    /ma "Shining Fantasia" <me>
    
--]]

-- Initialization function for this job file.
include('Make-Settings.lua')
include('organizer-lib')

function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Seb-Include.lua')
	
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy'}
	state.SongPotencyMode = M{['description']='Song Potency', 'Empy_Boost', 'Duration'}
	state.SongPotencyMode:set('Duration')

    state.Buff['Pianissimo'] = buffactive['pianissimo'] or false
	state.Buff['Troubadour'] = buffactive['troubadour'] or false
	state.Buff['Nightingale'] = buffactive['nightingale'] or false
	state.Pianissimo	    = M(false, 'Pianissimo All Songs')
	
	-- Additional Job Specifc local binds
	send_command('bind f9 input /ma "Chocobo Mazurka <me>')
	send_command('bind f10 gs c toggle Pianissimo')
	send_command('bind f11 gs c cycle SongPotencyMode')
	send_command('bind f12 gs c cycle ExtraSongsMode')
	
	--Custom Mapping
	song_buffsSpellMap = S{'Minuet', 'Minne', 'March', 'Madrigal', 'Prelude', 'Mambo', 'Mazurka', 'Etude', 'Ballad', 'Paeon', 'Carol'}
	song_buffsSpellName = S{"Honor March", "Fowl Aubade", "Herb Pastoral", "Shining Fantasia", "Scop's Operetta", "Puppet's Operetta", "Gold Capriccio", "Warding Round", "Goblin Gavotte", "Goddess's Hymnus", "Maiden's Virelai", "Sentinel's Scherzo"}
	song_sleepSpellName  = S{'Foe Lullaby', 'Foe Lullaby II',}
	song_sleepAoESpellName = S{'Horde Lullaby', 'Horde Lullaby II'}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.OffenseMode:options('None', 'Normal', 'Acc')
    state.HybridMode:options('Normal', 'DT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'DT', 'MEva')
	state.IdleMode:set('MEva')

	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	
	state.PhysicalDefense	= M(false, 'PhysicalDefense')
	state.MagicalDefense    = M(false, 'MagicalDefense')
	state.CP  				= M(false, 'CP')
	state.Auto_Kite			= M(false, 'Auto_Kite')

	DW_needed = 0
	DW = false
	MA_needed = 0
	H2H = false
	moving = false
	
	send_command('gi update')
	send_command('gi ugs true')
    update_combat_form()

	Ring_lock = S{"Resolution Ring", "Emperor Band", "Capacity Ring", "Echad Ring", "Trizek Ring", "Facility Ring", "Caliber Ring"}
	Tele_Ring = S{"Warp Ring", "Dim. Ring (Dem)", "Dim. Ring (Holla)", "Dim. Ring (Mea)"}
	Ear_lock = S{"Reraise Earring"}
	Back_lock  = S{"Nexus Cape"}
	
	Ring_slot_locked_1 = false
	Ring_slot_locked_2 = false
	unlock_em = false

	lockstyleset = 1 
	set_lockstyle()
	select_default_macro_book()

	old_inform = {}
	settings = load_settings()
	text_box = texts.new(settings.display)
	text_box:register_event('reload', initialize)
	
	initialize(text_box)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if spell.type == 'BardSong' then
			check_target(spell, action, spellMap, eventArgs)
			if state.Buff['Troubadour'] and state.Buff['Nightingale'] then
				get_casting_style(spell, action, spellMap, eventArgs)
				eventArgs.handled = true
			end
		end
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if spell_recasts[spell.recast_id] > 0 and spell.en == "Horde Lullaby II" then
			cancel_spell()
			send_command('input /ma "Horde Lullaby" <t>')
			eventArgs.cancel = true
			return
		elseif spell_recasts[spell.recast_id] > 0 and spell.en == "Foe Lullaby II" then
			cancel_spell()
			send_command('input /ma "Foe Lullaby" <t>')
			eventArgs.cancel = true
			return
		end
	end
end

function job_post_precast(spell, action, spellMap, eventArgs)
	if state.ExtraSongsMode.value == 'Dummy' then
		equip(sets.precast.FC.Daurdabla)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
		if spell.type == 'BardSong' then
			get_casting_style(spell, action, spellMap, eventArgs)
			eventArgs.handled = true
		elseif spell.action_type == 'Magic' then
			if spellMap == 'Cure' and spell.target.type == 'SELF' then
				equip(sets.midcast.CureSelf)
				eventArgs.handled = true
			end
		end
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		 if spellMap == 'Cure' or spellMap == 'Curaga' then
            if world.weather_element == 'Light' or windower.ffxi.get_info().day == 'Lightsday' then
                equip(sets.midcast['Cure day / weather'])
            end
		end
	end
	if state.CP.value == true then
		equip(sets.CP)
	end
end

-- Set eventArgs.handled to true if we don't want automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if state.Buff[spell.name] == false and not spell.interrupted then
		state.Buff[spell.name] = true
    end
	if spell.english:contains('Lullaby') and not spell.interrupted then
        get_lullaby_duration(spell)
    end
	if spell.type == 'BardSong' and not spell.interrupted then
		if state.Buff['Pianissimo'] == true then
			state.Buff['Pianissimo'] = false
		end
		state.ExtraSongsMode:reset()
	end
	
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

--[[
function job_buff_change(buff, gain)
	if state.Buff[buff] ~= nil then
		state.Buff[buff] = gain
		-- if not midaction() then
			-- handle_equipping_gear(player.status)
		-- end
	end
	if buff == 'Goldsmithing Imagery' and gain then
		 send_command('timers create "'..buff..'" 480 down abilities/00121.png')
	end
end
--]]

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	
	lockouts()

	if state.DefenseMode.current == 'None' then 
		if player.mpp < 51 then
			idleSet = set_combine(idleSet, sets.latent_refresh)
		end
	end
-- I seperated these so these sets are always on
	if state.CP.value == true then
		idleSet = set_combine(idleSet, sets.CP)
	end
	if state.Auto_Kite.value == true then
-- I added Councilor's Garb Swap for when in Adoulin
		if world.area:endswith('Adoulin') then
			idleSet = set_combine(idleSet, sets.Adoulin)
		else 
			idleSet = set_combine(idleSet, sets.Kiting)
		end
	end	
    return idleSet
end

function customize_melee_set(meleeSet)
	
	lockouts()

-- I turned this off so these sets are always on
	--if state.DefenseMode.current == 'None' then 
		if state.Auto_Kite.value == true then
			meleeSet = set_combine(meleeSet, sets.Kiting)
		end
		if state.CP.value == true then
			meleeSet = set_combine(meleeSet, sets.CP)
		end
	--end
    return meleeSet
end

-- Gear Lock
function lockouts()

	if Tele_Ring:contains(player.equipment.ring1) and unlock_em == false then
		if Ring_slot_locked_1 == false then
			add_to_chat(200,('[Tele Ring Equipped: '):color(Notification_color) .. ('-> Locking \"'..player.equipment.ring1 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
		end
		Ring_slot_locked_1 = true
		disable('ring1')
	end
	if Tele_Ring:contains(player.equipment.ring2) and unlock_em == false then
		if Ring_slot_locked_2 == false then
			add_to_chat(200,('[Tele Ring Equipped: '):color(Notification_color) .. ('-> Locking \"'..player.equipment.ring2 .. '\"'):color(text_color) .. (']'):color(Notification_color) )
		end
		Ring_slot_locked_2 = true
		disable('ring2')
	end
	
	if (Tele_Ring:contains(player.equipment.ring1) or Tele_Ring:contains(player.equipment.ring2)) and unlock_em then
		enable('ring1')
		enable('ring2')
	elseif not (Tele_Ring:contains(player.equipment.ring1) or Tele_Ring:contains(player.equipment.ring2)) and unlock_em then 
		unlock_em = false
		Ring_slot_locked_1 = false
		Ring_slot_locked_2 = false
		add_to_chat(200,('[Zoned: '):color(Notification_color) .. ('-> Un-locking Tele/Warp Rings '):color(text_color) .. (']'):color(Notification_color) )
	elseif not Tele_Ring:contains(player.equipment.ring1) and Ring_slot_locked_1 and unlock_em == false then 
		Ring_slot_locked_1 = false
		enable('ring1')
		add_to_chat(200,('[Tele Ring Removed manually: '):color(Notification_color) .. ('-> Un-locking Slot 1'):color(text_color) .. (']'):color(Notification_color) )
	elseif not Tele_Ring:contains(player.equipment.ring2) and Ring_slot_locked_2 and unlock_em == false then 
		Ring_slot_locked_2 = false
		enable('ring2')
		add_to_chat(200,('[Tele Ring Removed manually: '):color(Notification_color) .. ('-> Un-locking Slot 2'):color(text_color) .. (']'):color(Notification_color) )
	end
	--------------------------------
	-- Ring locks for exp ring use
	
	if Ring_lock:contains(player.equipment.ring1) and Ring_slot_locked_1 == false then
		disable('ring1')
	elseif not Ring_lock:contains(player.equipment.ring1) and Ring_slot_locked_1 == false then
		enable('ring1')
	end
	
	if Ring_lock:contains(player.equipment.ring2) and Ring_slot_locked_2 == false then
		disable('ring2')
	elseif not Ring_lock:contains(player.equipment.ring2) and Ring_slot_locked_2 == false then
		enable('ring2')
	end
	
	---------------------------------
	-- earring locks
	
	if Ear_lock:contains(player.equipment.ear1) then
		disable('Ear1')
	elseif not Ear_lock:contains(player.equipment.ear1) then
		enable('Ear1')
	end
	if Ear_lock:contains(player.equipment.ear2) then
		disable('Ear2')
	elseif not Ear_lock:contains(player.equipment.ear2) then
		enable('Ear2')
	end
	
	---------------------------------
	-- back locks
	
	if Back_lock:contains(player.equipment.back) then
		disable('Back')
	elseif not Back_lock:contains(player.equipment.back) then
		enable('Back')
	end
	if Back_lock:contains(player.equipment.back) then
		disable('Back')
	elseif not Back_lock:contains(player.equipment.back) then
		enable('Back')
	end
	
end

function reset_rings()
	if Ring_slot_locked_1 or Ring_slot_locked_2 then
		unlock_em = true
	end
end

windower.raw_register_event('zone change',reset_rings)

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
	handle_equipping_gear(player.status)
end

function check_moving()
	if 
--I disabled this so sets are always on
	--state.DefenseMode.value == 'None' and state.Kiting.value == false then
	state.Kiting.value == false then
		if state.Auto_Kite.value == false and moving then
			state.Auto_Kite:set(true)
		elseif state.Auto_Kite.value == true and moving == false then
			state.Auto_Kite:set(false)
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function get_lullaby_duration(spell)
    local self = windower.ffxi.get_player()

    local troubadour = false
    local clarioncall = false
    local soulvoice = false
    local marcato = false

    for i,v in pairs(self.buffs) do
        if v == 348 then troubadour = true end
        if v == 499 then clarioncall = true end
        if v == 52 then soulvoice = true end
        if v == 231 then marcato = true end
    end

    local mult = 1

    if player.equipment.range == 'Daurdabla' then mult = mult + 0.3 end -- change to 0.25 with 90 Daur
    if player.equipment.range == "Gjallarhorn" then mult = mult + 0.4 end -- change to 0.3 with 95 Gjall
    if player.equipment.range == "Marsyas" then mult = mult + 0.5 end

    if player.equipment.main == "Carnwenhan" then mult = mult + 0.5 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
    if player.equipment.main == "Legato Dagger" then mult = mult + 0.05 end
    if player.equipment.main == "Kali" then mult = mult + 0.05 end
    if player.equipment.sub == "Kali" then mult = mult + 0.05 end
    if player.equipment.sub == "Legato Dagger" then mult = mult + 0.05 end
    if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
    if player.equipment.neck == "Mnbw. Whistle" then mult = mult + 0.2 end
    if player.equipment.neck == "Mnbw. Whistle +1" then mult = mult + 0.3 end
    if player.equipment.body == "Fili Hongreline +1" then mult = mult + 0.12 end
    if player.equipment.legs == "Inyanga Shalwar +1" then mult = mult + 0.15 end
    if player.equipment.legs == "Inyanga Shalwar +2" then mult = mult + 0.17 end
    if player.equipment.feet == "Brioso Slippers" then mult = mult + 0.1 end
    if player.equipment.feet == "Brioso Slippers +1" then mult = mult + 0.11 end
    if player.equipment.feet == "Brioso Slippers +2" then mult = mult + 0.13 end
    if player.equipment.feet == "Brioso Slippers +3" then mult = mult + 0.15 end
    if player.equipment.hands == 'Brioso Cuffs +1' then mult = mult + 0.1 end
    if player.equipment.hands == 'Brioso Cuffs +2' then mult = mult + 0.1 end
    if player.equipment.hands == 'Brioso Cuffs +3' then mult = mult + 0.2 end

    --JP Duration Gift
    if self.job_points.brd.jp_spent >= 1200 then
        mult = mult + 0.05
    end

    if troubadour then
        mult = mult * 2
    end

    if spell.en == "Foe Lullaby II" or spell.en == "Horde Lullaby II" then
        base = 60
    elseif spell.en == "Foe Lullaby" or spell.en == "Horde Lullaby" then
        base = 30
    end

    totalDuration = math.floor(mult * base)

    -- Job Points Buff
    totalDuration = totalDuration + self.job_points.brd.lullaby_duration
    if troubadour then
        totalDuration = totalDuration + self.job_points.brd.lullaby_duration
        -- adding it a second time if Troubadour up
    end

    if clarioncall then
        if troubadour then
            totalDuration = totalDuration + (self.job_points.brd.clarion_call_effect * 2 * 2)
            -- Clarion Call gives 2 seconds per Job Point upgrade.  * 2 again for Troubadour
        else
            totalDuration = totalDuration + (self.job_points.brd.clarion_call_effect * 2)
            -- Clarion Call gives 2 seconds per Job Point upgrade.
        end
    end

    if marcato and not soulvoice then
        totalDuration = totalDuration + self.job_points.brd.marcato_effect
    end

    -- Create the custom timer
    if spell.english == "Foe Lullaby II" or spell.english == "Horde Lullaby II" then
        send_command('@timers c "Lullaby II ['..spell.target.name..']" ' ..totalDuration.. ' down spells/00377.png')
    elseif spell.english == "Foe Lullaby" or spell.english == "Horde Lullaby" then
        send_command('@timers c "Lullaby ['..spell.target.name..']" ' ..totalDuration.. ' down spells/00376.png')
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

function job_handle_equipping_gear(playerStatus, eventArgs)
	update_combat_form()
	check_moving()
	update()
end

-- Handle notifications of general user state change.
function job_state_change(field, newValue, oldValue)

	if field == "PhysicalDefense" then
		if state.PhysicalDefense.value == true then
			state.DefenseMode.current = 'Physical'
			state.DefenseMode:set('Physical')
			state.MagicalDefense = M(false)
		end
	elseif field == "MagicalDefense" then
		if state.MagicalDefense.value == true then
			state.DefenseMode.current = 'Magical'
			state.DefenseMode:set('Magical')
			state.PhysicalDefense = M(false)
		end
	end
	if field == "MagicalDefense" or field == "PhysicalDefense" then
		if state.PhysicalDefense.value == false and state.MagicalDefense.value == false then
			state.DefenseMode.current = 'None'
			state.DefenseMode:set('None')
		end
    end
	
    if field == 'Offense Mode' then
        if newValue ~= 'None' then
			--if state.CombatForm == 'DW' then
-- I added this rule it works better.
			if (player.sub_job == 'NIN' and player.sub_job_level > 9) or (player.sub_job == 'DNC' and player.sub_job_level > 19) then
				equip(sets.Locked_Main_Sub_DW)
			else
				equip(sets.Locked_Main_Sub)
			end
            disable('main','sub')
        else
            enable('main','sub')
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
	
    local msg = ('   [Melee'):color(Notification_color)
    
    if state.CombatForm.has_value then
        msg = msg .. (' (' .. state.CombatForm.value .. ')'):color(text_color)
    end
    
	if #classes.CustomMeleeGroups > 0 then
        for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then
					msg = msg .. (' ('):color(Notification_color)
				end
				msg = msg .. (classes.CustomMeleeGroups[i]):color(Notification_color)
				if i < #classes.CustomMeleeGroups then
					msg = msg .. (' + '):color(Notification_color)
				end
				if i == #classes.CustomMeleeGroups then
					msg = msg .. (')'):color(Notification_color)
				end
			end
        end
    end
	
    msg = msg .. (': '):color(Notification_color)
    
	if state.DefenseMode.value == 'None' then
		msg = msg .. (state.OffenseMode.value):color(text_color)
	else
		msg = msg ..('LOCKED: ' ):color(warning_text) .. (state.OffenseMode.value):color(text_color)
	end

	if state.HybridMode.value ~= 'Normal' then
        msg = msg .. (' + '):color(text_color) .. (state.HybridMode.value):color(warning_text)
    end
	
	msg = msg .. ('] [Casting: '):color(Notification_color) .. (state.CastingMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	msg = msg .. (' [Idle: '):color(Notification_color) .. (state.IdleMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	msg = msg .. (' [Extra Length: '):color(Notification_color) .. (state.SongPotencyMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	msg = msg .. (' [Dummy Song: '):color(Notification_color) .. (state.ExtraSongsMode.value):color(text_color) .. ('] '):color(Notification_color)
	
	if state.Pianissimo.value == true then
		msg = msg .. ('[Pianissimo all Songs'):color(Notification_color) .. ('] '):color(Notification_color)
	end
    if state.Kiting.value == true then
        msg = msg .. ('[Kiting'):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.CP.value == true then
        msg = msg .. ('[CP cape'):color(Notification_color) .. ('] '):color(Notification_color)
    end
	
	if state.DefenseMode.value ~= 'None' then
        msg = msg  .. ('\n')..('['):color(warning_text) .. ('Defense: '):color(warning_text) .. (state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'):color(text_color)..('] '):color(warning_text)
    end
	
	add_to_chat(122, msg)

    eventArgs.handled = true
	save_settings()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function check_target(spell, action, spellMap, eventArgs)
	if not (buffactive['Amnesia'] or buffactive['impairment']) and song_buffsSpellMap:contains(spellMap) or song_buffsSpellName:contains(spell.name) then 
		if state.Pianissimo.value == true and (((spell.target.type == 'PLAYER' or spell.target.type == 'SELF') and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) then
			if not state.Buff['Pianissimo'] then
				cancel_spell()
				send_command('Pianissimo')
				send_command:schedule(1,'input /ma "'..spell.name.. '" ' .. spell.target.name)
				eventArgs.cancel = true
				return
			end
		else
			if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) then
				if not state.Buff['Pianissimo'] then
					cancel_spell()
					send_command('Pianissimo')
					send_command:schedule(2,'input /ma "'..spell.name.. '" ' .. spell.target.name)
					eventArgs.cancel = true
					return
				end
			end
		end
	elseif (buffactive['Amnesia'] or buffactive['impairment']) then 
		if spell.target.type == 'PLAYER' then
			cancel_spell()
			send_command('"'..spell.name..'" <me>')
			add_to_chat(200,'***** Job Abilities not available. Redirecting spell to SELF *****')
			eventArgs.cancel = true
			return
		end
	end
end

function get_casting_style(spell, action, spellMap, eventArgs)
	local equipSet = sets.midcast
	
	--classes.SkipSkillCheck = classes.NoSkillSpells:contains(spell.english)
    -- Handle automatic selection of set based on spell class/name/map/skill/type.
    equipSet = select_specific_set(equipSet, spell, spellMap)
	if spell.type == 'BardSong' then
		if set.contains(spell.targets, 'Enemy') then
			if song_sleepSpellName :contains(spell.name) then
				spellMap = "F-Lullaby" 
			elseif song_sleepAoESpellName:contains(spell.name) then
				spellMap = "H-Lullaby" 
			end
			equipSet = equipSet['Debuff']
			equipSet = select_specific_set(equipSet, spell, spellMap)
			
		else
			if state.ExtraSongsMode.value == 'None' then
				if state.SongPotencyMode.value == 'Empy_Boost' then
					if equipSet['Buff'] then 
						equipSet = equipSet['Buff']
					end
				elseif state.SongPotencyMode.value == 'Duration' then 
					if equipSet['Extra Length'] then 
						equipSet = equipSet['Extra Length']
					elseif equipSet['Buff']['Extra Length'] then 
						equipSet = equipSet['Buff']['Extra Length']
					end
				end
				equipSet = select_specific_set(equipSet, spell, spellMap)
			elseif state.ExtraSongsMode.value == 'Dummy' then
				if equipSet['Dummy'] then 
					equipSet = equipSet['Dummy']
				end
			end
		end
	end

	if equipSet[state.CastingMode.current] then
		equipSet = equipSet[state.CastingMode.current]
	end
	
	equip(equipSet)
end

-- Examine equipment to determine what our current TP weapon is.
function update_combat_form()
	--if DW == true then
-- I added this. This rule works better for DW
    if (player.sub_job == 'NIN' and player.sub_job_level > 9) or (player.sub_job == 'DNC' and player.sub_job_level > 19) then
		state.CombatForm:set('DW')
	elseif H2H == true then
		state.CombatForm:set('H2H')
	else
		state.CombatForm:reset()
	end
end

function job_self_command(cmdParams, eventArgs)

   gearinfo(cmdParams, eventArgs)
   
   if cmdParams[1] == 'hide' then
		if hide_window then
			hide_window = false
		else
			hide_window = true
		end
		old_inform.hide_window = hide_window
	end

end

initialize = function(text, t)
    local properties = L{}
	
    if state.OffenseMode then
        properties:append('${OffenseMode|0}')
    end
	if state.HybridMode then
        properties:append('${HybridMode}')
    end
	if state.CastingMode then
        properties:append('${CastingMode|0}')
    end
	if state.IdleMode then
        properties:append('${IdleMode}')
    end
	if state.SongPotencyMode then
       properties:append('${SongPotencyMode}')
    end
	if state.ExtraSongsMode then
        properties:append('${ExtraSongsMode}')
    end
	if state.Pianissimo then
        properties:append('${Pianissimo}')
    end
	if state.Kiting then
        properties:append('${Kiting}')
    end
	if state.CP then
        properties:append('${CP}')
    end
	if state.DefenseMode then
        properties:append('${DefenseMode}')
    end
	properties:append('${is_Moving}')
    text:clear()
    text:append(properties:concat(''))
	update()
end

function update()
	
	local white = '\\cs(220,220,220)'
	local blue = '\\cs(150,150,235)'
	local red = '\\cs(255,0,0)'
	local orange = '\\cs(232,138,13)'
	local yellow = '\\cs(220,220,0)'
	local green = '\\cs(0,225,0)'
	local purple = '\\cs(213,43,196)'
	
	if not windower.ffxi.get_info().logged_in or not windower.ffxi.get_player() or zoning_bool or hide_window then
        text_box:hide()
        return
    end

	local inform = {}
	local msg = ' [Melee'
	if state.CombatForm.current == 'DW' then
		msg = msg .. ' (DW)'
	end
	if #classes.CustomMeleeGroups > 0 then
		for i = 1,#classes.CustomMeleeGroups do
			if classes.CustomMeleeGroups[i] ~= 'None' then
				if i == 1 then msg = msg .. ' (' end
				msg = msg .. classes.CustomMeleeGroups[i]
				if i < #classes.CustomMeleeGroups then msg = msg .. ' + ' end
				if i == #classes.CustomMeleeGroups then msg = msg ..')' end
			end
		end
	end
	
	msg = msg .. ': '
	
	if state.DefenseMode.value == 'None' then
		if state.HybridMode.value ~= 'Normal' then
			msg = blue .. msg .. white .. state.OffenseMode.value .. blue .. ' + ' .. yellow .. state.HybridMode.value .. blue .. '] '
		else
			msg = blue .. msg .. white .. state.OffenseMode.value .. blue .. '] '
		end
	else
		if state.HybridMode.value ~= 'Normal' then
			msg = red .. msg .. state.OffenseMode.value .. ' + ' .. state.HybridMode.value .. '] '
		else
			msg = red .. msg .. state.OffenseMode.value .. '] '
		end
	end
	inform.OffenseMode = msg .. '\\cr'
			
	inform.CastingMode = (blue .. ('\n [Casting: '.. white .. state.CastingMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	
	if state.SongPotencyMode.value ~= 'None' then
		inform.SongPotencyMode = (purple .. ('\n [Singing: '.. white .. state.SongPotencyMode.value:lpad(' ', 2) .. purple .. '] ' )) .. '\\cr'
	else
		inform.SongPotencyMode = ('')
	end
	
	if state.ExtraSongsMode.value ~= 'None' then
		inform.ExtraSongsMode = (red .. ('\n [Extra Song: '.. yellow .. state.ExtraSongsMode.value:lpad(' ', 2) .. red .. '] ' )) .. '\\cr'
	else
		inform.ExtraSongsMode = ('')
	end
	
	if state.Pianissimo.value == true then
		inform.Pianissimo = (purple .. ('\n [Pianissimo] ' )) .. '\\cr'
	elseif state.Pianissimo.value == false then
		inform.Pianissimo = ('')
	end
	
	if state.DefenseMode.value == 'None' then
		inform.IdleMode = (blue .. ('\n [Idle: '.. white .. state.IdleMode.value:lpad(' ', 2) .. blue .. '] ' )) .. '\\cr'
	else
		inform.IdleMode = (red .. ('\n [Idle: '..state.IdleMode.value:lpad(' ', 2) .. '] ' )) .. '\\cr'
	end
		
	if state.DefenseMode.value == 'None' then
		if state.Kiting.value == true and state.CP.value == true then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = (orange .. ('[CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == true and state.CP.value == false then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('')
		elseif state.Kiting.value == false and state.CP.value == true then
			inform.Kiting = ('')
			inform.CP = (orange .. ('\n [CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == false and state.CP.value == false then
			inform.Kiting = ('')
			inform.CP = ('')
		end
	else
		if state.Kiting.value == true and state.CP.value == true then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = (red .. ('[CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == true and state.CP.value == false then
			inform.Kiting = (yellow .. ('\n [Kiting] ' )) .. '\\cr'
			inform.CP = ('')
		elseif state.Kiting.value == false and state.CP.value == true then
			inform.Kiting = ('')
			inform.CP = (red .. ('\n [CP Cape] ' )) .. '\\cr'
		elseif state.Kiting.value == false and state.CP.value == false then
			inform.Kiting = ('')
			inform.CP = ('')
		end
	end
	
	if state.DefenseMode.value ~= 'None' then
		inform.DefenseMode = (red .. ('\n [' .. 'DEFENCE: ' .. state.DefenseMode.value .. white ..' (' ..state[state.DefenseMode.value .. 'DefenseMode'].value ..')'..red..']' )) .. '\\cr'
	else
		inform.DefenseMode = ('')
	end
	
	if state.DefenseMode.value == 'None' then
		if moving == true then
			inform.is_Moving = (yellow .. ('\n [Moving]' )) .. '\\cr'
		else
			inform.is_Moving = ('')
		end
	end
	
	if not table.equals(old_inform, inform) then
		text_box:update(inform)
		text_box:show()
		old_inform = inform
	end
end

windower.register_event('unload', function()
	text_box:destroy()
	text_box = nil
end)

windower.register_event('job change',function()
    send_command('gs r')
end)

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end

function set_lockstyle()
    send_command('wait 2; input /lockstyleset ' .. lockstyleset)
end