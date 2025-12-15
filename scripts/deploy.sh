#!/bin/bash
# Unified Deployment Script

set -e

ENV=${1:-production}

echo "Deploying DevOps Simulator"
echo "Environment: $ENV"

if [ "$ENV" = "production" ]; then
  echo "Running production deployment"
  # kubectl apply -f prod.yaml
elif [ "$ENV" = "development" ]; then
  echo "Running development deployment"
  # docker-compose up -d
else
  echo "Invalid environment"
  exit 1
fi

# Experimental deployment (disabled)
# export EXPERIMENTAL=true
