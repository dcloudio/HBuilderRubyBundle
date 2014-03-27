=begin 
本文档是JS代码块的编辑文件。注意不要把其他语言的设置放到js里来。
HBuilder可使用ruby脚本来编辑代码块和增强操作命令。
1、编辑代码块
如果要新增一个代码块，复制如下一段代码到空白行，然后设定参数。
	'document.getElementById'是代码块的显示名字；
	s.trigger = 'dgi' 是设定激活字符，比如输入dgi均会在代码提示时显示该代码块；
	s.expansion = '' 是设定该代码块的输出字符，其中$0、$1是光标的停留和切换位置。
	s.needApplyReContentAssist = true 是输入代码块后立即激活代码提示助手，此项可选，一般不用。
snippet "document.getElementById" do |s|
    s.trigger = "dgi"
    s.expansion = "document.getElementById(\"$1\")"
    s.needApplyReContentAssist = true
end

2、编辑按键命令
如果要新增一个按键操作命令，复制如下一段代码到空白行，然后设定参数。
  command t(:multicomment) do |cmd| #:首先起个名字,multicomment是名字
    cmd.key_binding = 'M1+M2+/' #这里绑定触发按键，这里是Ctrl+Shift+/
    cmd.input = :selection #输入内容是选中区域的内容
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

操作时注意冲突，注意备份，有问题就还原。
多看看已经写的ruby命令，会发现更多强大技巧。
修改完毕，需要重启才能生效。
玩的愉快，别玩坏！

脚本开源地址 https://github.com/dcloudio/HBuilderRubyBundle ，可以把你的配置共享到这里，也可以在这里获取其他网友的版本
=end

require 'ruble'

with_defaults :scope => "source.js" do
  
  snippet t(:object_method) do |s|
    s.trigger = ":f"
    s.expansion = "${1:method_name}: function(${2:attribute}){
	$0
}${3:,}"
  end
  
  snippet t(:function) do |s|
    s.trigger = "functionn"
    s.expansion = "function ${1:function_name} ($2) {
	$3
}"
  end
  
  snippet t(:function_anonymous) do |s|
    s.trigger = "functiona"
    s.expansion = "function ($1) {
	$2
}"
  end
  
  snippet t(:function_closures) do |s|
    s.trigger = "functionc"
    s.expansion = "(function ($1) {
	$2
})($3)"
  end
  
  snippet t(:prototype) do |s|
    s.trigger = "proto"
    s.expansion = "${1:class_name}.prototype.${2:method_name} = function(${3:first_argument}) {
	${0:// body...}
};
"
  end
  
  snippet t(:if) do |s|
    s.trigger = "iff"
    s.expansion = "if ($1) {
	
}"
  end
  
  snippet t(:if_else) do |s|
    s.trigger = "ife"
    s.expansion = "if ($1) {
	
} else{
	
}"
  end

  snippet t(:if_compare) do |s|
    s.trigger = "ifc"
    s.expansion = "if ($1 == true) {
	
} else{
	
}"
  end
  
  snippet t(:for) do |s|
    s.trigger = "forr"
    s.expansion = "for ($1) {
	$2
}"
  end

  snippet t(:fori) do |s|
    s.trigger = "fori"
    s.expansion = "for (var i = 0; i < ${1:Things}.length; i++) {
	${1:Things}[i]
}"
  end
  
  snippet t(:with) do |s|
    s.trigger = "with"
    s.expansion = "with ($1){
	$2
}"
  end
  snippet t(:typeof) do |s|
    s.trigger = "typeof"
    s.expansion = 'typeof($1)=="${2:undefined/boolean/function/number/object/string}"'
  end  

  snippet t(:switch_case) do |s|
    s.trigger = "switchc"
    s.expansion = "switch (${1}){
	case ${2:value}:
		break;
	default:
		break;
}"
  end
  
  snippet "while" do |s|
    s.trigger = "whilee"
    s.expansion = "while (${1:condition}){
	
}"
  end
  
  snippet "$ (document.getElementById)" do |s|
    s.trigger = "$$"
    s.expansion = "document.getElementById(\"$1\")"
    s.needApplyReContentAssist = true
  end
  
  snippet '$("")' do |s|
    s.trigger = "dl"
    s.expansion = "$$(\"$0\")"
    s.needApplyReContentAssist = true
  end
  
  snippet "document.getElementById" do |s|
    s.trigger = "dgi"
    s.expansion = "document.getElementById(\"$1\")"
    s.needApplyReContentAssist = true
  end
  
  snippet "document.write" do |s|
    s.trigger = "dw"
    s.expansion = "document.write($1)"
  end
  
  snippet "var i=0;" do |s|
	s.trigger = "vari"
	s.expansion = "var i=0;"
  end
  
  snippet "var s=\"\";" do |s|
	s.trigger = "vars"
	s.expansion = "var s=\"$1\";"
  end
  
  snippet "var a=[];" do |s|
	s.trigger = "vara"
	s.expansion = "var a=[$1];"
  end
  
  snippet "var l=a.length;" do |s|
	s.trigger = "varl"
	s.expansion = "var l=${1:a}.length;"
  end
  
  snippet "return true;" do |s|
	s.trigger = "returntrue"
	s.expansion = "return true;"
  end
  
  snippet "return false;" do |s|
	s.trigger = "returnfalse"
	s.expansion = "return false;"
  end
  
  snippet "console.log();" do |s|
	s.trigger = "consolelog"
	s.expansion = "console.log($1);"
  end
 
  snippet "try{}catch(e) {...}" do |s|
  s.trigger = "trycatch"
  s.expansion = "try{
	$1
}catch(e){
	//TODO handle the exception
}"
  end
  
  snippet t(:object_value) do |s|
    s.trigger = ":,"
    s.expansion = "${1:value_name}:${0:value},"
  end
  
  snippet t(:object_key) do |s|
    s.trigger = ":"
    s.expansion = '${1:key}: ${2:"${3:value}"}${4:, }'
  end
  
  snippet t(:setTimeout) do |s|
    s.trigger = "timeout"
    s.expansion = "setTimeout(function() {$0}, ${1:10});"
  end
  
  snippet t(:object_method_string) do |s|
    s.trigger = ':f'
    s.expansion = "'${1:${2:#thing}:${3:click}}': function(element){
	$0
}${4:,}"
  end
  
  snippet "@alias" do |s|
  	s.trigger = "@alias"
  	s.locationType="JS_DOC"
  	s.expansion = "@alias ${1:alias_name}"
  end
  
  snippet "@author" do |s|
  	s.trigger = "@author"
  	s.locationType="JS_DOC"
  	s.expansion = "@author ${1:author}"
  end
  
  snippet "@classDescription" do |s|
  	s.trigger = "@classDescription"
  	s.locationType="JS_DOC"
  	s.expansion = "@classDescription {${1:namespace}} ${2:description}"
  end
  
  snippet "@constructor" do |s|
  	s.trigger = "@constructor"
  	s.locationType="JS_DOC"
  	s.expansion = "@constructor ${1:description}"
  end
  
  snippet "@example" do |s|
  	s.trigger = "@example"
  	s.locationType="JS_DOC"
  	s.expansion = "@example ${1:example_code}"
  end
  
  snippet "@exception" do |s|
  	s.trigger = "@exception"
  	s.locationType="JS_DOC"
  	s.expansion = "@exception {${1:exception_type}} ${2:description}"
  end
  
  snippet "@extends" do |s|
  	s.trigger = "@extends"
  	s.locationType="JS_DOC"
  	s.expansion = "@extends {${1:parent_type}} ${2:description}"
  end
  
  snippet "@internal" do |s|
  	s.trigger = "@internal"
  	s.locationType="JS_DOC"
  	s.expansion = "@internal ${1}"
  end
  
  snippet "@param" do |s|
  	s.trigger = "@param"
  	s.locationType="JS_DOC"
  	s.expansion = "@param {${1:param_type}} ${2:param_name}"
  end
  
  snippet "@private" do |s|
  	s.trigger = "@private"
  	s.locationType="JS_DOC"
  	s.expansion = "@private ${1}"
  end
  
  snippet "@return" do |s|
  	s.trigger = "@return"
  	s.locationType="JS_DOC"
  	s.expansion = "@return {${1:return_type}} ${2}"
  end
  
  snippet "@see" do |s|
  	s.trigger = "@see"
  	s.locationType="JS_DOC"
  	s.expansion = "@see ${2:link}"
  end
  
  snippet "@userAgent" do |s|
  	s.trigger = "@userAgent"
  	s.locationType="JS_DOC"
  	s.expansion = "@userAgent ${1:browser1}:${2:version1},${3:browser2}:${4:version2}"
  end
  
end


with_defaults :scope => "source.js", :input => :none, :output => :insert_as_snippet do |bundle|

  command t(:multicomment) do |cmd| #:首先起个名字,multicomment是名字
    cmd.key_binding = 'M1+M2+/' #这里绑定触发按键，这里是Ctrl+Shift+/
    cmd.input = :selection #输入内容是选中区域的内容
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

end
