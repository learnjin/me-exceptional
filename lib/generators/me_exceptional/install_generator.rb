module MeExceptional
  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a MeExceptional initializer."

      def copy_initializer_file
        copy_file "me_exceptional.rb", "config/initializers/me_exceptional.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end

    end

  end
end
