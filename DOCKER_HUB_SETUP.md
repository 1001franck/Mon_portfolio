# 🐳 Publication Docker Hub - Portfolio Harel Franck

## 🎯 Objectif
Publier votre portfolio sur Docker Hub pour obtenir un lien partageable avec votre professeur.

## 📋 Étapes pour Publier sur Docker Hub

### 1. Créer un Compte Docker Hub
```
https://hub.docker.com/signup
```

### 2. Se Connecter à Docker Hub
```bash
docker login
# Entrez votre nom d'utilisateur et mot de passe Docker Hub
```

### 3. Construire l'Image Locale
```bash
docker build -t harel-portfolio .
```

### 4. Tagger l'Image pour Docker Hub
```bash
# Remplacez "votre-username" par votre nom d'utilisateur Docker Hub
docker tag harel-portfolio votre-username/harel-portfolio:latest
```

### 5. Pousser l'Image sur Docker Hub
```bash
docker push votre-username/harel-portfolio:latest
```

## 🔗 Liens à Envoyer à Votre Professeur

### Lien Docker Hub Principal
```
https://hub.docker.com/r/votre-username/harel-portfolio
```

### Commande de Déploiement
```bash
docker run -d -p 8080:80 votre-username/harel-portfolio:latest
```

### Lien d'Accès (après déploiement)
```
http://localhost:8080
```

## 🚀 Déploiement Rapide pour le Professeur

### Option 1 : Une seule commande
```bash
docker run -d -p 8080:80 --name portfolio-harel votre-username/harel-portfolio:latest
```

### Option 2 : Avec Docker Compose
```yaml
# docker-compose.yml pour le professeur
version: '3.8'
services:
  portfolio:
    image: votre-username/harel-portfolio:latest
    ports:
      - "8080:80"
    restart: unless-stopped
```

## 📧 Message à Envoyer au Professeur

```
Bonjour Professeur,

Voici le lien Docker de mon portfolio :

🐳 Docker Hub : https://hub.docker.com/r/votre-username/harel-portfolio

🚀 Pour déployer mon portfolio :
docker run -d -p 8080:80 votre-username/harel-portfolio:latest

🌐 Accès : http://localhost:8080

Technologies utilisées :
- HTML5/CSS3 avec thème cyber
- Nginx pour le serveur web
- Docker pour la containerisation
- Design responsive et moderne

Cordialement,
Harel Franck
```

## 🔧 Commandes Utiles

### Vérifier l'image publiée
```bash
docker search votre-username/harel-portfolio
```

### Tester l'image
```bash
docker pull votre-username/harel-portfolio:latest
docker run -d -p 8080:80 votre-username/harel-portfolio:latest
```

### Mettre à jour l'image
```bash
docker build -t votre-username/harel-portfolio:latest .
docker push votre-username/harel-portfolio:latest
```

## 📊 Statistiques Docker Hub

Une fois publié, vous pourrez voir :
- Nombre de téléchargements
- Évaluations
- Commentaires
- Tags disponibles

## 🎯 Checklist de Publication

- [ ] Compte Docker Hub créé
- [ ] Connecté avec `docker login`
- [ ] Image construite localement
- [ ] Image taggée correctement
- [ ] Image poussée sur Docker Hub
- [ ] Lien testé et fonctionnel
- [ ] Message préparé pour le professeur

---

**Prêt à envoyer à votre professeur ! 🚀** 