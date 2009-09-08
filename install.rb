require 'fileutils'

module Swfupload
module InstallHelpers
def self.copy_files dir, files, rails_folder="public"
  files.each do |js_file|
    dest_dir = File.join(RAILS_ROOT, rails_folder,dir)
    FileUtils.mkdir(dest_dir) unless File.exist? dest_dir
    dest_file = File.join(dest_dir, js_file)
    src_file = File.join(File.dirname(__FILE__) , dir, js_file)  	
    FileUtils.cp_r(src_file, dest_file) unless File.exist?(dest_file)
    
  end  
end
end
end


puts "Copy started..."

Swfupload::InstallHelpers::copy_files 'javascripts',["swfupload.js", "swfupload.fileprogress.js", "swfupload.handlers.js", "swfupload.queue.js"]
Swfupload::InstallHelpers::copy_files 'stylesheets',["swfupload.css"]
Swfupload::InstallHelpers::copy_files 'images',["FullyTransparent_65x29.png"]
Swfupload::InstallHelpers::copy_files 'flash',["swfupload.swf"]
Swfupload::InstallHelpers::copy_files 'app/views/shared',["_swfupload_form.html.erb"],''
Swfupload::InstallHelpers::copy_files 'config/initializers',["session_swf_support.rb"],''

puts "Files copied - Installation complete!"

