# Use the official TensorFlow image as the base image
FROM tensorflow/tensorflow:2.8.1-gpu

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    tar \
    gzip \
    libxm4 \
    libmotif-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip && \
    pip install numpy==1.23.1

# Set up FullProf Suite
# Step 1: Create a directory for FullProf Suite
RUN mkdir -p /opt/FullProf_Suite

# Step 2: Download and extract FullProf Suite
RUN wget -O /opt/FullProf_Suite/FullProf_Suite_Linux64.tgz "https://www.ill.eu/sites/fullprof/downloads/FullProf_Suite_December2017_Linux64.tgz" && \
    tar -xzvf /opt/FullProf_Suite/FullProf_Suite_Linux64.tgz -C /opt/FullProf_Suite && \
    rm /opt/FullProf_Suite/FullProf_Suite_Linux64.tgz

# Step 3: Set environment variables for FullProf Suite
ENV FULLPROF=/opt/FullProf_Suite
ENV PATH=$FULLPROF:$PATH

# Step 4: Verify the installation
RUN echo "FULLPROF is set to: $FULLPROF" && \
    echo "PATH is set to: $PATH"

# Set up the working directory
WORKDIR /workspace

# Copy the Jupyter Notebook files into the container
COPY ./XRD_analysis.ipynb /workspace/XRD_analysis.ipynb
COPY ./XRD_Generator.ipynb /workspace/XRD_Generator.ipynb

# Set the default command to bash (so you can attach to the container)
CMD ["bash"]