=begin 
本文档是CSS代码块的编辑文件。注意不要把其他语言的设置放到css里来。
HBuilder可使用ruby脚本来编辑代码块和增强操作命令。
1、编辑代码块
如果要新增一个代码块，复制如下一段代码到空白行，然后设定参数。
	'userselect:none'是代码块的显示名字；
	s.trigger = 'usn' 是设定激活字符，比如输入usn会在代码提示时显示该代码块；
	s.expansion = '' 是设定该代码块的输出字符，其中$0、$1是光标的停留和切换位置。
snippet "userselect:none" do |s|
    s.trigger = "usn"
    s.expansion = '-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;'
end

2、编辑按键命令
如果要新增一个按键操作命令，复制如下一段代码到空白行，然后设定参数。
'Br'是命令名字；
s.key_binding = 'CONTROL+ENTER' 是设定按什么快捷键可以触发这个命令；
s.expansion = '<br/>' 是设定输出字符。

snippet 'Br' do |s|
  s.key_binding = 'CONTROL+ENTER'
  s.expansion = '<br/>'
end
以上以html代码块做示例，css代码块类似，使用时注意避免混淆

操作时注意冲突，注意备份，有问题就还原。
多看看已经写的ruby命令，会发现更多强大技巧。
修改完毕，需要重启才能生效。
玩的愉快，别玩坏！

脚本开源地址 https://github.com/dcloudio/HBuilderRubyBundle ，可以把你的配置共享到这里，也可以在这里获取其他网友的版本
=end

require 'ruble'

with_defaults :scope => "source.css support.type.property-name.css" do
  
#  snippet "!important CSS" do |s|
#    s.trigger = "!"
#    s.expansion = "${1:!important}"
#  end
  
  snippet "-webkit-" do |s|
    s.trigger = "webkit"
    s.needApplyReContentAssist = true
    s.expansion = '-webkit-'
  end
  
  snippet "-moz-" do |s|
    s.trigger = "moz"
    s.needApplyReContentAssist = true
    s.expansion = '-moz-'
  end
  
  snippet "-ms-" do |s|
    s.trigger = "ms"
    s.needApplyReContentAssist = true
    s.expansion = '-ms-'
  end
  
  snippet "background: image repeat attachment position" do |s|
    s.trigger = "bg"
    s.needApplyReContentAssist = true
    s.expansion = "background: url($1) ${2:repeat/repeat-x/repeat-y/no-repeat} ${3:scroll/fixed} ${4:top left/top center/top right/center left/center center/center right/bottom left/bottom center/bottom right/x-% y-%/x-pos y-pos};$0"
  end
    
  snippet "background-color" do |s|
    s.trigger = "bc"
    s.expansion = "background-color: $1"
    s.needApplyReContentAssist = true
  end
    
  snippet "background-color: \#" do |s|
    s.trigger = "bch"
    s.expansion = "background-color: \#$1"
    s.needApplyReContentAssist = true
  end
  
  snippet "background-color: rgb" do |s|
    s.trigger = "bcr"
    s.expansion = "background-color: rgb(${1:255},${2:255},${3:255})"
  end
  
  snippet "background-image" do |s|
    s.trigger = "bi"
    s.expansion = "background-image: $1"
    s.needApplyReContentAssist = true
  end
  
  snippet "background-image: url" do |s|
    s.trigger = "biu"
    s.expansion = "background-image: url($1)"
    s.needApplyReContentAssist = true
  end
  
  snippet "background-position" do |s|
    s.trigger = "bp"
    s.expansion = "background-position: $1"
    s.needApplyReContentAssist = true
  end

  snippet "border-color" do |s|
    s.trigger = "boc"
    s.expansion = 'border-color: $1'
    s.needApplyReContentAssist = true
  end
  
  snippet "border-style" do |s|
    s.trigger = "bs"
    s.expansion = 'border-style: $1'
    s.needApplyReContentAssist = true
  end
  
  snippet "border-width" do |s|
    s.trigger = "bw"
    s.expansion = 'border-width: $1'
    s.needApplyReContentAssist = true
  end
  
  snippet "display: none" do |s|
    s.trigger = "dn"
    s.expansion = 'display: none'
  end
  
  snippet "display: block" do |s|
    s.trigger = "db"
    s.expansion = 'display: block'
  end
  
  snippet "font-family: family" do |s|
    s.trigger = "ff"
    s.expansion = 'font-family: $1'
    s.needApplyReContentAssist = true
  end
  
  snippet "font-size: size" do |s|
    s.trigger = "fsize"
    s.expansion = 'font-size: $1'
    s.needApplyReContentAssist = true
  end

  snippet "height length" do |s|
    s.trigger = "height"
    s.expansion = 'height ${1}px;$0'
  end
  
  snippet "list-style-image: url" do |s|
    s.trigger = "lsi"
    s.expansion = 'list-style-image: url($1);'
    s.needApplyReContentAssist = true
  end
  
  snippet "properties { } ( } )" do |s|
    s.trigger = "{"
    s.expansion = '{
	/* $1 */
	$0
'
  end
  # FIXME Doesn't work
  snippet "scrollbar" do |s|
    s.trigger = "scrollbar"
    s.expansion = 'scrollbar-base-color:       ${1:#CCCCCC};
scrollbar-arrow-color:      ${2:#000000};
scrollbar-track-color:      ${3:#999999};
scrollbar-3dlight-color:    ${4:#EEEEEE};
scrollbar-highlight-color:  ${5:#FFFFFF};
scrollbar-face-color:       ${6:#CCCCCC};
scrollbar-shadow-color:     ${7:#999999};
scrollbar-darkshadow-color: ${8:#666666};'
  end
  
  snippet "text-align: left" do |s|
    s.trigger = "tal"
    s.expansion = 'text-align: left;'
  end

  snippet "text-align: center" do |s|
    s.trigger = "tac"
    s.expansion = 'text-align: center;'
  end

  snippet "text-align: right" do |s|
    s.trigger = "tar"
    s.expansion = 'text-align: right;'
  end
  
  snippet "text-transform" do |s|
    s.trigger = "tt"
    s.expansion = 'text-transform: $1'
    s.needApplyReContentAssist = true
  end
  
  snippet "width length" do |s|
    s.trigger = "width"
    s.expansion = 'width: ${1}px;$0'
  end
  
  snippet "userselect:none" do |s|
    s.trigger = "usn"
    s.expansion = '-webkit-user-select: none;
-moz-user-select: none;
-ms-user-select: none;'
  end
end

with_defaults :scope => "source.css entity.name.tag.css" do
  snippet "@font-face" do |s|
    s.trigger = "@fontface"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@font-face {
	font-family:$1;
	src: url($2);
}'
  end
  
  snippet "@import" do |s|
    s.trigger = "@import"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@import url("${1:global.css}");'
  end
  
  snippet "@charset" do |s|
    s.trigger = "@charset"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@charset "${1:utf-8}";'
  end
  
  snippet "@page" do |s|
    s.trigger = "@page"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@page:${1:first/left/right}{
	
}'
  end
  snippet "@keyframes" do |s|
    s.trigger = "@keyframes"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@keyframes ${1:name}{
	from{$2}
	to{$3}
}'
  end
  
  snippet "@-moz-keyframes" do |s|
    s.trigger = "@keyframes"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@-moz-keyframes ${1:name}{
	from{$2}
	to{$3}
}'
  end
  
  snippet "@-ms-keyframes" do |s|
    s.trigger = "@keyframes"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@-ms-keyframes ${1:name}{
	from{$2}
	to{$3}
}'
  end
  
  snippet "@-webkit-keyframes" do |s|
    s.trigger = "@keyframes"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@-webkit-keyframes ${1:name}{
	from{$2}
	to{$3}
}'
  end
  
  snippet "@document" do |s|
    s.trigger = "@document"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@document ${1:url/url-prefix/domain/regexp}("$2") {
	$3
}'
  end
  
  snippet "@supports" do |s|
    s.trigger = "@supports"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@supports(${1:prop}:${2:value}) {
	$3
}'
  end
  
  snippet "@namespace" do |s|
    s.trigger = "@namespace"
    s.locationType="CSS_OUTRULE"
    s.expansion = '@namespace ${1:prefix} "$2";'
  end
  
    
  snippet "@media" do |s|
    s.trigger = "@media"
    s.locationType="CSS_OUTRULE"
	s.expansion = '@media only screen and (min-width: $1px) {
	$2
}'
  end
end
