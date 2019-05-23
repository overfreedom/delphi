;(function(mod) {
  if (typeof exports == 'object' && typeof module == 'object')
    // CommonJS
    mod(require('../../lib/codemirror'))
  else if (typeof define == 'function' && define.amd)
    //AMD
    define(['../../lib/codemirror'], mod)
  else mod(CodeMirror)
})(function(CodeMirror) {
  var pascalKeyWords=['Abs','absolute','abstract','and','AnsiChar','AnsiString','array','as','asm','assembler','Assigned','begin','Boolean','Byte',
    'Cardinal','case','cdecl','Ceil','Char','class','const','constructor','Copy','Cos','Currency','default','Delete','deprecated','destructor',
    'dispinterface','div','do','Double','downto','dynamic','else','end','except','Exit','Exp','export','exports','Extended','external','False',
    'far','file','finalization','finally','Floor','for','forward','function','goto','High','if','implementation','in','index','inherited',
    'initialization','inline','Int','Int64','Integer','interface','is','label','Length','library','Ln','LongBool','LongInt','LongWord','Low',
    'message','mod','nil','not','null','object','of','OleVariant','on','or','Ord','out','overload','override','packed','PAnsiChar','pascal',
    'PChar','Pi','Pointer','Pos','Power','private','procedure','program','property','protected','public','published','PWideChar','raise','Random',
    'read','Real','record','register','reintroduce','repeat','resourcestring','Round','safecall','set','shl','ShortInt','ShortString','shr','Sin',
    'Single','SizeOf','SmallInt','Sqr','Sqrt','stdcall','stored','string','TDateTime','then','threadvar','to','True','Trunc','try','type','TypeInfo',
    'unit','until','uses','var','Variant','virtual','while','WideChar','with','write','xor','_CHAR_UNSIGNED','_CPPUNWIND','_M_IX86','_WCHAR_T',
    '_WCHAR_T_DEFINED','_Windows','__BCOPT__','__BCPLUSPLUS__','__BORLANDC__','__CDECL__','__CONSOLE__','__DATE__','__DLL__','__FILE__','__LINE__',
    '__MSDOS__','__MT__','__PASCAL__','__STDC__','__TCPLUSPLUS__','__TEMPLATES__','__TIME__','__TLS__','__TURBOC__','__WIN32__','__asm','__automated',
    '__cdecl','__classid','__closure','__cplusplus','__declspec','__dispid','__except','__export','__fastcall','__finally','__import','__int16','__int32',
    '__int64','__int8','__pascal','__property','__published','__rtti','__stdcall','__thread','__try','_asm','_cdecl','_export','_fastcall','_import',
    '_pascal','_stdcall','auto','bool','break','catch','char','const_cast','continue','delete','double','dynamic_cast','enum','explicit','extern','false',
    'float','friend','int','long','mutable','namespace','new','NULL','operator','reinterpret_cast','return','short','signed','sizeof','static','static_cast',
    'struct','switch','template','this','throw','true','typedef','typeid','typename','union','unsigned','using','void','volatile','wchar_t']

  var Pos = CodeMirror.Pos
  CodeMirror.registerHelper('hint', 'pascal', pascalHint)  
  function pascalHintLoad() {
    //可以用来加载服务器文件 加载Hint资源？
    let xhr = new XMLHttpRequest(),
      okStatus = document.location.protocol === 'file:' ? 0 : 200
    xhr.open('GET', 'PreDefSymbols.xml', false)
    xhr.overrideMimeType('text/html;charset=utf-8') //默认为utf-8
    xhr.send(null)
    return xhr.status === okStatus ? xhr.responseText : null
  }

  function forAllProps(obj, callback) {
    if (!Object.getOwnPropertyNames || !Object.getPrototypeOf) {
      for (var name in obj) callback(name)
    } else {
      for (var o = obj; o; o = Object.getPrototypeOf(o))
        Object.getOwnPropertyNames(o).forEach(callback)
    }
  }

  function forEach(arr, f) {
    for (var i = 0, e = arr.length; i < e; ++i) f(arr[i]);
  }


  function arrayContains(arr, item) {
    if (!Array.prototype.indexOf) {
      var i = arr.length;
      while (i--)
        if (arr[i] === item) {
          return true;
        }
      return false;
    }
    return arr.indexOf(item) != -1;
  }  

  function getCompletions(token, context, keywords, options) {
    var found = [], start = token.string, global = options && options.globalScope || window;
    function maybeAdd(str) {
      if (str.lastIndexOf(start, 0) == 0 && !arrayContains(found, str)) found.push(str);
    }
    function gatherCompletions(obj) {
      if (typeof obj == "string") forEach(stringProps, maybeAdd);
      else if (obj instanceof Array) forEach(arrayProps, maybeAdd);
      else if (obj instanceof Function) forEach(funcProps, maybeAdd);
      forAllProps(obj, maybeAdd)
    }

    if (context && context.length) {
      //  just look in the global object and any local scope
      for (var v = token.state.localVars; v; v = v.next) maybeAdd(v.name);
      for (var v = token.state.globalVars; v; v = v.next) maybeAdd(v.name);
      // if (!options || options.useGlobalScope !== false)
      //   gatherCompletions(global);
      forEach(keywords, maybeAdd);
    }
    return found;
  }

  function scriptHint(editor, options, keywords, getToken) {
    // Find the token at the cursor
    var cur = editor.getCursor(), token = getToken(editor, cur);
    if (/\b(?:string|comment)\b/.test(token.type)) return;
    token.state = CodeMirror.innerMode(editor.getMode(), token.state).state;

    // If it's not a 'word-style' token, ignore the token.
    if (!/^[\w$_]*$/.test(token.string)) {
      token = {
        start: cur.ch, end: cur.ch, string: "", state: token.state,
        type: token.string == "." ? "property" : null
      };
    } else if (token.end > cur.ch) {
      token.end = cur.ch;
      token.string = token.string.slice(0, cur.ch - token.start);
    }

    var tprop = token;
    // If it is a property, find out what it is a property of.
    // while (tprop.type == "property" || tprop.type == 'var') {
    //   tprop = getToken(editor, Pos(cur.line, tprop.start));
    //   if (tprop.string != ".") return;
    //   tprop = getToken(editor, Pos(cur.line, tprop.start));
    //   if (!context) var context = [];
    //   context.push(tprop);
    // }
    if (!context) var context = [];    
    context.push(tprop);
    return {
      list: getCompletions(token, context, keywords, options),
      from: Pos(cur.line, token.start),
      to: Pos(cur.line, token.end)
    }
  }
  function pascalHint(editor, options) {    
    return scriptHint(editor, options, pascalKeyWords, function (e, cur) {
      return e.getTokenAt(cur);
    })
  }
  
});
