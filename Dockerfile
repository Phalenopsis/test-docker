# Écris ici le dockerfile de ton app Spring
FROM maven:latest as app-build
WORKDIR /usr/app
COPY pom.xml ./
RUN mvn verify --fail-never
COPY ./src ./src
COPY wait-for-mysql.sh ./
RUN mvn clean package -DskipTests
RUN echo "tadam"

FROM eclipse-temurin:21-jre-alpine
WORKDIR usr/app
COPY --from=app-build ./usr/app/target/*.jar ./app.jar
COPY --from=app-build ./usr/app/wait-for-mysql.sh ./wait-for-mysql.sh
RUN chmod +x wait-for-mysql.sh
EXPOSE 8080
CMD ["./wait-for-mysql.sh"]
