
#import "../base.typ": *
#import "../étude/links.typ": *


#show: presentation

#title-slide(
  title: [
    Écosystèmes COTS de développement et de vérification des logiciels
    critiques et temps réel
  ],
  subtitle: "",
  authors: [Julien Blond (julien.blond\@ocaml.pro)],
)

#slide[
  = OCamlPro

  - PME française créée en 2011
  - ADN recherche et liens étroits avec la recherche académique.
  - OCaml : core team, opam & optimisations
  - R&D langages (DSL) & dette technque (Cobol)
  - Méthodes formelles (Alt-Ergo)
  - Certification Sécurité (CC EAL6+)
  - Formations (OCaml, Rust, Coq)

  Jane street, Inria, DGFiP, Samsung, Mitsubishi, Thales, CEA, Adacore,
  TrustInSoft
]

#slide[
  = Objectif

  Tour d'horizon des langages de programmation dans la sûreté:
  - C
  - C++
  - Ada
  - Scade
  - OCaml
  - Rust

  Donner suffisamment d'informations pour faire un choix éclairé
]

#slide[
  = C

  - Créé en 1972 par Dennis Ritchie
  - Programmation système (Unix)
  - Langage bas niveau
  - Standardisé : C89, C99, C11, C18, C23 (draft)...
  - ... mais une sémantique indéterministe.


]

#slide[
  == C : Paradigme

  Essentiellement *impératif* et *procédural*

  ```c
      int add_value(struct state *s, int v)
      {
        int code = KO;
        if (nullptr != s) {
          s->acc += v;
          code = OK;
        }
        return code;
      }
  ```
]

#slide[
  == C : Mécanismes de protection intrinsèques

  #align(
    center,
    table(
      columns: (auto, auto),
      align: (left, left),
      align(center)[*Avantage*], align(center)[*Inconvénient*],
      [Système de type], [Trop rudimentaire et laxe],
      [ ], [Gestion manuelle des pointeurs],
      [Analyses des compilateurs], [
        - Pas activées par défaut
        - Pas standardisées
      ],
    )
  )
]

#slide[
  == C : Compilateurs

  #align(
    center,
    table(
      columns: (auto, auto),
      align: (left, left),
      align(center)[*Compilateur*], align(center)[*Remarques*],
      [GCC], [La référence],
      [Clang], [Le challenger],
      [icc/icx], [Intel],
      [MSVC], [Microsoft],
      [AOCC], [AMD],
      [sdcc], [microcontrôleurs],
      [CompCert], [Vérifié formellement],
    )
  )
]

#slide[
  == C : Interfaçage

  #v(2cm)
  - Le C permet d'écrire de l'assembleur dans le texte.

  - Il sert de cible pour la plupart des langages.

]

#slide[
  == C : Adhérence

  #v(2cm)
  Aucune, il faut juste un compilateur pour l'architecture cible.
]

#slide[
  == C : Gestionnaires de paquets

  - Deux gestionnaires classiques : Conan & vcpkg
  - Un gestionnaire de _vendoring_ : Clib
  - Possibibilité d'utiliser des gestionnaires agnostriques (Nix, 0install, ...)

  Pour les systèmes embarqués : Buildroot, Yocto, ... ont leur propre
  _packaging_.
]

#slide[
  == C : Communauté

  - Très large
  - Entreprises
  - OS (FSF)
  - Système (Linux)
  - Embarqué
]

#slide[
  == C : Debugueurs

  #{
    set text(size: 16pt)

    figure(
      table(
        columns: (auto, auto, auto),
        [*Debugueur*], [*Architectures*], [*License*],
        [*#linaro*], [x86-64, ARM, PowerPC, Intel Xeon Phi, CUDA], [Propriétaire],
        [*#gdb*], [x86, x86-64, ARM, PowerPC, SPARC, ...], [GPLv3],
        [*#lldb*], [i386, x86-65, AArch64, ARM], [Apache v2],
        [*#totalview*], [x86-64, ARM64, CUDA], [Propriétaire],
        [*#undo*], [x86-64], [Propriétaire],
        [*#valgrind*], [x86, x86-64, PowerPC, ARMv7], [GPL],
        [*#vsd*], [x86, x86-64], [Propriétaire],
        [*#windbg*], [x86, x86-64], [Gratuit],
        [*#rr*], [x86, x86-64, ARM], [GPLv2],
      )
    )
  }
]

#slide[
  == C : Tests

  #figure(
    table(
      columns: (auto, auto, auto, auto, auto),
      [*Outil*],               [*Tests*], [*Generation*], [*Gestion*], [_*mocking*_],
      [*#cantata*],            [UIRC],   [+++],          [✓],         [],
      [*#criterion*],          [U],      [+],            [],          [],
      [*#libcester*],          [U],      [+],            [✓],         [✓],
      [*#novaprova*],          [U],      [+],            [✓],         [✓],
      [*#opmock*],             [U],      [++],           [],           [✓],
      [*#parasoft*],           [UC],     [++],            [✓],         [],
      [*#TPT*],                [UINC],   [+++],           [✓],         [],
      [*#vectorcast*],         [UC],     [++],            [✓],         [✓],
    ),
  ) <c-test>
]

#slide[

  == C : Parsing

  Il existe beaucoup d'outils d'analyse syntaxique en C mais les plus
  connus/matures qui suffisent dans la grande majorité des cas sont:
  - Flex/Bison
  - ANTLR


]

#slide[
  == C : Méta-programmation

  - Le préprocesseur permet de faire précalculer des expressions simples
    par le compilateur (souvent inutile)
  - Il existe des _tricks_ d'expansion récursive bornée (à éviter)
  ```c
  /* #define sum(n) ((n * (n + 1)) / 2) */
  inline int sum(int n) { return (n * (n + 1)) / 2; }
  int main() { return sum(10); }
  ```
  ```asm
  0x0000000000001040 <main+0>: endbr64
  0x0000000000001044 <main+4>: mov    $0x37,%eax
  0x0000000000001049 <main+9>: retq
  ```
]

#slide[
  == C : Dérivation

  - Les macros permettent une forme archaïque de dérivation
  ```c
  #define COULEUR X(ROUGE, 0xFF0000) X(VERT, 0x00FF00) X(BLEU, 0x0000FF)
  #define X(c, v) c = v,
  typedef enum { COULEUR } couleur_t;
  #undef X
  ```
]

 #slide[
  == C : Runtime Errors

  Les analyseurs statiques corrects permettant de se prémunir contre des
  erreurs à _runtime_ sont:
  - #astree
  - #eclair
  - #framac
  - #polyspace
  - #tisanalyser
 ]

 #slide[
  == C : Formalisation

  #[
    #set text(size: 18pt)
    - Par transpilation (automatique ou manuelle) vers Coq (VerifiedC):
      #align(center,
        grid(
          columns: (auto, auto, auto, auto, auto),
          [C], [$=>$], [Coq], [$=>$], [Preuves (Hoare, WP)]
        )
      )

    - Par annotation et preuve (semi) automatiques (Frama-C, RedefinedC, VerCors):
      ```c
      /*@ requires \valid(a) && \valid(b);
      @ ensures A: *a == \old(*b) ;
      @ ensures B: *b == \old(*a) ;
      @ assigns *a,*b ;
      @*/
      void swap(int *a,int *b);
      ```
  ]

 ]


#slide[
  == C : WCET

  Il existe plusieurs outils basés sur une analyse statique binaire :
  - #chronos (IR)
  - #bound-T
  - #aiT
  - #sweet (IR)
  - #otawa (modulaire)
  - #rapidtime

]

#slide[
  == C : Pile

  Pour l'analyse statique de la pile:
  - #gcc
  - #stackanalyser
  - #t1stack (+ annotations)
  - #armlink
]

#slide[
  == C : Qualité numérique

  #[
    #set text(size: 18pt)
    Se prémunir contre les erreurs numériques (overflow, précision, ...)
    - par analyse statique:
      - #fluctuat
      - #astree
      - #polyspace
      - #gappa (+ annotations #framac)
    - par un calcul dynamique:
      - #cadna
      - #mpfr
      - #gmp
  ]

]

#slide[
  == C : Assurances

  Niveau d'assurance donné par le C est paradoxal :
  - quasiment pas de sécurité intrinsèque
  - l'histoire et l'usage ont apporté des outils externes qui fiabilisent le C

  Le développpement reste relativement peu productif et coûteux:
  - même un bon programmeur fait des erreurs
  - A/R entre services de développement et de vérification
  - licences, formations, ...
]

#slide[
  == C : Critique

  Le C est utilisé dans tous les domaines critiques soit
  - directement pour écrire le système (en entier ou au moins les interfaces
    avec le matériel);
  - indirectement comme langage cible (#Ada, #Scade, ...).
]
