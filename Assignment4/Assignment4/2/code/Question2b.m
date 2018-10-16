
[Yale_X_train,Yale_y_train] = splitimage_Yale();
[V,T,x_bar,X] = eigenValues_SVD(Yale_X_train);

for i =1:25
    img = reshape(V(:,i),[192,168]);              %as eigen vector is already in descending order of eigen values
    subplot(5,5,i),imshow(img,[]);  
end


