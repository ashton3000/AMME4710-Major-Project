function location_matrix = setupLocationMatrix(side_length, centrepoints, im)
        
        location_matrix = zeros(8,8,2);
        
        
        
        for i = 2:7
            location_matrix(i, 2:7, 1) = centrepoints(flip(6*(i-2)+1:6*(i-1)), 1); 
            location_matrix(i, 2:7, 2) = centrepoints(flip(6*(i-2)+1:6*(i-1)), 2); 
        end  
        
        centre_point(1) = location_matrix(2, 2, 1);
        centre_point(2) = location_matrix(2, 2, 2); 
        for i = 1:4
            colour(i) = checkSquare2(centre_point, side_length, im);
        end
        colour1 = mode(colour);
        
        centre_point(1) = location_matrix(2, 7, 1);
        centre_point(2) = location_matrix(2, 7, 2);
        for i = 1:4
            colour(i) = checkSquare2(centre_point, side_length, im);
        end
        colour2 = mode(colour);
        
        switch colour1
            case 0
                switch colour2
                    case 0
                        
                    case 1
                        location_matrix = rot90(location_matrix, 3);
                        
                            
                end
                
                
            case 1
               switch colour2
                   case 0
                        location_matrix = rot90(location_matrix);
                        
                   case 1
                       location_matrix = rot90(location_matrix, 2);
               end
               
                         
        end
        
        for i = 2:7
            location_matrix(1,i,1) = 2*location_matrix(2,i,1)-location_matrix(3,i,1);
            location_matrix(1,i,2) = 2*location_matrix(2,i,2)-location_matrix(3,i,2);
            
            location_matrix(8,i,1) = 2*location_matrix(7,i,1)-location_matrix(6,i,1);
            location_matrix(8,i,2) = 2*location_matrix(7,i,2)-location_matrix(6,i,2);
            
            location_matrix(i,1,1) = 2*location_matrix(i,2,1)-location_matrix(i,3,1);
            location_matrix(i,1,2) = 2*location_matrix(i,2,2)-location_matrix(i,3,2);
            
            location_matrix(i,8,1) = 2*location_matrix(i,7,1)-location_matrix(i,6,1);
            location_matrix(i,8,2) = 2*location_matrix(i,7,2)-location_matrix(i,6,2);
            
        end
        
        location_matrix(1,1,1) = 2*location_matrix(2,2,1) - location_matrix(3,3,1);
        location_matrix(1,1,2) = 2*location_matrix(2,2,2) - location_matrix(3,3,2);
        
        location_matrix(1,8,1) = 2*location_matrix(2,7,1) - location_matrix(3,6,1);
        location_matrix(1,8,2) = 2*location_matrix(2,7,2) - location_matrix(3,6,2);
        
        location_matrix(8,1,1) = 2*location_matrix(7,2,1) - location_matrix(6,3,1);
        location_matrix(8,1,2) = 2*location_matrix(7,2,2) - location_matrix(6,3,2);
        
        location_matrix(8,8,1) = 2*location_matrix(7,7,1) - location_matrix(6,6,1);
        location_matrix(8,8,2) = 2*location_matrix(7,7,2) - location_matrix(6,6,2);
        
                        
                        
end
