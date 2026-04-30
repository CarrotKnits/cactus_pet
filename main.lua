--main program

function _init()
    ipet()
    i_hp_sts()
    i_music()
    i_main_menu()
    music(track)
    i_cursor_control()
end

function _update()
    upet()
    u_hp_sts()
    u_music()
    u_main_menu()
    u_cursor_control()
end

function _draw()
    cls()
    map()
    spr(11,24,32)
    d_hp_sts()
    dpet()
    d_main_menu()
    d_cursor_control()
end