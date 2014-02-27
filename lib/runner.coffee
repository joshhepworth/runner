url = require 'url'
fs = require 'fs'

RunnerView = require './runner-view'

module.exports =
  activate: (state) ->
    atom.workspaceView.command "runner:run", =>
      @run()

    @runnerView = new RunnerView()

    atom.workspace.registerOpener (uriToOpen) =>
      {protocol, pathname} = url.parse(uriToOpen)
      return unless protocol is 'runner:'
      @runnerView

  openRunnerView: (filePath) ->
    previousActivePane = atom.workspace.getActivePane()
    uri = "runner://#{filePath}"

    atom.workspace.open(uri, split: 'right', searchAllPanes: true).done (runnerView) ->
      runnerView.run(filePath)
      previousActivePane.activate()

  run: ->
    editor = atom.workspace.activePaneItem
    return unless editor?

    filePath = editor.buffer.file?.path

    if filePath == undefined
      filePath = "/tmp/#{Date.now()}"
      fs.writeFile filePath, editor.buffer.lines.join("\n"), (error) =>
        @openRunnerView(filePath)
    else
      @openRunnerView(filePath)
