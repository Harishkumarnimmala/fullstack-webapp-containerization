#!/bin/bash

set -e

echo "🔧 Checking for required packages..."

# Install OpenJDK 17 if not already installed
if ! java -version 2>&1 | grep -q '17'; then
  echo "☕ Installing OpenJDK 17..."
  sudo apt update
  sudo apt install -y openjdk-17-jdk
fi

# Set JAVA_HOME & PATH (corrected for ARM64)
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-arm64"
export PATH="$JAVA_HOME/bin:$PATH"
echo "✅ JAVA_HOME set to $JAVA_HOME"

# Install Maven if not already installed
if ! command -v mvn &> /dev/null; then
  echo "🧱 Installing Maven..."
  sudo apt install -y maven
fi

# Confirm Maven works
mvn -version

# Clone the repo if not already cloned
if [ ! -d fullstack-webapp-containerization ]; then
  echo "📦 Cloning project..."
  git clone git@github.com:Harishkumarnimmala/fullstack-webapp-containerization.git
fi

cd fullstack-webapp-containerization

# Run Maven build
echo "🚀 Running Maven build..."
mvn clean install -Dmaven.test.skip=true


echo "✅ Build complete."
