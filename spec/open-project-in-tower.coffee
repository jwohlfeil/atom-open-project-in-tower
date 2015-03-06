OpenProjectInIterm2 = require '../lib/open-project-in-tower'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "OpenProjectInTower", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('open-project-in-tower')

  describe "when the open-project-in-tower:open event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.open-project-in-tower')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'open-project-in-tower:open'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.open-project-in-tower')).toExist()
        atom.workspaceView.trigger 'open-project-in-tower:open'
        expect(atom.workspaceView.find('.open-project-in-tower')).not.toExist()
