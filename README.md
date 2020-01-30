# myproject - Simple Neural Network model for predicting PM 2.5 (Fine Particulate Matter):


**Notes:**
My code is not perfect (obviously - I am newbie of programming). I did it six months ago for my very first course project of Machine Learning. I focused on predicting PM 2.5 concentration using dataset of Beijing 2013 that I downloaded from kaggle.com.
I believe that this is great for some who just start to learn about Machine Learning. 
Since I used an old version of MATLAB so I wrote down some functions to do plot diagram, normalization and all the stuffs. 

# Files:
- **PM25NeuralNetwork.m** -- main function includes the neural network model. Setting two hidden layers in which `node = 10` and `node1 = 1`. You can change the number of nodes and number of hidden layers as well.
- **NormalizeData.m** -- normalize input data in the range of `[0, 1]`. I was so so naive to wrote a normalization function. In the newly version of MATLAB, you can use the pre-defined function instead.
- **TrainTestDivide.m** -- divide the input data into training dataset and test dataset. Some papers that I read, they used 30% for test set and 70% for training set. That is the reason why I set it to `0.3`. However, according to Andrew Ng., we can choose another fraction for training and test dataset based on the number of input data. I might be 1% for test set if you have 10000000.
- **draw_train_test.m** -- this function is used for comparing the observed PM 2.5 and predicted PM 2.5 concentration - the output of neural network model.
- **ScatteredPlot.m** -- this function shows the scatterplot of observed-predicted PM 2.5 concentration in training and test dataset. 
- **EvalFunction.m** -- I wrote this function for checking only. This function computes the mean-squared-error (MSE) and root-mean-squared-error (RMSE) from model.

**All feedback is always welcome!*
