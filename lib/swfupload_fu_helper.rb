module SwfUploadFuHelper

  # Place swfupload_head to html head or in body
  # <html>
  # <head>
  #  <title>...</title>
  #  <%=swfupload_head%>
  # </head>
  def swfupload_head
    html = ''
    html << stylesheet_link_tag('swfupload')
    html << javascript_include_tag('swfupload','swfupload.fileprogress','swfupload.handlers','swfupload.queue')
    html
  end
  
  # Helper method which build upload files form
  # form template rendered from /views/shared/_swfupload_form.html.erb  by default
  # You only need pass upload_url - is url hash for upload action    
  # Ex: 
  # <%=swfupload :controller=>'assets',:action=>'upload'%>
  # or <%=swfupload {:controller=>'assets',:action=>'upload'}, 'dir_where_template','template'%>
  def swfupload  upload_url,path='shared', template='swfupload_form.html.erb'
    render :partial=>"/#{path}/#{template}",:locals=>{:upload_url=>upload_path_with_session_information(upload_url)}
  end

private

  def upload_path_with_session_information url
    session_key = ActionController::Base.session_options[:key]
    url_for url.merge({"#{session_key}" => cookies[session_key], :request_forgery_protection_token => form_authenticity_token})
  end  

end
