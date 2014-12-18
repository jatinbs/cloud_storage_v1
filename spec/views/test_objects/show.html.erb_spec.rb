require 'rails_helper'

RSpec.describe "test_objects/show", :type => :view do
  before(:each) do
    @test_object = assign(:test_object, TestObject.create!(
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
