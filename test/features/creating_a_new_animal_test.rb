require_relative '../test_helper'

class TestAnimalCreationFeature < ActionDispatch::IntegrationTest
  def test_a_user_can_create_a_new_animal
    #all of this is html so everything willl look like a string
    visit '/'

    click_link "Create a new little baby animal"

    # assert_equal '/animals/new', current_path
      assert_equal new_animal_path, current_path

    fill_in "Name", with: "Turtle-Bear"
    # fill in "animal [description]" with: "Big furry with a hard shell"
    fill_in "Description", with: "Big furry with a hard shell"

    fill_in "Age", with: 1
    click_button "Create Animal"


    assert page.has_css?"#animal_details"

    within("#animal_details") do
      assert page.has_content?("Turtle-Bear")
      assert page.has_content?("Big furry with a hard shell")
      assert page.has_content?("1")
    end

  end
end
