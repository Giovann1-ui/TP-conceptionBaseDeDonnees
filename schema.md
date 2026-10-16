# ETAPE 01
plats(__id__, libelle, prix) (nouveau)

# ETAPE 02
plats(__id__, libelle, prix, #id_categorie_plats) (modifie)
categorie_plats(__id__, libelle) (nouveau)

# ETAPE 03
plats(__id__, libelle, prix, #id_categorie_plats)
categorie_plats(__id__, libelle)
commandes(__id__, date) (nouveau)
commandes_details(__id__, #id_commande, #id_plat, quantite, prix) (nouveau)