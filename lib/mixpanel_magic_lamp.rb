require 'mixpanel_client'
require 'mixpanel_magic_lamp/configuration'
require 'mixpanel_magic_lamp/engine' if defined? Rails
require 'mixpanel_magic_lamp/client'
require 'mixpanel_magic_lamp/expression_builder'
require 'mixpanel_magic_lamp/formatter'
require 'mixpanel_magic_lamp/queue'
require 'mixpanel_magic_lamp/interface'

# Include and extend the magic lamp
Mixpanel.extend MixpanelMagicLamp::ClassMethods
module Mixpanel
  include MixpanelMagicLamp::InstanceMethods
end
