# +----------------------------------------------------------------------
# | ThinkPHP ThinkCMF HBuilder代码块
# +----------------------------------------------------------------------
# | ThinkCMF[ WE CAN DO IT MORE SIMPLE ]
# +----------------------------------------------------------------------
# | Copyright (c) 2013-2014 http:#www.thinkcmf.com All rights reserved.
# +----------------------------------------------------------------------
# | The MIT License (MIT)
# +----------------------------------------------------------------------
# | Author: Dean <zxxjjforever@163.com>
# +----------------------------------------------------------------------
# | Version: 1.0.0
# +----------------------------------------------------------------------

# 安装方法：
# 打开HBuilder 工具》扩展代码块》html代码
# 在最后加上html_snippets.rb文件里的代码，如果已经加入，请覆盖升级

#ThinkPHP ThinkCMF 模板标签代码块
# 使用方法
# 直接在html模板里敲tc，就会自动提示,tc代表代码块前缀（thinkphp thinkcmf缩写）以防和其它程序标签发生冲突
# 如foreach标签 ，直接输入tcforeach试试


with_defaults :scope => 'text.html text' do |bundle|  #=====HTML标签代码块================================================================================

  snippet 'tcforeach' do |cmd|  #tcforeach是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcforeach'        #tcforeach是激活字符，即按下tcforeach后会触发该代码块
    cmd.expansion = "<foreach name=\"$1\" item=\"vo\">
    $0
</foreach>"                         #expansion是代码块的输出内容，其中$0、$1是光标的停留和切换位置。$1是第一个停留光标，$0是最后回车时停留的光标。
                                                          #如果输出涉及到换行和tab，也需严格在这里使用换行和tab。
                                                          #输出双引号在前面加\来转义，输出$使用$$转义
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #foreach代码块结束
  
  snippet 'tcvolist' do |cmd|  #tcvolist是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcvolist'        #tcvolist是激活字符，即按下tcvolist后会触发该代码块
    cmd.expansion = "<volist name=\"$1\" id=\"vo\">
    $0
</volist>" 
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #volist代码块结束
  
  snippet 'tcfor' do |cmd|  #tcfor是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcfor'        #tcfor是激活字符，即按下tcfor后会触发该代码块
    cmd.expansion = "<for start=\"$1\" end=\"$2\" comparison=\"lt$3\" step=\"1$4\" name=\"i$5\" >
    $0
</for>" 
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #for代码块结束
  
  snippet 'tcswitch' do |cmd|  #tcswitch是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcswitch'        #tcswitch是激活字符，即按下tcswitch后会触发该代码块
    cmd.expansion = "<switch name=\"$1\" >
    <case value=\"$2\" break=\"$3\">$4</case>
    <case value=\"$5\">$6</case>
    <default />$0
</switch>" 
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #switch代码块结束
  
  snippet 'tceq' do |cmd|  #tceq是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tceq'        #tceq是激活字符，即按下tceq后会触发该代码块
    cmd.expansion = '<${1:eq/equal/neq/notequal/gt/egt/lt/elt/heq/nheq} name="$2" value="$3">
    $0
</$1>'
  end #比较代码块结束
  
  snippet 'tcin' do |cmd|  #tcin是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcin'        #tcin是激活字符，即按下tcin后会触发该代码块
    cmd.expansion = '<${1:in/notin/between/notbetween} name="$2" value="$3">
    $0
</$1>'
  end #范围判断代码块结束
  
  snippet 'tcif' do |cmd|  #tcif是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcif'        #tcif是激活字符，即按下tcif后会触发该代码块
    cmd.expansion = '<if condition="$1">
    $0    
</if>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #if代码块结束
  
  snippet 'tcifelse' do |cmd|  #tcifelse是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcifelse'        #tcifelse是激活字符，即按下tcifelse后会触发该代码块
    cmd.expansion = '<if condition="$1">
    $0$2
    <else />
    $3
</if>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #ifelse代码块结束
  
  snippet 'tcifelseif' do |cmd|  #tcifelseif是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcifelseif'        #tcifelseif是激活字符，即按下tcifelseif后会触发该代码块
    cmd.expansion = '<if condition="$1"> 
        $0$2
    <elseif condition="$3"/>
        $4
    <else /> 
        $5
</if>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #ifelseif代码块结束
  
  snippet 'tcpresent' do |cmd|  #tcpresent是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcpresent'        #tcpresent是激活字符，即按下tcpresent后会触发该代码块
    cmd.expansion = '<present name="$1">
    $0
</present>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #present代码块结束
  
  snippet 'tcnotpresent' do |cmd|  #tcnotpresent是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcnotpresent'        #tcnotpresent是激活字符，即按下tcnotpresent后会触发该代码块
    cmd.expansion = '<notpresent name="$1">
    $0
</notpresent>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #notpresent代码块结束
  
  snippet 'tcempty' do |cmd|  #tcempty是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcempty'        #tcempty是激活字符，即按下tcempty后会触发该代码块
    cmd.expansion = '<empty name="$1">
    $0
</empty>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #empty代码块结束
  
  snippet 'tcdefined' do |cmd|  #tcdefined是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcdefined'        #tcdefined是激活字符，即按下tcdefined后会触发该代码块
    cmd.expansion = '<defined name="$1">
    $0
</defined>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #defined代码块结束
  
  snippet 'tcphp' do |cmd|  #tcphp是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcphp'        #tcphp是激活字符，即按下tcphp后会触发该代码块
    cmd.expansion = '<php>
    $0
</php>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #php代码块结束
  
  snippet 'tcimport' do |cmd|  #tcimport是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcimport'        #tcimport是激活字符，即按下tcimport后会触发该代码块
    cmd.expansion = '<import file="$1" type="js$2">
    $0
</import>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #import代码块结束
  
  snippet 'tcload' do |cmd|  #tcload是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcload'        #tcload是激活字符，即按下tcload后会触发该代码块
    cmd.expansion = '<load href="$1">
    $0
</load>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #load代码块结束
  
  snippet 'tcjs' do |cmd|  #tcjs是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcjs'        #tcjs是激活字符，即按下tcjs后会触发该代码块
    cmd.expansion = '<js href="$1">
    $0
</js>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #js代码块结束
  
  snippet 'tccss' do |cmd|  #tccss是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tccss'        #tccss是激活字符，即按下tccss后会触发该代码块
    cmd.expansion = '<css href="$1">
    $0
</css>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #css代码块结束
  
  snippet 'tctcinclude' do |cmd|  #tctcinclude是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tctcinclude'        #tctcinclude是激活字符，即按下tctcinclude后会触发该代码块
    cmd.expansion = '<tc_include file="$1">
    $0
</tc_include>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #tcinclude代码块结束
  
  snippet 'tcinclude' do |cmd|  #tcinclude是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcinclude'        #tcinclude是激活字符，即按下tcinclude后会触发该代码块
    cmd.expansion = '<include file="$1">
    $0
</include>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #include代码块结束
  
  snippet 'tcliteral' do |cmd|  #tcliteral是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcliteral'        #tcliteral是激活字符，即按下tcliteral后会触发该代码块
    cmd.expansion = '<literal>
    $0
</literal>'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #literal代码块结束
  
  snippet 'tcroot' do |cmd|  #tcroot是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcroot'        #tcroot是激活字符，即按下tcroot后会触发该代码块
    cmd.expansion = '__ROOT__'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #root代码块结束
  
  snippet 'tctmpl' do |cmd|  #tctmpl是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tctmpl'        #tctmpl是激活字符，即按下tctmpl后会触发该代码块
    cmd.expansion = '__TMPL__'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #tmpl代码块结束
  
  snippet 'tcstatics' do |cmd|  #tcstatics是显示名称，代码助手提示列表显示时可见
    cmd.trigger = 'tcstatics'        #tcstatics是激活字符，即按下tcstatics后会触发该代码块
    cmd.expansion = '__STATICS__'
    cmd.needApplyReContentAssist = true  #这句话的意思是输出后同时激活代码助手，即在$1的位置直接拉出样式列表
  end #statics代码块结束

end

#ThinkPHP ThinkCMF 模板标签代码块结束