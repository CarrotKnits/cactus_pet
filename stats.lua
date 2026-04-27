--hp and statuses

function i_hp_sts()
	mx_br_sz=38

	hp={
		sp=33,
		spx=3,
		spy=1,
		tlx=12,
		tly=4,
		blx=50,
		bly=5,
		clr=8,
		state="max"
	}
	
	hap={
		sp=34,
		spx=3,
		spy=9,
		tlx=12,
		tly=18,
		blx=50,
		bly=19,
		clr=12,
		state="happy"
	}
	
	cln={
		sp=49,
		spx=3,
		spy=17,
		tlx=12,
		tly=11,
		blx=50,
		bly=12,
		clr=11,
		state="dirty"
	}
	
end

function u_hp_sts()
	--hp states
	if pet_stats.cln>=mx_br_sz*.9 then
		hp.state="max"
	elseif pet_stats.hp<=mx_br_sz*.75 and pet_stats.hp>=mx_br_sz*.5 then
		hp.state="healthy"
	elseif pet_stats.hp<=mx_br_sz*.5 and pet_stats.hp>=mx_br_sz*.4 then
		hp.state="normal"
	elseif pet_stats.hp<=mx_br_sz*.35 and pet_stats.hp>=mx_br_sz*.3 then
		hp.state="weakening"
	elseif pet_stats.hp<=mx_br_sz*.25 and pet_stats.hp>=mx_br_sz*.1 then
		hp.state="weak"
	elseif pet_stats.hp<=mx_br_sz*.1 and pet_stats.hp>0then
		hp.state="dying"
	elseif pet_stats.hp==0 then
		hp.state="dead"
	end
	--happiness states
	if pet_stats.hap<=mx_br_sz/2 then
		cln.state="sad"
	else
		cln.state="happy"
	end
	--cleanliness states
	if pet_stats.cln<=mx_br_sz/2 then
		cln.state="dirty"
	else
		cln.state="clean"
	end

end

function d_hp_sts()
--	rectfill(3,3,23,21,1)
--hp
	spr(hp.sp,hp.spx,hp.spy)
	rectfill(hp.tlx,hp.tly,hp.blx,hp.bly,1)
	rectfill(hp.tlx,hp.tly,hp.tlx+1+pet_stats.hp,hp.bly,hp.clr)
	rect(hp.tlx-1,hp.tly-1,hp.blx+1,hp.bly+1,1)

--happiness: bug:happiness bar is cln bar, why??
	spr(hap.sp,hap.spx,hap.spy)
	rectfill(hap.tlx,hap.tly,hap.blx,hap.bly,1)
	rectfill(hap.tlx,hap.tly,hap.tlx+1+pet_stats.hap,hap.bly,hap.clr)
	rect(hap.tlx-1,hap.tly-1,hap.blx+1,hap.bly+1,1)

--cleanliness: bug:cln bar is happiness bar, why?? 
	spr(cln.sp,cln.spx,cln.spy)
	rectfill(cln.tlx,cln.tly,cln.blx,cln.bly,1)
	rectfill(cln.tlx,cln.tly,cln.tlx+1+pet_stats.cln,cln.bly,cln.clr)
	rect(cln.tlx-1,cln.tly-1,cln.blx+1,cln.bly+1,1)

end