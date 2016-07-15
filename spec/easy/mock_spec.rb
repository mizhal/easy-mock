require 'spec_helper'

RSpec::Expectations.configuration.warn_about_potential_false_positives = false

describe Easy::Mock do
  it 'has a version number' do
    expect(Easy::Mock::VERSION).not_to be nil
  end

  it 'mixins can be attached to classes' do
  	class X
  		include Easy::Mock::ObjectMock
  		extend Easy::Mock::CollectionMock

  		set_model_class X

  		attr_accessor :a, :b, :c
  	end

  	expect{ x = X.new }.not_to raise_error

    expect{ X.export_to_csv "test.csv" }.not_to raise_error

  end
end
