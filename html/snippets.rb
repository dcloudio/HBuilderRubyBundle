=begin 
本文档是HTML代码块的编辑文件。注意不要把其他语言的设置放到html里来。
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
以上以HTML代码块做示例，js和css代码块类似，使用时注意避免混淆
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

with_defaults :scope => 'text.html entity.other.attribute-name.html' do |bundle|

	snippet 'data-' do |s|
		s.trigger = 'data-'
		s.expansion='data-${1:type/role/transition/icon/iconpos/*} = "$2"'
     	s.locationType='HTML_ATTRIBUTE'
	end

end

with_defaults :scope => 'text.html text' do |bundle|

snippet t(:html_4_strict) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
	"http://www.w3.org/TR/html4/strict.dtd">
'
end

snippet t(:xhtml_1_frameset) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
'
end

snippet t(:xhtml_1_strict) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
'
end

snippet t(:xhtml_1_transitional) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
'
end

snippet t(:xhtml_11) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
	"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
'
end

snippet t(:movie) do |s|
  s.trigger = 'movie'
  s.expansion = '<object width="${2:320}" height="${3:240}" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">
	<param name="src" value="${1:movie.mov}"/>
	<param name="controller" value="${4:true}"/>
	<param name="autoplay" value="${5:true}"/>
	<embed src="${1:movie.mov}"
		width="${2:320}" height="${3:240}"
		controller="${4:true}" autoplay="${5:true}"
		scale="tofit" cache="true"
		pluginspage="http://www.apple.com/quicktime/download/"
	></embed>
</object>'
end

snippet t(:html_4_transitional) do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
'
end

snippet 'input with label' do |s|
  s.trigger = 'input'
  s.expansion = '<label for="$2">$1</label><input type="${3:text/submit/hidden/button}" name="$2" value="$5" id="$2"/>'
end

snippet t(:option) do |s|
  s.trigger = 'opt'
  s.expansion = '<option value="${1:option}">${1:option}</option>'
end

snippet 'input' do |s|
  s.trigger = 'input'
  s.expansion = '<input type="$1" name="$2" id="$2" value="$3" />'
  s.needApplyReContentAssist = true
end

snippet 'textarea' do |s|
  s.trigger = 'textarea'
  s.expansion = '<textarea name="$1" rows="$2" cols="$3">$0</textarea>'
end

snippet 'canvas' do |s|
  s.trigger = 'canvas'
  s.expansion = '<canvas id="$1" width="$2" height="$3"></canvas>'
end

snippet 'iframe' do |s|
  s.trigger = 'iframe'
  s.expansion = '<iframe src="$1" width="$2" height="$3"></iframe>'
  s.needApplyReContentAssist = true
end

snippet t(:nbsp) do |s|
  s.key_binding = 'OPTION+Space'
  s.expansion = '&nbsp;'
end

snippet 'Br' do |s|
  s.key_binding = 'CONTROL+ENTER'
  s.expansion = '<br/>'
end

snippet 'link' do |s|
  s.trigger = 'link'
  s.expansion = '<link rel="stylesheet" type="text/css" href="$1"/>'
  s.needApplyReContentAssist = true
end

snippet 'meta' do |s|
  s.trigger = 'meta'
  s.needApplyReContentAssist = true
  s.expansion = '<meta name="$1" content="$2"/>'
end

snippet 'meta_UTF8' do |s|
  s.trigger = 'metautf'
  s.expansion = '<meta charset="UTF-8"/>'
end

snippet 'meta_GB2312' do |s|
  s.trigger = 'metagb'
  s.expansion = '<meta charset="GB2312"/>'
end

snippet 'meta_nocache' do |s|
  s.trigger = 'metanocache'
  s.expansion = '<meta http-equiv="Pragma" content="no-cache" />'
end

snippet 'meta_keywords' do |s|
  s.trigger = 'metakeywords'
  s.expansion = '<meta name="Keywords" content="$1"/>'
end

snippet 'meta_description' do |s|
  s.trigger = 'metadescription'
  s.expansion = '<meta name="Description" content="$1"/>'
end

snippet 'meta_viewport' do |s|
  s.trigger = 'metaviewport'
  s.expansion = '<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />'
end

snippet 'script_google_jquery' do |s|
  s.trigger = 'scriptjqg'
  s.expansion = '<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>'
end

snippet 'script_baidu_jquery' do |s|
  s.trigger = 'scriptjqb'
  s.expansion = '<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>'
end

snippet '<!--[if IE]>' do |s|
  s.trigger = 'ifie'
  s.expansion = '<!--[if IE]>
	$1
<![endif]-->'
end

snippet '<!--[if lte IE 6]>' do |s|
  s.trigger = 'ifie6'
  s.expansion = '<!--[if lte IE 6]>
	$1
<![endif]-->'
end

snippet '<select>...</select>' do |s|
  s.trigger = 'select'
  s.expansion = '<select name="$1">
    <option value="$2">$3</option>
</select>'
end

snippet 'dl' do |s|
  s.trigger = 'dl'
  s.expansion = '<dl>
	<dt>$1</dt>
	<dd>$2</dd>
</dl>'
end

snippet 'ul' do |s|
  s.trigger = 'ul'
  s.expansion = '<ul>
	<li>$1</li>
</ul>'
end

snippet 'form' do |s|
  s.trigger = 'form'
  s.expansion = "<form action=\"$1\" method=\"${2:get}\">
	$0
	<input type=\"submit\" value=\"$3\"/>
</form>"
	s.needApplyReContentAssist = true
end

snippet 'input_text' do |s|
  s.trigger = 'intext'
  s.expansion = '<input type="text" id="$1" value="$2" />'
  s.needApplyReContentAssist = true
end

snippet 'input_button' do |s|
  s.trigger = 'inbutton'
  s.expansion = '<input type="button" id="$1" value="$2" />'
  s.needApplyReContentAssist = true
end

snippet 'input_image' do |s|
  s.trigger = 'inimage'
  s.expansion = '<input type="image" src="$1" />'
  s.needApplyReContentAssist = true
end

snippet 'input_password' do |s|
  s.trigger = 'inpassword'
  s.expansion = '<input type="password" name="$1" />'
end

snippet 'input_search' do |s|
  s.trigger = 'insearch'
  s.expansion = '<input type="search" name="$1" required="$2" placeholder="Search" x-webkit-speech="$3" x-webkit-grammar="builtin:search" lang="zh-CN">'
end

snippet 'input_submit' do |s|
  s.trigger = 'insubmit'
  s.expansion = '<input type="submit" id="$1" name="$2" />'
end

snippet 'input_reset' do |s|
  s.trigger = 'inreset'
  s.expansion = '<input type="reset"/>'
end

snippet 'img' do |s|
  s.trigger = 'img'
  s.expansion = '<img src="$1"/>'
  s.needApplyReContentAssist = true
end

snippet 'a_link' do |s|
  s.trigger = 'al'
  s.expansion = '<a href="$1"></a>'
  s.needApplyReContentAssist = true
end

snippet 'a_mailto' do |s|
  s.trigger = 'am'
  s.expansion = '<a href="mailto:$1"></a>'
end

snippet 'video' do |s|
  s.trigger = 'video'
  s.expansion = '<video width="${1:800}" height="$2">
	<source src="${3:myvideo.mp4}" type="video/mp4"></source>
	<source src="${4:myvideo.ogv}" type="video/ogg"></source>
	<source src="${5:myvideo.webm}" type="video/webm"></source>
	<object width="$6" height="$7" type="application/x-shockwave-flash" data="${8:myvideo.swf}">
		<param name="movie" value="$8" />
		<param name="flashvars" value="autostart=true&amp;file=$8" />
	</object>
		当前浏览器不支持 video直接播放，点击这里下载视频： <a href="${9:myvideo.webm}">下载视频</a>
</video>'
end

snippet t(:script_w_external_source) do |s|
  s.trigger = 'scsrc'
  s.expansion = '<script src="$1" type="text/javascript" charset="${3:utf-8}"></script>'
  s.needApplyReContentAssist = true
end

snippet 'Script' do |s|
  s.trigger = 'script'
  s.expansion = '<script type="text/javascript" charset="utf-8">
	$0
</script>'
end

snippet 'style' do |s|
  s.trigger = 'style'
  s.expansion = '<style type="text/css">
	$0
</style>'
end

snippet '<!DOCTYPE html>' do |s|
  s.trigger = 'doctype'
  s.expansion = '<!DOCTYPE HTML>'
end

snippet 'html' do |s|
  s.trigger = 'html'
  s.expansion = '<html>
	<head>
		<title>$0</title>
	</head>
	<body>
		
	</body>
</html>'
end

snippet 'h1' do |s|
  s.trigger = 'h1'
  s.expansion = '<h1>$0</h1>'
end

snippet 'h2' do |s|
  s.trigger = 'h2'
  s.expansion = '<h2>$0</h2>'
end

snippet 'h3' do |s|
  s.trigger = 'h3'
  s.expansion = '<h3>$0</h3>'
end

snippet 'h4' do |s|
  s.trigger = 'h4'
  s.expansion = '<h4>$0</h4>'
end

snippet 'h5' do |s|
  s.trigger = 'h5'
  s.expansion = '<h5>$0</h5>'
end

snippet 'h6' do |s|
  s.trigger = 'h6'
  s.expansion = '<h6>$0</h6>'
end

snippet 'table' do |s|
  s.trigger = 'table'
  s.expansion = '<table border="$1" cellspacing="$2" cellpadding="$3">
	<tr><th>${4:Header}</th></tr>
	<tr><td>${5:Data}</td></tr>
</table>'
end

snippet 'head' do |cmd|
    cmd.trigger = 'head'
    cmd.expansion = "<head>
	<meta charset=\"utf-8\"/>
	<title>$1</title>
	
</head>"
end

snippet 'body' do |cmd|
    cmd.trigger = 'body'
    cmd.expansion = "<body>
	$0
</body>"
end

snippet 'div' do |cmd|
    cmd.trigger = 'div'
  	cmd.needApplyReContentAssist = true
    cmd.expansion = "<div id=\"$1\">
	$0
</div>"        
end

snippet 'span' do |cmd|
    cmd.trigger = 'span'
  	cmd.needApplyReContentAssist = true
    cmd.expansion = "<span id=\"$1\">
	$0
</span>"        
end

snippet 'fieldset' do |cmd|
  cmd.trigger = 'fieldset'
  cmd.expansion = "<fieldset id=\"$2\">
	<legend>$1</legend>
	
	$0
</fieldset>"
end

end # End Snippets with scope 'text.html text'

# -----------------------------------------------------------------------------------
# Snippets that used env vars and needed to be converted to commands
with_defaults :scope => 'text.html - source', :input => :none, :output => :insert_as_snippet do |bundle|

  command t(:quick_br) do |cmd|
    cmd.key_binding = 'M2+ENTER'
    cmd.output = :insert_as_snippet
    cmd.input = :none
    cmd.invoke { "<br />" }
  end
	
  command t(:quick_html_space) do |cmd|
    cmd.key_binding = 'M2+SPACE'
    cmd.output = :insert_as_snippet
    cmd.input = :none
    cmd.invoke { "&nbsp;" }
  end

  command t(:emphasize) do |cmd|
    cmd.key_binding = 'M1+M2+I'
    cmd.input = :selection
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
      if selection.length > 0
        "<em>${1:#{selection}}</em>"
      else
        "<em>$0</em>"
      end
    end
  end
  
  command t(:strong) do |cmd|
    cmd.key_binding = 'M1+M2+B'
    cmd.input = :selection
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
      if selection.length > 0
        "<strong>${1:#{selection}}</strong>"
      else
        "<strong>$0</strong>"
      end
    end
  end
  
  command t(:wrap_selection_in_tag_pair) do |cmd|
    cmd.key_binding = "CONTROL+9"
    cmd.input = :selection
    cmd.invoke do |context|
      selection = ENV['TM_SELECTED_TEXT'] || ''
      if selection.length > 0
        "<${1:p}>#{selection.gsub('/', '\/')}</${1:p}>"
      else
        "<${1:p}>$0</${1:p}>"
      end
    end
  end
end #end of 'text.html - source'

with_defaults :scope => 'text.html text', :input => :none, :output => :insert_as_snippet do |bundle|
  command t(:ie_6_and_below) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : ' IE Conditional Comment: Internet Explorer 6 and below '
      "<!--[if lte IE 6]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie_6) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : '     IE Conditional Comment: Internet Explorer 6 only   '
      "<!--[if IE 6]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie_7_and_above) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : ' IE Conditional Comment: Internet Explorer 7 and above '
      "<!--[if gte IE 7]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie_8_and_above) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : ' IE Conditional Comment: Internet Explorer 8 and above '
      "<!--[if gte IE 8]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie_9_and_above) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : ' IE Conditional Comment: Internet Explorer 9 and above '
      "<!--[if gte IE 9]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:ie) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : '       IE Conditional Comment: Internet Explorer          '
      "<!--[if IE]>${1:#{value}}<![endif]-->$0"
    end
  end
  
  command t(:not_ie) do |cmd|
    cmd.trigger = '!'
    cmd.invoke do |context|
      value = (ENV['TM_SELECTED_TEXT'] || '').length > 0 ? ENV['TM_SELECTED_TEXT'] : '  IE Conditional Comment: NOT Internet Explorer      '
      "<!--[if !IE]><!-->${1:#{value}}<!-- <![endif]-->$0"
    end
  end
  
  command t(:wrap_in_jsp_tag) do |cmd|
    cmd.scope = 'text.html string'
    cmd.invoke {|context| "<?= #{ENV['TM_SELECTED_TEXT']} ?>" }
  end
end
