class ApplicationController < ActionController::Base
  force_ssl if: :require_ssl?

  protect_from_forgery with: :exception

  def ping
    render text: :pong
  end

protected

  def log_exception exception
    puts exception # +++
  end

private

  def require_ssl?
    ENV["FORCE_SSL"].to_s.to_bool
  end

  def debug
    puts('DEBUG FUNCTION:, ', controller_name, action_name, self.class.name)
  end

end
