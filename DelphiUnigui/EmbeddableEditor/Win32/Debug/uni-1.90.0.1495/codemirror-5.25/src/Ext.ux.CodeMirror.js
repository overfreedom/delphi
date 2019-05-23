var uniFilesAdded = '' //list of files already added

function checkLoadedFile(filename) {
  if (uniFilesAdded.indexOf('[' + filename + ']') == -1) {
    uniFilesAdded += '[' + filename + ']'
    return false
  }
  return true
}

Ext.define('Ext.ux.form.CodeMirrorEx', {
  extend: 'Ext.form.field.TextArea',
  xtype: 'ux-codemirrorex',
  language: 'txt',
  codeMirrorPath: null, // should be path to code mirror on your server!
  codeEditor: null,
  CodeMirror: null,
  elRendered: false,
  synMode: '',
  theme: 'default',

  destroy: function() {
    var me = this

    me.initialized = false
    if (me.codeEditor && me.codeEditor.clear) {
      me.codeEditor.clear()
    }
    me.codeEditor = null
    me.callParent(arguments)
  },
  /*    
    loadScript: function(modeName) {
			Ext.Loader.loadScriptFile(
					this.codeMirrorPath + '/mode/' + modeName + '/'+ modeName +'.js',
					function() {},	
					function() {_log('loadScript error: ' + modeName)},	
					this,	true
			);
		},
*/


  loadScript: function(modeName) {
    var me = this
    //这里顺序不要动？ 创建一次CodeMirror。
    require([
      'codemirror',      
      'codemirror/addon/selection/active-line',
      'codemirror/addon/edit/matchbrackets',
      'codemirror/addon/hint/show-hint',
      'codemirror/addon/hint/' + modeName + '-hint', 
      'codemirror/addon/comment/comment',       
      this.codeMirrorPath + '/../ext-keydown-modify.js',
      'codemirror/addon/search/jump-to-line',
      'codemirror/addon/search/search',
      'codemirror/addon/search/searchcursor',
      'codemirror/addon/dialog/dialog',
      'codemirror/mode/' + modeName + '/' + modeName,
    ], function(CodeMirror) {
      me.CodeMirror = CodeMirror
      me.createCodeMirror(me.CodeMirror) //加载完后，最后执行
      // ajaxRequest(me,'InitFirstSize',[]) //加载好后重新设置一下尺寸  不用delphi处理
      document.getElementsByClassName("CodeMirror")[0].setAttribute("style","width: "+
        document.getElementById(me.id).style.width + ";height: "+
        document.getElementById(me.id).style.height);      
    })
  },

  loadCSS: function(CSSFileName) {
    var fileref = document.createElement('link')
    fileref.setAttribute('rel', 'stylesheet')
    fileref.setAttribute('type', 'text/css')
    fileref.setAttribute('href', CSSFileName)

    if (typeof fileref != 'undefined')
      document.getElementsByTagName('head')[0].appendChild(fileref)
  },

  appendJS: function (jsPath){
    var fileref = document.createElement('script')
    fileref.setAttribute('type','text/javascript')
    fileref.setAttribute('href', jsPath)
    if (typeof fileref != 'undefined')
      document.getElementsByTagName('head')[0].appendChild(fileref)
  },

  setFontCSS: function(cssStr){
    var style = document.getElementsByClassName('CodeMirror').item(0).style
    if (style.cssText.indexOf('font-size') == -1)
      style.cssText += cssStr
    else
      style.cssText = style.cssText.replace(/font-size:\s*\d+px/, cssStr)  
    // var style = document.createElement('sytle'),
    //   head = document.head || document.getElementsByTagName('head')[0]
    // style.setAttribute('type', 'text/css')
    // if (style.styleSheet) { //IE
    //   var fun = function () {
    //     try {
    //       style.styleSheet.cssText = cssText
    //     } catch (e) {

    //     }
    //   }

    //   if (style.styleSheet.disabled) {
    //     setTimeout(fun, 10)
    //   } else {
    //     fun
    //   }
    // }else{
    //   var textNode = document.createTextNode(cssStr);
    //   style.appendChild(textNode)
    // }
    // head.appendChild(style)
  },

  createCodeMirror: function(CodeMirror) {
    var me = this

    if (!me.elRendered) return
    if (me.codeEditor) return

    var codeEditor = new CodeMirror.fromTextArea(me.inputEl.dom, {
      id: me.id + '_codemirror',
      width: me.width,
      value: me.value || '',
      readOnly: !!me.readOnly,
      lineNumbers: true,
      tabSize: 4,
      mode: me.synMode,
      theme: me.theme,
      toggleComment: true,
      extraKeys: {
         'Ctrl-j': 'autocomplete',
         "Ctrl-/": "toggleComment",
         "Alt-F": "findPersistent",
        //  "Ctrl-;": function(cm){ alert("ctrl-;")},
       },
      indentUnit: 4,
      styleActiveLine: true,
      matchBrackets: true,
      gutters: ["CodeMirror-linenumbers", "breakpoints"]
    })
    codeEditor.setSize(me.width, me.height)
    codeEditor.setOption('theme', 'monokai') //设置主题

    codeEditor.on("gutterClick", function(cm, n) {
      setDebugLineCSS(cm,n)      
    });
    
    function setDebugLineCSS(cm, n) {
        n = n ? n : cm.getCursor().line
        var info = cm.lineInfo(n)
        if (info.text.trim() == "")  return 
        var containGutter = false
        if ("gutterMarkers" in info && info.gutterMarkers)
          containGutter = true
        cm.setGutterMarker(n, "breakpoints", containGutter ? null : makeMarker());
        if (!containGutter)
          cm.addLineClass(n, "background", "DebugLineBackground")
        else
          cm.removeLineClass(n, "background", "DebugLineBackground")
    }

    function makeMarker() {
      var marker = document.createElement("div");
      marker.style.color = "#822";
      marker.innerHTML = "●";
      return marker;
    }

    
    codeEditor.on('keyup', function(cm, event) {
      if (
        (!cm.state.completionActive &&
          (event.keyCode >= 65 && event.keyCode <= 90)) ||
        event.keyCode == 52 ||
        event.keyCode == 219 ||
        event.keyCode == 190
      ) 
        CodeMirror.commands.autocomplete(cm, null, { completeSingle: false })        
      else if (event.keyCode == 116) //F5                        
        setDebugLineCSS(cm)      
      else if (event.keyCode == 119) //F8
        me.singleDebug(cm)    
    })

    // location.hash = '#idea'
    me.initialized = true
    me.codeEditor = codeEditor || null
  },

  singleDebug: function (cm, begin, step) { //TODO 等待最终确定入参
    cm.debugLineNum = ("debugLineNum" in cm && cm.debugLineNum) || []
    if (cm.debugLineNum.length){
      begin = cm.debugLineNum.pop()
      if (begin < cm.lineCount()) {
        cm.setCursor(begin+1)
        cm.debugLineNum.push(begin+1)
      }
    }else{
      if (begin){
        cm.setCursor(begin)
        cm.debugLineNum.push(begin) 
      }else{
        cm.setCursor(0)  
        cm.debugLineNum.push(0)
          
      }
    }
    ajaxRequest(this,'当前调试中','调试行'+begin)   //这里传this是因为方法是me调用的，me就是最外层封装好的控件
  },

  configMode: function() {
    switch (this.language.toLowerCase()) {
      case 'pas':
      case 'pascal':
        this.theme = 'borland'
        if (!checkLoadedFile(this.theme)) {
          this.loadCSS(this.codeMirrorPath + '/theme/borland.css')
        }
        this.synMode = 'text/x-pascal'
        this.loadScript('objectpascal')
        break

      case 'ansipascal':
        this.synMode = 'text/x-pascal'
        this.loadScript('pascal')
        break

      case 'js':
        this.synMode = 'text/javascript'
        this.loadScript('javascript')
        break

      case 'java':
        this.synMode = 'text/javascript'
        this.loadScript('javascript')
        break

      case 'python':
        this.synMode = 'text/x-python'
        this.loadScript('python')
        break

      case 'vb':
        this.synMode = 'text/x-vb'
        this.loadScript('vb')
        break

      case 'cs':
        this.synMode = 'text/x-csharp'
        this.loadScript('clike')
        break

      case 'xml':
        this.synMode = 'text/xml'
        this.loadScript('xml')
        break

      case 'perl':
        this.synMode = 'text/x-perl'
        this.loadScript('perl')
        break

      case 'ruby':
        this.synMode = 'text/x-ruby'
        this.loadScript('ruby')
        break

      case 'css':
        this.synMode = 'text/css'
        this.loadScript('css')
        break

      case 'sql':
        this.synMode = 'text/x-sql'
        this.loadScript('sql')
        break

      case 'php':
        this.synMode = 'application/x-httpd-php'
        this.loadScript('php')
        break

      case 'html':
        this.synMode = 'text/html'
        this.loadScript('htmlmixed')
        break

      case 'txt':
      default:
        this.synMode = 'text/x-textile'
        this.loadScript('textile')
        break
    }
  },

  initComponent: function() {
    this.initialized = false
    if (this.codeMirrorPath === null) {
      throw 'Ext.ux.form.CodeMirror: codeMirrorPath required'
    }

    require.config({
      packages: [
        {
          name: 'codemirror',
          location: this.codeMirrorPath,
          main: 'lib/codemirror'
        }
      ]
    })
    this.loadCSS(this.codeMirrorPath +'/theme/idea.css')
    this.loadCSS(this.codeMirrorPath +'/theme/monokai.css') //这个方法可以动态加载css
    this.loadCSS(this.codeMirrorPath +'/addon/hint/show-hint.css')      
    this.loadCSS(this.codeMirrorPath +'/addon/dialog/dialog.css')          
    this.callParent(arguments)
    this.configMode(this.language)
    this.on({
      resize: function(ta, width, height) {
        if (this.codeEditor) {
          this.codeEditor.setSize(width, height)
        }
      },

      boxready: function() {
        var me = this
        me.elRendered = true
        if (me.CodeMirror) {
          me.createCodeMirror(me.CodeMirror)
        }
      }
    })
  },

  getValue: function() {
    if (this.initialized) {
      return this.codeEditor.getValue()
    }
    return this.value
  },

  setValue: function(v) {
    this.value = v
    if (this.initialized) {
      this.codeEditor.setValue(v)
    }
    this.callParent(arguments)
  },

  validate: function() {
    this.getValue()
    this.callParent(arguments)
  },

  isDirty: function() {
    return !(this.originalValue === this.getValue())
  },

  setReadOnly: function(readOnly) {
    var me = this
    readOnly = !!readOnly
    me[readOnly ? 'addCls' : 'removeCls'](me.readOnlyCls)
    me.readOnly = readOnly
    if (me.codeEditor) {
      me.codeEditor.setReadOnly(readOnly)
    }
    me.fireEvent('writeablechange', me, readOnly)
  }
})
