#!/usr/bin/env bash

# Set KUBECONFIG
export KUBECONFIG=$HOME/.kube/config

# CD
cd $HOME/kong-course-gateway-ops-for-kubernetes/

# Local Environment Variables
export KONG_PROXY_PORT=30000
export KONG_PROXY_HOSTNAME=localhost
export KONG_SERVICE_HOSTNAME=${KONG_PROXY_HOSTNAME}
export KONG_PROXY_URI=${KONG_PROXY_HOSTNAME}:${KONG_PROXY_PORT}
export KONG_SERVICE_URI=${KONG_PROXY_HOSTNAME}:${KONG_PROXY_PORT}
export KONG_PROXY_URL="http://${KONG_PROXY_URI}"
export KONG_SERVICE_URL="http://${KONG_SERVICE_URI}"

export KONG_ADMIN_API_PORT=30001
export KONG_ADMIN_API_HOSTNAME=localhost
export KONG_ADMIN_API_URI=${KONG_ADMIN_API_HOSTNAME}:${KONG_ADMIN_API_PORT}
export KONG_ADMIN_API_URL="http://${KONG_ADMIN_API_URI}"

export KONG_MANAGER_PORT=30002
export KONG_MANAGER_HOSTNAME=localhost
export KONG_MANAGER_URI=${KONG_MANAGER_HOSTNAME}:${KONG_MANAGER_PORT}
export KONG_MANAGER_URL="http://${KONG_MANAGER_URI}"

export KONG_PORTAL_GUI_PORT=30003
export KONG_PORTAL_GUI_HOST=localhost
export KONG_PORTAL_GUI_URI=${KONG_PORTAL_GUI_HOST}:${KONG_PORTAL_GUI_PORT}
export KONG_PORTAL_GUI_URL="http://${KONG_PORTAL_GUI_URI}"

export KONG_PORTAL_API_PORT=30004
export KONG_PORTAL_API_HOSTNAME=localhost
export KONG_PORTAL_API_URI=${KONG_PORTAL_API_HOSTNAME}:${KONG_PORTAL_API_PORT}
export KONG_PORTAL_API_URL="http://${KONG_PORTAL_API_URI}"

# Keycloak for Kong Operations Course
export KEYCLOAK_PORT=8080
export KEYCLOAK_HOSTNAME=localhost
export KEYCLOAK_URI=${KEYCLOAK_HOSTNAME}:${KEYCLOAK_PORT}
export KEYCLOAK_URL="http://${KEYCLOAK_URI}"
export KEYCLOAK_CONFIG_ISSUER="http://${KEYCLOAK_URI}/auth/realms/kong/.well-known/openid-configuration"
export CLIENT_SECRET="681d81ee-9ff0-438a-8eca-e9a4f892a96b"
export KEYCLOAK_REDIRECT_URI=${KONG_SERVICE_URI}
export KEYCLOAK_REDIRECT_URL=${KONG_SERVICE_URL}

# Prometheus for Kong Operations Course
export PROMETHEUS_PORT=30006
export PROMETHEUS_HOSTNAME=localhost
export PROMETHEUS_URI=${PROMETHEUS_HOSTNAME}:${PROMETHEUS_PORT}
export PROMETHEUS_URL="http://${PROMETHEUS_URI}"

# Grafana for Kong Operations Course
export PROMETHEUS_PORT=30006
export PROMETHEUS_HOSTNAME=localhost
export PROMETHEUS_URI=localhost:${PROMETHEUS_PORT}
export PROMETHEUS_URL="http://${PROMETHEUS_URI}"
export GRAFANA_PORT=30005
export GRAFANA_HOSTNAME=localhost
export GRAFANA_URI=localhost:${GRAFANA_PORT}
export GRAFANA_URL="http://${GRAFANA_URI}"

# Get Current Directory
CURRENTDIR=`pwd`

# Teardown
./base/teardown.sh

# Install
./base/install.sh

# Deploy Docker Containers
cd ./docker-containers
docker-compose up -d

# Change back to directory
cd $CURRENTDIR

echo ""
echo "KONG MANAGER URL"
echo $KONG_MANAGER_URL