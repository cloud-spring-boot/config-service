FROM openjdk:8-jre-alpine
MAINTAINER Maksym Stepanenko <stepanenkomaksi@gmail.com>
RUN  apk update && apk upgrade && apk add netcat-openbsd && apk add bash && apk add curl && apk add tcpdump
RUN mkdir -p /usr/local/config-service
RUN mkdir -p /usr/local/config-service/pcap

RUN echo $JAVA_HOME

RUN cd /tmp/ && \
    curl -k -LO "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" -H 'Cookie: oraclelicense=accept-securebackup-cookie' && \
    unzip jce_policy-8.zip && \
    rm jce_policy-8.zip && \
    yes |cp -v /tmp/UnlimitedJCEPolicyJDK8/*.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/security/

ADD @project.build.finalName@.jar /usr/local/config-service/
ADD run.sh run.sh
RUN chmod +x run.sh
CMD ./run.sh