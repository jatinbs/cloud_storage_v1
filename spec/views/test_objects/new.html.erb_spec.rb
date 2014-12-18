require 'rails_helper'

RSpec.describe "test_objects/new", :type => :view do
  before(:each) do
    assign(:test_object, TestObject.new(
      :title => "MyString"
    ))
  end

  it "renders new test_object form" do
    render

    assert_select "form[action=?][method=?]", test_objects_path, "post" do

      assert_select "input#test_object_title[name=?]", "test_object[title]"
    end
  end
end
