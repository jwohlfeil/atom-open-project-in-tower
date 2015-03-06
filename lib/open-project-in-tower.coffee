proc = require 'child_process'
path = require 'path'

module.exports =

  activate: ->
    atom.workspaceView.command "open-project-in-tower:open", (event) =>
      @open()

  open: ->
    projectPath = atom.project.getPath()

    return unless projectPath

    proc.exec "open -a Tower.app #{projectPath}", (error) ->
      console.log "error: #{error}" unless error is null
