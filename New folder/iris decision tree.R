# Load necessary packages
library(rpart)
library(rpart.plot)

data("iris")
iris

# Step 1: Split the dataset into training and testing sets
set.seed(123)  # Set seed for reproducibility
sample_index <- sample(1:nrow(iris), 0.7 * nrow(iris))  # 70% for training

train_data <- iris[sample_index, ]
test_data <- iris[-sample_index, ]

# Step 2: Train the Decision Tree model
tree_model <- rpart(Species ~ ., 
                    data = train_data, method = "class")

# Step 3: Visualize the Decision Tree
rpart.plot(tree_model, main = "Decision Tree")

