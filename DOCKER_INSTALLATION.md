# 🐳 Installation Docker pour Windows - Portfolio Harel Franck

## 📋 Prérequis

- Windows 10/11 (64-bit)
- WSL2 activé (Windows Subsystem for Linux 2)
- Virtualisation activée dans le BIOS

## 🚀 Installation Docker Desktop

### 1. Télécharger Docker Desktop
```bash
# Lien officiel Docker Desktop pour Windows
https://www.docker.com/products/docker-desktop/
```

### 2. Installer Docker Desktop
1. Exécuter le fichier `Docker Desktop Installer.exe`
2. Suivre l'assistant d'installation
3. Redémarrer l'ordinateur si demandé

### 3. Vérifier l'installation
```bash
# Ouvrir PowerShell et taper :
docker --version
docker-compose --version
```

## 🔧 Configuration WSL2 (si nécessaire)

### Activer WSL2
```powershell
# Ouvrir PowerShell en tant qu'administrateur
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

### Installer le kernel Linux
```bash
# Télécharger et installer :
https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
```

### Définir WSL2 par défaut
```powershell
wsl --set-default-version 2
```

## 🎯 Déploiement du Portfolio

### 1. Ouvrir le terminal dans le dossier du projet
```bash
cd "C:\Users\OMEN\Documents\PORTFOLIO TEST"
```

### 2. Construire l'image Docker
```bash
docker build -t harel-portfolio .
```

### 3. Démarrer le conteneur
```bash
docker run -d -p 8080:80 --name portfolio harel-portfolio
```

### 4. Ou utiliser Docker Compose
```bash
docker-compose up -d
```

## 🌐 Liens d'Accès

Une fois déployé, votre portfolio sera accessible sur :

- **Portfolio Principal** : http://localhost:8080
- **Monitoring Nginx** : http://localhost:9113/metrics

## 📊 Commandes Utiles

```bash
# Voir les conteneurs en cours
docker ps

# Voir les logs
docker logs portfolio

# Arrêter le conteneur
docker stop portfolio

# Redémarrer le conteneur
docker restart portfolio

# Supprimer le conteneur
docker rm portfolio

# Nettoyer les images
docker system prune -a
```

## 🔗 Liens Docker Hub (Optionnel)

### Publier sur Docker Hub
```bash
# Se connecter à Docker Hub
docker login

# Tagger l'image
docker tag harel-portfolio votre-username/harel-portfolio:latest

# Pousser l'image
docker push votre-username/harel-portfolio:latest
```

### Lien Docker Hub
```
https://hub.docker.com/r/votre-username/harel-portfolio
```

## 🚀 Déploiement Rapide avec Script

### Utiliser le script Windows
```bash
# Double-cliquer sur deploy.bat
# Ou exécuter dans PowerShell :
.\deploy.bat
```

## 📱 Accès Mobile

Pour accéder depuis d'autres appareils sur le même réseau :

1. Trouver l'IP de votre PC :
```bash
ipconfig
```

2. Accéder via : `http://VOTRE_IP:8080`

## 🔒 Sécurité

- Le portfolio utilise Nginx avec des headers de sécurité
- Port 8080 exposé localement uniquement
- Configuration HTTPS recommandée pour la production

## 📞 Support

En cas de problème :
- Email : harelfranck24@gmail.com
- GitHub : https://github.com/1001franck
- Discord : harel_franck

---

**Développé avec ❤️ par Harel Franck** 