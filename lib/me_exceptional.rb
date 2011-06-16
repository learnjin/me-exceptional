require 'rails'

module MeExceptional

  mattr_accessor :mailer_from
  @@mailer_from = nil

  mattr_accessor :mailer_to
  @@mailer_to = nil


  def self.setup
    yield self
  end

end

require 'me_exceptional/action_controller_extension'
require 'me_exceptional/engine'




