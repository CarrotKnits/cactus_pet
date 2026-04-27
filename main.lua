--main program

function _init()
    music(3)
    ipet()
    i_main_menu()
    i_cursor_control()
end

function _update()
    upet()
    u_main_menu()
    u_cursor_control()
end

function _draw()
    cls()
    map()
    spr(11,24,32)
    dpet()
    d_main_menu()
    d_cursor_control()
end