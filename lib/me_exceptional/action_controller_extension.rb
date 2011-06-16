require 'action_controller'
require 'action_dispatch'

module ActionController
  class Base

    rescue_from Exception, :with => :exception_catcher

    def exception_catcher(e)
       if Rails.env == 'production' 
        # blocking to be sure this gets send!
        Emailer.exceptional(e.message,
                            :backtrace => e.backtrace.join("\n"),
                            :timestamp => Time.zone.now,
                            :method => request.method,
                            :url => request.url,
                            :params => params.inspect.to_s,
                            :user_agent => request.user_agent,
                            :client_ip => request.remote_ip,
                            :request_env => request.env.inspect.to_s).deliver

      end
      raise e
    end

  end

end



