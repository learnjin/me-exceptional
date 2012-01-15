require 'me_exceptional/engine'

module MeExceptional
  module BasicExtension

    def exception_catcher(e)

      message = "#{e.class}: #{e.message}"
      content = {:backtrace => e.backtrace.join("\n"), :timestamp => Time.zone.now}

      m = MeExceptional::Mailer.error_mail(message, content) 
      m.deliver

      Rails.logger.error "[EXCEPTION] #{e.class}: #{e.message}"
    end

    module ClassMethods

      def rescue_mail_from_methods(*methods)

        methods.each do |method|
          class_eval <<-EOF
            alias_method :#{method}_non_rescuable, :#{method}

            def #{method}(*args)
              #{method}_non_rescuable(*args)
            rescue Exception => e
              exception_catcher(e)
              #rescue_with_handler(e)
            end
          EOF
        end

      end
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

  end

end



