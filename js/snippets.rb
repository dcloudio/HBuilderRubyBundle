=begin 
本文档是HBuilder预置的js代码块的文件。注意不要把其他语言的设置放到js里来。
如果用户修改此文档，HBuilder升级后会覆盖用户的修改，建议进入菜单 工具→扩展代码块 扩展相应的代码块。
若修改本文档，需要重启才能生效。修改过程中注意备份。

脚本开源地址 https://github.com/dcloudio/HBuilderRubyBundle

1、编辑代码块
如果要新增一个代码块，复制如下一段代码到空白行，然后设定参数。
snippet "document.getElementById" do |s|            #'document.getElementById'是代码块的显示名字；
    s.trigger = "dgi"                               #'dgi' 是激活字符，比如输入dgi均会在代码提示时显示该代码块；
    s.expansion = "document.getElementById(\"$1\")" #expansion是设定该代码块的输出字符，其中$0、$1是光标的停留和切换位置。
                                                    #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。
                                                    #输出双引号在前面加\来转义，输出$使用$$转义
    s.needApplyReContentAssist = true               #输入代码块后立即在$1位置激活代码提示助手
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

=end

require 'ruble'

with_defaults :scope => "source.js" do   #=====JS代码块编辑===============================
  
  snippet t(:object_method) do |s|
    s.trigger = ":f"
    s.expansion = "${1:method_name}: function(${2:attribute}){
	$0
}${3:,}"
  end
  
  snippet "function" do |s|
    s.trigger = "funn"
    s.expansion = "function ${1:function_name} ($2) {
	$3
}"
  end
  
  snippet t(:function_anonymous) do |s|
    s.trigger = "funan"
    s.expansion = "function ($1) {
	$2
}"
  end
  
  snippet t(:function_closures) do |s|
    s.trigger = "funcl"
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
    $2
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
    s.expansion = "if ($1 == ${2:true}) {
	
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
    s.trigger = "withh"
    s.expansion = "with ($1){
	$2
}"
  end
  snippet t(:typeof) do |s|
    s.trigger = "typeoff"
    s.expansion = 'typeof($1)=="${2:undefined/boolean/function/number/object/string}"'
  end  

  snippet t(:switch_case) do |s|
    s.trigger = "switchcase"
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

  snippet "var i=0;" do |s|
  s.trigger = "vari"
  s.expansion = "var ${1:i}=${2:0};"
  end
  
  snippet "var s=\"\";" do |s|
  s.trigger = "vars"
  s.expansion = "var ${1:s}=\"$2\";"
  end
  
  snippet "var a=[];" do |s|
  s.trigger = "vara"
  s.expansion = "var ${1:a}=[$2];"
  end
  
  snippet "var l=a.length;" do |s|
  s.trigger = "varl"
  s.expansion = "var ${1:l}=${2:a}.length;"
  end

  snippet "var c = canvas" do |s|
    s.trigger = "varc"
    s.expansion = "var ${2:c} = document.getElementById(\"$1\").getContext(\"2d\");"
    s.needApplyReContentAssist = true
  end

  snippet "var xhr" do |s|
    s.trigger = "varxhr"
    s.expansion = "var ${1:xhr} = new XMLHttpRequest();
xhr.open(\"${2:GET/POST/PUT}\",\"$3\",${4:true/false});"
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
  s.expansion = "console.log(\"$1\");"
  end
  
  snippet "try{}catch(e)" do |s|
  s.trigger = "trycatch"
  s.expansion = "try{
	$1
}catch(e){
	//TODO handle the exception
}"
  end
  
  snippet "$ (document.getElementById)" do |s|
    s.trigger = "$$$"
    s.expansion = "document.getElementById(\"$1\")"
    s.needApplyReContentAssist = true
  end

  snippet '$("")' do |s|
    s.trigger = "dl"
    s.expansion = "$$(\"$1\")"
    s.needApplyReContentAssist = true
  end
  snippet '$("#")' do |s|
    s.trigger = "dlid"
    s.expansion = "$$(\"\#$1\")"
    s.needApplyReContentAssist = true
  end
  snippet '$(".")' do |s|
    s.trigger = "dlclass"
    s.expansion = "$$(\".$1\")"
    s.needApplyReContentAssist = true
  end
  
  snippet "document.getElementById" do |s|
    s.trigger = "dgi"
    s.expansion = "document.getElementById(\"$1\")"
    s.needApplyReContentAssist = true
  end

  snippet "document.querySelectorAll" do |s|
    s.trigger = "dqs"
    s.expansion = "document.querySelectorAll(\"$1\")"
    s.needApplyReContentAssist = true
  end
  
  snippet "document.write" do |s|
    s.trigger = "dw"
    s.expansion = "document.write(\"$1\")"
  end

  snippet "navigator.userAgent;" do |s|
  s.trigger = "nuser"
  s.expansion = "navigator.userAgent"
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

  snippet "@function" do |s|
    s.trigger = "@function"
    s.locationType="JS_DOC"
    s.expansion = "@function ${1}"
  end
    
  snippet "@internal" do |s|
  	s.trigger = "@internal"
  	s.locationType="JS_DOC"
  	s.expansion = "@internal ${1}"
  end
  
  snippet "@param" do |s|
  	s.trigger = "@param"
  	s.locationType="JS_DOC"
  	s.expansion = "@param {${1:boolean/function/number/object/string/AttrString/ClassString/ColorString/CSSString/CSSURIString/EventString/FontString/HTMLString/IDString/ImageURIString/JSURIString/MultimediaString/SelectorString/TagString/URIString}} ${2:param_name}"
  end
  
  snippet "@private" do |s|
  	s.trigger = "@private"
  	s.locationType="JS_DOC"
  	s.expansion = "@private ${1}"
  end

  snippet "@property" do |s|
    s.trigger = "@property"
    s.locationType="JS_DOC"
    s.expansion = "@property ${1}"
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
  
  snippet "@type" do |s|
    s.trigger = "@type"
    s.locationType="JS_DOC"
    s.expansion = "@type {${1:boolean/function/number/object/string/AttrString/ClassString/ColorString/CSSString/CSSURIString/EventString/FontString/HTMLString/IDString/ImageURIString/JSURIString/MultimediaString/SelectorString/TagString/URIString}} ${2:param_name}"
  end
    
  snippet "@userAgent" do |s|
  	s.trigger = "@userAgent"
  	s.locationType="JS_DOC"
  	s.expansion = "@userAgent ${1:browser1}:${2:version1},${3:browser2}:${4:version2}"
  end
  
end


with_defaults :scope => "source.js", :input => :none, :output => :insert_as_snippet do |bundle|
=begin
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
=end
end
