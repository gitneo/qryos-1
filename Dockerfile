# Use Eclipse Temurin (Java 21) base image
FROM eclipse-temurin:21-jdk

# Set working directory
WORKDIR /app

# Copy your application JAR into the image
COPY target/qryosr-0.0.1-SNAPSHOT.jar /app/qryosr-0.0.1-SNAPSHOT.jar

# Expose a port (optional, change as needed)
EXPOSE 8080

# Default command to run your JAR
ENTRYPOINT ["java", "-jar", "/app/qryosr-0.0.1-SNAPSHOT.jar"]