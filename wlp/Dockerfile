FROM dockerfile/java
MAINTAINER Ewald Ertl <ewald.ertl@hartter.com>

ENV HTTP_PROXY <http://server:port>
ENV HTTPS_PROXY <http://server:port>
ENV http_proxy <http://server:port>
ENV https_proxy <http://server:port>
ENV _JAVA_OPTIONS -Djava.net.preferIPv4Stack=true
# change PS1 for InstallAnywhere Package mailformed encoding
ENV PS1 $PWD >

# install packages 
#RUN apt-get install -y rpm 
#RUN apt-get install -y ksh
#RUN apt-get install -y ssh
#RUN apt-get install -y supervisor
#RUN apt-get install -y libstdc++5

RUN mkdir /customization

COPY customization /customization

RUN cd /opt; jar -xf /customization/wlp-developers-runtime-8.5.5.0.jar; jar -xf /customization/wlp-developers-extended-8.5.5.0.jar
RUN chmod a+x /opt/wlp/bin/*
RUN cd /opt/wlp; bin/server create hsf2; mkdir -p /opt/wlp/usr/servers/hsf2/lib/global
RUN cp /customization/server.xml /opt/wlp/usr/servers/hsf2/server.xml; 

VOLUME ["/opt/wflp/usr/hsf2/dropins" ]
VOLUME ["/opt/wflp/usr/hsf2/apps" ]
VOLUME ["/opt/wlp/usr/servers/hsf2/logs" ]

CMD [ "/opt/wlp/bin/server", "run", "hsf2" ]