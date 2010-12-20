require 'spec_helper'

describe "resources/index.html.erb" do
  before(:each) do
    assign(:resources, [
      stub_model(Resource,
        :title => "Title",
        :description => "MyText",
        :url => "Url",
        :category_id => 1
      ),
      stub_model(Resource,
        :title => "Title",
        :description => "MyText",
        :url => "Url",
        :category_id => 1
      )
    ])
  end

  it "renders a list of resources" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
