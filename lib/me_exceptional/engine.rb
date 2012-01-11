require 'me_exceptional'
require 'rails'
require 'action_controller'

module MeExceptional
  class Engine < ::Rails::Engine
    engine_name :me_exceptional

    #initialize "me_exceptional.load_app_instance_data" do |app|
    #  MeExceptional.setup do |config|
    #    config.app_root = app.root
    #  end
    #end

  end
end


