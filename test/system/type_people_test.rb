require "application_system_test_case"

class TypePeopleTest < ApplicationSystemTestCase
  setup do
    @type_person = type_people(:one)
  end

  test "visiting the index" do
    visit type_people_url
    assert_selector "h1", text: "Type people"
  end

  test "should create type person" do
    visit type_people_url
    click_on "New type person"

    fill_in "Description", with: @type_person.description
    fill_in "Name", with: @type_person.name
    fill_in "Slug", with: @type_person.slug
    click_on "Create Type person"

    assert_text "Type person was successfully created"
    click_on "Back"
  end

  test "should update Type person" do
    visit type_person_url(@type_person)
    click_on "Edit this type person", match: :first

    fill_in "Description", with: @type_person.description
    fill_in "Name", with: @type_person.name
    fill_in "Slug", with: @type_person.slug
    click_on "Update Type person"

    assert_text "Type person was successfully updated"
    click_on "Back"
  end

  test "should destroy Type person" do
    visit type_person_url(@type_person)
    click_on "Destroy this type person", match: :first

    assert_text "Type person was successfully destroyed"
  end
end
