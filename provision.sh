#!/bin/bash

# Mise à jour et installation
apt-get update
apt-get upgrade -y

# Installation d'Apache
apt-get install -y apache2

# Installation de PHP
apt-get install -y php php-cli

# Activation d'Apache au démarrage
systemctl enable apache2

# Nettoyage du dossier web par défaut
rm -rf /var/www/html/*

# Création d'une page index.html simple
cat <<'HTML' > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>TP Vagrant LAMP</title>
</head>
<body>
    <h1>Bienvenue sur le serveur LAMP</h1>
    <p>Ceci est une page de test depuis Vagrant.</p>
    <p>Serveur: $(hostname)</p>
</body>
</html>
HTML

# Correction des permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Message personnalisé dans motd
echo "VM TP - Serveur LAMP" > /etc/motd

# Redémarrage d'Apache
systemctl restart apache2

echo "Provisionnement terminé !"
