function [Yale_X_train,Yale_y_train] = splitimage_Yale()
dirPath = '../../CroppedYale';
Yale_X_train = [];
Yale_y_train = [];
for i = 1:39
    if(i<10)
        directory = strcat(dirPath,"/","yaleB",'0',num2str(i),"/");
    elseif(i==14)
        continue;
    else
        directory = strcat(dirPath,"/","yaleB",num2str(i),'/');
    end
    
    files = dir(directory);
    name = {files.name};
    
       for j = 1:60
           image = strcat(directory, name{j+2});
           A = double(imread(image,'pgm'));
           B = A(:);
         if(j<41)
             Yale_X_train = [Yale_X_train,B];
         else
             Yale_y_train = [Yale_y_train,B];
         end
   
    end
end
end
