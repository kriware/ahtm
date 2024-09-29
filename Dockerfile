# Use a more specific and lightweight base image
FROM python:3.9-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

# Create and set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    wget \
    unzip \
    sudo \
    zip \
    xz-utils \
    openjdk-11-jre \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy only the necessary files initially
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .

# Installing AHTM
#RUN python setup.py install

# Create a user with a password
RUN useradd -m myuser && \
    echo "myuser:1234" | chpasswd && \
    adduser myuser sudo

# Command to open an interactive shell
CMD ["/bin/bash"]