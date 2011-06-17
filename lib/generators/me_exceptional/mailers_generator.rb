module MeExceptional
  module Generators

    class MailersGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/mailers", __FILE__)
      desc "Copies all mailers to your applications"

      def copy_mailers
        directory "me_exceptional", "app/mailers/#{:me_exceptional}"
      end

    end
  end
end


