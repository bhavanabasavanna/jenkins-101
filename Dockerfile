FROM jenkins/jenkins:lts-jdk17

USER root

# Install Docker CLI
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*

# Add Jenkins user to Docker group
RUN usermod -aG docker jenkins

USER jenkins

# Install latest plugins
RUN jenkins-plugin-cli --plugins \
    blueocean \
    docker-workflow \
    workflow-aggregator \
    git

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

EXPOSE 8080 50000
