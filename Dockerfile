# Use an official Maven image as a base image
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the POM file and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the application files
COPY src ./src

# Build the application
RUN mvn package

# Use a lightweight Java image as the final base image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage to the final stage
COPY --from=build /app/target/SimpleCalculator-1.0.0.jar .

# Command to run the application
CMD ["java", "-jar", "SimpleCalculator-1.0.0.jar"]
