FROM debian:bookworm-slim

MAINTAINER Kaycon "kaycon1@web.de"

# Set workdir
WORKDIR /jdownloader

# Install required packages
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        default-jre \
        wget && \
    wget http://installer.jdownloader.org/JDownloader.jar && \
    apt-get remove -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download JDownloader2
RUN wget http://installer.jdownloader.org/JDownloader.jar

# Volume for downloads and config
VOLUME ["/root/Downloads", "/jdownloader/cfg"]

# Start JDownloader2 in headless mode
ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "JDownloader.jar", "-norestart"]
