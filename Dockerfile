# build
FROM maven:3.5-jdk-8 as builder
WORKDIR /build
COPY . .
RUN mvn -B -e clean install -am -pl seyren-web -Dmaven.test.skip


FROM maven:3.5-jdk-8-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean
WORKDIR /data
COPY --from=builder /build .
COPY --from=builder /root/.m2 /root/.m2
ADD run-seyren.sh /usr/bin/run-seyren.sh
RUN chmod +x /usr/bin/run-seyren.sh

ENTRYPOINT ["/usr/bin/run-seyren.sh"]
EXPOSE 8080

