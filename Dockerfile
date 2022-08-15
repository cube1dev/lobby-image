FROM amazoncorretto:17-alpine-jdk

ARG VELOCITY_SECRET

ENV VELOCITY_SECRET=${VELOCITY_SECRET}

WORKDIR /srv

ADD ./server/* /srv/
RUN mkdir /srv/lobby
ADD ./lobby /srv/lobby

RUN mkdir /srv/extensions
RUN wget https://github.com/Project-Cepi/Particable/releases/download/latest/particable-1.0.0-all.jar -P /srv/extensions
RUN wget https://github.com/cube1dev/lobby-extension/releases/download/latest/LobbyExtension-0.0.1-all.jar -P /srv/extensions
RUN wget https://github.com/EmortalMC/NBStom/releases/download/latest/NBStom-1.0.0-all.jar -P /srv/extensions
RUN wget https://github.com/Project-Cepi/Sabre/releases/download/latest/sabre-1.0.0-all.jar -P /srv
RUN chmod +x /srv/run.sh

ENTRYPOINT [ "/srv/run.sh" ]