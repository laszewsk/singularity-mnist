## Set up TensorFlow
#Import TensorFlow into your program to get started:


import tensorflow as tf
print("TensorFlow version:", tf.__version__)

from cloudmesh.common.StopWatch import StopWatch

print("Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))

# Load a dataset

StopWatch.start("Total runtime")## stop watch for total time


mnist = tf.keras.datasets.mnist

StopWatch.start("Loading in Data")## stop watch for loading in data

(x_train, y_train), (x_test, y_test) = mnist.load_data()

StopWatch.stop("Loading in Data")

x_train, x_test = x_train / 255.0, x_test / 255.0

"""## Build a machine learning model

Build a `tf.keras.Sequential` model:
"""

model = tf.keras.models.Sequential([
  tf.keras.layers.Flatten(input_shape=(28, 28)),
  tf.keras.layers.Dense(128, activation='relu'),
  tf.keras.layers.Dropout(0.2),
  tf.keras.layers.Dense(10)
])

predictions = model(x_train[:1]).numpy()
predictions

"""The `tf.nn.softmax` function converts these logits to *probabilities* for each class: """

tf.nn.softmax(predictions).numpy()

"""
Define a loss function for training using `losses.SparseCategoricalCrossentropy`:
"""

loss_fn = tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True)



loss_fn(y_train[:1], predictions).numpy()


model.compile(optimizer='adam',
              loss=loss_fn,
              metrics=['accuracy'])

"""## Train and evaluate your model

Use the `Model.fit` method to adjust your model parameters and minimize the loss: 
"""

StopWatch.start("Model Fitting") ## stop watch for model fitting

model.fit(x_train, y_train, epochs=5)

StopWatch.stop("Model Fitting")

"""The `Model.evaluate` method checks the model's performance, usually on a [validation set](https://developers.google.com/machine-learning/glossary#validation-set) or [test set](https://developers.google.com/machine-learning/glossary#test-set)."""

StopWatch.start("Model Evaluation") ## StopWatch for model evaluation
model.evaluate(x_test,  y_test, verbose=2)

StopWatch.stop("Model Evaluation")

probability_model = tf.keras.Sequential([
  model,
  tf.keras.layers.Softmax()
])



probability_model(x_test[:5])



StopWatch.stop("Total runtime")

StopWatch.benchmark()
