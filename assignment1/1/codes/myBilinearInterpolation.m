A = 'C:\Users\User\Desktop\5thSEM\csassin\assignment1\1\data\barbaraSmall.png';
B = imread(A);
figure(1),imshow(A)
[rows,colms] = size(B);
rows = int16(3*rows-2);
colms = int16(2*colms-1);
C = zeros(rows,colms,'uint8');
for i = 1:rows
    for j = 1:colms
        if ((mod(i,3)==1) && (mod(j,2) == 1))
            x = ceil(single(i)/3);
            y = ceil(single(j)/2);
            C(i,j) = B(x,y);
        end
    end
end
for i = 1:rows
    for j = 1:colms
       if (((mod(i,3)==1) && (mod(j,2) == 1)) && i<=305 && j<= 202)
            C(i,j+1) = (C(i,j) + C(i,j+2))/2 ;  %along horizontal axis
            C(i+1,j) = (2*C(i,j) + 1*C(i+2,j))/3;
            C(i+2,j) = (1*C(i,j) + 2*C(i+2,j))/3;
            C(i+1,j+1) = (2*C(i,j) + 1*C(i+3,j+3)+ 2*C(i,j+2) + 1*C(i,j+3))/6;
            C(i+2,j+1) = (1*C(i,j) + 2*C(i+3,j+3)+1*C(i,j+2) + 2*C(i,j+3))/6;
            
        end
    end
end
 figure(2),imshow(C);
           