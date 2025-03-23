# Use Java 17 JRE image
FROM eclipse-temurin:17-jre-jammy

# Set working directory
WORKDIR /app

# Copy JAR file
COPY target/EmployeeService-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8085
EXPOSE 8085

# Start the Spring Boot application
CMD ["java", "-jar", "app.jar"]
