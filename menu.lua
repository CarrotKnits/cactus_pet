--main menu

--initialize main menu
function i_main_menu()
--setup menu
	wash = {
		sp = 17,
		x = 8,
		y = 40
	}
	
	water = {
		sp = 18,
		x = 24,
		y = 40
	}
	
	talk={
		sp = 19,
		x = 40,
		y = 40
	}
	
	menu = {
		state = "wash"
	}
	
	--cooldown timers
	--wash cd
	wash_cd = 0
	wash_cd_max = 150

	--water cd
	water_cd = 0
	water_cd_max = 300

	--talk cd
	talk_cd = 0
	talk_cd_max = 150


end

--update main menu
function u_main_menu()

	if wash_cd > 0 then
		wash_cd -= 1
	end

	if water_cd > 0 then
		water_cd -= 1
	end

	if talk_cd > 0 then
		talk_cd -= 1
	end

	if wash_cd > 0 then
		if menu.state == "wash" then
			wash.sp = 59
			wash.y = 39
		else
			wash.sp = 59
			wash.y = 40
		end
	else
		if menu.state == "wash" then
			wash.sp = 3
			wash.y = 39
		else
			wash.sp = 19
			wash.y = 40
		end
	end

	if talk_cd > 0 then
		if menu.state == "talk" then
			talk.sp = 43
			talk.y = 39
		else
			talk.sp = 43
			talk.y = 40
		end
	else
		if menu.state == "talk" then
			talk.sp = 2
			talk.y = 39
		else
			talk.sp = 18
			talk.y = 40
		end
	end

	if water_cd > 0 then
		if menu.state == "water" then
			water.sp = 27
			water.y = 39
		else
			water.sp = 27
			water.y = 40
		end
	else
		if menu.state == "water" then
			water.sp = 1
			water.y = 39
		else
			water.sp = 17
			water.y = 40
		end
	end

end



--draw menu
function d_main_menu()
	spr(wash.sp, wash.x, wash.y)
	spr(water.sp, water.x, water.y)
	spr(talk.sp, talk.x, talk.y)
end