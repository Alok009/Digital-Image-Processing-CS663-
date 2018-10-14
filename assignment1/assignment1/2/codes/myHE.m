A = 'C:\Users\User\Desktop\5thSEM\csassin\assignment1\2\data\TEM.png';
B = imread(A,'png');
figure(1),imshow(B);
[rows,colm] = size(B);
figure(2),histogram(B,255);
[counts,x] = imhist(B);
prob = counts/(rows*colm);
cdf = cumsum(prob);
cdf2 = cdf*255;
figure(3),histogram(cdf,255);
for i = 1:rows
    for j = 1:colm
        img(i,j) = cdf2(B(i,j)+1,1);
    end
end
figure(4),imshow(img, []);
figure(5),histogram(img,256)


