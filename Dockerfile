FROM openjdk:11

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y git curl
RUN curl -fsSL https://code-server.dev/install.sh | sh
WORKDIR /tmp
RUN curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs
RUN chmod +x cs
RUN yes | ./cs setup
WORKDIR /app-ini
COPY start.sh start.sh
RUN chmod u+x start.sh
RUN echo "export PATH=\"\$PATH:/root/.local/share/coursier/bin:/usr/local/openjdk-11/bin\"" >> /root/.bashrc
WORKDIR /app

CMD ["/app-ini/start.sh"]
