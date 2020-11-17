FROM openjdk:13-alpine
RUN addgroup -S spring && adduser -S spring -G spring
COPY ./ ./
RUN ./mvnw -q clean
RUN ./mvnw -q package
COPY --chown=spring:spring /target/*.jar /app.jar
USER spring:spring
ENTRYPOINT ["java","-jar", "/app.jar"]