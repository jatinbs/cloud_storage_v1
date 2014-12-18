require 'rails_helper'

RSpec.describe "test_objects/index", :type => :view do
  before(:each) do
    assign(:test_objects, [
      TestObject.create!(
        :title => "Title"
      ),
      TestObject.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of test_objects" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
