--main program

function _init()
    game_state = "title"
    pet_state_code = "mch"
    i_gameover()
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
    elseif game_state == "gameover" then
        u_gameover()
    end
end

function _draw()
    if game_state == "title" then
        d_title()
    elseif game_state == "play" then
        d_play()
    elseif game_state == "gameover" then
        d_gameover()
    end
end