FROM node:18

RUN apt-get update && apt-get install -y curl unzip

# Install Flowise
RUN npm install -g flowise

# Create app directory
WORKDIR /app

# Copy your chatflow JSON into Flowise default folder
RUN mkdir -p /root/.flowise/chatflows
COPY ./ /root/.flowise/chatflows/Nagar_Setu_Chatbot_Chatflow.json


EXPOSE 3000

CMD flowise start --PORT 3000
