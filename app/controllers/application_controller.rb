class ApplicationController < ActionController::Base
  # XXX This controller violates the "Cross Site Request Forgery" portion of Brakeman.
  # This controller should contain the "protect_from_forgery :with => :exception"
  # You may find the documentation relating to this below.
  # Source: http://brakemanscanner.org/docs/warning_types/cross-site_request_forgery/
end
