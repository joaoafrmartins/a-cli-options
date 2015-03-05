ACliCommand = require 'a-cli-command'

class ACliOptions extends ACliCommand

  command:

    options:

      dir:

        alias: "D"

        type: "string"

        description: [
          "set the current working directory"
        ]

      mkdir:

        type: "boolean"

        description: [
          "used conjuntion with -D acts like mkdir -p"
        ]

      help:

        alias: "H"

        type: "string"

        usage: "[ <command> ]"

        description: [
          "display usage information"
        ]

      silent:

        alias: "S"

        type: "boolean"

        description: [
          "set log level to silent"
        ]

      verbose:

        alias: "V"

        type: "boolean"

        description: [
          "set log level to verbose"
        ]

  "silent?": (command, next) ->

    #console.log @cli.options.consoleThreshold

    #@cli.options.consoleThreshold = "silent"

    next null, @debug "silent"

  "verbose?": (command, next) ->

    #console.log @cli.options

    #@cli.options.consoleThreshold = "error"

    next null, @debug "verbose"

  "dir?": (command, next) ->

    @shell

    { mkdir: create, dir } = command.args

    if not dir then return next "invalid dir value #{dir}", null

    if create

      mkdir "-p", dir

      @debug "created directory #{dir}"

    cd dir

    next null, @debug "changed to directory #{dir}"

  "help?": (command, next) ->

    usage = @cli.usage command.args.help

    @cli.console.info usage

    next null, @debug "called #{command.args.help} help"

module.exports = ACliOptions
