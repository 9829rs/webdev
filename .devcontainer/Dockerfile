# Use the official Python image from the Docker Hub
FROM python:3.9

# Install MySQL
RUN apt-get update && apt-get install -y mysql-server

# Set up a working directory
WORKDIR /workspace

# Copy the current directory contents into the container at /workspace
COPY . /workspace

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 3306 to the host
EXPOSE 3306
