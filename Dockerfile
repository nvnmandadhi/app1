FROM openjdk:13-alpine
COPY ./ ./
RUN ./mvnw -q clean
RUN ./mvnw -q package
ENTRYPOINT ["java","-jar", "target/*.jar"]