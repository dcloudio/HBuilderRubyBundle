=begin 
本文档是jquery代码块的编辑文件。修改其他的代码块，请在对应的激活代码助手点右下角的修改图标。
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

with_defaults :scope => 'source.js' do

snippet t(:select_dom_element) do |s|
  s.trigger = '$'
  #s.expansion = '\$(${1/(.+)/(?1:\':)/}${1:string/element/array/function/jQuery object/string, context}${1/(.+)/(?1:\':)/})$0'
  s.expansion = '\$(${1:\'string\'/element/array/function/jQuery object/\'string\', context})$0'
end

snippet '$(this)' do |s|
  s.trigger = 'this'
  s.expansion = '\$(this)$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet '$.ajax' do |s|
  # s.trigger = '$.ajax'
  # s.expansion = '\$.ajax({
  # url: \'${1:/path/to/file}\',
# ${2/(.+)/(?1:  type\: \':)/}${2:POST}${2/(.+)/(?1:\',
# :)/}${3/(.+)/(?1:  dataType\: \':)/}${3:xml/html/script/json/jsonp}${3/(.+)/(?1:\',
# :)/}${4/(.+)/(?1:  data\: {:)/}${4:param1: \'value1\'}${4/(.+)/(?1:},
# :)/}${5/(.+)/(?1:  complete\: function\(xhr, textStatus\) {
    # :)/}${5://called when complete}${5/(.+)/(?1:
  # },
# :)/}${6/(.+)/(?1:  success\: function\(data, textStatus, xhr\) {
    # :)/}${6://called when successful}${6/(.+)/(?1:
  # },
# :)/}${7/(.+)/(?1:  error\: function\(xhr, textStatus, errorThrown\) {
    # :)/}${7://called when there is an error}
# ${7/(.+)/(?1:  }
# :)/}});
# $0'
# end

snippet 'ajaxError' do |s|
  s.trigger = '.ajaxError'
  s.expansion = '.ajaxError(function(${1:event, xhr, settings, thrownError}) {
	${2://stuff to do when an AJAX call returns an error};
});
$0'
end

snippet 'ajaxSend' do |s|
  s.trigger = '.ajaxSend'
  s.expansion = '.ajaxSend(function(${1:event, xhr, settings}) {
	${2://stuff to do before an AJAX request is sent};
});
$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet '$.ajaxSetup' do |s|
  # s.trigger = '$.ajaxSetup'
  # s.expansion = '\$.ajaxSetup({
  # url: \'${1:/path/to/file}\',
# ${2/(.+)/(?1:  type\: \':)/}${2:POST}${2/(.+)/(?1:\',
# :)/}${3/(.+)/(?1:  dataType\: \':)/}${3:xml/html/script/json/jsonp}${3/(.+)/(?1:\',
# :)/}${4/(.+)/(?1:  data\: {:)/}${4:param1: \'value1\'}${4/(.+)/(?1:},
# :)/}${5/(.+)/(?1:  complete\: function\(xhr, textStatus\) {
    # :)/}${5://called when complete}${5/(.+)/(?1:
  # },
# :)/}${6/(.+)/(?1:  success\: function\(data, textStatus, xhr\) {
    # :)/}${6://called when successful}${6/(.+)/(?1:
  # },
# :)/}${7/(.+)/(?1:  error\: function\(xhr, textStatus, errorThrown\) {
    # :)/}${7://called when there is an error}
# ${7/(.+)/(?1:  }
# :)/}});
# $0'
# end

snippet 'ajaxStart' do |s|
  s.trigger = '.ajaxStart'
  s.expansion = '.ajaxStart(function() {
	${1://stuff to do when an AJAX call is started and no other AJAX calls are in progress};
});
$0'
end

snippet 'ajaxStop' do |s|
  s.trigger = '.ajaxStop'
  s.expansion = '.ajaxStop(function() {
	${1://stuff to do when all AJAX calls have completed};
});
$0'
end

snippet 'ajaxSuccess' do |s|
  s.trigger = '.ajaxSuccess'
  s.expansion = '.ajaxSuccess(function(event, xhr, settings) {
	${1:// executes whenever an AJAX request completes successfully}
});$0'
end

snippet '$.boxModel' do |s|
  s.trigger = '$.boxModel'
  s.expansion = '\$.boxModel'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet '$.browser' do |s|
  # s.trigger = '$.browser'
  # s.expansion = '\$.browser${1/(.+)/(?1:.:)/}${1:webkit/opera/msie/mozilla}${1/(.+)/(?1: :)/}$0'
# end

snippet '$.browser.version' do |s|
  s.trigger = '$.browser'
  s.expansion = '\$.browser.version'
end

snippet '$.each' do |s|
  s.trigger = '$.each'
  s.expansion = '\$.each(${1:array/object}, function(${2:index}${3:, ${4:val}}) {
	${0://iterate through array or object}
});'
end

snippet '$.extend' do |s|
  s.trigger = '$.extend'
  s.expansion = '\$.extend(${1:true, }${2:target object}, ${3:object1});
$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet '$.get' do |s|
  # s.trigger = '$.get'
  # s.expansion = '\$.get(\'${1:/path/to/file}\'${2/(.+)/(?1:, {:)/}${2:param1: \'value1\'}${2/(.+)/(?1:}:)/}${3/(.+)/(?1:, function\(data, textStatus, xhr\) {
  # :)/}${3://optional stuff to do after success}${3/(.+)/(?1:
# }:)/});
# $0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet '$.getJSON' do |s|
  # s.trigger = '$.getJSON'
  # s.expansion = '\$.getJSON(\'${1:/path/to/file}\'${2/(.+)/(?1:, {:)/}${2:param1: \'value1\'}${2/(.+)/(?1:}:)/}${3/(.+)/(?1:, function\(json, textStatus\) {
  # :)/}${3://optional stuff to do after success}${3/(.+)/(?1:
# }:)/});
# $0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet '$.getScript' do |s|
  # s.trigger = '$.getScript'
  # s.expansion = '\$.getScript(\'${1:path/to/file}\'${2/(.+)/(?1:, function\(data, textStatus\) {
  # :)/}${2://optional stuff to do after getScript}${2/(.+)/(?1:
# }:)/});
# $0'
# end

snippet '$.inArray' do |s|
  s.trigger = '$.inArray'
  s.expansion = '\$.inArray(${1:value}, ${2:array});$0'
end

snippet '$.isEmptyObject' do |s|
  s.trigger = '$.isEmptyObject'
  s.expansion = '\$.isEmptyObject(\'${1:object}\')$0'
end

snippet '$.isPlainObject' do |s|
  s.trigger = '$.isPlainObject'
  s.expansion = '\$.isPlainObject(\'${1:object}\')$0'
end

snippet '$.map' do |s|
  s.trigger = '$.map'
  s.expansion = '\$.map(${1:array}, function(${2:item}${3:, ${4:index}}) {
	${5:return ${6:something};}
});'
end

snippet '$.merge' do |s|
  s.trigger = '$.merge'
  s.expansion = '\$.merge(${1:array1}, ${2:array2});
$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet '$.noop' do |s|
  # s.trigger = '$.noop'
  # s.expansion = '\$.noop()${0:;}${1:}'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet '$.parseJSON' do |s|
  # s.trigger = '$.parseJSON'
  # s.expansion = '\$.parseJSON(${1:json});${0:}'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet '$.post' do |s|
  # s.trigger = '$.post'
  # s.expansion = '\$.post(\'${1:/path/to/file}\'${2/(.+)/(?1:, {:)/}${2:param1: \'value1\'}${2/(.+)/(?1:}:)/}${3/(.+)/(?1:, function\(data, textStatus, xhr\) {
  # :)/}${3://optional stuff to do after success}${3/(.+)/(?1:
# }:)/});
# $0'
# end

snippet '$.trim' do |s|
  s.trigger = '$.trim'
  s.expansion = '\$.trim(${1:\'${2:string}\'})$0'
end

snippet '$.unique' do |s|
  s.trigger = '$.unique'
  s.expansion = '\$.unique(${1:DOMelementArray});
$0'
end

snippet 'add' do |s|
  s.trigger = '.add'
  s.expansion = '.add(\'${1:selector/elements/html}\')$0'
end

snippet 'addClass' do |s|
  s.trigger = '.addClass'
  s.expansion = '.addClass(\'${1:class name}\')$0'
end

snippet 'after' do |s|
  s.trigger = '.after'
  s.expansion = '.after(\'${1:Some text <b>and bold!</b>}\')$0'
end

snippet 'ajaxComplete' do |s|
  s.trigger = '.ajaxComplete'
  s.expansion = '.ajaxComplete(function(event, xhr, settings) {
	${1:// executes whenever an AJAX request completes}
});$0'
end

snippet 'andSelf' do |s|
  s.trigger = '.andSelf'
  s.expansion = '.andSelf()$0'
end

snippet 'animate (with callback)' do |s|
  s.trigger = '.animate'
  s.expansion = '.animate({${2:param1}: ${3:value1}${4:, ${5:param2}: ${6:value2}}}, ${7:speed}, function() {
	${0:// stuff to do after animation is complete}
})'
end

snippet 'animate' do |s|
  s.trigger = '.animate'
  s.expansion = '.animate({${1:${2:param1}: ${3:value1}${4:, ${5:param2}: ${6:value2}}}}, ${7:speed})$0'
end

snippet 'append' do |s|
  s.trigger = '.append'
  s.expansion = '.append(\'${1:Some text <b>and bold!</b>}\')$0'
end

snippet 'appendTo' do |s|
  s.trigger = '.appendTo'
  s.expansion = '.appendTo(\'${1:selector expression}\')$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'attr (map)' do |s|
  # s.trigger = '.attr'
  # s.expansion = '.attr({
  # ${1/^([^\'"].+-.+)$|.+/(?1:\':)/}${1:attribute1}${1/^([^\'"].+-.+[^\'"])$|.+/(?1:\':)/}: ${3:\'${2:value1}\'}${4/([^,]).*|.+/(?1:,
  # :)/m}${4:attribute2: \'value2\'}
# })$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'attr' do |s|
  # s.trigger = '.attr'
  # s.expansion = '.attr(\'${1:attribute}\'${2/(^,).*|.+/(?1::, )/}${2/(^([0-9]+$|,.*))|.+/(?1::\')/}${2:value}${2/(^([0-9]+$|,.*))|.+/(?1::\')/})$0'
# end

snippet 'before' do |s|
  s.trigger = '.before'
  s.expansion = '.before(\'${1:Some text <b>and bold!</b>}\')$0'
end

snippet 'bind' do |s|
  s.trigger = '.bind'
  s.expansion = '.bind(\'${1:event name}\', function(${2:event}) {
	${0:// Act on the event}
});'
end

snippet 'blur' do |s|
  s.trigger = '.blur'
  s.expansion = '.blur(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'change' do |s|
  s.trigger = '.change'
  s.expansion = '.change(${1:function() {
	${0:// Act on the event}
\}});'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'children' do |s|
  # s.trigger = '.children'
  # s.expansion = '.children(${1/(.+)/(?1:\':)/}${1:selector expression}${1/(.+)/(?1:\':)/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'clearqueue' do |s|
  # s.trigger = '.clearQueue'
  # s.expansion = '.clearQueue(${1/(.+)/(?1:\':)/}${1:queueName}${1/(.+)/(?1:\':)/})$0'
# end

snippet 'click' do |s|
  s.trigger = '.click'
  s.expansion = '.click(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'clone' do |s|
  s.trigger = 'clone'
  s.expansion = '.clone()$0'
end

snippet 'filter' do |s|
  s.trigger = '.filter'
  s.expansion = '.filter(\'${1:selector expression}\')$0'
end

snippet 'contains' do |s|
  s.trigger = '.contains'
  s.expansion = '.contains(\'${1:text to find}\')$0'
end

snippet 'contents' do |s|
  s.trigger = '.contents'
  s.expansion = '.contents()$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'css (map)' do |s|
  # s.trigger = '.css'
  # s.expansion = '.css({
  # ${1/^([^\'"].+-.+)$|.+/(?1:\':)/}${1:property1}${1/^([^\'"].+-.+[^\'"])$|.+/(?1:\':)/}: ${3:\'${2:value1}\'}${4/^([^,]).*|.+/(?1:,
  # :)/m}${4:property2: \'value2\'}
# })$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'css' do |s|
  # s.trigger = '.css'
  # s.expansion = '.css(\'${1:property}\'${2/(^,).*|.+/(?1::, )/}${2/(^([0-9]+$|,.*))|.+/(?1::\')/}${2:value}${2/(^([0-9]+$|,.*))|.+/(?1::\')/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'data' do |s|
  # s.trigger = '.data'
  # s.expansion = '.data(\'${1:data}\'${2/(.+)/(?1:, :)/}${2/(^[0-9]+$)|.+/(?1::\')/}${2:value}${2/(^[0-9]+$)|.+/(?1::\')/})$0'
#end

snippet 'dblclick' do |s|
  s.trigger = '.dblclick'
  s.expansion = '.dblclick(${1:function() {
	${0:// Act on the event}
\}});'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'delay' do |s|
  # s.trigger = '.delay'
  # s.expansion = '.delay(${1:milliseconds}${2/^([^,]|\w).*$|.+/(?1:, :)/}${2:queueName})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'delegate' do |s|
  # s.trigger = '.delegate'
  # s.expansion = '.delegate(\'${1:selector}\', \'${2:event type(s)}\'${3/(^{).*|.+/(?1::, {)/}${3:value}${3/(^(}.+$|,.*))|.+/(?1::})/}, function(${4:event}) {
	# ${0:// Act on the event}
# });'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'dequeue' do |s|
  # s.trigger = '.dequeue'
  # s.expansion = '.dequeue(${1/(.+)/(?1:\':)/}${1:queueName}${1/(.+)/(?1:\':)/})$0'
# end

snippet 'die' do |s|
  s.trigger = '.die'
  s.expansion = '.die(\'${1:click/dblclick/mousedown/mouseup/mousemove/mouseover/mouseout/keydown/keypress/keyup}\')$0'
end

snippet t(:document_ready_safe) do |s|
  s.trigger = 'ready'
  s.expansion = 'jQuery(document).ready(function(\$) {
	${0:// Stuff to do as soon as the DOM is ready. Use \$() w/o colliding with other libs;}
});
'
end

snippet t(:document_ready) do |s|
  s.trigger = 'ready'
  s.expansion = '\$(document).ready(function() {
	${0:// Stuff to do as soon as the DOM is ready;}
});
'
end

snippet 'each' do |s|
  s.trigger = '.each'
  s.expansion = '.each(function(index) {
	${0:this.innerHTML = this + " is the element, " + index + " is the position";}
});'
end

snippet 'end' do |s|
  s.trigger = '.end'
  s.expansion = '.end()$0'
end

snippet 'eq' do |s|
  s.trigger = '.eq'
  s.expansion = '.eq(${1:index})$0'
end

snippet 'error' do |s|
  s.trigger = '.error'
  s.expansion = '.error(${1:function() {
	${0:// Act on the event}
\}});'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'fadeIn (with callback)' do |s|
  # s.trigger = '.fadeIn'
  # s.expansion = '.fadeIn(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/}, function() {
	# ${0://Stuff to do *after* the animation takes place};
# });
# '
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'fadeIn' do |s|
  # s.trigger = '.fadeIn'
  # s.expansion = '.fadeIn(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'fadeOut (with callback)' do |s|
  # s.trigger = '.fadeOut'
  # s.expansion = '.fadeOut(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/}, function() {
	# ${0://Stuff to do *after* the animation takes place};
# });
# '
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'fadeOut' do |s|
  # s.trigger = '.fadeOut'
  # s.expansion = '.fadeOut(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'fadeTo (with callback)' do |s|
  # s.trigger = '.fadeTo'
  # s.expansion = '.fadeTo(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/}, ${2:0.5}, function() {
	# ${0://Stuff to do *after* the animation takes place};
# });
# '
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'fadeTo' do |s|
  # s.trigger = '.fadeTo'
  # s.expansion = '.fadeTo(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/}, ${2:0.5})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'filter (function)' do |s|
  # s.trigger = '.filter'
  # s.expansion = '.filter(function(index) {
  # ${1:return ${2:something};}
# })'
# end

snippet 'closest' do |s|
  s.trigger = '.closest'
  s.expansion = '.closest(\'${1:selector expression}\')$0'
end

snippet 'find' do |s|
  s.trigger = '.find'
  s.expansion = '.find(\'${1:selector expression}\')$0'
end

snippet 'first' do |s|
  s.trigger = '.first'
  s.expansion = '.first()$0'
end

snippet 'focus' do |s|
  s.trigger = '.focus'
  s.expansion = '.focus(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'focusin' do |s|
  s.trigger = '.focusin'
  s.expansion = '.focusin(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'focusout' do |s|
  s.trigger = '.focusout'
  s.expansion = '.focusout(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'get' do |s|
  s.trigger = '.get'
  s.expansion = '.get(${1:element index})$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'has' do |s|
  # s.trigger = '.has'
  # s.expansion = '.has(${1/(.+)/(?1:\':)/}${1:contained selector/element}${1/(.+)/(?1:\':)/})$0'
# end

snippet 'hasClass' do |s|
  s.trigger = '.hasClass'
  s.expansion = '.hasClass(\'${1:className}\')$0'
end

snippet 'height' do |s|
  s.trigger = '.height'
  s.expansion = '.height(${1:integer})$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'hide (with callback)' do |s|
  # s.trigger = '.hide'
  # s.expansion = '.hide(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/}, function() {
	# ${0://Stuff to do *after* the animation takes place};
# });
# '
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'hide' do |s|
  # s.trigger = '.hide'
  # s.expansion = '.hide(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/})$0'
# end

snippet 'hover' do |s|
  s.trigger = '.hover'
  s.expansion = '.hover(function() {
	${1:// Stuff to do when the mouse enters the element;}
}, function() {
	${2:// Stuff to do when the mouse leaves the element;}
});$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'html' do |s|
  # s.trigger = '.html'
  # s.expansion = '.html(${1/(.+)/(?1:\':)/}${1:Some text <b>and bold!</b>}${1/(.+)/(?1:\':)/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'index' do |s|
  # s.trigger = '.index'
  # s.expansion = '.index(${1/(.+)/(?1:\':)/}${1:selector/element}${1/(.+)/(?1:\':)/})$0'
# end

snippet 'innerHeight' do |s|
  s.trigger = '.innerHeight'
  s.expansion = '.innerHeight()$0'
end

snippet 'innerWidth' do |s|
  s.trigger = '.innerWidth'
  s.expansion = '.innerWidth()$0'
end

snippet 'insertAfter' do |s|
  s.trigger = '.insertAfter'
  s.expansion = '.insertAfter(\'${1:selector expression}\')$0'
end

snippet 'insertBefore' do |s|
  s.trigger = '.insertBefore'
  s.expansion = '.insertBefore(\'${1:selector expression}\')$0'
end

snippet 'is' do |s|
  s.trigger = '.is'
  s.expansion = '.is(\'${1:selector expression}\')$0'
end

snippet 'keydown' do |s|
  s.trigger = '.keydown'
  s.expansion = '.keydown(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'keypress' do |s|
  s.trigger = '.keypress'
  s.expansion = '.keypress(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'keyup' do |s|
  s.trigger = '.keyup'
  s.expansion = '.keyup(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'last' do |s|
  s.trigger = '.last'
  s.expansion = '.last()$0'
end

snippet 'live' do |s|
  s.trigger = '.live'
  s.expansion = '.live(\'${1:event type(s)}\', function(${2:event}) {
	${0:// Act on the event}
});'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'load (AHAH)' do |s|
  # s.trigger = '.load'
  # s.expansion = '.load(\'${1:/path/to/file}\'${2/(.+)/(?1:,{
 # :)/}${2:param1: "value1", param2: "value2"}${2/(.+)/(?1:}:)/}${3/(.+)/(?1:,
 # function\(\){
    # :)/}${3:// Stuff to do after the page is loaded}${3/(.+)/(?1:
# }:)/});
# $0'
# end

snippet 'load' do |s|
  s.trigger = '.load'
  s.expansion = '.load(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'map (function)' do |s|
  s.trigger = '.map'
  s.expansion = '.map(function(index, elem) {
	${1:return ${2:something};}
})'
end

snippet 'mousedown' do |s|
  s.trigger = '.mousedown'
  s.expansion = '.mousedown(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'mouseenter' do |s|
  s.trigger = '.mouseenter'
  s.expansion = '.mouseenter(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'mouseleave' do |s|
  s.trigger = '.mouseleave'
  s.expansion = '.mouseleave(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'mousemove' do |s|
  s.trigger = '.mousemove'
  s.expansion = '.mousemove(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'mouseout' do |s|
  s.trigger = '.mouseout'
  s.expansion = '.mouseout(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'mouseover' do |s|
  s.trigger = '.mouseover'
  s.expansion = '.mouseover(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'mouseup' do |s|
  s.trigger = '.mouseup'
  s.expansion = '.mouseup(${1:function() {
	${0:// Act on the event}
\}});'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'next' do |s|
  # s.trigger = '.next'
  # s.expansion = '.next(${1/(.+)/(?1:\':)/}${1:selector}${1/(.+)/(?1:\':)/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'nextAll' do |s|
  # s.trigger = '.nextAll'
  # s.expansion = '.nextAll(${1/(.+)/(?1:\':)/}${1:selector}${1/(.+)/(?1:\':)/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'nextUntil' do |s|
  # s.trigger = '.nextUntil'
  # s.expansion = '.nextUntil(${1/(.+)/(?1:\':)/}${1:selector}${1/(.+)/(?1:\':)/})$0'
# end

snippet 'not' do |s|
  s.trigger = '.not'
  s.expansion = '.not(\'${1:selector expression}\')$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'offset (function)' do |s|
  # s.trigger = '.offset'
  # s.expansion = '.offset(function(index, currentCoordinates) {
  # ${1:return ${2:someObject};}
# })'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'offset' do |s|
  # s.trigger = '.offset'
  # s.expansion = '.offset(${1/(.+)/(?1:{:)/}${1:coordinates}${1/(.+)/(?1:}:)/})$0'
# end

snippet 'offsetParent' do |s|
  s.trigger = '.offsetParent'
  s.expansion = '.offsetParent()$0'
end

snippet 'one' do |s|
  s.trigger = '.one'
  s.expansion = '.one(\'${1:event name}\', function(${2:event}) {
	${0:// Act on the event once}
});'
end

snippet 'outerHeight' do |s|
  s.trigger = '.outerHeight'
  s.expansion = '.outerHeight()$0'
end

snippet 'outerWidth' do |s|
  s.trigger = '.outerWidth'
  s.expansion = '.outerWidth()$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'parent' do |s|
  # s.trigger = '.parent'
  # s.expansion = '.parent(${1/(.+)/(?1:\':)/}${1:selector expression}${1/(.+)/(?1:\':)/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'parents' do |s|
  # s.trigger = '.parents'
  # s.expansion = '.parents(${1/(.+)/(?1:\':)/}${1:selector expression}${1/(.+)/(?1:\':)/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'parentsUntil' do |s|
  # s.trigger = '.parentsUntil'
  # s.expansion = '.parentsUntil(${1/(.+)/(?1:\':)/}${1:selector}${1/(.+)/(?1:\':)/})$0'
# end

snippet t(:plugin_animation) do |s|
  s.trigger = 'plugin'
  s.expansion = 'jQuery.fn.${1:myeffect} = function(speed, easing, callback) {
	return this.animate({${2:param1}: ${3:\'value\'}}, speed, easing, callback);
};'
end

snippet t(:plugin_selector) do |s|
  s.trigger = 'plugin'
  s.expansion = '(function(\$) {
	\$.extend(\$.expr[\':\'], {
		${1:selectorName}: function(element, index, matches, set) {
			$0
			return something;
		}
	});
})(jQuery);
'
end

snippet t(:plugin_method) do |s|
  s.trigger = 'plugin'
  s.expansion = ';(function(\$) {
${2:// ${3:What does the $1 plugin do?}}
\$.fn.${1:pluginName} = function(options) {
	var opts = \$.extend({}, \$.fn.$1.defaults, options);

	return this.each(function() {
		var \$this = \$(this);

	${5:  ${6:// Support for the Metadata Plugin.}
		var o = \$.meta ? \$.extend({\}, opts, \$this.data()) : opts;
	}

	});

	// private function for debugging
	function debug(\$obj) {
		if (window.console && window.console.log) {
			window.console.log(\$obj);
		}
	}
};

// default options
\$.fn.$1.defaults = {
	${4:defaultOne:true,
	defaultTwo:false,
	defaultThree:\'yay!\'}
};

})(jQuery);
'
end

snippet 'prepend' do |s|
  s.trigger = '.prepend'
  s.expansion = '.prepend(\'${1:Some text <b>and bold!</b>}\')$0'
end

snippet 'prependTo' do |s|
  s.trigger = '.prependTo'
  s.expansion = '.prependTo(\'${1:selector expression}\')$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'prev' do |s|
  # s.trigger = '.prev'
  # s.expansion = '.prev(${1/(.+)/(?1:\':)/}${1:selector expression}${1/(.+)/(?1:\':)/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'prevAll' do |s|
  # s.trigger = '.prevAll'
  # s.expansion = '.prevAll(${1/(.+)/(?1:\':)/}${1:selector}${1/(.+)/(?1:\':)/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'prevUntil' do |s|
  # s.trigger = '.prevUntil'
  # s.expansion = '.prevUntil(${1/(.+)/(?1:\':)/}${1:selector}${1/(.+)/(?1:\':)/})$0'
# end

snippet 'remove' do |s|
  s.trigger = '.remove'
  s.expansion = '.remove()$0'
end

snippet 'removeAttr' do |s|
  s.trigger = '.removeAttr'
  s.expansion = '.removeAttr(\'${1:attribute name}\')$0'
end

snippet 'removeClass' do |s|
  s.trigger = '.removeClass'
  s.expansion = '.removeClass(\'${1:class name}\')$0'
end

snippet 'removeData' do |s|
  s.trigger = '.removeData'
  s.expansion = '.removeData(\'${1:data name}\')$0'
end

snippet 'replaceAll' do |s|
  s.trigger = '.replaceAll'
  s.expansion = '.replaceAll(\'${1:data name}\')$0'
end

snippet 'replaceWith (function)' do |s|
  s.trigger = '. replaceWith'
  s.expansion = '.replaceWith(function(index, currentContents) {
	${1:return ${2:something};}
})'
end

snippet 'replaceWith' do |s|
  s.trigger = '.replaceWith'
  s.expansion = '.replaceWith(\'${1:htmlString/DOMElement/jQueryObject}\')$0'
end

snippet 'reset' do |s|
  s.trigger = '.reset'
  s.expansion = '.reset(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'resize' do |s|
  s.trigger = '.resize'
  s.expansion = '.resize(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'scroll' do |s|
  s.trigger = '.scroll'
  s.expansion = '.scroll(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'scrollLeft' do |s|
  s.trigger = '.scrollLeft'
  s.expansion = '.scrollLeft(${1:value})$0'
end

snippet 'scrollTop' do |s|
  s.trigger = '.scrollTop'
  s.expansion = '.scrollTop(${1:value})$0'
end

snippet 'select' do |s|
  s.trigger = '.select'
  s.expansion = '.select(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'serialize' do |s|
  s.trigger = '.serialize'
  s.expansion = '.serialize()$0'
end

snippet 'serializeArray' do |s|
  s.trigger = '.serializeArray'
  s.expansion = '.serializeArray()$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'show (with callback)' do |s|
  # s.trigger = '.show'
  # s.expansion = '.show(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/}, function() {
	# ${0://Stuff to do *after* the animation takes place};
# });
# '
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'show' do |s|
  # s.trigger = '.show'
  # s.expansion = '.show(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'siblings' do |s|
  # s.trigger = '.siblings'
  # s.expansion = '.siblings(${1/(.+)/(?1:\':)/}${1:selector expression}${1/(.+)/(?1:\':)/})$0'
# end

snippet 'size' do |s|
  s.trigger = '.size'
  s.expansion = '.size()$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'slice' do |s|
  # s.trigger = '.slice'
  # s.expansion = '.slice(${1:start}${2/^([^,]|\d).*$|.+/(?1:, :)/}${2:end})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'slideDown (with callback)' do |s|
  # s.trigger = '.slideDown'
  # s.expansion = '.slideDown(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/}, function() {
	# ${0://Stuff to do *after* the animation takes place};
# });
# '
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'slideDown' do |s|
  # s.trigger = '.slideDown'
  # s.expansion = '.slideDown(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'slideToggle' do |s|
  # s.trigger = '.slideToggle'
  # s.expansion = '.slideToggle(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'slideUp (with callback)' do |s|
  # s.trigger = '.slideUp'
  # s.expansion = '.slideUp(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/}, function() {
	# ${0://Stuff to do *after* the animation takes place};
# });
# '
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'slideUp' do |s|
  # s.trigger = '.slideUp'
  # s.expansion = '.slideUp(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/})$0'
# end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'stop' do |s|
  # s.trigger = '.stop'
  # s.expansion = '.stop(${1:clearQueue}${2/^([^,]|\w).*$|.+/(?1:, :)/}${2:gotoEnd})$0'
# end

snippet 'submit' do |s|
  s.trigger = '.submit'
  s.expansion = '.submit(${1:function() {
	${0:// Act on the event}
\}});'
end

snippet 'text' do |s|
  s.trigger = '.text'
  s.expansion = '.text(${1:\'some text\'})$0'
end

snippet 'toArray' do |s|
  s.trigger = '.toArray'
  s.expansion = '.toArray()$0'
end

snippet 'toggle (event)' do |s|
  s.trigger = '.toggle'
  s.expansion = '.toggle(function() {
	${1:// Stuff to do every *odd* time the element is clicked;}
}, function() {
	${2:// Stuff to do every *even* time the element is clicked;}
});
$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'toggle (show/hide)' do |s|
  # s.trigger = '.toggle'
  # s.expansion = '.toggle(${1/(^[0-9]+$)|.+/(?1::\')/}${1:slow/400/fast}${1/(^[0-9]+$)|.+/(?1::\')/})$0'
# end

snippet 'toggleClass' do |s|
  s.trigger = '.toggleClass'
  s.expansion = '.toggleClass(\'${1:class name}\')$0'
end

snippet 'trigger' do |s|
  s.trigger = '.trigger'
  s.expansion = '.trigger(\'${1:event name}\')$0'
end

snippet 'triggerHandler' do |s|
  s.trigger = '.trigger'
  s.expansion = '.triggerHandler(\'${1:event name}\')$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'unbind' do |s|
  # s.trigger = '.unbind'
  # s.expansion = '.unbind(\'${1:event name(s)}\'${2/(^,).*|.+/(?1::, )/}${2/(^([0-9]+$|,.*))|.+/(?1::\')/}${2:functionName}${2/(^([0-9]+$|,.*))|.+/(?1::\')/})$0'
# end

snippet 'undelegate' do |s|
  s.trigger = '.undelegate'
  s.expansion = '.undelegate(\'${1:selector}\', \'${2:event type}\', \'${3:function}\');'
end

snippet 'unwrap' do |s|
  s.trigger = '.unwrap'
  s.expansion = '.unwrap()$0'
end

# FIXME Not currently working due to unsupported TextMate functionality
# snippet 'val' do |s|
  # s.trigger = '.val'
  # s.expansion = '.val(${1/(.+)/(?1:\':)/}${1:text}${1/(.+)/(?1:\':)/})$0'
# end

snippet 'width' do |s|
  s.trigger = '.width'
  s.expansion = '.width(${1:integer})$0'
end

snippet 'wrap' do |s|
  s.trigger = '.wrap'
  s.expansion = '.wrap(\'${1:<div class="extra-wrapper"></div>}\')$0'
end

snippet 'wrapAll' do |s|
  s.trigger = '.wrap'
  s.expansion = '.wrapAll(\'${1:<div class="extra-wrapper"></div>}\')$0'
end

snippet 'wrapInner' do |s|
  s.trigger = '.wrap'
  s.expansion = '.wrapInner(\'${1:<div class="extra-wrapper"></div>}\')$0'
end

end # source.js


with_defaults :scope => 'source.js meta.selector.jquery', :trigger => ':' do

snippet ':button' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':button'
end

snippet ':checkbox' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':checkbox'
end

snippet ':checked' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':checked'
end

snippet ':contains(\'test\')' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':contains(\'${1:test}\')$0'
end

snippet ':disabled' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':disabled'
end

snippet ':empty' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':empty'
end

snippet ':enabled' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':enabled'
end

snippet ':eq(n)' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':eq(${1:n})$0'
end

snippet ':even' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':even'
end

snippet ':file' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':file'
end

snippet ':first-child' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':first-child'
end

snippet ':first' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':first'
end

snippet ':gt(n)' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':gt(${1:n})$0'
end

snippet ':hidden' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':hidden
'
end

snippet ':image' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':image'
end

snippet ':input' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':input'
end

snippet ':last-child' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':last-child'
end

snippet ':last' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':last'
end

snippet ':lt(n)' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':lt(${1:n})$0'
end

snippet ':not(s)' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':not(${1:s})$0'
end

snippet ':nth-child(n)' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':nth-child(${1:n})$0'
end

snippet ':odd' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':odd'
end

snippet ':only-child' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':only-child'
end

snippet ':parent' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':parent
'
end

snippet ':password' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':password'
end

snippet ':radio' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':radio'
end

snippet ':reset' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':reset'
end

snippet ':root' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':root'
end

snippet ':selected' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':selected'
end

snippet ':submit' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':submit'
end

snippet ':text' do |s|
  s.key_binding = 'M4+M3+:'
  s.expansion = ':text'
end

snippet ':visible' do |s|
  s.key_binding = 'M4+:'
  s.expansion = ':visible
'
end

end # :scope => 'source.js meta.selector.jquery', :trigger => ':'