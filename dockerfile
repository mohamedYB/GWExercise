# --------------- DÉBUT COUCHE OS -------------------
FROM debian:stable-slim
# --------------- FIN COUCHE OS ---------------------


# MÉTADONNÉES DE L'IMAGE
LABEL version="1.0" maintainer="YAHIA BEY Mohamed"


# VARIABLES TEMPORAIRES
ARG APT_FLAGS="-q -y"
ARG DOCUMENTROOT="/var/www/html/"

# Mise à jour des repository distant du container, avant d'installer les paquets requis pour le projet
RUN apt update && apt upgrade -y

# Permet d'éviter d'avoir le bug concernant le choix de la timezone
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

# --------------- DÉBUT COUCHE APACHE ---------------
RUN apt-get update -y && \
    apt-get install ${APT_FLAGS} apache2
# --------------- FIN COUCHE APACHE -----------------

# DÉMARRAGE DES SERVICES LORS DE L'EXÉCUTION DE L'IMAGE
ENTRYPOINT service apache2ctl -D FOREGROUND

# OUVERTURE DU PORT HTTP
EXPOSE 80

# RÉPERTOIRE DE TRAVAIL
WORKDIR  ${DOCUMENTROOT}
