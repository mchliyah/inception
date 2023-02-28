# Use Debian Buster as the base image
FROM debian:buster

# Install necessary packages and dependencies
RUN apt-get update && apt-get install -y curl \
  && rm -rf /var/lib/apt/lists/*

# Download the latest CAdvisor binary
RUN curl -L https://github.com/google/cadvisor/releases/download/v0.38.0/cadvisor -o /usr/bin/cadvisor

# Make the binary executable
RUN chmod +x /usr/bin/cadvisor

# Expose port 8080 for the web UI
EXPOSE 8080

# Set the entrypoint to start CAdvisor
ENTRYPOINT ["/usr/bin/cadvisor", "--logtostderr"]