
dirPath = '../att_faces';

X_train = [];
y_train = [];
X = [];
Z = [];
dist = [];
K = [1, 2, 3, 5, 10, 15, 20, 30, 50, 75, 100, 150, 170];
%Accessing image
for i = 1:32
    dir = strcat(dirPath,"/","s",num2str(i),"/");
    for j = 1:10
        image = strcat(dir,num2str(j),".pgm");
        A = double(imread(image));
        B = A(:);
        if(j<7)
            X_train = [X_train,B];
        else
            y_train = [y_train,B];
        end
  
    end
end

average = mean(X_train,2);    %average by rows

for n = 1:192
    D = X_train(:,n)-average;
    X = [X,D];
end

L = X'*X;
[eigVec,eigVal] = eig(L);
eigVC = X*eigVec;
trainCoff = eigVC'*X;

eigVC = normc(eigVC);

[sortedEigV,index] = sort(diag(eigVal),'descend');
EA = reshape(eigVC(:,1),[112,92]);
eigVal = eigVal(index,index);

V = eigVec(:,index);    %k = no.s of vector to take
trainCoff = trainCoff(:,index);

%testing_phase---------------------------------------
for m = 1:128
    D = y_train(:,m)-average;
    Z = [Z,D];
end

testCoff =  eigVC'*Z;

dist = ((testCoff(:,1)-trainCoff(:,1)).^2);
  

%for v = K
 %   KV = V(:,1:v);
  %  KT = trainCoff(:,1:v) ;
   % for t = 1:v
    %    dist = [dist,sum((trainCoff(:,t) -testCoff(:,1)).^2)] ;
    %end
%end


