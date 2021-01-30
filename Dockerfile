FROM ibmcom/websphere-liberty:kernel-java8-openj9-ubi

# Add my app and config
COPY --chown=1001:0  apps/ccm.war.zip /config/dropins/
COPY --chown=1001:0  apps/jts.war.zip /config/dropins/
COPY --chown=1001:0  apps/rm.war.zip /config/dropins/
COPY --chown=1001:0  apps/qm.war.zip /config/dropins/
COPY --chown=1001:0  server.xml /config/
COPY --chown=1001:0  conf/basicUserRegistry.xml /config/conf/
COPY --chown=1001:0  conf/application.xml /config/conf/

# Default setting for the verbose option
ARG VERBOSE=true

# This script will add the requested XML snippets, grow image to be fit-for-purpose and apply interim fixes
RUN configure.sh
