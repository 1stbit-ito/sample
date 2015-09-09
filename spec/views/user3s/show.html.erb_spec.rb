require 'rails_helper'

RSpec.describe "user3s/show", :type => :view do
  before(:each) do
    @user3 = assign(:user3, User3.create!(
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end
