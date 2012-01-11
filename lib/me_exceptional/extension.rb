require 'me_exceptional/engine'

module MeExceptional
  module BasicExtension

    def exception_catcher(e)
      if Rails.env == 'production' 

        m = MeExceptional::Mailer.error_mail(e.message,
                                             :backtrace => e.backtrace.join("\n"),
                                             :timestamp => Time.zone.now)

        # blocking on purpose to be sure this gets sent!
        m.deliver

      end
      raise e
    end

    module ClassMethods
      def rescue_mail_from_methods(*methods)

        methods.each do |method|
          class_eval <<-EOF
            def #{method}_rescuable
              method
            rescue Exception => e
              rescue_with_handler(e)
            end
            alias_method :#{method}, :#{method}_rescuable
          EOF
        end

      end
    end

    def self.included(base)
      base.extend(ClassMethods)

      base.instance_eval <<-EOF
        include ActiveSupport::Rescuable
        rescue_from Exception, :with => :exception_catcher
      EOF

    end

  end

end


