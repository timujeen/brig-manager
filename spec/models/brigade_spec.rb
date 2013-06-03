require 'spec_helper'

describe Brigade do
  it {should have_and_belong_to_many(:jobs)}
  it {should validate_uniqueness_of(:title)}
  it {should_not allow_value(0).for(:price)}
  it {should_not allow_value(-1).for(:price)}
  it {should_not allow_value(0).for(:count_of_workers)}
  it {should_not allow_value(-1).for(:count_of_workers)}
end
