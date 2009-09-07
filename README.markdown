# SWFUploadFu

This plugin allows you to easily integrate [SWFUpload](http://swfupload.org/) to your Ruby on Rails application

## Installation
    script/plugin install git://github.com/alex3t/swfupload_fu.git
    
## Using
#### SWFUpload required some javascripts and stylesheets. For this you can use SWFUploadFu helper in your views

    <head>
      <title>...</title>
      <%=swfupload_head %>
    </head>
    
#### Now you can place swfupload form anywhere on your page. You need provide only url hash, same as for `url_for`

    <%=swfupload :controller=>'assets',:action=>'upload'%>

#### If you want modify swfupload form template then change `/app/views/shared/_swfupload_form.html.erb`. Keep only elements and their IDs. 

    
###### Copyright (c) 2009 Alex Tretyakov, released under MIT license