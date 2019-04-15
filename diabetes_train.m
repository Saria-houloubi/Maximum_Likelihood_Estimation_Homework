%Read the data 
data = dlmread('pima-indians-diabetes.csv');

% 80% for the train data and 20% for test
train_data_length= floor((length(data) * 80 ) /100);
test_data_length=  floor((length(data) * 20 ) /100);

%Get the test and train data
train_data = data(1:train_data_length,:);
test_data = data(train_data_length + 1:end,:);

%Get the active and inavtive rows
train_data_rows_active = train_data(:,9) == 1;
train_data_rows_inactive = train_data(:,9) == 0;

%get the length of the rows that are active and inactive
train_data_row_active_length = length(train_data(train_data_rows_active));
train_data_row_inactive_length = length(train_data(train_data_rows_inactive));

%now to get the active/inactive mean and variance
mean_active = [];
mean_inactive = [];

var_active = [];
var_inactive = [];

%loop throw all the columns
for i = 1 : 8
    %get the mean of all the elments in the i column where they are active
    mean_active(i) = mean(train_data(train_data_rows_active,i));
    %get the mean of all the elments in the i column where they are inactive
    mean_inactive(i) = mean(train_data(train_data_rows_inactive,i));
    
    
    %get the var of all the elments in the i column where they are active
    var_active(i) = var(train_data(train_data_rows_active,i));
    %get the var of all the elments in the i column where they are inactive
    var_inactive(i) = var(train_data(train_data_rows_inactive,i));
end


%get the probiblity of getting an active and inactive type
train_data_active_probility = train_data_row_active_length / length(train_data);
train_data_inactive_probility = train_data_row_inactive_length / length(train_data);

