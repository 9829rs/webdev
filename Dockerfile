FROM python:3.12-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Install MySQL client
RUN apt-get update && apt-get install -y \
    default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Install dependencies
COPY requirements.txt /workspace/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . /workspace/

# Expose port 5000 for Flask
EXPOSE 5000
