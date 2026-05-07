--main program

function _init()
    game_state = "title"
    pet_state_code = "mch"
    ipet()
    i_hp_sts()
    i_ani()
    i_music()
    i_main_menu()
    music(track)
    i_cursor_control()
end

function _update()
    if game_state == "title" then
        u_title()
    elseif game_state == "play" then
        u_play()
    end
end

function _draw()
    if game_state == "title" then
        d_title()
    elseif game_state == "play" then
        d_play()
    end
end