require 'spec_helper'

describe "prayers/new.html.erb" do
  before(:each) do
    assign(:prayer, stub_model(Prayer,
      :request => "MyString"
    ).as_new_record)
  end

  it "renders new prayer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => prayers_path, :method => "post" do
      assert_select "input#prayer_request", :name => "prayer[request]"
    end
  end
end
