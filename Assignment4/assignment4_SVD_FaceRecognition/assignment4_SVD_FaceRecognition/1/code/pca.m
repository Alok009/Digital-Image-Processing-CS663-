A = double(imread('../att_faces/s1/1.pgm'));
B = double(imread('../att_faces/s1/2.pgm'));
C = double(imread('../att_faces/s1/3.pgm'));
D = double(imread('../att_faces/s1/4.pgm'));
E = double(imread('../att_faces/s1/5.pgm'));
F = double(imread('../att_faces/s1/6.pgm'));

vector1 = A(:);
vector2 = B(:);
vector3 = C(:);
vector4 = D(:);
vector5 = E(:);
vector6 = F(:);

average = (vector1+vector2+vector3+vector4+vector5+vector6)/6;

vector1 = vector1-average;
vector2 = vector2-average;
vector3 = vector3-average;
vector4 = vector4-average;
vector5 = vector5-average;
vector6 = vector6-average;

X = [vector1,vector2,vector3,vector4,vector5,vector6];
XT = transpose(X);
L = XT*X;

[eigVector,eigVAlue] = eig(L);

eigVectOfC = X*eigVector;
NorEigVectOfC = normc(eigVectOfC); 

