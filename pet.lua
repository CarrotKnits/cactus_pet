--pet

function ipet()
	petx=24
	pety=24
	p_spr=5
	pi={
		sp=p_spr,
		x=petx,
		y=pety,
		t=0
	} --pet idle
	
	pet_stats = {
	maxhp=38,
	hp=38,
	maxhap=38,
	hap=38,
	maxcln=38,
	cln=38
	}
	
end

function upet()
	pi.t+=0.05
	pet_stats.hp-=0.005
	pet_stats.hap-=0.005
	pet_stats.cln-=0.005
end

function dpet()
	--pet idle animation
	sspr(48,5,5,3,pi.x,pi.y+5) --base
	local bob = sin(pi.t) * 1
	sspr(40,0,8,7,pi.x,pi.y+bob) --top
	
	--
end    