require 'ruble'
=begin 
 HBuilder可使用ruby脚本来扩展代码块和增强操作命令。这是极客的神奇玩具。
  本文档用于用户自定义JS扩展命令，并非HBuilder预置命令的文档，预置的代码块不可改。查阅预置代码块，请在弹出预置代码块界面时点右下角的编辑按钮，比如dw代码块。
  本文档修改完毕，保存即可生效。
  玩的愉快，别玩坏！
  
  脚本开源地址 https://github.com/dcloudio/HBuilderRubyBundle
  可以把你的配置共享到这里，也可以在这里获取其他网友的版本
  
  注：如果1.9版本之前的用户修改过代码块，请点右键打开本文档所在目录，找之前的snippets.rb.bak文件，把修改过的内容放置进来。 
=end

with_defaults :scope => "source.js" do #=====扩展定义JS代码块========================
#如下是一个示例代码块，可以复制后再添加新代码块
  snippet 'document.createElement()' do |s|            #document.createElement()是显示名称，代码助手提示列表显示时可见   
    s.trigger = "dc"                                   #dc是激活字符，即按下dc后会触发该代码块 
    s.expansion = "document.createElement(\"$1\")$0"   #expansion是代码块的输出内容，其中$0、$1是光标的停留和切换位置。$1是第一个停留光标，$0是最后回车时停留的光标。                        
                                                       #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。                                                         
                                                       #输出双引号在前面加\来转义，输出$使用\$(单引号中)或\\$(双引号中)转义                                                                
    s.needApplyReContentAssist = true                  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出标签列表
  end
    
    #复制上述代码块，删除备注，在下面即可开始自定义
#js
  snippet "console.log();" do |s|
    s.trigger = "clog"
    s.expansion = "console.log($1);"
  end
  snippet "return true;" do |s|
  s.trigger = "rtrue"
  s.expansion = "return true;"
  end
  snippet "return false;" do |s|
  s.trigger = "rfalse"
  s.expansion = "return false;"
  end
  snippet "querySelector" do |s|
  s.trigger = "ds"
  s.needApplyReContentAssist = true
  s.expansion = "document.querySelector(\'$1\').$0"
  end 
  snippet "querySelectoraddEventListener" do |s|
  s.trigger = "dsa"
  s.needApplyReContentAssist = true
  s.expansion = "document.querySelector(\'$1\').addEventListener(\'${2:tap}\',function ($3) {
        $0
})"
  end 
  snippet "getElementByIdaddEventListener" do |s|
  s.trigger = "dga"
  s.needApplyReContentAssist = true
  s.expansion = "document.getElementById(\'$1\').addEventListener(\'${2:tap}\',function ($3) {
        $0
})"
  end 
  snippet "windowaddEventListener" do |s|
  s.trigger = "wad"
  s.needApplyReContentAssist = true
  s.expansion = "window.addEventListener(\'${1:scroll}\',function ($2) {
        $0
})"
  end 
  snippet "documentaddEventListener" do |s|
  s.trigger = "dad"
  s.needApplyReContentAssist = true
  s.expansion = "document.addEventListener(\'${1:scroll}\',function ($2) {
        $0
})"
  end 
  snippet "mui.on" do |s|
  s.trigger = "mmon"
  s.needApplyReContentAssist = true
  s.expansion = "mui('$1').on('${2:tap}','$3',function($4){
  $0
}) "
  end 
  snippet "mui.off" do |s|
  s.trigger = "mmoff"
  s.needApplyReContentAssist = true
  s.expansion = "mui('$1').off('${2:tap}','$3',function($4){
  $0
}) "
  end 
  snippet "mui.trigger()" do |s|
  s.trigger = "mtrigger"
  s.expansion = "mui.trigger(${1:dom},'${3:tap}'${4:,{a:'as'}})"
  end 
  snippet "mui.fire()" do |s|
  s.trigger = "mfire"
  s.needApplyReContentAssist = true
  s.expansion = "mui.fire(${1:targetWebviewObj},'${2:event}',{${3:data}})"
  end 
  snippet "mui()" do |s|
  s.trigger = "mmui"
  s.needApplyReContentAssist = true
  s.expansion = "mui('$1')"
  end 
  snippet "mui.each()" do |s|
  s.trigger = "meach"
  s.expansion = "mui.each(${1:obj},function (${2:index},${3:element}) {
	$0
})"
  end 
  snippet "mui().each()" do |s|
  s.trigger = "mmeach"
  s.expansion = "mui('$1').each(function (${3:index},${4:element}) {
	$0
})"
  end 
  snippet "mui.extend()" do |s|
  s.trigger = "mextend"
  s.expansion = "mui.extend(${1:'target'},${2:'source'},${3:'deep'/true/false})"
  end 
  snippet "mui.later()" do |s|
  s.trigger = "mlater"
  s.expansion = "mui.later(function()\{
	$2  
},${1:500/1000/1500/2000})"
  end 
  snippet "mui.scrollTo()" do |s|
  s.trigger = "mscrollto"
  s.expansion = "mui.scrollTo(${1:ypos},${2:duration},${3:/function () {
    	
}}$0"
  end 
  snippet "mui.ajax()" do |s|
  s.trigger = "majax"
  s.needApplyReContentAssist = true
  s.expansion = "mui.ajax('$1',{
	data:{
		$2
	},
	dataType:'${3:json}',//服务器返回json格式数据
	type:'${4:post}',//HTTP请求类型
	timeout:${5:10000},//超时时间设置为10秒；
	success:function(${6:data}){
		$7
	},
	error:function(${8:xhr,type,errorThrown}){
		$9
	}
});$0"
  end 
  snippet "mui.post()" do |s|
  s.trigger = "mpost"
  s.needApplyReContentAssist = true
  s.expansion = "mui.post('$1',{
		$2
	},function(${3:data}){
		$0
	},'${4:json}'
);"
  end 
  snippet "mui.get()" do |s|
  s.trigger = "mget"
  s.needApplyReContentAssist = true
  s.expansion = "mui.gett('$1',{
		$2
	},function(${3:data}){
		$0
	},'${4:json}'
);"
  end 
  snippet "mui.getJSON()" do |s|
  s.trigger = "mjson"
  s.needApplyReContentAssist = true
  s.expansion = "mui.getJSON('$1',{$2},function($3){
		$4
	}
);$0"
  end 
#init
    snippet "mui.init" do |s|
      s.trigger = "minit"
      s.expansion = "mui.init({$0})"
      #s.needApplyReContentAssist = true
  end
  snippet "mui.init({子页面})" do |s|
  s.trigger = "minsubpage"
  s.needApplyReContentAssist = true
  s.expansion = "mui.init({
	subpages:[{
	  url:'${1:url}',
      id:'${2:id}',
      styles:{
        $3
      },
      extras:{$4}
	}]
})$0"
  end 
  snippet "mui.init({预加载})" do |s|
  s.trigger = "minpreload"
  s.needApplyReContentAssist = true
  s.expansion = "mui.init({
	preloadPages:[{
	  url:'${1:url}',
      id:'${2:id}',
      styles:{
        $3
      },
      extras:{$4}
	}]
})$0"
  end 
  snippet "mui.init({刷新组件})" do |s|
  s.trigger = "minpullRefresh"
  s.needApplyReContentAssist = true
  s.expansion = "mui.init({
  pullRefresh : {
    container:'\#${1:refreshContainer}',
    down : {
      callback :${2:pullfresh}
    },
    up : {
      callback :${3:pullfresh} 
    }
  }
});$0"
  end 
  snippet "mui.init({手势事件})" do |s|
  s.trigger = "mingesture"
  s.expansion = "mui.init({
  	gestureConfig:{
	   tap: ${1:true/false}, 
	   doubletap: ${2:true/false}, 
	   longtap: ${3:true/false}, 
	   swipe: ${4:true/false}, 
	   drag: ${5:true/false}, 
	   hold:${6:false/true},
	   release:${7:false/true}
  	}
});$0"
  end 
  snippet "mui.init({侧滑返回})" do |s|
  s.trigger = "minswipeback"
  s.expansion = "mui.init({
	swipeBack:${1:true/false} 
);$0"
  end 
  snippet "mui.init({按键绑定})" do |s|
  s.trigger = "minkeyevent"
  s.expansion = "mui.init({
	keyEventBind: {
		backbutton: ${1:true/false},  
		menubutton: ${2:true/false}   
	},
})"
  end 
  snippet "mui.init({重写窗口关闭逻辑})" do |s|
  s.trigger = "minbeforeback"
  s.expansion = "mui.init({
	beforeback:function () {
		$0
	}
})"
  end 
  snippet "mui.init({设置状态栏颜色})" do |s|
  s.trigger = "minstatusbar"
  s.needApplyReContentAssist = true
  s.expansion = "mui.init({
	statusBarBackground:'\#${1:FFFFFF}'
})"
  end 
  snippet "mui.init({预加载数量})" do |s|
  s.trigger = "minprelimit"
  s.needApplyReContentAssist = true
  s.expansion = "preloadLimit:${1:5}"
  end 
#plus
 snippet "plusReady" do |s|
      s.trigger = "pready"
      s.expansion = "function plusReady(){
    $0
}
if (window.plus) {
    plusReady()
} else{
    document.addEventListener('plusready',plusReady,false);
}"
      s.needApplyReContentAssist = true
  end
    snippet "plus.accelerometer" do |s|
      s.trigger = "pacce"
      s.expansion = "plus.accelerometer."
      s.needApplyReContentAssist = true
  end
    snippet "plus.audio" do |s|
      s.trigger = "paudio"
      s.expansion = "plus.audio."
      s.needApplyReContentAssist = true
  end
    snippet "plus.barcode" do |s|
      s.trigger = "pbarcode"
      s.expansion = "plus.barcode."
      s.needApplyReContentAssist = true
  end
    snippet "plus.camera" do |s|
      s.trigger = "pcamera"
      s.expansion = "plus.camera."
      s.needApplyReContentAssist = true
  end
    snippet "plus.contacts" do |s|
      s.trigger = "pcontacts"
      s.expansion = "plus.contacts."
      s.needApplyReContentAssist = true
  end
    snippet "plus.device" do |s|
      s.trigger = "pdevice"
      s.expansion = "plus.device."
      s.needApplyReContentAssist = true
  end
    snippet "plus.gallery" do |s|
      s.trigger = "pgallery"
      s.expansion = "plus.gallery."
      s.needApplyReContentAssist = true
  end
    snippet "plus.geolocation" do |s|
      s.trigger = "pgeolocation"
      s.expansion = "plus.geolocation."
      s.needApplyReContentAssist = true
  end
    snippet "plus.io" do |s|
      s.trigger = "pio"
      s.expansion = "plus.io."
      s.needApplyReContentAssist = true
  end
    snippet "plus.key" do |s|
      s.trigger = "pkey"
      s.expansion = "plus.key."
      s.needApplyReContentAssist = true
  end
    snippet "plus.maps" do |s|
      s.trigger = "pmaps"
      s.expansion = "plus.maps."
      s.needApplyReContentAssist = true
  end
    snippet "plus.messaging" do |s|
      s.trigger = "pmessaging"
      s.expansion = "plus.messaging."
      s.needApplyReContentAssist = true
  end
    snippet "plus.nativeObj" do |s|
      s.trigger = "pnativeObj"
      s.expansion = "plus.nativeObj."
      s.needApplyReContentAssist = true
  end
    snippet "plus.nativeUI" do |s|
      s.trigger = "pnativeUI"
      s.expansion = "plus.nativeUI."
      s.needApplyReContentAssist = true
  end
    snippet "plus.navigator" do |s|
      s.trigger = "pnavigator"
      s.expansion = "plus.navigatorsc."
      s.needApplyReContentAssist = true
  end
    snippet "plus.orientation" do |s|
      s.trigger = "porientation"
      s.expansion = "plus.orientation."
      s.needApplyReContentAssist = true
  end
    snippet "plus.payment" do |s|
      s.trigger = "ppayment"
      s.expansion = "plus.payment."
      s.needApplyReContentAssist = true
  end
    snippet "plus.proximity" do |s|
      s.trigger = "pproximity"
      s.expansion = "plus.proximity."
      s.needApplyReContentAssist = true
  end
    snippet "plus.push" do |s|
      s.trigger = "ppush"
      s.expansion = "plus.push."
      s.needApplyReContentAssist = true
  end
    snippet "plus.runtime" do |s|
      s.trigger = "pruntime"
      s.expansion = "plus.runtime."
      s.needApplyReContentAssist = true
  end
    snippet "plus.share" do |s|
      s.trigger = "pshare"
      s.expansion = "plus.share."
      s.needApplyReContentAssist = true
  end
    snippet "plus.speech" do |s|
      s.trigger = "pspeech"
      s.expansion = "plus.speech.$0"
      s.needApplyReContentAssist = true
  end
    snippet "plus.net" do |s|
      s.trigger = "pnet"
      s.expansion = "plus.net."
      s.needApplyReContentAssist = true
  end
    snippet "plus.zip" do |s|
      s.trigger = "pzip"
      s.expansion = "plus.zip."
      s.needApplyReContentAssist = true
  end
    snippet "plus.networkinfo" do |s|
      s.trigger = "pnetworkinfo"
      s.expansion = "plus.networkinfo."
      s.needApplyReContentAssist = true
  end
    snippet "plus.display" do |s|
      s.trigger = "pdisplay"
      s.expansion = "plus.display."
      s.needApplyReContentAssist = true
  end
    snippet "plus.Screen" do |s|
      s.trigger = "pScreen"
      s.expansion = "plus.Screen."
      s.needApplyReContentAssist = true
  end
    snippet "plus.os" do |s|
      s.trigger = "pos"
      s.expansion = "plus.os."
      s.needApplyReContentAssist = true
  end
    snippet "plus.oauth" do |s|
      s.trigger = "poauth"
      s.expansion = "plus.oauth."
      s.needApplyReContentAssist = true
  end
    snippet "plus.oauth" do |s|
      s.trigger = "poauth"
      s.expansion = "plus.oauth."
      s.needApplyReContentAssist = true
  end
    snippet "plus.statistic" do |s|
      s.trigger = "pstatistic"
      s.expansion = "plus.statistic."
      s.needApplyReContentAssist = true
  end
    snippet "plus.storage" do |s|
      s.trigger = "pstorage"
      s.expansion = "plus.storage."
      s.needApplyReContentAssist = true
  end
    snippet "plus.uploader" do |s|
      s.trigger = "puploader"
      s.expansion = "plus.uploader."
      s.needApplyReContentAssist = true
  end
    snippet "plus.android" do |s|
      s.trigger = "pandroid"
      s.expansion = "plus.android."
      s.needApplyReContentAssist = true
  end
    snippet "plus.ios" do |s|
      s.trigger = "pios"
      s.expansion = "plus.ios."
      s.needApplyReContentAssist = true
  end
    snippet "plus.oauth" do |s|
      s.trigger = "poauth"
      s.expansion = "plus.oauth."
      s.needApplyReContentAssist = true
  end
    snippet "plus.downloader" do |s|
      s.trigger = "pdown"
      s.expansion = "plus.downloader."
      s.needApplyReContentAssist = true
  end
#mui
    snippet "mui.plusReady()" do |s|
      s.trigger = "mplusready"
      s.expansion = "mui.plusReady(function () {
    $1
})$0"
  end
    snippet "mui.ready" do |s|
      s.trigger = "mready"
      s.expansion = " mui.ready(function () {
   	$0
   })"
      s.needApplyReContentAssist = true
  end
    snippet "mui.open" do |s|
      s.trigger = "mopen"
      s.expansion = "mui.openWindow('${1:url}','${2:id}',{$3})"
      s.needApplyReContentAssist = true
  end
    snippet "mui.currentWebview" do |s|
      s.trigger = "mcurrent"
      s.expansion = "mui.currentWebview."
      s.needApplyReContentAssist = true
  end

    snippet "mui.back()" do |s|
      s.trigger = "mback"
      s.expansion = "mui.back()$0"
  end
    snippet "mui.backFunction" do |s|
      s.trigger = "mbackfunction"
      s.expansion = "mui.back=function () {
    $0	
}"
  end
    snippet "mui.preload()" do |s|
      s.trigger = "mpreload"
      s.expansion = "mui.preload({
	url:'${1:url}',
	id:'${2:id}',
	styles:{$3},//窗口参数
	extras:{$4}//自定义扩展参数
})$0"
      s.needApplyReContentAssist = true
  end
    snippet "clogios" do |s|
      s.trigger = "cloios"
      s.expansion = "		console.log(JSON.stringify(${1:e}));
		console.log('${2:e}');"
      s.needApplyReContentAssist = true
  end
    snippet "mui.os" do |s|
      s.trigger = "mos"
      s.expansion = "mui.os."
      s.needApplyReContentAssist = true
  end
    snippet "mui.mask" do |s|
      s.trigger = "mmask"
      s.expansion = "var ${1:mask} = mui.createMask(function () {
	$2
})
${1:mask}.show()"
  end
    snippet "mui('').pullRefresh" do |s|
      s.needApplyReContentAssist = true
      s.trigger = "mmpullrefresh"
      s.expansion = "mui('\#${1:refreshContainer}').pullRefresh().$2"
  end
end


with_defaults :scope => "source.js", :input => :none, :output => :insert_as_snippet do |bundle|  #=====无显示名称的快捷命令=======================
=begin 
  command t(:multicomment) do |cmd| #:首先给命令命名,multicomment，该命令的目的是选中多行js后统一注释
    cmd.key_binding = 'M1+M2+/' #这里绑定触发按键，这里是Ctrl+Shift+/
    cmd.input = :selection #输入内容是选中区域的内容
    #以下是输出
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
      # 如果选区长度大于0，则输出如下字符。回车符就使用真实回车。如下输出即在选中内容前后加上/* */的注释
      if selection.length > 0
        "/*
${1:#{selection}}
*/"
      end
    end
  end
=end
end