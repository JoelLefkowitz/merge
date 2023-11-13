{ name = "functional"
, dependencies =
  [ "arrays", "assert", "effect", "foldable-traversable", "maybe", "prelude" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
