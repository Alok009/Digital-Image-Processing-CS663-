
tic;
%% Part 1
% 
%  Reconstruction of image using various values of K
%  K = [2, 10, 20, 50, 75, 100, 125, 150, 175]
% 

[Yale_X_train,Yale_y_train] = splitimage_Yale();
[V,T,x_bar,X] = eigenValues_SVD(Yale_X_train);
K = [2, 10, 20, 50, 75, 100, 125, 150, 175];

for i =1:length(K)
    V_cap = V(:,1:K(i));        % taking out n features
    alpha = V_cap'*X;           % eigen coefficient    
    img = V_cap*alpha;
    img = reshape(img(:,50),[192,168]);
    subplot(3,3,i),imshow(img,[]);  
end

%% Part 2
%
% 
%  25 eigenfaces corresponding to the 25 largest eigenvalues 
%  
% 
[Yale_X_train,Yale_y_train] = splitimage_Yale();
[V,T,x_bar,X] = eigenValues_SVD(Yale_X_train);

for i =1:25
    img = reshape(V(:,i),[192,168]);              %as eigen vector is already in descending order of eigen values
    subplot(5,5,i),imshow(img,[]);  
end

%%
toc;