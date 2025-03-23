# Use Java 17 JRE image
FROM eclipse-temurin:17-jre-jammy

# Set working directory
WORKDIR /app

# Copy JAR file
COPY target/EmployeeService-0.0.1-SNAPSHOT.jar app.jar

# Expose the default port (optional, Cloud Run ignores this)
EXPOSE 8080

# Start the Spring Boot application with a dynamic port
CMD ["java", "-jar", "app.jar"]
