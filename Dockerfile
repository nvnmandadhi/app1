FROM openjdk:13-alpine
RUN addgroup -S spring && adduser -S spring -G spring
COPY ./ ./
RUN ./mvnw clean
RUN ./mvnw package
ARG JAR_FILE=/target/*.jar
COPY --chown=spring:spring ${JAR_FILE} app.jar
USER spring:spring
ENTRYPOINT ["java","-jar","/app.jar"]