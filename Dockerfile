# build
FROM maven:3.5-jdk-8 as builder
WORKDIR /build
COPY . .
RUN mvn -B -e clean install -am -pl seyren-web -Dmaven.test.skip


FROM maven:3.5-jdk-8-slim
WORKDIR /data
COPY --from=builder /build .
COPY --from=builder /root/.m2 /root/.m2
CMD ["mvn","-B","-pl","seyren-web","tomcat7:run-war"]
