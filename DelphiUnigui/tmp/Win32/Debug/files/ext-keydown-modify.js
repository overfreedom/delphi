Ext.onReady(function(){        
  Ext.WindowMgr.zseed = 10000;    
  Ext.QuickTips.init();     
       
  Ext.getDoc().on("contextmenu", function(e){       
      e.stopEvent();       
  });     
      
  if(document.addEventListener){    
      document.addEventListener("keydown",maskBackspace, true);    
  }else{    
      document.attachEvent("onkeydown",maskBackspace);    
  }    
      
  function maskBackspace(event){    
      var event = event || window.event;  //标准化事件对象    
      var obj = event.target || event.srcElement;    
      var keyCode = event.keyCode ? event.keyCode : event.which ?    
              event.which : event.charCode;    
      if(keyCode == 8){    
          if(obj!=null && obj.tagName!=null && (obj.tagName.toLowerCase() == "input"      
                 || obj.tagName.toLowerCase() == "textarea")){    
              event.returnValue = true ;    
              if(Ext.getCmp(obj.id)){    
                  if(Ext.getCmp(obj.id).readOnly) {    
                      if(window.event)    
                          event.returnValue = false ;  //or event.keyCode=0    
                      else    
                          event.preventDefault();   //for ff    
                  }    
              }    
          }else{    
              if(window.event)    
                  event.returnValue = false ;   // or event.keyCode=0    
              else    
                  event.preventDefault();    //for ff    
          }    
      }    
  }    
      
  var map = new Ext.KeyMap(document, [    
  {    
      key: [116], // F5    
      fn: function(){ },    
      stopEvent: true,    
      scope: this    
  },{    
      key: [37,39,115], //方向键左,右,F4    
      alt: true,    
      fn: function(){ },    
      stopEvent: true,    
      scope: this    
  }, {    
      key: [82],  // ctrl + R    
      ctrl: true,    
      fn: function(){ },    
      stopEvent: true,    
      scope: this    
  }]);    
  map.enable();    
});   