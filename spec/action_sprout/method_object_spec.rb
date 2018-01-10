require "spec_helper"

RSpec.describe ActionSprout::MethodObject do

  it 'has a version number' do
    expect(ActionSprout::MethodObject::VERSION).not_to be nil
  end

  Module.include ActionSprout::MethodObject

  class MyMethodObject
    method_object

    def call
      'my-method-object-was-called'
    end
  end

  class AMethodObjectWithOptions
    method_object :foo, bar: 42

    def call
      [foo, bar]
    end
  end

  class NoCallDefined
    method_object
  end

  class WithABlock
    method_object :foo

    def call
      yield foo
    end
  end

  it 'can call the method object' do
    result = MyMethodObject.call
    expect(result).to eq 'my-method-object-was-called'
  end

  it 'can configure options' do
    result = AMethodObjectWithOptions.call foo: Math::PI, bar: Math::E
    expect(result).to eq [Math::PI, Math::E]
  end

  it 'can use default options' do
    result = AMethodObjectWithOptions.call foo: Math::PI
    expect(result).to eq [Math::PI, 42]
  end

  it 'raises a useful no method error when call is not defined' do
    expect { NoCallDefined.call }.to raise_error(NoMethodError, /call.*NoCallDefined/)
  end

  it 'can pass a block' do
    expect { |block| WithABlock.call(foo: :bar, &block) }.to yield_with_args(:bar)
  end
end

