🔧 Exercice 3

async/await est la méthode la plus simple pour gérer l'asynchrone. Elle permet d'écrire du code de manière linéaire, ce qui rend la lecture et la gestion des erreurs plus faciles.

Combine, c'est un framework d'Apple basé sur la programmation réactive. C'est utile pour gérer des flux de données et des événements sur une longue  durée. Combine est plus compliqué mais aussi puissant pour les transformations et combinaisons de flux asynchrones.

completionHandler / GCD, c'est l'ancienne façon de faire utilisant des closures et `DispatchQueue` pour exécuter du code de manière asynchrone. C'est 
plus difficile à gérer, notamment avec l'imbrication de callbacks, mais c'est toujours utilisé pour la compatibilité avec les anciennes API.
