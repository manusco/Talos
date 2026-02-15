# ==============================================================================
# OpenClaw Custom Build
# ==============================================================================
# Why custom? 
# 1. We need Headless Chrome for browser automation skills.
# 2. We want to control the exact Node version (v22).
# 3. We want to run as a non-root user for security.

FROM node:22-bookworm-slim

# Install system dependencies for Chromium (Headless)
RUN apt-get update && apt-get install -y \
    chromium \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgcc1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    lsb-release \
    wget \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Install OpenClaw Global Package
# This pulls the latest version from NPM. To pin a version, use @<version>
RUN npm install -g openclaw@latest

# Create a non-root user 'node' (already exists in base image) and set permissions
# OpenClaw writes to ~/.openclaw by default
RUN mkdir -p /home/node/.openclaw && chown -R node:node /home/node/.openclaw

USER node
WORKDIR /home/node

# Expose the gateway port
EXPOSE 18789

# Entrypoint: Start the OpenClaw Gateway
# We use 'npx' execution to ensure we use the installed package
CMD ["openclaw", "gateway", "--port", "18789"]
