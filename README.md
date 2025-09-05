npm run dev
npm run build

# Build the Docker
docker build -t version-control-app .

# Run the Docker
docker run -p 5000:5000 version-control-app