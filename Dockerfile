FROM n8nio/n8n:1.101.0

USER root

# Install any additional system packages if needed
RUN apt-get update && \
    apt-get install -y \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# Switch back to n8n user
USER node

# The official image already has all the necessary n8n setup
# Just expose the port and set the command
EXPOSE 5678

CMD ["n8n", "start"]
