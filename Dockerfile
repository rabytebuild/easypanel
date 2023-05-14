# Start with a base image
FROM ubuntu:20.04

# Update the package index and install required dependencies
RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract Easypanel
RUN curl -L https://downloads.easypanel.io/easypanel-latest.zip -o easypanel.zip && \
    unzip easypanel.zip -d /opt/easypanel && \
    rm -f easypanel.zip

# Expose the necessary ports
EXPOSE 80 443

# Set the working directory and entry point
WORKDIR /opt/easypanel
ENTRYPOINT ["./start.sh"]
