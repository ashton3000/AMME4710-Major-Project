function full_game_matrix = initGameMatrix()
        full_game_matrix = zeros(8);
        full_game_matrix(2, 1:8) = 1:8;
        full_game_matrix(7, 1:8) = 21:28;
        full_game_matrix(1,1:8) = [9,11,13,16,15,14,12,10];
        full_game_matrix(8,1:8) = [29,31,33,36,35,34,32,30];
end
