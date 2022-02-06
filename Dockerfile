FROM hseeberger/scala-sbt:8u222_1.3.5_2.13.1

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y git curl
RUN curl -fsSL https://code-server.dev/install.sh | sh
WORKDIR /app-ini
COPY start.sh start.sh
RUN chmod u+x start.sh
WORKDIR /app

CMD ["/app-ini/start.sh"]
