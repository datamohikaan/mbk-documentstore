FROM postgres:12
 
# Create the needed temp file before the first postgreSQL execution
 
# RUN mkdir temp
WORKDIR /temp
USER root
# Create group and user
 
RUN groupadd non-root-postgres-group
RUN useradd non-root-postgres-user --group non-root-postgres-group

#RUN useradd postgres # useradd: user 'postgres' already exists
#RUN chown postgres:postgres /var/export/vol1
#RUN chmod 777 /var/export/vol1
 
 
# Set user rights to allow the on-root-postgres-user 
# to access the temp folder
 

RUN chown -R non-root-postgres-user:non-root-postgres-group /temp

RUN chmod 777 /temp
RUN chown postgres:postgres /temp
 
# Change to non-root privilege
 
USER non-root-postgres