# Étape 1 : utiliser l'image officielle Antora
FROM docker.io/antora/antora:latest

# Étape 2 : définir le répertoire de travail
WORKDIR /antoraz

# Étape 3 : installer un serveur statique (via apk, car base Alpine)
RUN apk add --no-cache nodejs npm \
  && npm install -g http-server

# Étape 4 : générer le site au démarrage puis le servir
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["antora --stacktrace default-site.yml && http-server ./build/site -p 8080 -a 0.0.0.0"]
