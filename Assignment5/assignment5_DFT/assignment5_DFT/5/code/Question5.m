A = "../data/barbara256.png";
I = double(imread(A));
figure(1),imshow(I,[]);

[rows,colm] = size(I);
N = randn(size(I))*20;

J = I+N;
figure(2),imshow(J,[]);
