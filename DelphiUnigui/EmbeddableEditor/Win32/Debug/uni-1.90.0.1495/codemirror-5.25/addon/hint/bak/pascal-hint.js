;(function(mod) {
  if (typeof exports == 'object' && typeof module == 'object')
    // CommonJS
    mod(require('../../lib/codemirror'))
  else if (typeof define == 'function' && define.amd)
    //AMD
    define('../../lib/codemirror', mod)
  else mod(CodeMirror)
})(function(CodeMirror) {
  function pascalHintLoad() {
    //可以用来加载服务器文件 加载Hint资源？
    let xhr = new XMLHttpRequest(),
      okStatus = document.location.protocol === 'file:' ? 0 : 200
    xhr.open('GET', 'PreDefSymbols.xml', false)
    xhr.overrideMimeType('text/html;charset=utf-8') //默认为utf-8
    xhr.send(null)
    return xhr.status === okStatus ? xhr.responseText : null
  }

  function scriptHint(editor, keywords, getToken, options) {
    // Find the token at the cursor
    var cur = editor.getCursor(),
      token = getToken(editor, cur)
    if (/\b(?:string|comment)\b/.test(token.type)) return
    token.state = CodeMirror.innerMode(editor.getMode(), token.state).state

    // If it's not a 'word-style' token, ignore the token.
    if (!/^[\w$_]*$/.test(token.string)) {
      token = {
        start: cur.ch,
        end: cur.ch,
        string: '',
        state: token.state,
        type: token.string == '.' ? 'property' : null
      }
    } else if (token.end > cur.ch) {
      token.end = cur.ch
      token.string = token.string.slice(0, cur.ch - token.start)
    }

    return { list: [], from: '', to: '' }
  }  
  function pascalHint(editor, options) {
    return scriptHint(
      editor,
      keywords,
      function(e, cur) {
        return e.getTokenAt(cur)
      },
      options
    )
  }
  CodeMirror.registerHelper('hint', 'pascal', pascalHint)
})
