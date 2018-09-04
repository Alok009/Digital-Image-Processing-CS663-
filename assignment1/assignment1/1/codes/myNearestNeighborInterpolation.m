function myNearestNeighborInterpolation
A = '../data/barbaraSmall.png';
b = imread(A,'png');

m = size(b,1);
n = size(b,2);

img = zeros(3*m-2,2*n-1,'uint8');

for r = 0:(3*m-3)
    for c = 0:(2*n-2)

        if(mod(r,3) == 0)
          if(mod(c,2) == 0)
            img(r+1,c+1) = b(r/3+1,c/2+1);
          else
            img(r+1,c+1) = b(r/3+1,(c-1)/2+1);
          end
        elseif(mod(r,3) == 1)
          if(mod(c,2) == 0)
            img(r+1,c+1) = b((r-1)/3+1,c/2+1);
          else
            img(r+1,c+1) = b((r-1)/3+1,(c-1)/2+1);
          end
        elseif(mod(r,3) == 2)
          if(mod(c,2) == 0)
            img(r+1,c+1) = b((r+1)/3+1,c/2+1);
          else
            img(r+1,c+1) = b((r+1)/3+1,(c-1)/2+1);
          end
        end
    end
end


figure(3),imshow(b);
title('Original Image');
colorbar('southoutside');
figure(5),imshow(img);
title('Nearest Neighbour Interpolation');
colorbar('southoutside');
end
