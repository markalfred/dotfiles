slate.configAll({
  'keyboardLayout': 'qwerty',
  'defaultToCurrentScreen': true,
  'modalEscapeKey': 'esc',
  'nudgePercentOf': 'screenSize',
  'resizePercentOf': 'screenSize',
  'windowHintsShowIcons': true,
  'windowHintsBackgroundColor': '45;45;45;1.0',
  'windowHintsIconAlpha': 0.7,
  'windowHintsFontColor': '204;204;204;1.0',
  'windowHintsTopLeftX': '(windowSizeX/2)-(windowHintsWidth/2);0',
  'windowHintsTopLeftY': '(windowSizeY/2)-(windowHintsWidth/2);0',
  'windowHintsIgnoreHiddenWindows': false,
  'windowHintsSpread': true,
  'windowHintsSpreadSearchWidth': 100,
  'windowHintsSpreadSearchHeight': 100
});

var LEADER = 'j,ctrl';

function chord(varargs) {
  return Array.prototype.slice.call(arguments).reduce(function(ks, k) {
    return k + ':' + ks;
  });
}

var topLeft = {
  'x': 'screenOriginX + 19',
  'y': 'screenOriginY + 21.666'
};

var topRight = {
  'x': 'screenOriginX + screenSizeX / 2 + (19/2)',
  'y': 'screenOriginY + 22'
};

var bottomLeft = {
  'x': 'screenOriginX + 19',
  'y': 'screenOriginY + screenSizeY / 2 + (21.666/2)'
};

var bottomRight = {
  'x': 'screenOriginX + screenSizeX / 2 + (19/2)',
  'y': 'screenOriginY + screenSizeY / 2 + (21.666/2)'
};

var center = function(size) {
  return {
    'x': '(screenSizeX - ' + size.width + ') / 2',
    'y': '(screenSizeY - ' + size.height + ') / 2'
  };
};

var fullWidth = {
  'width': 'screenSizeX - (19*2)'
};

var fullHeight = {
  'height': 'screenSizeY - (21.666*2)'
};

var halfWidth = {
  'width': 'screenSizeX / 2 - (19*3/2)'
};

var halfHeight = {
  'height': 'screenSizeY / 2 - (21.666*3/2)'
};

var sameSize = function(size) {
  return {
    'width': size.width,
    'height': size.height
  };
};

slate.bind(chord(LEADER, 'f'),
           slate.operation('move',
                           _.extend({}, topLeft, fullWidth, fullHeight)));

slate.bind(chord(LEADER, 'j'),
           slate.operation('move',
                           _.extend({}, topLeft, halfWidth, fullHeight)));

slate.bind(chord(LEADER, 'l'),
           slate.operation('move',
                           _.extend({}, topRight, halfWidth, fullHeight)));

slate.bind(chord(LEADER, 'i'),
           slate.operation('move',
                           _.extend({}, topLeft, fullWidth, halfHeight)));

slate.bind(chord(LEADER, 'k'),
           slate.operation('move',
                           _.extend({}, bottomLeft, fullWidth, halfHeight)));

slate.bind(chord(LEADER, 'u'),
           slate.operation('move',
                           _.extend({}, topLeft, halfWidth, halfHeight)));

slate.bind(chord(LEADER, 'o'),
           slate.operation('move',
                           _.extend({}, topRight, halfWidth, halfHeight)));

slate.bind(chord(LEADER, ';'),
           slate.operation('move',
                           _.extend({}, bottomRight, halfWidth, halfHeight)));

slate.bind(chord(LEADER, 'h'),
           slate.operation('move',
                           _.extend({}, bottomLeft, halfWidth, halfHeight)));

slate.bind(chord(LEADER, 'u'), slate.operation('undo'));
slate.bind(chord(LEADER, 'r'), slate.operation('relaunch'));

slate.bind(chord('toggle', LEADER, 'w'), slate.operation('throw', {
  'screen': 'next'
}));

slate.bind(chord(LEADER, 's'), slate.operation('hint', {
  'characters': 'FJDKSLA'
}));

slate.bind(chord(LEADER, 'm'), function focusLast(w) {
  var found = false;

  slate.eachApp(function(a) {
    if (found) { return; }

    var aw = a.mainWindow();

    if (aw && aw.pid() !== w.pid()) {
      found = aw.focus();
    }
  });
});

slate.bind("space:ctrl", function toggleTerm(win) {
  if (win.app().name() === 'iTerm2') {
    win.doOperation(slate.operation("hide", {"app" : 'iTerm2'}));
  } else {
    win.doOperation(slate.operation("focus", {"app" : 'iTerm2'}));
  }
});

slate.bind(chord(LEADER, 'c'), function centerWindow(win) {
  win.doOperation(slate.operation('move', _.extend({}, center(win.size()), sameSize(win.size()))));
});
