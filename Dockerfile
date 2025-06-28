# Use OpenJDK base image
FROM openjdk:17-jdk

# Set working directory
WORKDIR /app

# Copy JAR file into the container
COPY target/employee-management-0.0.1-SNAPSHOT.jar /app/employee-management.jar

# Expose port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "employee-management.jar"]
