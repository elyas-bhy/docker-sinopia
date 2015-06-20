FROM node:0.12
MAINTAINER so0k <vincent.drl@gmail.com>
RUN adduser --disabled-password --gecos "" sinopia && \
    mkdir -p /opt/sinopia/storage
WORKDIR /opt/sinopia
RUN npm install js-yaml sinopia && \
    chown -R sinopia:sinopia /opt/sinopia && \
    npm cache clean

USER sinopia
ADD config_gen.js start.sh /opt/sinopia/

CMD ["/opt/sinopia/start.sh"]
EXPOSE 4873
VOLUME ["/opt/sinopia"]