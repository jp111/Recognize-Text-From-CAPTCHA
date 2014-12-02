function [labelit]=knnclassifier(k,feature_train,feature_test,label_train,kp)

sizeDataTrain=size(feature_train,1);
sizeDataTest=kp;
labels=zeros(1,k);
correct=0;
incorrect=0;
sizeDataTest
sizeDataTrain
confusionMatrix=zeros(10,10);
cnt=0;
labelit = [];
for i=1:sizeDataTest
    disp('i is');
    disp(i);
    
    % Difference of feature vector calculation
    difference=zeros(1,sizeDataTrain);
    for j=1:sizeDataTrain
        difference(j)=sum((feature_train(j,:)-feature_test(i,:)).^2);
    end
    
    %sort difference vector
    [~,sortedIndex] = sort(difference,'ascend'); 
     
    for j=1:k
        labels(j)=label_train(sortedIndex(j),1);
    end
    lbl=mode(single(labels));
    
    labelit(cnt+1)=lbl;
    cnt=cnt+1;
    %test label
    
    
    %confusion matrix update
    %confusionMatrix(label_test(i)+1,lbl+1)=confusionMatrix(label_test(i)+1,lbl+1)+1;
end

%compute accuracy
%accuracy=correct/sizeDataTest;
disp(labelit);
%dlmwrite('myFile.txt', confusionMatrix);
end
