FROM openjdk:11.0.12-oraclelinux8 AS BUILD_CODE

WORKDIR /build

COPY . .

RUN ./mvnw package

FROM openjdk:11.0.12-oraclelinux8 AS RUN_IMAGE
WORKDIR /petclinic
COPY --from=BUILD_CODE target/*.jar .
CMD["java", "-jar", "/petclinic/*.jar"]

