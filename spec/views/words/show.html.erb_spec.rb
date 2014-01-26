require 'spec_helper'

describe "words/show" do
  before(:each) do
    @word = assign(:word, stub_model(Word,
      :name => "Name",
      :definition => "MyText",
      :example => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
