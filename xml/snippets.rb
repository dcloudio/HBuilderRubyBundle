=begin 
本文档是xml代码块的编辑文件。修改其他的代码块，请在对应的激活代码助手点右下角的修改图标。
HBuilder可使用ruby脚本来编辑代码块和增强操作命令。
1、编辑代码块
如果要新增一个代码块，复制如下一段代码到空白行，然后设定参数。
	'Style'是代码块的显示名字；
	s.trigger = 'style' 是设定激活字符，比如输入style均会在代码提示时显示该代码块；
	s.expansion = '' 是设定该代码块的输出字符，其中$0、$1是光标的停留和切换位置。
snippet 'Style' do |s|
  s.trigger = 'style'
  s.expansion = '<style type="text/css" media="screen">
	$0
</style>'
end
以上以HTML代码块做示例，其他代码块类似，使用时注意避免混淆
2、编辑按键命令
如果要新增一个按键操作命令，复制如下一段代码到空白行，然后设定参数。
'Br'是命令名字；
s.key_binding = 'CONTROL+ENTER' 是设定按什么快捷键可以触发这个命令；
s.expansion = '<br/>' 是设定输出字符。

snippet 'Br' do |s|
  s.key_binding = 'CONTROL+ENTER'
  s.expansion = '<br/>'
end

操作时注意冲突，注意备份，有问题就还原。
多看看已经写的ruby命令，会发现更多强大技巧。
修改完毕，需要重启才能生效。
玩的愉快，别玩坏！

脚本开源地址 https://github.com/dcloudio/HBuilderRubyBundle ，可以把你的配置共享到这里，也可以在这里获取其他网友的版本
=end
require 'ruble'

with_defaults :scope => 'text.xml' do
  snippet 'CDATA' do |s|
    s.trigger = 'cdata'
    s.expansion = '<![CDATA[$0]]>'
  end
  
  snippet t(:long_attribute_tag) do |s|
    s.trigger = '<a'
    s.expansion = '<${1:name} ${2:attr="value"}>$0
</${1:name}>'
  end
  
  snippet t(:long_tag) do |s|
    s.trigger = '<'
    s.expansion = '<${1:name}>$0</${1:name}>'
  end
  
  snippet t(:short_tag) do |s|
    s.trigger = '>'
    s.expansion = '<${1:name} />'
  end

  snippet t(:xml_processing_instruction) do |s|
    s.trigger = '<?xml'
    s.expansion = '<?xml version="1.0" encoding="UTF-8"?>'
  end
end
  
# snippet 'Special: Return Inside Empty Open/Close Tags' do |s|
  # FIXME This should probably be moved into the AutoIndentStrategy for XML Editor!
#  s.key_binding = '\n'
#  s.scope = 'meta.scope.between-tag-pair.xml'
#  s.expansion = '
# $0
#'
#end
