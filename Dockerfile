# Use a base image that supports your application requirements
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the trained model file
COPY model/model_binary.dat.gz /app/model/model_binary.dat.gz

# Copy the requirements.txt file
COPY requirements.txt /app

# Install dependencies
RUN pip install -r requirements.txt

# Copy the code_model_training directory
COPY code_model_training /app/code_model_training

# Copy the data directory (if needed)
COPY data /app/data

# Copy the ms directory (if needed)
COPY ms /app/ms

# Copy any additional files needed
COPY app.py /app/app.py
COPY Dockerfile /app/Dockerfile
COPY README.md /app/README.md
COPY tests /app/tests

# Specify the command to run your application
CMD ["python", "app.py"]
