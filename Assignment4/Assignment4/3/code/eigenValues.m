
function [V,T,x_bar,X] = eigenValues(X_train)
%[X_train,y_train] = splitimage();
x_bar = mean(X_train,2);    %mean by rows
X = [];

for n = 1:192
    D = X_train(:,n)-x_bar;
    X = [X,D];
end

L = X'*X; 
[W,T] = svd(L);    %T = eigenvalue of L  && W = eigenVector of L
V = X*W;           %eigen vector of C
V = normc(V);      %unit normalization of V

[T,index] = sort(diag(T),'descend');
V = V(:,index);
end


