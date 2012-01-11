require 'rails'
require 'active_support'

module MeExceptional

  mattr_accessor :mailer_from
  @@mailer_from = nil

  mattr_accessor :mailer_to
  @@mailer_to = nil

  mattr_accessor :app_root

  def self.setup
    yield self
  end

end

require 'me_exceptional/extension'
require 'me_exceptional/action_controller_extension'
require 'me_exceptional/engine'



