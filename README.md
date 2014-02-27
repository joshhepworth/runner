# Runner package

This is a atom package to run ruby scripts and show the output
in a vertical pane to the right of the normal pane.

Simply press `ctrl-r` in any file, saved or unsaved, and the
content of your script will be run through the `ruby` command and
the `stdout` rendered to the right.

You can set the command that will run the script by editing `~/.atom/config.cson`
and adding:

```cson
'runner':
  'rubyCommand': '/usr/bin/env ruby'
```

## Todo

1. Write tests
2. Set defaults for commands for a few languages
3. Detect filetype and pick appropriate command to run
