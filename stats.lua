--hp and statuses

function i_hp_sts()
	mx_br_sz = 40

	hp = {
		sp = 33,
		spx = 3,
		spy = 1,
		tlx = 11,
		tly = 4,
		blx = 51,
		bly = 5,
		clr = 8,
		state = "max"
	}
	
	hap = {
		sp = 34,
		spx = 3,
		spy = 9,
		tlx = 11,
		tly = 11,
		blx = 51,
		bly = 12,
		clr = 11,
		state = "happy"
	}
	
	cln = {
		sp = 49,
		spx = 3,
		spy = 17,
		tlx = 11,
		tly = 18,
		blx = 51,
		bly = 19,
		clr = 12,
		state = "dirty"
	}
	
end

function u_hp_sts()	
--hp states
	if pet_stats.hp >= mx_br_sz*.85 then
		hp.state = "max"
	elseif pet_stats.hp <= mx_br_sz*.85 and pet_stats.hp > mx_br_sz*.7 then
		hp.state = "healthy"
	elseif pet_stats.hp <= mx_br_sz*.7 and pet_stats.hp > mx_br_sz*.5 then
		hp.state = "normal"
	elseif pet_stats.hp <= mx_br_sz*.45 and pet_stats.hp > mx_br_sz*.25 then
		hp.state = "weakening"
	elseif pet_stats.hp <= mx_br_sz*.25 and pet_stats.hp > mx_br_sz*.15 then
		hp.state = "weak"
	elseif pet_stats.hp <= mx_br_sz*.15 and pet_stats.hp > 0 then
		hp.state = "dying"
	elseif pet_stats.hp == 0 then
		hp.state = "dead"
	end
	--hp bar heart icon change
	if hp.state == "dead" then
		hp.sp = 50
	else
		hp.sp = 33
	end
--happiness states
	if pet_stats.hap <= mx_br_sz/2 then
		hap.state = "sad"
		hap.sp = 35
	else
		hap.state = "happy"
		hap.sp = 34
	end
--cleanliness states
	if pet_stats.cln <= mx_br_sz/2 then
		cln.state = "dirty"
		cln.sp = 51
	else
		cln.state = "clean"
		cln.sp = 49
	end

--sprite animation lookup
	--hp state lookup
	if hp.state == "max" then
		hp_code = "m"
	elseif hp.state == "healthy" then
		hp_code = "h"
	elseif hp.state == "normal" then
		hp_code = "n"
	elseif hp.state == "weakening" then
		hp_code = "wn"
	elseif hp.state == "weak" then
		hp_code = "wk"
	elseif hp.state == "dying" then
		hp_code = "dy"
	elseif hp.state == "dead" then
		hp_code = "dd"
		if gameover_cd > 0 then
			gameover_cd -= 1
			if gameover_cd == 0 then
				game_state = "gameover"
			end
		end
	end
	--cleanliness state lookup
	if cln.state == "clean" then
		cln_code = "c"
	elseif cln.state == "dirty" then
		cln_code = "d"
	end
	--happiness state lookup
	if hap.state == "happy" then
		hap_code = "h"
	elseif hap.state == "sad" then
		hap_code = "s"
	end
	--code for the combined states
	pet_state_code = hp_code .. cln_code .. hap_code

end

function d_hp_sts()
--hp
	spr(hp.sp, hp.spx, hp.spy)
	rectfill(hp.tlx, hp.tly, hp.blx, hp.bly, 2) --bar back empty
	rectfill(hp.tlx, hp.tly, hp.tlx + pet_stats.hp, hp.bly, hp.clr) --bar fill
	rect(hp.tlx, hp.tly - 1, hp.blx, hp.bly + 1, 1) --bar border

--happiness: bug:happiness draw code is actually the cln bar??
	spr(hap.sp, hap.spx, hap.spy)
	rectfill(hap.tlx, hap.tly, hap.blx, hap.bly, 2) --bar back empty
	rectfill(hap.tlx, hap.tly, hap.tlx + pet_stats.hap, hap.bly, hap.clr) --bar fill
	rect(hap.tlx, hap.tly - 1, hap.blx, hap.bly + 1, 1) --bar border

--cleanliness: bug:cleanliness draw code is actually the happiness bar?? 
	spr(cln.sp, cln.spx, cln.spy)
	rectfill(cln.tlx, cln.tly, cln.blx, cln.bly, 2) --bar back empty
	rectfill(cln.tlx, cln.tly, cln.tlx + pet_stats.cln, cln.bly, cln.clr) --bar fill
	rect(cln.tlx, cln.tly - 1, cln.blx, cln.bly + 1, 1) --bar border

end