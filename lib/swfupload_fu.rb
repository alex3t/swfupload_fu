require 'swfupload_fu/flash_session_cookie_middleware'
require 'swfupload_fu_helper'


ActionController::Dispatcher.middleware.use(FlashSessionCookieMiddleware, ActionController::Base.session_options[:key])

ActionView::Base.send(:include, SwfUploadFuHelper)

