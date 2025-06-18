# Utiliser une image de base légère avec Nginx
FROM nginx:alpine

# Copier les fichiers du portfolio
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Copier la configuration Nginx personnalisée
COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port 80
EXPOSE 80

# Définir les métadonnées
LABEL maintainer="Harel Franck <harelfranck24@gmail.com>"
LABEL description="Portfolio Web Développeur - Harel Franck"
LABEL version="1.0"

# Commande par défaut
CMD ["nginx", "-g", "daemon off;"] 