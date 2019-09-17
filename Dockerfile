FROM tomcat:8.5-jdk8
LABEL MAINTAINERS="Markus Döring <mdoering@gbif.org>, Matthew Blissett <mblissett@gbif.org>"

ARG IPT_VERSION

ENV IPT_DATA_DIR=/srv/ipt

RUN rm -Rf /usr/local/tomcat/webapps \
    && mkdir -p /usr/local/tomcat/webapps/ROOT \
    && mkdir -p ${IPT_DATA_DIR} \
    && curl -LSsfo ipt.war https://repository.gbif.org/repository/releases/org/gbif/ipt/${IPT_VERSION}/ipt-${IPT_VERSION}.war \
    && unzip -d /usr/local/tomcat/webapps/ROOT ipt.war \
    && rm -f ipt.war

VOLUME /srv/ipt

EXPOSE 8080
CMD ["catalina.sh", "run"]
