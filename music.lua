--music

function i_music()
    playlist = {
        track = 0,
		state = "normal"
    }

    music(playlist.track)

end

function u_music()
    if playlist.state == "normal" then
		    track = 0
	    elseif playlist.state == "weak" then
		    track = 4
	    end
end
