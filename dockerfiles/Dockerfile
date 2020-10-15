FROM webdevops/php-apache:7.4

LABEL MAINTAINER="Blake Mammen"
LABEL VERISION="1.0.0"

# Initialize needed Environment Variables
ENV PLEX_URL= \
    PLEX_TOKEN= \
    PHP_DATE_TIMEZONE=America/Chicago \
    REFRESH_RATE=1800

# Clone project and put in proper place
RUN git clone https://github.com/blake1029384756/Plex-Export.git /tmp/plex-export && \
    cd /tmp/plex-export && \
    cp -R . /app

RUN rm -rf /tmp/plex-export

# Create service to collect plex data on an interval
COPY /service/plex-export.sh /opt/docker/bin/service.d/
COPY /service/plex-export.conf /opt/docker/etc/supervisor.d/

RUN chmod +x /opt/docker/bin/service.d/plex-export.sh
Run chmod +x /app/cli.php