# build
FROM maven:3.5-jdk-8
WORKDIR /data
COPY . .
RUN mvn -B -e clean install -am -pl seyren-web -Dmaven.test.skip

CMD ["mvn","-B","-pl","seyren-web","tomcat7:run-war"]

