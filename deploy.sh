#!/usr/bin/env bash
# One-shot deployment inside a GitHub Codespace: build both images, create a Docker network, start containers.
set -e
docker network create superkart-net 2>/dev/null || true
docker build -t superkart-backend ./backend
docker build -t superkart-frontend ./frontend
docker rm -f backend frontend 2>/dev/null || true
docker run -d --name backend  --network superkart-net -p 7860:7860 superkart-backend
docker run -d --name frontend --network superkart-net -p 8501:8501 superkart-frontend
sleep 5 && docker ps && curl -s http://localhost:7860/ && echo
echo "Now open the PORTS tab, set 7860 and 8501 to Public, and copy their forwarded URLs."
