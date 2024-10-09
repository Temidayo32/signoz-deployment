# Use an official lightweight base image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    git \
    curl \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Clone the SigNoz repository
RUN git clone -b main https://github.com/SigNoz/signoz.git .

# Change to the deploy directory
WORKDIR /app/signoz/deploy

# Run the install script
RUN chmod +x install.sh && ./install.sh

# Expose the necessary ports
EXPOSE 4317 4318 3000 3001

# Define the entrypoint
CMD ["bash"]
