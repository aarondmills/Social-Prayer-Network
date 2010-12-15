require 'spec_helper'

describe "prayers/show.html.erb" do
  before(:each) do
    @prayer = assign(:prayer, stub_model(Prayer,
      :request => "Request"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Request/)
  end
end
