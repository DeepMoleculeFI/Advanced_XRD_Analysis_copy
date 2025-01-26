import tensorflow as tf

# Create a random tensor and perform a computation
with tf.device('/GPU:0'):  # Force TensorFlow to use the GPU
    a = tf.random.normal([1000, 1000])
    b = tf.random.normal([1000, 1000])
    c = tf.matmul(a, b)

print("Computation completed. GPU is working!")