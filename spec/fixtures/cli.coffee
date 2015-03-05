kosher.alias 'ACliDomain', require 'a-cli-domain'

class ACli extends kosher.ACliDomain

class A extends ACli

  command:

    main: __dirname

module.exports = "A": A
