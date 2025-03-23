# Use an official image as the base
FROM openjdk:17
WORKDIR /app
COPY . /app
RUN javac Main.java
CMD ["java", "Main"]