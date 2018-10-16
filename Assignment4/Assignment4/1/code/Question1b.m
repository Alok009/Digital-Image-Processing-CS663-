
[Yale_X_train,Yale_y_train] = splitimage_Yale();
[V,T,x_bar,X] = eigenValues_SVD(Yale_X_train);
K = [1, 2, 3, 5, 10, 15, 20, 30, 50, 60, 65, 75, 100, 200, 300, 500, 1000];
z_bar = [];
diff = [];
recogRate = [];

for n = 1:size(Yale_y_train,2)
    D = Yale_y_train(:,n)-x_bar;
    z_bar = [z_bar,D];
end


for i =1:length(K)
    V_cap = V(:,1:K(i));      % taking out n features
    alpha = V_cap'*X;     %eigen coefficient 
    alpha_probe = V_cap'*z_bar;
    
    
    recognise = 0;
    for j = 1:size(alpha_probe,2)
        diff = [];
        for k = 1:size(alpha,2)
            diff = [diff,sum((alpha(:,k)-alpha_probe(:,j)).^2)];
        end
        colm  = find(diff == min(diff));
        if(floor((j-1)/20) == floor((colm-1)/40))
            recognise = recognise+1;
        end 
    end
    
  
    recogRate = [recogRate,100.0*recognise/size(Yale_y_train,2)];   
end
figure(1),plot(K,recogRate);

