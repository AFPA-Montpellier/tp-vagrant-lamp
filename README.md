# TP Vagrant - LAMP Stack

## Description
Configuration d'un serveur LAMP (Linux, Apache, MySQL, PHP) avec Vagrant.

## Spécifications
- **VM** : lamp-server
- **Box** : Debian 12 (bookworm)
- **RAM** : 1024 Mo
- **CPU** : 1
- **Port Forwarding** : 7676 (host) → 80 (VM)
- **Dossier partagé** : ./shared → /var/www/html

## Services Installés
- Apache2
- PHP + php-cli
- Configuration automatique au démarrage

## Utilisation
```bash
# Démarrer la VM
vagrant up

# Accéder au site web
curl http://localhost:7676
# ou ouvrir http://localhost:7676 dans le navigateur

# Se connecter à la VM
vagrant ssh

# Arrêter la VM
vagrant halt
