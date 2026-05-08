--game state control
--for title screen and main game

--title
function u_title()
    if btnp(❎) then
        game_state = "play"
    end
end

function d_title()
    cls()
    map(7, 0, 0, 0, 7, 7, 0)
    spr(4, 8, 8)
    spr(11, 8, 16)
    spr(17, 8, 21)
    spr(18, 8, 30)
    spr(19, 8, 39)
    spr(33, 41, 21)
    spr(34, 37, 31)
    spr(49, 37, 41)
    spr(71, 16, 5, 3, 1)
    spr(87, 22, 13, 2, 1)
    print("water+", 17, 23, 10)
    print("talk+", 17, 32, 10)
    print("wash+", 17, 41, 10)
    rectfill(6, 48, 50, 54, 4)
    print("❎ to start", 7, 49, 7)
end
--play
function u_play()
    u_hp_sts()
    upet()
    u_music()
    u_main_menu()
    u_cursor_control()
end

function d_play()
    cls()
    map(0, 0, 0, 0, 7, 7, 0)
    spr(11,24,32)
    d_hp_sts()
    dpet()
    d_main_menu()
    d_cursor_control()
end