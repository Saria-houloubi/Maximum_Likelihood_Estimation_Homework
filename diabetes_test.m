%must run the diabetes_train.m file before running this file..
%as it depends on variables declared there

correct_classification = 0;
wrong_classifications = 0;

%loop throw the test data
for i = 1 : test_data_length
    active_Likelihood = 1;
    inactive_Likelihood = 1;
    %loop throw the features
    for j = 1 : 8
    %calaculte the likelihood for each feature
    likelihood_active_feature_j = exp(-(test_data(i,j)-mean_active(j))^2/(2*var_active(j)))/sqrt(var_active(j));
    likelihood_inactive_feature_j = exp(-(test_data(i,j)-mean_inactive(j))^2/(2*var_inactive(j)))/sqrt(var_inactive(j));
    
    
    active_Likelihood = active_Likelihood * likelihood_active_feature_j;
    inactive_Likelihood = inactive_Likelihood * likelihood_inactive_feature_j;
    end
    
    %get the probibliy of this test sample
    item_active_probility = train_data_active_probility  * active_Likelihood;
    item_inactive_probility = train_data_inactive_probility  * inactive_Likelihood;
    
    %check what is the type of the item
    %if the type of the item is active which is 1 then...
    if item_active_probility > item_inactive_probility
        %check if the our classification is right
        if test_data(i,9) == 1 
            correct_classification = correct_classification + 1;
        else
            wrong_classifications = wrong_classifications + 1; 
        end
    %if the type of the item is inactive which is 0 then...
    else
        %check if the our classification is right
        if test_data(i,9) == 0 
            correct_classification = correct_classification + 1;
        else
            wrong_classifications = wrong_classifications + 1; 
        end
    end
end

Accuracy = (correct_classification / (correct_classification + wrong_classifications)) * 100;