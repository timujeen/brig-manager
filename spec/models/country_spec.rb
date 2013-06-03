require 'spec_helper'

describe Country do
  it {should have_many(:brigades)}
end
