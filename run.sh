#!/bin/bash

# FKS Forex Service - Run Script

set -e

cd "$(dirname "$0")"

# Activate virtual environment if it exists
if [ -d ".venv" ]; then
    source .venv/bin/activate
elif [ -d "../.venv" ]; then
    source ../.venv/bin/activate
fi

# Set Python path
export PYTHONPATH="${PYTHONPATH}:$(pwd)/src"

# Run the service
exec uvicorn main:app --host 0.0.0.0 --port "${PORT:-8000}" --reload
