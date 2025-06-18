# 🚀 Portfolio Harel Franck - Développeur Web & Designer

Portfolio professionnel avec thème cyber développé en HTML/CSS, containerisé avec Docker pour un déploiement facile et optimisé.

## 🎯 Caractéristiques

- **Design Cyberpunk** : Interface moderne avec effets visuels avancés
- **Responsive Design** : Optimisé pour tous les appareils
- **Performance** : Optimisé avec Nginx et compression Gzip
- **Sécurité** : Headers de sécurité configurés
- **Docker Ready** : Containerisation complète avec Docker Compose

## 🛠️ Technologies Utilisées

- HTML5/CSS3
- Nginx (serveur web)
- Docker & Docker Compose
- Google Fonts (Orbitron, Rajdhani, Fira Code)

## 📦 Installation avec Docker

### Prérequis
- Docker installé
- Docker Compose installé

### Déploiement Rapide

1. **Cloner le projet**
```bash
git clone <votre-repo>
cd portfolio-test
```

2. **Construire et démarrer avec Docker Compose**
```bash
docker-compose up -d
```

3. **Accéder au portfolio**
```
http://localhost:8080
```

### Commandes Docker Utiles

```bash
# Construire l'image
docker build -t harel-portfolio .

# Démarrer le conteneur
docker run -d -p 8080:80 --name portfolio harel-portfolio

# Voir les logs
docker logs portfolio

# Arrêter le conteneur
docker stop portfolio

# Supprimer le conteneur
docker rm portfolio

# Nettoyer les images
docker system prune -a
```

## 🔧 Configuration

### Variables d'Environnement
- `NGINX_HOST` : Nom d'hôte (défaut: localhost)
- `NGINX_PORT` : Port Nginx (défaut: 80)

### Ports
- **8080** : Port d'accès au portfolio
- **9113** : Port du monitoring Nginx (optionnel)

## 📊 Monitoring

Le projet inclut un exporter Prometheus pour le monitoring :
- URL : `http://localhost:9113/metrics`
- Compatible avec Grafana et Prometheus

## 🚀 Déploiement en Production

### Avec Docker Compose
```bash
# Production avec restart automatique
docker-compose -f docker-compose.yml up -d

# Vérifier le statut
docker-compose ps
```

### Avec Docker Swarm
```bash
# Initialiser le swarm
docker swarm init

# Déployer le stack
docker stack deploy -c docker-compose.yml portfolio
```

### Avec Kubernetes
```bash
# Créer le namespace
kubectl create namespace portfolio

# Appliquer les manifests
kubectl apply -f k8s/
```

## 🔒 Sécurité

- Headers de sécurité configurés
- Protection XSS et CSRF
- Content Security Policy
- Cache sécurisé pour les ressources statiques

## 📈 Performance

- Compression Gzip activée
- Cache optimisé pour les fichiers statiques
- Images optimisées
- Lazy loading des ressources

## 🐛 Dépannage

### Problèmes Courants

1. **Port déjà utilisé**
```bash
# Changer le port dans docker-compose.yml
ports:
  - "8081:80"  # Au lieu de 8080:80
```

2. **Problèmes de permissions**
```bash
# Vérifier les permissions
ls -la
chmod 644 index.html style.css
```

3. **Conteneur ne démarre pas**
```bash
# Vérifier les logs
docker logs harel-portfolio

# Reconstruire l'image
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

## 📝 Structure du Projet

```
portfolio-test/
├── index.html          # Page principale
├── style.css           # Styles CSS
├── Dockerfile          # Configuration Docker
├── docker-compose.yml  # Orchestration Docker
├── nginx.conf          # Configuration Nginx
├── .dockerignore       # Fichiers ignorés par Docker
└── README.md           # Documentation
```

## 🤝 Contribution

1. Fork le projet
2. Créer une branche feature (`git checkout -b feature/AmazingFeature`)
3. Commit les changements (`git commit -m 'Add AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 📞 Contact

- **Email** : harelfranck24@gmail.com
- **GitHub** : [github.com/1001franck](https://github.com/1001franck)
- **LinkedIn** : [linkedin.com/HAREL FRANCK](https://www.linkedin.com/feed/)
- **Discord** : harel_franck
- **Telegram** : @HarelFranck

---

**Développé  par Harel Franck** 