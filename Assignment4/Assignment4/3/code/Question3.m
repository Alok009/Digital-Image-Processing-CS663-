function Question3(input)
[X_train,y_train] = splitimage();
[X_test,y_test] = Question3_split();


[V,T,x_bar,X] = eigenValues(X_train);
K = [60];
z_bar = [];
diff = [];
recogRate = [];
minn  = [];

if(input == 1)                     % plot for 128 seen images
for n = 1:size(y_train,2)           
    D = y_train(:,n)-x_bar;         
    z_bar = [z_bar,D];
end
end

if(input==2)                       % plot for 32 new images
for n = 1:size(y_test,2)           
    D = y_test(:,n)-x_bar;         
    z_bar = [z_bar,D];
end
end

for i =1:length(K)
    V_cap = V(:,1:K(i));      % taking out n features
    alpha = V_cap'*X;     %eigen coefficient 
    alpha_probe = V_cap'*z_bar;
    
    
    out = 0;
    for j = 1:size(alpha_probe,2)
        diff = [];
        for k = 1:size(alpha,2)
            diff = [diff,sum((alpha(:,k)-alpha_probe(:,j)).^2,1)];
        end
        
        minn = [minn,min(diff)];
       if(min(diff)>5.5*10^6)
            out = out+1;
        end 
    end  
end
figure(2),plot(minn);
end
