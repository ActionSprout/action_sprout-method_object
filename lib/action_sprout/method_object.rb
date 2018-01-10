require 'action_sprout/method_object/version'
require 'kwattr'
require 'action_sprout/method_object/railtie' if defined?(Rails)

module ActionSprout
  # MethodObject is a quick shortcut for creating "method objects". Under the
  # hood, it uses kwattr. Check out the [kwattr docs][] for how to configure
  # options.
  #
  # [kwattr docs]: https://github.com/etiennebarrie/kwattr
  #
  # Example:
  #
  #   class SaveUser
  #     method_object :user, repository: UserRepository.new
  #
  #     def call
  #       repository.save user
  #     end
  #   end
  #
  #   SaveUser.call user: user
  #
  # Summary of kwattr options:
  #
  # kwattr stands for key-word-attributes and therefore only supports setting up
  # method objects that take keyword arguments. Each positional argument passed
  # to method_object represents a required attribute, and each keyword argument
  # passed to method_object represents an option attribute and its default.
  module MethodObject
    def method_object(*args)
      extend ClassMethods
      kwattr(*args)
    end

    module ClassMethods
      def call(**args, &block)
        new(**args).call(&block)
      end
    end
  end
end
