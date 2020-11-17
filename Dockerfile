FROM openjdk:13-alpine
RUN addgroup -S spring && adduser -S spring -G spring
COPY ./ ./
RUN ./mvnw -q clean
RUN ./mvnw -q package
ARG JAR_FILE=target/*.jar
RUN ls -la target
COPY --chown=spring:spring ${JAR_FILE} app.jar
USER spring:spring
ENTRYPOINT ["java","-jar", "/app.jar"]