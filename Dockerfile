FROM ibmcom/websphere-liberty:kernel-java8-openj9-ubi

ADD --chown=1001:0 jts.war.tar.gz /config/apps/


# Add my app and config
COPY --chown=1001:0  ccm.war.zip /config/apps/
COPY --chown=1001:0  jts.war.zip /config/apps/
COPY --chown=1001:0  rm.war.zip /config/apps/
COPY --chown=1001:0  qm.war.zip /config/apps/
COPY --chown=1001:0  server.xml /config/


# Default setting for the verbose option
ARG VERBOSE=true

# This script will add the requested XML snippets, grow image to be fit-for-purpose and apply interim fixes
RUN configure.sh
