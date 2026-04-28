--cursor controls

--cursor control
function i_cursor_control()
	cursr={
		tlx=7,
		tly=38,
		blx=16,
		bly=47,
		clr=7,
		state="wash"
	}
end

function u_cursor_control()

--cursor response to button press ➡️
	if btnp(➡️) then
		sfx(0)
		if cursr.state=="wash" then
			cursr.state="water"
		elseif cursr.state=="water" then
			cursr.state="talk"
		elseif cursr.state=="talk" then
			cursr.state="wash"
		end
	end
--cursor response to button press ⬅️
	if btnp(⬅️) then
		sfx(0)
		if cursr.state=="wash" then
			cursr.state="talk"
		elseif cursr.state=="water" then
			cursr.state="wash"
		elseif cursr.state=="talk" then
			cursr.state="water"
		end
	end
	
--change cursor state
	if cursr.state=="wash" then
		cursr.tlx=7
		cursr.blx=16
		menu.state="wash"
	elseif cursr.state=="water" then
		cursr.tlx=23
		cursr.blx=32
		menu.state="water"
	elseif cursr.state=="talk" then
		cursr.tlx=39
		cursr.blx=48
		menu.state="talk"
	end
--select option
	if btnp(❎) then
		sfx(1)
		if cursr.state=="water" then
			pet_stats.hp+=5
		end
		if cursr.state=="wash" then
			pet_stats.cln+=5
		end
		if cursr.state=="talk" then
			pet_stats.hap+=5
		end
	end

end

--draw 
function d_cursor_control()
	rect(cursr.tlx,cursr.tly,cursr.blx,cursr.bly,cursr.clr)
end