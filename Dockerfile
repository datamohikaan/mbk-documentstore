
#FROM postgres:12
FROM cir.chp.belastingdienst.nl/quayio/enterprisedb/postgresql@sha256:5c6c9ddcb8a3565dc593c9d4454872a3bc6cd091b756a9618fec5de2aa974d8f

# Create the needed temp file before the first postgreSQL execution
#https://suedbroecker.net/2020/06/23/run-a-postgressql-container-as-a-non-root-user-in-openshift/


USER root
RUN mkdir temp
WORKDIR /temp
RUN chmod a+rwx -R /temp

#RUN chmod a+rwx -R /var/lib/postgresql/data/pgdata
#RUN chmod a+rwx -R /var/run/postgresql
#RUN  chown -R 1002010000:1002010000 /var/lib/postgresql/data/pgdata


# Create group and user
ENV POSTGRES_PASSWORD=bdadmin
RUN groupadd non-root-postgres-group
RUN useradd non-root-postgres-user --group non-root-postgres-group

# Set user rights to allow the on-root-postgres-user 
# to access the temp folder

RUN chown -R non-root-postgres-user:non-root-postgres-group /temp

RUN chmod 777 /temp

# Change to non-root privilege
#POSTGRES_HOST_AUTH_METHOD=trust
USER non-root-postgres