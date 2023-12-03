#FROM cir.chp.belastingdienst.nl/quayio/enterprisedb/postgresql:latest
FROM FROM quay.io/enterprisedb/postgresql:latest

ENV POSTGRES_USER=user1
ENV POSTGRES_PASSWORD=password1
ENV POSTGRES_DB=database1


#add storage persistant volume claims
#pvc1 = '/var/lib/postgresql/data'  mbk-documentstore-var-lib-postgresql-data
#pvc2 = '/var/run/postgresql'   mbk-documentstore-var-run-postgresql

# https://www.postgresqltutorial.com/postgresql-administration/postgresql-show-tables/
# psql -d database1 -U user1
#/dt 
# select upload_moment, model_name||file_extension from public.modellen order by upload_moment desc;
# select upload_moment + interval '2 hours', 
# model_name||file_extension from public.modellen order by upload_moment desc;

# 👇
# SELECT *
# FROM pg_catalog.pg_tables
# WHERE schemaname != 'pg_catalog' AND 
#     schemaname != 'information_schema';
# hope the run will be okay!

# sh-4.4$ psql -U user1 -d database1
# psql (16.0)
# Type "help" for help.
# 
# database1=# select upload_moment, model_name||file_extension from public.modellen order by upload_moment desc;
#        upload_moment        |                                     ?column?                                     
# ----------------------------+----------------------------------------------------------------------------------
#  2023-09-29 11:41:29.08234  | ziekteverzuim.xlsx
#  2023-09-29 11:40:46.460872 | kg_locatie_-_bag_-_begripsmodel_-_v1.0.0_-_2022-10-26_4_.xlsx
#  2023-09-28 17:37:06.880227 | LGD_EXM_Ander_kennisgebied_Kern.ldm
#  2023-09-28 17:35:41.491478 | KG_Formeel_recht_-_begripsmodel_Formeel_recht_-_R1.0.0_snapshot_2_V20230503.xlsx
#  2023-09-28 14:31:13.139095 | download_ziekteverzuim.xlsx
#  2023-09-28 14:18:30.298497 | SM_VDA_logisch_gegevensmodel.xlsx
#  2023-09-28 13:38:49.1746   | ziekteverzuim.xlsx
# (7 rows)
