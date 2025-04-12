## BUILD DA APLICAÇÃO E INDICA QUAL A VERSÃO DO JAVA SERA FEITA O BUILD 
FROM maven:3.8.4-openjdk-17 as build

##AJUSTA DATA-HORA
ENV TZ=America/Sao_Paulo

## COPIA SRC PARA /udemy-app/src
COPY src /udemy-app/src

## FAZ UMA COPIA DO pom.xml PARA /udemy-app
COPY pom.xml /udemy-app

## RETORNA PARA O DIRETORIO  /udemy-app
WORKDIR /udemy-app

## COMANDO MAVEN
RUN mvn clean install

## DIRETORIO JAVA 
FROM openjdk:22-ea-16-oracle

## PEGA O build  DA APLICAÇÃO E FAZ UMA COPIA PARA /udemy-app/udemy-proto-api-0.0.1.jar
COPY --from=build /udemy-app/target/udemy-proto-api-0.0.1.jar /udemy-app/udemy-proto-api-0.0.1.jar

## DIRETORIO /udemy-app
WORKDIR /udemy-app

##  QUAL A PORTA A APLICAÇÃO SERA EXECUTADA
EXPOSE 8080

##  EXECUTA OS COMANDO JAVA ABAIXO PARA O JAR udemy-proto-api-0.0.1.jar
CMD [ "java","-jar","udemy-proto-api-0.0.1.jar"]

