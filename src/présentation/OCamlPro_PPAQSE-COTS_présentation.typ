
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
  - R&D langages (DSL) & dette technique (Cobol)
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
  = C++

  - Créé en 1979 par Bjarne Stroustrup
  - C++ = C + classes + templates + exceptions + ...
  - Mêmes usages que le C mais censé être plus efficace/productif
  - Standardisé : C++98, C++03, C++11, C++14, C++17, C++20, C++23...
  - ... mais sémantique indéterministe.
]

#slide[
  = Ada

  - Initié par le DoD dans les années 1970
  - Langage de programmation de haut niveau pour la sûreté
  - Standardisé : Ada83, Ada95, Ada2005, Ada2012, Ada2023
  - Sémantique claire
]

#slide[
  = Scade

  - Créé dans les années 1990 par VERIMAG/VERILOG
  - Repris par Esterel Technologies/Ansys
  - Langage de programmation graphique basé sur Lustre
  - Propriétaire
  - Sémantique déterministe
]

#slide[
  = OCaml

  - Créé en 1996 par l'INRIA
  - Lignée des langages ML
  - Lien étroit avec Coq
  - Centré sur l'algorithmique et la simplicité
  - Sémantique mathématique issue du $lambda$-calcul
]

#slide[
  = Rust

  - Créé dans les années 2000 chez Mozilla
  - Première version en 2015
  - C++ amélioré
  - Qualifications/standarisation en cours
]

#slide[
  = Paradigmes

  #align(
    center,
    table(
      columns: (auto, auto, auto, auto, auto),
      align: left,
      align(center)[*Langage*],
      align(center)[*Impératif*],
      align(center)[*Fonctionnel*],
      align(center)[*Objet*],
      align(center)[*Déclaratif*],
      [C],     [✓], [\~], [],   [],
      [C++],   [✓], [\~], [✓], [],
      [Ada],   [✓], [],   [\~], [],
      [Scade], [], [], [], [_dataflow_, graphique],
      [OCaml], [✓], [✓], [✓], [],
      [Rust],  [✓], [✓], [\~], [],
    )
  )
]

#slide[
  = Mécanismes de protection intrinsèques

  #align(
    center,
    table(
      columns: (auto, auto, auto, auto, auto),
      align: left,
      align(center)[*Langage*],
      align(center)[*Typage*],
      align(center)[*Pointeurs*],
      align(center)[*Mémoire*],
      align(center)[*Contrôles*],
      [C],     [😕], [😨], [😨], [😕],
      [C++],   [😕], [😨], [😨], [😐],
      [Ada],   [😊], [😌], [😨], [😊],
      [Scade], [😊], [😊], [😊], [😊],
      [OCaml], [😃], [😊], [😃], [😊],
      [Rust],  [😊], [😕], [😌], [😊],
    )
  )
]

#slide[
  = Compilateurs

  #align(
    center,
    table(
      columns: (auto, auto),
      align: (left, left),
      align(center)[*Langage*], align(center)[*Compilateurs*],
      [C], [GCC, Clang/LLVM, icx, MSVC, AOCC, sdcc, CompCert, ...],
      [C++], [G++, Clang/LLVM, icx, MSVC, AOCC, C++ Builder, ...],
      [Ada], [GNAT (GCC), GNAT Pro/LLVM, GreenHills Ada, PTC, Janus/Ada],
      [Scade], [Scade Suite],
      [OCaml], [OCaml (ocamlc, ocamlopt)],
      [Rust], [rustc]
    )
  )
]

#slide[
  = Interfaçage

  #align(
    center,
    table(
      columns: (auto, auto),
      align: (left, left, left, left),
      align(center)[*Langage source*], align(center)[*Langage(s) cibles(s)*],
      [C], [ASM],
      [C++], [C, ASM],
      [Ada], [C],
      [Scade], [C, Ada (out)],
      [OCaml], [C],
      [Rust], [C]
    )
  )
]


#slide[
  = Adhérence

  #align(
    center,
    table(
      columns: (auto, auto),
      align: (left, left),
      align(center)[*Langage*], align(center)[*Adhérence*],
      [C], [],
      [C++], [],
      [Ada], [],
      [Scade], [],
      [OCaml], [POSIX (natif), VM (objet)],
      [Rust], []
    )
  )
]

#slide[
  = Gestionnaires de paquets

  #align(
    center,
    table(
      columns: (auto, auto),
      align: (left, left),
      align(center)[*Langage*], align(center)[*Gestionnaire(s) de paquet(s)*],
      [C], [Clib, Conan, vcpkg],
      [C++], [Buckaroo, Conan, vcpkg],
      [Ada], [Alire],
      [Scade], [],
      [OCaml], [opam],
      [Rust], [Cargo]
    )
  )

  - Agnotisques: Nix, 0install, opam, ...
  - Systèmes embarqué : Yocto, Buildroot, ...
]

#slide[
  = Communauté

  #[
    #set text(size: 18pt)
    #align(
      center,
      table(
        columns: (auto, auto, auto, auto, auto),
        align: (left, left),
        align(center)[*Langage*],
        align(center)[*Fondation(s)/Association(s)*],
        align(center)[*Entreprise(s)*],
        align(center)[*Recherche*],
        align(center)[*Volume*],
        [C], [FSF], [+++], [], [+++],
        [C++], [FSF], [+++], [], [+++],
        [Ada], [Ada Europe, Ada Resource Association, Ada France], [Adacore, +], [], [+],
        [Scade], [], [Ansys], [Verimag], [+],
        [OCaml], [OSF], [Jane Street, OCamlPro, Tarides, +], [INRIA], [+],
        [Rust],  [RF, Rust France], [AWS, Mozilla, +], [], [++],
      )
    )
  ]
]

#slide[
  = Debugueurs

  #{
    set text(size: 16pt)

    figure(
      table(
        columns: (auto, auto),
        align(center)[*Langage*],
        align(center)[*Debugueur(s)*],
        [C], [#gdb, #lldb, #totalview, #undo, #valgrind, #vsd, #windbg, #rr, #linaro],
        [C++], [#gdb, #lldb, ...],
        [Ada], [#gdb, #lldb],
        [Scade], [Scade Suite],
        [OCaml], [ocamldebug (objet), #gdb, #lldb, ...],
        [Rust], [#gdb, #lldb, #windbg]

      )
    )
  }
]

#slide[
  = Tests

  #align(
    center,
    table(
      columns: (auto, auto),
      [C], [#cantata, #parasoft, #TPT, #vectorcast, ...],
      [C++], [#cantata, #parasoft, #TPT, #vectorcast, #testwell_ctc, #boost, #gtest, ...],
      [Ada], [#aunit, #adatest95, #avhen, #ldra, #vectorcastAda, #rtrt],
      [Scade], [Scade Suite],
      [OCaml], [#ounit, #alcotest, #qcheck, #crowbar, PPX, Cram, ...],
      [Rust], [_builtin_, quickcheck, proptest, mockall, ...]

    ),
  )
]

#slide[

  = Parsing

  #align(
    center,
    table(
      columns: (auto, auto),
      [C], [Flex/Bison, ANTLR, ...],
      [C++], [Flex/Bison, ANTLR, ...],
      [Ada], [AFlex/AYacc],
      [Scade], [],
      [OCaml], [sedlex, ulex, Menhir, ocamllex, ocamlyacc, angstrom, dypgen, ...],
      [Rust], [LALRPOP, Hime, Syntax]
    )
  )

]

#slide[
  = Méta-programmation (C)

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
  = Méta-programmation (C++)

  Les _templates_ sont Turing-complets et permettent de calculer virtuellement
  n'importe quoi qui ne dépende pas d'une IO.
  ```cpp
  template<unsigned int N> struct Fact {
      enum {Value = N * Fact<N - 1>::Value};
  };
  template<> struct Fact<0> {
      enum {Value = 1};
  };
  unsigned int x = Fact<4>::Value;
  ```
]

#slide[
  = Méta-programmation (Ada & Scade)

  Pas de support de méta-programmation.
]

#slide[
  = Méta-programmation (OCaml)

  Les PPX permettent de transformer le code source avant la compilation

  ```ocaml
  let main () =
    [%init 42];
    let v = some_calculus () in
    [%do_something v]
  ```
]

#slide[
  = Méta-programmation (Rust)

  Les macros permettent de transformer le code source avant la compilation

  #[
    #set text(size: 18pt)
    ```rust
    macro_rules! vec {
        ($($x:expr),*) => {
            {
                let mut temp_vec = Vec::new();
                $(temp_vec.push($x);)*
                temp_vec
            }
        };
    }
    ```

    ```rust
    let v = vec![1, 2, 3];
    ```
  ]
]

#slide[
  = Dérivation (C)

  Les macros permettent une forme archaïque de dérivation
  ```c
  #define COULEUR X(ROUGE, 0xFF0000) X(VERT, 0x00FF00) X(BLEU, 0x0000FF)
  #define X(c, v) c = v,
  typedef enum { COULEUR } couleur_t;
  #undef X
  ```
]

#slide[
  = Dérivation (C++)

  On peut avoir une forme de dérivation via les _templates_:
  ```cpp
  template <typename T>
  struct is_pointer {
    static const bool value = false;
  };
  template <typename T>
  struct is_pointer<T*> {
    static const bool value = true;
  };
  ```
]

#slide[
  = Dérivation (Ada & Scade)

  Pas de support de dérivation.
]

#slide[
  = Dérivation (OCaml)

  Les PPX permettent de transformer le code source avant la compilation

  ```ocaml
  type couleur = Rouge | Vert | Bleu | RGB of int * int * int
  [@@deriving show]

  (* val show : couleur -> string
     val pp_couleur : Format.formatter -> couleur -> unit *)
  ```
]

#slide[
  = Dérivation (Rust)

  Les macros permettent de transformer le code source avant la compilation

  ```rust
  #[derive(Debug)]
  struct Point {
      x: i32,
      y: i32,
  }
  ```
]



 #slide[
  = Runtime Errors

  Analyseurs sans faux négatifs:

  #align(
    center,
    table(
      columns: (auto, auto),
      align: left,
      align(center)[*Langage*],
      align(center)[*Analyseurs*],
      [C], [#astree, #eclair, #framac, #polyspace, #tisanalyser],
      [C++], [#astree (C++17), #framac (?)],
      [Ada], [#codepeer, #polyspace, #spark],
      [Scade], [Scade suite ?, + outils C/Ada sur le code généré],
      [OCaml], [],
      [Rust], [(Mirai)],
    )
  )
 ]

 #slide[
  = Formalisation

  Il y a globalement deux approches :

  - Par transpilation de ou vers Coq (ou autre)
    - Langage $=>$ Coq $=>$ Preuves (Hoare, WP)
    - Coq + Preuves $=>$ Langage
  - Par annotation et preuve (semi) automatiques:
    #[
      #set text(size: 16pt)
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
  = WCET

  Le WCET par analyse statique fonctionne par analyse du binaire avec les
  contraintes de l'architecture cible.
  #align(
    center,
    table(
      columns: (auto, auto),
      align: left,
      align(center)[*Langage*],
      align(center)[*Analyseurs*],
      [C], [#chronos, #bound-T, #aiT, #sweet, #otawa, #rapidtime],
      [C++], [outils C],
      [Ada], [#rapidtime, #aiT],
      [Scade], [#aiT],
      [OCaml], [outils C],
      [Rust], [outils C],
    )
  )
]

#slide[
  = Pile

  L'analyse statique de la pile fonctionne également par analyse du
  binaire:
  #align(
    center,
    table(
      columns: (auto, auto),
      align: left,
      align(center)[*Langage*],
      align(center)[*Analyseurs*],
      [C], [#stackanalyser, #armlink, #gcc],
      [C++], [outils du C],
      [Ada], [#gnatstack],
      [Scade], [#stackanalyser],
      [OCaml], [outils du C (natif)],
      [Rust], [outils du C],
    )
  )
]

#slide[
  = Qualité numérique

  #align(
    center,
    table(
      columns: (auto, auto, auto),
      align: left,
      align(center)[*Langage*],
      align(center)[*Analyseurs statiques*],
      align(center)[*Calcul dynamique*],
      [C], [#fluctuat, #astree, #polyspace, #gappa (+ annotations)], [#cadna, #mpfr, #gmp],
      [C++], [#astree, #polyspace], [#cadna, #mpfr, #boost, #xsc],
      [Ada], [_builtin_, #polyspace, #spark (+annotations)], [#mpfr, #gmp],
      [Scade], [], [Scade library ?],
      [OCaml], [], [#mpfr, #gmp],
      [Rust], [], [biblothèques, #mpfr, #gmp],
    )
  )

]

#slide[
  = Assurances

  #align(
    center,
    table(
      columns: (auto, auto, auto),
      align: left,
      align(center)[*Langage*],
      align(center)[*Intrinsèque*],
      align(center)[*Externe*],
      [C], [😨], [😊],
      [C++], [😕], [😕],
      [Ada], [😊], [😊],
      [Scade], [😊], [😊],
      [OCaml], [😊], [😨],
      [Rust], [😊], [😕],
    )
  )
]

#slide[

  = Assurances / Coût (Sécurité)

  #align(
    center,
    table(
      columns: (auto, auto, auto, auto),
      align: left,
      align(center)[*Langage*],
      align(center)[*Intrinsèque*],
      align(center)[*Externe*],
      align(center)[*Coût*],
      [C], [😨], [😊], [😨],
      [C++], [😕], [😕], [😕],
      [Ada], [😊], [😊], [😕],
      [Scade], [😊], [😊], [😌],
      [OCaml], [😊], [😨], [😊],
      [Rust], [😊], [😕], [😕],
    )
  )
]

#slide[

  = Critique

  #align(
    center,
    table(
      columns: (auto, auto),
      align: left,
      align(center)[*Langage*],
      align(center)[*Domaines critiques*],
      [C], [Tous],
      [C++], [Tous],
      [Ada], [Spatial, Aéronautique, Ferroviaire ],
      [Scade], [Aéronautique, Ferroviaire, Nucléaire],
      [OCaml], [Outillage (Astree, KCG, ...)],
      [Rust], [],
    )
  )
]

#slide[

  = Conclusion

  - Quand on peut, privilégier les langages métiers
  - OCaml est souvent un bon choix pour l'outillage
  - Rust est à la mode mais encore jeune pour être recommandé sans réserve
  - Innover pour s'adapter aux nouveaux besoins/contraintes

]

#slide[

  #v(3cm)
  #align(center)[*Questions ?*]

]