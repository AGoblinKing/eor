define ["lib/jquery"], () ->
  requirejs.config
    baseUrl: "lib"
    packages: [{name: "eor", location: "../eor"}]
    paths: 
      "config": "../config"
    shim:
      "backbone":
        deps: ["underscore"]
        exports: "Backbone"
      "jquery":
        exports: "$"
      "jade":
        exports: "jade"
      "speakClient":
        exports: "speak"
      "underscore":
        exports: "_"

  require ["eor"]