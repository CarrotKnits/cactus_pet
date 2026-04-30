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
		tly = 18,
		blx = 51,
		bly = 19,
		clr = 12,
		state = "happy"
	}
	
	cln = {
		sp = 49,
		spx = 3,
		spy = 17,
		tlx = 11,
		tly = 11,
		blx = 51,
		bly = 12,
		clr = 11,
		state = "dirty"
	}
	
end

function u_hp_sts()
--hp states
	if pet_stats.cln >= mx_br_sz*.9 then
		hp.state = "max"
	elseif pet_stats.hp <= mx_br_sz*.75 and pet_stats.hp >= mx_br_sz*.5 then
		hp.state = "healthy"
	elseif pet_stats.hp <= mx_br_sz*.5 and pet_stats.hp >= mx_br_sz*.4 then
		hp.state = "normal"
	elseif pet_stats.hp <= mx_br_sz*.35 and pet_stats.hp >= mx_br_sz*.3 then
		hp.state = "weakening"
	elseif pet_stats.hp <= mx_br_sz*.25 and pet_stats.hp >= mx_br_sz*.1 then
		hp.state = "weak"
	elseif pet_stats.hp <= mx_br_sz*.1 and pet_stats.hp > 0 then
		hp.state = "dying"
	elseif pet_stats.hp == 0 then
		hp.state = "dead"
	end
--happiness states
	if pet_stats.hap <= mx_br_sz/2 then
		hap.state = "sad"
	else
		hap.state = "happy"
	end
--cleanliness states
	if pet_stats.cln <= mx_br_sz/2 then
		cln.state = "dirty"
	else
		cln.state = "clean"
	end

end

function d_hp_sts()
--hp
	spr(hp.sp, hp.spx, hp.spy)
	rectfill(hp.tlx, hp.tly, hp.blx, hp.bly, 2) --bar back empty
	rectfill(hp.tlx, hp.tly, hp.tlx + pet_stats.hp, hp.bly, hp.clr) --bar fill
	rect(hp.tlx, hp.tly - 1, hp.blx, hp.bly + 1, 1) --bar border

--happiness: bug:happiness bar is cln bar, why??
	spr(hap.sp, hap.spx, hap.spy)
	rectfill(hap.tlx, hap.tly, hap.blx, hap.bly, 2) --bar back empty
	rectfill(hap.tlx, hap.tly, hap.tlx + pet_stats.hap, hap.bly, hap.clr) --bar fill
	rect(hap.tlx, hap.tly - 1, hap.blx, hap.bly + 1, 1) --bar border

--cleanliness: bug:cln bar is happiness bar, why?? 
	spr(cln.sp, cln.spx, cln.spy)
	rectfill(cln.tlx, cln.tly, cln.blx, cln.bly, 2) --bar back empty
	rectfill(cln.tlx, cln.tly, cln.tlx + pet_stats.cln, cln.bly, cln.clr) --bar fill
	rect(cln.tlx, cln.tly - 1, cln.blx, cln.bly + 1, 1) --bar border

end