
function [V,T,x_bar,X] = eigenValues_SVD(Yale_X_train)
%[Yale_X_train,Yale_y_train] = splitimage_Yale();
x_bar = mean(Yale_X_train,2);    %mean by rows
X = [];

for n = 1:size(Yale_X_train,2)
    D = Yale_X_train(:,n)-x_bar;
    X = [X,D];
end

%L = X'*X; 
[U,S,v] = svd(X,'econ');    %T = eigenvalue of L  && U = eigenVector of L
%V = X*W;           %eigen vector of C
U = normc(U);      %unit normalization of V

%[T,index] = sort(diag(T),'descend');
V = U;
T = S;



end


