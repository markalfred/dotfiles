LEADER = 'j,ctrl'

slate.configAll
  keyboardLayout: 'qwerty'
  defaultToCurrentScreen: true
  modalEscapeKey: 'esc'
  nudgePercentOf: 'screenSize'
  resizePercentOf: 'screenSize'
  windowHintsShowIcons: true
  windowHintsBackgroundColor: '45;45;45;1.0'
  windowHintsIconAlpha: 0.7
  windowHintsFontColor: '204;204;204;1.0'
  windowHintsTopLeftX: '(windowSizeX/2)-(windowHintsWidth/2);0'
  windowHintsTopLeftY: '(windowSizeY/2)-(windowHintsWidth/2);0'
  windowHintsIgnoreHiddenWindows: false
  windowHintsSpread: true
  windowHintsSpreadSearchWidth: 100
  windowHintsSpreadSearchHeight: 100

chord = (varargs) ->
  Array::slice.call(arguments).reduce (ks, k) ->
    k + ':' + ks

topLeft =
  x: 'screenOriginX + 19'
  y: 'screenOriginY + 21.666'

topRight =
  x: 'screenOriginX + screenSizeX / 2 + (19/2)'
  y: 'screenOriginY + 22'

bottomLeft =
  x: 'screenOriginX + 19'
  y: 'screenOriginY + screenSizeY / 2 + (21.666/2)'

bottomRight =
  x: 'screenOriginX + screenSizeX / 2 + (19/2)'
  y: 'screenOriginY + screenSizeY / 2 + (21.666/2)'

center = (size) ->
  x: "screenOriginX + ((screenSizeX - #{size.width}) / 2)"
  y: "screenOriginY + ((screenSizeY - #{size.height}) / 2)"

fullWidth = width: 'screenSizeX - (19*2)'
fullHeight = height: 'screenSizeY - (21.666*2)'
halfWidth = width: 'screenSizeX / 2 - (19*3/2)'
halfHeight = height: 'screenSizeY / 2 - (21.666*3/2)'

sameSize = (size) ->
  width: size.width
  height: size.height

slate.bind chord(LEADER, 'f'), slate.operation('move', _.extend({}, topLeft, fullWidth, fullHeight))
slate.bind chord(LEADER, 'j'), slate.operation('move', _.extend({}, topLeft, halfWidth, fullHeight))
slate.bind chord(LEADER, 'l'), slate.operation('move', _.extend({}, topRight, halfWidth, fullHeight))
slate.bind chord(LEADER, 'i'), slate.operation('move', _.extend({}, topLeft, fullWidth, halfHeight))
slate.bind chord(LEADER, 'k'), slate.operation('move', _.extend({}, bottomLeft, fullWidth, halfHeight))
slate.bind chord(LEADER, 'u'), slate.operation('move', _.extend({}, topLeft, halfWidth, halfHeight))
slate.bind chord(LEADER, 'o'), slate.operation('move', _.extend({}, topRight, halfWidth, halfHeight))
slate.bind chord(LEADER, ';'), slate.operation('move', _.extend({}, bottomRight, halfWidth, halfHeight))
slate.bind chord(LEADER, 'h'), slate.operation('move', _.extend({}, bottomLeft, halfWidth, halfHeight))
slate.bind chord(LEADER, 'r'), slate.operation('relaunch')
slate.bind chord('toggle', LEADER, 'w'), slate.operation('throw', screen: 'next')

slate.bind 'space:ctrl', toggleTerm = (win) ->
  if win.app().name() is 'iTerm2'
    win.doOperation slate.operation('hide', app: 'iTerm2')
  else
    win.doOperation slate.operation('focus', app: 'iTerm2')

slate.bind chord(LEADER, 'c'), centerWindow = (win) ->
  win.doOperation slate.operation('move', _.extend({}, center(win.size()), sameSize(win.size())))
