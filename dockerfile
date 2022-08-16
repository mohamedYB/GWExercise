# --------------- DÉBUT COUCHE OS -------------------
FROM debian:stable-slim
# --------------- FIN COUCHE OS ---------------------


# MÉTADONNÉES DE L'IMAGE
LABEL version="1.0" maintainer="YAHIA BEY Mohamed"


# VARIABLES TEMPORAIRES
ARG APT_FLAGS="-qq -y"
ARG DOCUMENTROOT="/var/www/html/"


# Début couche apache et docker
RUN apt-get update $APT_FLAGS && \
    apt-get install $APT_FLAGS apache2 && docker

#RUN sudo apt-get update -qq -y

# DÉMARRAGE DES SERVICES LORS DE L'EXÉCUTION DE L'IMAGE
ENTRYPOINT service apache2ctl $APT_FLAGS -D FOREGROUND

# OUVERTURE DU PORT HTTP
EXPOSE 8080

# RÉPERTOIRE DE TRAVAIL
WORKDIR  ${DOCUMENTROOT}
