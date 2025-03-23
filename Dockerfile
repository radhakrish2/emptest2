# Use official openjdk base image
FROM openjdk:17-jdk-slim as build

# Set the working directory inside the container
WORKDIR /app

# Copy the maven build artifact (assuming you're using Maven)
COPY target/*.jar app.jar

# Command to run the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
