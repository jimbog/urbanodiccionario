require 'spec_helper'

describe "words/new" do
  before(:each) do
    assign(:word, stub_model(Word,
      :name => "MyString",
      :definition => "MyText",
      :example => "MyText"
    ).as_new_record)
  end

  it "renders new word form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", words_path, "post" do
      assert_select "input#word_name[name=?]", "word[name]"
      assert_select "textarea#word_definition[name=?]", "word[definition]"
      assert_select "textarea#word_example[name=?]", "word[example]"
    end
  end
end
