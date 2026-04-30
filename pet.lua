--pet

function ipet()
	petx = 24
	pety = 24
	p_spr = 5
	pi = {
		sp = p_spr,
		x = petx,
		y = pety,
		t = 0
	} --pet idle
	
	pet_stats = {
	maxhp = 40,
	hp = 40,
	maxhap = 40,
	hap = 40,
	maxcln = 40,
	cln = 40
	}
	
end

function upet()
	--pet animation speed
	pi.t += 0.05
	--hp decay speed, defaults 0.005, 0.015, 0.03; other values are for testing
	if pet_stats.hp <= 0 then
		pet_stats.hp = 0 --stops inner bar from growing to the left outside the outer bar when at 0
	elseif hap.state == "happy" and cln.state == "clean" then
		pet_stats.hp -= 0.4
	elseif hap.state == "sad" or cln.state == "dirty" then
		pet_stats.hp -= 0.4
	elseif hap.state == "sad" and cln.state == "dirty" then
		pet_stats.hp -= 0.4
	end
	--happiness decay speed: default 0.015
	if pet_stats.hap <= 0 then
		pet_stats.hap = 0 --stops inner bar from growing to the left outside the outer bar when at 0
	elseif pet_stats.hap > 0 then
		pet_stats.hap -= 0.06
	end
	--cleanliness decay speed: default 0.01
	if pet_stats.cln <= 0 then
		pet_stats.cln = 0 --stops inner bar from growing to the left outside the outer bar when at 0
	elseif pet_stats.cln > 0 then
		pet_stats.cln -= 0.04
	end

end

function dpet()
	--pet idle animation
	sspr(48, 5, 5, 3, pi.x, pi.y + 5) --base
	local bob = sin(pi.t) * 1
	sspr(40, 0, 8, 7, pi.x, pi.y + bob) --top
	
	--
end    