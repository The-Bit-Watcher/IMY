# Dockerfile
# Build stage
FROM node:18-alpine as build

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build the React app
RUN npm run build

# Production stage
FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy built app from build stage
COPY --from=build /app/dist ./dist
COPY --from=build /app/backend ./backend

# Expose port
EXPOSE 5000

# Start the application
CMD ["npm", "start"]