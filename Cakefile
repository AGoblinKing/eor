CakeHelper = require "cakehelper"
express = require "express"

paths =
  "base": [ "src", "public" ]

moves = [
  ".md"
  ".js"
  ".jpg"
  ".png"
  ".gif"
  ".jpeg"
  ".eot"
  ".ico"
  ".svg"
  ".ttf"
  ".json"
  ".woff"
  ".html"
  ".css"
  ".ogg"
  ".webm"
]

tasks = new CakeHelper { paths, moves }
Tools = tasks.Tools
# Compiles
task "compile:coffee", "Compile all CoffeeScript", -> tasks.do "compile:coffee"
task "compile:dust", "Compile dust templates", -> tasks.do "compile:dust"
task "compile:less", "Compile all LESS to CSS", -> tasks.do "compile:less"
task "compile:stylus", "Compile all stylus to CSS", -> tasks.do "compile:stylus"
task "compile:jade", "Compile all Jade files", -> tasks.do "compile:jade:amd"
  
task "compile", "Compile everything", ->
  tasks.do "compile:coffee"
  tasks.do "compile:dust"
  tasks.do "compile:less"
  tasks.do "compile:stylus"
  tasks.do "compile:jade:raw"
  tasks.do "compile:moves"

# Watches
task "watch:coffee", "Compile all CoffeeScript on update", -> tasks.do "watch:coffee"
task "watch:dust", "Compile dust templates on update", -> tasks.do "watch:dust"
task "watch:less", "Compile all LESS to CSS on update", -> tasks.do "watch:less"
task "watch:stylus", "Compile all stylus to CSS on update", -> tasks.do "watch:stylus"
task "watch:jade", "Compile all Jade files on update", -> tasks.do "watch:jade:amd"

task "watch", "Compile everything on update", ->
  invoke "compile"
  tasks.do "watch:coffee"
  tasks.do "watch:dust"
  tasks.do "watch:less"
  tasks.do "watch:stylus"
  tasks.do "watch:jade:raw"
  tasks.do "watch:moves"

task "run", "Run a webserver and watch", ->
  invoke "watch"
  port = 4444
  app = express()
  app.use express.static "#{__dirname}/public"
  app.listen port
  console.log "App running on port #{port}"
