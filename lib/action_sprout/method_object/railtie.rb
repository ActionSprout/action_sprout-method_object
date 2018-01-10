require 'rails/railtie'

module ActionSprout
  module MethodObject
    class Railtie < Rails::Railtie
      initializer 'action_sprout-method_object.initialize' do
        Module.include ActionSprout::MethodObject
      end
    end
  end
end

