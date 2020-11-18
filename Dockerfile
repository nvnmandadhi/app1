FROM openjdk:13-alpine
COPY ./ ./
RUN ./mvnw -q clean
RUN ./mvnw -q package
RUN chmod 777 target
ENTRYPOINT ["java","-jar", "/target/*.jar"]