{ name = "functional"
, dependencies =
  [ "arrays"
  , "assert"
  , "effect"
  , "integers"
  , "maybe"
  , "numbers"
  , "prelude"
  , "quickcheck"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
