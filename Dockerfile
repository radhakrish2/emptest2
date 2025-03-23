# Use a lightweight JDK 17 base image
FROM eclipse-temurin:17-jdk-jammy AS build

# Set working directory
WORKDIR /app

# Copy Maven wrapper and pom.xml for dependency caching
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Give execute permission to Maven Wrapper
RUN chmod +x ./mvnw

# Convert Windows line endings to Unix format (if necessary)
RUN apt-get update && apt-get install -y dos2unix
RUN dos2unix ./mvnw

# Download dependencies separately to optimize caching
RUN ./mvnw dependency:resolve

# Copy application source code
COPY src ./src

# Build the application
RUN ./mvnw package -DskipTests

# Use a smaller JRE image for the final execution
FROM eclipse-temurin:17-jre-jammy AS runtime

# Set working directory
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/EmployeeService-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 (Spring Boot default port)
EXPOSE 8080

# Set the entry point for the application
CMD ["java", "-jar", "app.jar"]
