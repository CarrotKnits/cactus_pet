--game over

function i_gameover()
    gameover_cd = 60
    gameover_cd_max = 60
end

function u_gameover()
    if btnp(❎) then
        game_state = "play"
        gameover_cd = gameover_cd_max
    end
end

function d_gameover()
    rectfill(11, 14, 45, 22, 10)
    print("pet died", 13, 16, 0)
    rectfill(7, 38, 50, 46, 10)
    print("❎ restart", 9, 40, 0)
end