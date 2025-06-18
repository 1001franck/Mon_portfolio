#!/bin/bash

# 🚀 Script de Déploiement - Portfolio Harel Franck
# Auteur: Harel Franck
# Email: harelfranck24@gmail.com

set -e  # Arrêter en cas d'erreur

# Couleurs pour les messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Fonction pour afficher les messages
print_message() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  🚀 DÉPLOIEMENT PORTFOLIO${NC}"
    echo -e "${BLUE}================================${NC}"
}

# Vérifier si Docker est installé
check_docker() {
    print_message "Vérification de Docker..."
    if ! command -v docker &> /dev/null; then
        print_error "Docker n'est pas installé. Veuillez l'installer d'abord."
        exit 1
    fi
    
    if ! command -v docker-compose &> /dev/null; then
        print_error "Docker Compose n'est pas installé. Veuillez l'installer d'abord."
        exit 1
    fi
    
    print_message "Docker et Docker Compose sont installés ✓"
}

# Vérifier les fichiers requis
check_files() {
    print_message "Vérification des fichiers requis..."
    
    required_files=("index.html" "style.css" "Dockerfile" "docker-compose.yml" "nginx.conf")
    
    for file in "${required_files[@]}"; do
        if [ ! -f "$file" ]; then
            print_error "Fichier manquant: $file"
            exit 1
        fi
    done
    
    print_message "Tous les fichiers requis sont présents ✓"
}

# Nettoyer les conteneurs existants
cleanup() {
    print_message "Nettoyage des conteneurs existants..."
    
    # Arrêter et supprimer les conteneurs existants
    docker-compose down --remove-orphans 2>/dev/null || true
    
    # Supprimer les images orphelines
    docker image prune -f 2>/dev/null || true
    
    print_message "Nettoyage terminé ✓"
}

# Construire et démarrer les conteneurs
build_and_start() {
    print_message "Construction de l'image Docker..."
    docker-compose build --no-cache
    
    print_message "Démarrage des conteneurs..."
    docker-compose up -d
    
    print_message "Attente du démarrage des services..."
    sleep 10
}

# Vérifier le statut des conteneurs
check_status() {
    print_message "Vérification du statut des conteneurs..."
    
    if docker-compose ps | grep -q "Up"; then
        print_message "Conteneurs démarrés avec succès ✓"
    else
        print_error "Erreur lors du démarrage des conteneurs"
        docker-compose logs
        exit 1
    fi
}

# Test de connectivité
test_connectivity() {
    print_message "Test de connectivité..."
    
    # Attendre que le service soit prêt
    for i in {1..30}; do
        if curl -s http://localhost:8080 > /dev/null 2>&1; then
            print_message "Portfolio accessible sur http://localhost:8080 ✓"
            return 0
        fi
        sleep 2
    done
    
    print_error "Le portfolio n'est pas accessible"
    return 1
}

# Afficher les informations de déploiement
show_info() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}  📊 INFORMATIONS DE DÉPLOIEMENT${NC}"
    echo -e "${BLUE}================================${NC}"
    echo -e "${GREEN}✅ Portfolio déployé avec succès!${NC}"
    echo -e "${YELLOW}🌐 URL d'accès:${NC} http://localhost:8080"
    echo -e "${YELLOW}📊 Monitoring:${NC} http://localhost:9113/metrics"
    echo -e "${YELLOW}📝 Logs:${NC} docker-compose logs -f"
    echo -e "${YELLOW}🛑 Arrêter:${NC} docker-compose down"
    echo -e "${YELLOW}🔄 Redémarrer:${NC} docker-compose restart"
    echo -e "${BLUE}================================${NC}"
}

# Fonction principale
main() {
    print_header
    
    # Vérifications préliminaires
    check_docker
    check_files
    
    # Déploiement
    cleanup
    build_and_start
    check_status
    
    # Tests
    if test_connectivity; then
        show_info
    else
        print_error "Échec du déploiement"
        docker-compose logs
        exit 1
    fi
}

# Gestion des arguments
case "${1:-}" in
    "stop")
        print_message "Arrêt des conteneurs..."
        docker-compose down
        print_message "Conteneurs arrêtés ✓"
        ;;
    "restart")
        print_message "Redémarrage des conteneurs..."
        docker-compose restart
        print_message "Conteneurs redémarrés ✓"
        ;;
    "logs")
        docker-compose logs -f
        ;;
    "status")
        docker-compose ps
        ;;
    "clean")
        print_message "Nettoyage complet..."
        docker-compose down --volumes --remove-orphans
        docker system prune -af
        print_message "Nettoyage terminé ✓"
        ;;
    "help"|"-h"|"--help")
        echo "Usage: $0 [COMMANDE]"
        echo ""
        echo "Commandes:"
        echo "  (aucune)  Déployer le portfolio"
        echo "  stop      Arrêter les conteneurs"
        echo "  restart   Redémarrer les conteneurs"
        echo "  logs      Afficher les logs"
        echo "  status    Afficher le statut"
        echo "  clean     Nettoyage complet"
        echo "  help      Afficher cette aide"
        ;;
    *)
        main
        ;;
esac 