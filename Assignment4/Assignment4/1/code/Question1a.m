
[X_train,y_train] = splitimage();
[V,T,x_bar,X] = eigenValues(X_train);
K = [1 2 3 5 10 15 20 30 50 75 100 150 170];
z_bar = [];
diff = [];
recogRate = [];

for n = 1:size(y_train,2)
    D = y_train(:,n)-x_bar;
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
            diff = [diff,sum((alpha(:,k)-alpha_probe(:,j)).^2,1)];
        end
        colm  = find(diff == min(diff));
        if(floor((j-1)/4) == floor((colm-1)/6))
            recognise = recognise+1;
        end 
    end
    recogRate = [recogRate,100.0*recognise/size(y_train,2)];   
end
figure(1),plot(K,recogRate);

