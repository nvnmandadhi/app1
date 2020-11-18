FROM openjdk:13-alpine
COPY ./ ./
RUN ./mvnw -q clean
RUN ./mvnw -q package
ARG JAR_FILE=target/*.jar
ENTRYPOINT ["java","-jar", "${JAR_FILE}"]