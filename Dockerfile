# Use a base image with Java pre-installed
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled JAR file into the container
COPY target/SimpleCalculator-1.0.0.jar ./app.jar

# Expose the application's port (if applicable)
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "app.jar"]
