#import "links.typ": *
#import "defs.typ": *

= Introduction

== Terminologie

#align(
  center,
  table(
    columns: (auto, auto),
    align: (center, left),
    [*Terme*], [*Définition*],
    [COTS <cots>], [_Commercial Off-The-Shelf_ ou produit sur étagère],
    [WCET <wcet>], [
      _Worst Case Execution Time_ ou temps d'exécution du pire cas
      (_i.e._ maximal)
    ],
  )
)

== Organisation du document

Le document présente les langages C, C++, #Ada, #Scade, #OCaml et #Rust
d'un point de vue de la sûreté logicielle embarquée selon un plan organisé en
trois axes:
1. une description du langage décrivant
  + son paradigme;
  + ses mécanismes de protection;
  + ses compilateurs;
  + son adhérence au système;
  + ses gestionnaires de paquets;
  + sa communauté.
2. l'outillage présent dans l'écosystème du langage :
  + les débugueurs;
  + les outils de tests;
  + les outils de _parsing_;
  + les capacités de méta-programmation;
  + les possibilités de dérivation.
3. les aspects de sûreté logicielle :
  + les outils d'analyse statique disponibles;
  + les moyens de formalisation;
  + le calcul statique du WCET;
  + le calcul statique de la taille de pile maximale;
  + les outils de qualité numérique;
  + l'assurance générale de la qualité du code;
  + l'utilisation dans le domaine critique.

== Note méthodologique

La méthodologie utilisée pour l'étude des langages reprend les points abordés
dans les clauses techniques #cite(<ctcots>).
De manière générale, l'étude est basée sur le contenu publique disponible sur
internet, les brochures techniques ou commerciales et les connaissances propres
des auteurs. Le volume d'information obtenu étant inégal suivant les outils,
la complétude des informations fournies dans ce rapport n'est pas assurée.
Toutefois, et sous réserve que les informations publiques soient à jour, elles
sont _a priori_ correctes.

Ce rapport étant lui même destiné à être _open source_, nous invitons
le lecteur à participer à son amélioration continue en signalant toute
erreur ou en contribuant via le dépôt https://github.com/OCamlPro/ppaqse-lang.

Pour des questions de lisibilité du document, certains points méthodologiques ou
explications sont renvoyés en annexe.

