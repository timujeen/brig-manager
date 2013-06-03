require 'spec_helper'

describe Job do
  it {should have_and_belong_to_many(:brigades)}
end
