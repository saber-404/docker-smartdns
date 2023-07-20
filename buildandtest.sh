# docker buildx build -f Dockerfile -o type=docker,dest=- --platform linux/amd64 -t saberfordocker/smartdns . >1.tar
# docker load -i 1.tar
# docker compose up -d
docker buildx build -f Dockerfile --push --platform linux/386,linux/amd64,linux/arm64/v8,linux/arm/v7 -t saberfordocker/smartdns:1.0.0 -t saberfordocker/smartdns:latest .