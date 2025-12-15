#!/bin/bash
# Unified Deployment Script
# Supports Production and Development environments

set -e

ENV=${1:-production}

echo "====================================="
echo "DevOps Simulator Deployment"
echo "====================================="

echo "Selected Environment: $ENV"

# Pre-deployment checks
echo "Running pre-deployment checks..."
if [ ! -f "config/app-config.yaml" ]; then
    echo "Error: Configuration file not found!"
    exit 1
fi

if [ "$ENV" == "production" ]; then
    echo "----- Production Deployment -----"

    DEPLOY_REGION="us-east-1"
    APP_PORT=8080

    echo "Region: $DEPLOY_REGION"
    echo "Port: $APP_PORT"

    echo "Pulling latest Docker images..."
    # docker pull devops-simulator:latest

    echo "Performing rolling update..."
    # kubectl rolling-update devops-simulator

    echo "Deployment completed successfully!"
    echo "Application available at: https://app.example.com"

elif [ "$ENV" == "development" ]; then
    echo "----- Development Deployment -----"

    DEPLOY_MODE="docker-compose"
    APP_PORT=3000
    ENABLE_DEBUG=true

    echo "Mode: $DEPLOY_MODE"
    echo "Port: $APP_PORT"
    echo "Debug: $ENABLE_DEBUG"

    echo "Installing dependencies..."
    npm install

    echo "Running tests..."
    npm test

    echo "Starting application using Docker Compose..."
    docker-compose up -d

    echo "Waiting for application to be ready..."
    sleep 5

    echo "Performing health check..."
    curl -f http://localhost:$APP_PORT/health || exit 1

    echo "Deployment completed successfully!"
    echo "Application available at: http://localhost:$APP_PORT"
    echo "Hot reload enabled"

else
    echo "❌ Invalid environment specified!"
    echo "Usage: ./deploy.sh [production|development]"
    exit 1
fi
