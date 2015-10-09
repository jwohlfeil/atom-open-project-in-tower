proc = require 'child_process'
path = require 'path'

module.exports =

  activate: ->
    atom.commands.add 'atom-workspace',
      'open-project-in-tower:open': (event) =>
          @open()

  open: ->
    projectPaths = atom.project.getPaths()

    return unless projectPaths

    projectPaths.forEach (projectPath) ->
      proc.exec "open -a Tower.app \'#{projectPath}\'", (error) ->
        console.log "error: #{error}" unless error is null
