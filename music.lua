--music

function i_music()
    playlist = {
		state = "normal"
    }

    --tracks: "normal" 0, "weak" 4
    last_track = "normal"
    music(0)

end

function u_music()

    --change playlist.state based on hp.state
    if hp.state == "weak" or hp.state == "dying" or hp.state == "dead" then
        playlist.state = "weak"
    else
        playlist.state = "normal"
    end

    --change music track based on playlist.state
    if playlist.state ~= last_track then
        if playlist.state ==  "weak" then
	        last_track = "weak"
            music(4)
	    elseif playlist.state == "normal" then
	        last_track = "normal"
            music(0)
        end
	end

end


