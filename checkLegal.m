function [to_point, legal_flag] = checkLegal(from_point, to_point, piece, situ)
        switch piece
            
            % pawns
            case{1:8}
                switch situ
                    case 1
                        if to_point(1,2) - from_point(1,2) > 3 || to_point(1,2) - from_point(1,2) < 0 || (to_point(1,2) - from_point(1,2) == 2 && from_point(1,2) ~= 2)
                            legal_flag = 1;
                        end
                end
                    
            case{21:28}
                 
            % rooks    
            case{9,10,29,30}
                
            
            % knights
            case{11,12,31,32}
                
            % bishops
            case{13,14,33,34}
                
            % queens
            case{15, 35}
                
            % kings    
            case{16,36}
                
                
                




end