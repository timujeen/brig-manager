require 'spec_helper'

describe "brigades/show" do
  before(:each) do
    @brigade = assign(:brigade, stub_model(Brigade,
      :title => "Title",
      :count_of_workers => 1,
      :price => "9.99",
      :country_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/9.99/)
    rendered.should match(/2/)
  end
end
