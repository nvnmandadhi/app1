FROM openjdk:13-alpine
RUN addgroup -S spring && adduser -S spring -G spring
COPY ./ ./
RUN ./mvnw -q clean
RUN ./mvnw -q package
ARG JAR_FILE=/target/*.jar
RUN echo ${JAR_FILE}
RUN chown spring:spring ${JAR_FILE}
USER spring:spring
ENTRYPOINT ["java","-jar", "${JAR_FILE}"]