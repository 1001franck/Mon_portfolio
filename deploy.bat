@echo off
setlocal enabledelayedexpansion

REM 🚀 Script de Déploiement Windows - Portfolio Harel Franck
REM Auteur: Harel Franck
REM Email: harelfranck24@gmail.com

echo ================================
echo   🚀 DÉPLOIEMENT PORTFOLIO
echo ================================

REM Vérifier si Docker est installé
echo [INFO] Vérification de Docker...
docker --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Docker n'est pas installé. Veuillez l'installer d'abord.
    pause
    exit /b 1
)

docker-compose --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Docker Compose n'est pas installé. Veuillez l'installer d'abord.
    pause
    exit /b 1
)

echo [INFO] Docker et Docker Compose sont installés ✓

REM Vérifier les fichiers requis
echo [INFO] Vérification des fichiers requis...
if not exist "index.html" (
    echo [ERROR] Fichier manquant: index.html
    pause
    exit /b 1
)
if not exist "style.css" (
    echo [ERROR] Fichier manquant: style.css
    pause
    exit /b 1
)
if not exist "Dockerfile" (
    echo [ERROR] Fichier manquant: Dockerfile
    pause
    exit /b 1
)
if not exist "docker-compose.yml" (
    echo [ERROR] Fichier manquant: docker-compose.yml
    pause
    exit /b 1
)
if not exist "nginx.conf" (
    echo [ERROR] Fichier manquant: nginx.conf
    pause
    exit /b 1
)

echo [INFO] Tous les fichiers requis sont présents ✓

REM Nettoyer les conteneurs existants
echo [INFO] Nettoyage des conteneurs existants...
docker-compose down --remove-orphans >nul 2>&1
docker image prune -f >nul 2>&1
echo [INFO] Nettoyage terminé ✓

REM Construire et démarrer les conteneurs
echo [INFO] Construction de l'image Docker...
docker-compose build --no-cache

echo [INFO] Démarrage des conteneurs...
docker-compose up -d

echo [INFO] Attente du démarrage des services...
timeout /t 10 /nobreak >nul

REM Vérifier le statut des conteneurs
echo [INFO] Vérification du statut des conteneurs...
docker-compose ps

REM Test de connectivité
echo [INFO] Test de connectivité...
for /l %%i in (1,1,15) do (
    curl -s http://localhost:8080 >nul 2>&1
    if not errorlevel 1 (
        echo [INFO] Portfolio accessible sur http://localhost:8080 ✓
        goto :show_info
    )
    timeout /t 2 /nobreak >nul
)

echo [ERROR] Le portfolio n'est pas accessible
docker-compose logs
pause
exit /b 1

:show_info
echo ================================
echo   📊 INFORMATIONS DE DÉPLOIEMENT
echo ================================
echo ✅ Portfolio déployé avec succès!
echo 🌐 URL d'accès: http://localhost:8080
echo 📊 Monitoring: http://localhost:9113/metrics
echo 📝 Logs: docker-compose logs -f
echo 🛑 Arrêter: docker-compose down
echo 🔄 Redémarrer: docker-compose restart
echo ================================

pause 