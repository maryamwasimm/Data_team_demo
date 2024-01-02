# Use Node.js 14 base image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package.json and install npm dependencies
COPY package*.json ./
RUN npm install

# Install AWS CLI
RUN apt-get update && \
    apt-get install -y awscli && \
    rm -rf /var/lib/apt/lists/*

# Configure AWS CLI with credentials
RUN aws configure set aws_access_key_id AKIAWVGXMVP4BJF27O6O && \
    aws configure set aws_secret_access_key 73z]P#{bSjJf&E2M1cLp && \
    aws configure set default.region us-east-1

# Copy the application code
COPY . .

# Expose the application port
EXPOSE 3000

# Define the default command to start the application
CMD ["npm", "start"]
