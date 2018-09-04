A = 'C:\Users\User\Desktop\5thSEM\csassin\assignment1\2\data\canyon.png';
B = imread(A,'png');
figure(1),imshow(B);
[rows,colm] = size(B);
low = min(B);
lowest = min(low);  %minimum intensity
high = max(B);   
highest = max(high);   %maximum intensity
Z = 255/double(highest-lowest);
C(1:rows,1:colm) = double(B(1:rows,1:colm) - lowest)*(Z);
figure(2),imshow(C);


