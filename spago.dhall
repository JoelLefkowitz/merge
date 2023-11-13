{ name = "functional"
, dependencies =
  [ "arrays"
  , "console"
  , "effect"
  , "integers"
  , "maybe"
  , "numbers"
  , "prelude"
  , "strings"
  , "test-unit"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
