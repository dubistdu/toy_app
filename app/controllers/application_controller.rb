class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def hello
    render html: "안녕 앱"    
  end
end
