#!/usr/bin/env bash
set -euo pipefail

ARTIFACT_DIR="artifacts"
ARTIFACT_NAME="configs.tar.gz"

mkdir -p "$ARTIFACT_DIR"
rm -f "$ARTIFACT_DIR/$ARTIFACT_NAME"

tar -czf "$ARTIFACT_DIR/$ARTIFACT_NAME" configs topology.yaml

echo "Created artifact: $ARTIFACT_DIR/$ARTIFACT_NAME"
