FROM openjdk:13-alpine
COPY ./ ./
RUN ./mvnw -q clean
RUN ./mvnw -q package
COPY /target/*.jar /app.jar
ENTRYPOINT ["java","-jar", "/app.jar"]