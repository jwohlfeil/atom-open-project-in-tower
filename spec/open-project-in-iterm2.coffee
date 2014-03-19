OpenProjectInIterm2 = require '../lib/open-project-in-iterm2'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "OpenProjectInIterm2", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('open-project-in-iterm2')

  describe "when the open-project-in-iterm2:open event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.open-project-in-iterm2')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'open-project-in-iterm2:open'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.open-project-in-iterm2')).toExist()
        atom.workspaceView.trigger 'open-project-in-iterm2:open'
        expect(atom.workspaceView.find('.open-project-in-iterm2')).not.toExist()
