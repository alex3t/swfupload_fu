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

## [Attachment_Fu](http://github.com/technoweenie/attachment_fu/tree/master) integration
You able access uploaded file from `params[:Filedata]` in your upload action.
#### Because flash send file data without correct type, you need set content type yourself using mime-types gem(`gem install mime-types`). For example:
    require 'mime/types'
    class Asset < ActiveRecord::Base
      has_attachment 
      
      def swf_uploaded_data=(data)
        data.content_type = MIME::Types.type_for(data.original_filename)
        self.uploaded_data = data
      end  
    end
    
    class AssetsController < ApplicationController
      def upload
        @file = Asset.new :swf_uploaded_data => params[:Filedata]
        @file.save
        ...
      end
    end
    
###### Copyright (c) 2009 Alex Tretyakov, released under MIT license