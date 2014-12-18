require 'rails_helper'

RSpec.describe "test_objects/edit", :type => :view do
  before(:each) do
    @test_object = assign(:test_object, TestObject.create!(
      :title => "MyString"
    ))
  end

  it "renders the edit test_object form" do
    render

    assert_select "form[action=?][method=?]", test_object_path(@test_object), "post" do

      assert_select "input#test_object_title[name=?]", "test_object[title]"
    end
  end
end
