require 'spec_helper'

describe "brigades/new" do
  before(:each) do
    assign(:brigade, stub_model(Brigade,
      :title => "MyString",
      :count_of_workers => 1,
      :price => "9.99",
      :country_id => 1
    ).as_new_record)
  end

  it "renders new brigade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", brigades_path, "post" do
      assert_select "input#brigade_title[name=?]", "brigade[title]"
      assert_select "input#brigade_count_of_workers[name=?]", "brigade[count_of_workers]"
      assert_select "input#brigade_price[name=?]", "brigade[price]"
      assert_select "input#brigade_country_id[name=?]", "brigade[country_id]"
    end
  end
end
