describe 'ACliOptions', () ->

  it 'before', () ->

    kosher.alias 'fixture', kosher.spec.fixtures.cli

    kosher.alias 'stream', new kosher.WriteableStream

    kosher.alias 'instance', new kosher.fixture.A

      consoleOutputStream: kosher.stream

      consoleErrorStream: kosher.stream

  describe 'methods', () ->

    describe 'silent', () ->

      it 'should supress output'

    describe 'verbose', () ->

      it 'should display error stack'

    describe 'dir', () ->

      it 'should change the current working directory', () ->

        old = process.cwd()

        kosher.argv '-D', resolve old, '..'

        kosher.instance.run()

        process.cwd().should.eql resolve old, '..'

        kosher.argv '-D', old

        kosher.instance.run()

        process.cwd().should.eql old

    describe 'help', () ->

      it 'should display global help information'

      it 'should display command context help information'
