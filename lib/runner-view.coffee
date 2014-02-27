{$, $$$, EditorView, ScrollView} = require 'atom'
exec = require('child_process').exec

module.exports =
class RunnerView extends ScrollView
  @content: ->
    @div class: 'runner', tabindex: -1

  render: (error, stdout, stderr) =>
    if stderr? && stderr.length > 0
      @html $$$ ->
        @pre class: 'error', stderr
    else if stdout?
      @html $$$ ->
        @pre stdout

  command: (language) ->
    atom.config.get("runner.#{language}Command")

  getLanguage: (filePath) ->
    # TODO Enable more than just ruby
    'ruby'

  run: (filePath) ->
    exec("#{@command(@getLanguage(filePath))} #{filePath}", @render)

  getTitle: ->
    "Output"
