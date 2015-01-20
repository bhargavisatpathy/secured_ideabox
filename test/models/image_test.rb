require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def valid_attributes
    {
      name:     "image1",
      url:      "https://flower.com"
    }
  end
  test "it creates an image" do
    image = Image.new(valid_attributes)

    assert image.valid?
    assert_equal "image1", image.name
    assert_equal "https://flower.com", image.url
  end

  test "it cannot create an image without a name" do
    image = Image.new(url: "https://flower.com")

    assert image.invalid?
  end

  test "it cannot create an image without a url" do
    image = Image.new(name: "image1")

    assert image.invalid?
  end

  test "it can have many ideas" do
    image = Image.create(valid_attributes)
    image.ideas.create(title: "title1", description: "this is title1")
    image.ideas.create(title: "title2", description: "this is title2")
    ideas = image.imagings.collect{|imaging| imaging.idea}
    assert ["title1", "title1"], ideas
  end
end
