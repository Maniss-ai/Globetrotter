# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy only the Maven wrapper and pom.xml first (for caching dependencies)
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Install Maven dependencies (this caches dependencies separately)
RUN ./mvnw dependency:go-offline

# Now copy the rest of the project files
COPY src ./src

# Build the project using Maven inside the container
RUN ./mvnw clean package -DskipTests

# Expose the application port
EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "target/globetrotter.jar"]
