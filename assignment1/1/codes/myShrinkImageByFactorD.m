function myShrinkImageByFactorD(d)
A = 'C:\Users\User\Desktop\5thSEM\csassin\assignment1\1\data\circles_concentric.png';
B = imread(A,'png');
figure(1),imshow(B);
[rows,colm] = size(B);
C= B(1:d:end, 1:d:end);
figure(2), imshow(C);



