#Deep Learning Script
library(h2o)
localH2O<-h2o.init()



#Import Train Data
pathToFolder <- "/Users/gijs/Genesis/h2o/train.csv"
train.hex <- h2o.importFile(localH2O, path = pathToFolder, key = "train.hex")



#Import Test Data
pathToFolder <- "/Users/gijs/Genesis/h2o/test.csv"
test.hex <- h2o.importFile(localH2O, path = pathToFolder, key = "test.hex")



#Train model
model <- h2o.deeplearning(x = 1:4096, 
                          y = 4097,  
                          data = train.hex,
                          activation = "TanhWithDropout", #RectifierWithDropout", #, TanhWithDropout", # or 'Tanh'
                          balance_classes = TRUE, 
                          hidden = c(12,6), 
                          epochs = 400)


#Predict model
predict <- h2o.predict(model,test.hex)

