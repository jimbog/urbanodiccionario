require 'spec_helper'

describe "words/edit" do
  before(:each) do
    @word = assign(:word, stub_model(Word,
      :name => "MyString",
      :definition => "MyText",
      :example => "MyText"
    ))
  end

  it "renders the edit word form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", word_path(@word), "post" do
      assert_select "input#word_name[name=?]", "word[name]"
      assert_select "textarea#word_definition[name=?]", "word[definition]"
      assert_select "textarea#word_example[name=?]", "word[example]"
    end
  end
end
