# ActionSprout::MethodObject

A simple class method that makes it super easy to create a method object taking keyword attributes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'action_sprout-method_object'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install action_sprout-method_object

## Usage

MethodObject is a quick shortcut for creating "method objects". Under the hood, it uses kwattr. Check out the [kwattr docs][] for how to configure options.

[kwattr docs]: https://github.com/etiennebarrie/kwattr

Example:

```ruby
class SaveUser
  method_object :user, repository: UserRepository.new

  def call
    repository.save user
  end
end

SaveUser.call user: user
```

### Summary of kwattr options:

`kwattr` stands for key-word-attributes and therefore only supports setting up method objects that take keyword arguments. Each positional argument passed to `method_object` represents a required attribute, and each keyword argument passed to `method_object` represents an option attribute and its default.

### Block support

A block may be passed to the `call` class method. This block will be passed directly to the `call` instance method. For example:

```ruby
class ParseConfiguration
  method_object :name

  def call
    yield configuration
  end

  private

  def configuration
    YAML.load_file(file_name)[Rails.env]
  end

  def file_name
    Rails.root.join('config', name).to_s
  end
end

ParseConfiguration.call(name: 'user-config') do |config|
  # do something with config
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Amiel Martin/action_sprout-method_object. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

