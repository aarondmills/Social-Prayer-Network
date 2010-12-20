require 'spec_helper'

describe "resources/new.html.erb" do
  before(:each) do
    assign(:resource, stub_model(Resource,
      :title => "MyString",
      :description => "MyText",
      :url => "MyString",
      :category_id => 1
    ).as_new_record)
  end

  it "renders new resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => resources_path, :method => "post" do
      assert_select "input#resource_title", :name => "resource[title]"
      assert_select "textarea#resource_description", :name => "resource[description]"
      assert_select "input#resource_url", :name => "resource[url]"
      assert_select "input#resource_category_id", :name => "resource[category_id]"
    end
  end
end
