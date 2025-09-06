# Base image with Node.js
FROM node:18

# Install dependencies
RUN apt-get update && apt-get install -y curl unzip

# Install Flowise
RUN npm install -g flowise

# Install Ollama (binary inside container)
RUN curl -L https://ollama.ai/download/OllamaLinux.zip -o ollama.zip \
    && unzip ollama.zip -d /usr/local/bin \
    && rm ollama.zip

# Create app directory
WORKDIR /app

# Copy your chatflow JSON into Flowise default folder
RUN mkdir -p /root/.flowise/chatflows
COPY "Nagar_Setu_Chatbot_Chatflow.json" /root/.flowise/chatflows/Nagar_Setu_Chatbot_Chatflow.json

# Make sure Ollama binary is executable and in PATH
RUN chmod +x /usr/local/bin/ollama

# Expose ports
EXPOSE 3000 11434

# Start Ollama + Flowise together
CMD ollama serve & flowise start --PORT 3000
