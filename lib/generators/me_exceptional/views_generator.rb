module MeExceptional
  module Generators

    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/views", __FILE__)

      desc "Copies all views to your application"

      def copy_views
        directory "me_exceptional", "app/views/#{:me_exceptional}"
      end

    end

  end
end


