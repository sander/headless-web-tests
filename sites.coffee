###
casper = require('casper').create()

casper.start 'http://localhost:3000', ->
  @echo 'starting'
  @echo @evaluate ->
    document.querySelector('title').innerText

casper.run ->
  @echo 'running'
  @exit()
###

casper.test.begin 'Hello', 1, (test) ->
  test.assert true
  #casper.start 'http://localhost:3000', ->
  #  @capture 'test.png', top: 100, left: 100, width: 500, height: 400

  childProcess = require 'child_process'
  childProcess.execFile '/usr/local/bin/compare', ['-metric', 'RMSE', 'test.png', 'test\ copy.png', 'NULL:'], null, (err, stdout, stderr) ->
    test.info 'test' + JSON.stringify stderr
    test.done()

  #casper.run ->
  #  test.done()
