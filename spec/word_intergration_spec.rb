require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("create a word path", { :type => :feature }) do
  it("creates a word and then goes to the word page") do
    visit("/words")
    click_on("Add a new word")
    fill_in("word_str", :with => "flying bison")
    click_on("Add")
    expect(page).to(have_content("flying bison"))
  end
end

describe("create a definition path", { :type => :feature }) do
  it("creates a word, definition and then displays definition") do
    word = Word.new("flying bison", nil)
    word.save()
    visit("/words/#{word.id}")
    fill_in("def_str", :with => "homie")
    click_on("Add")
    expect(page).to(have_content("homie"))
  end
end

describe("edit a word", { :type => :feature }) do
  it("edit a word and return to word page") do
    word = Word.new("flying bison", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Edit word")
    fill_in("str", :with => "appa")
    click_on("Update")
    expect(page).to(have_content("appa"))
  end
end

describe("edit a definition", { :type => :feature }) do
  it("edit a definition and return to word page") do
    word = Word.new("flying bison", nil)
    word.save()
    def1 = Define.new("homie for life", word.id, nil)
    def1.save()
    visit("/words/#{word.id}/definitions/#{def1.id}")
    fill_in("str", :with => "turtle duck")
    click_on("Update")
    expect(page).to(have_content("turtle duck"))
  end
end

describe("delete a word", { :type => :feature }) do
  it("delete a word and return to word page") do
    word = Word.new("flying bison", nil)
    word.save()
    visit("/words/#{word.id}")
    click_on("Edit word")
    click_on("Delete")
    expect(page).to(have_content(""))
  end
end

describe("delete a definition", { :type => :feature }) do
  it("delete a definition and return to word page") do
    word = Word.new("flying bison", nil)
    word.save()
    def1 = Define.new("homie for life", word.id, nil)
    def1.save()
    visit("/words/#{word.id}/definitions/#{def1.id}")
    click_on("Delete")
    expect(page).to(have_content(""))
  end
end