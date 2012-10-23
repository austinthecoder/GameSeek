require 'spec_helper'

feature "Finding games" do
  scenario "finding games based on my criteria" do
    Game.create!(
      :title => 'FIFA 13',
      :price => 40,
      :platform_id => Platform.find_by_name('PlayStation 3').id,
      :genre_id => Genre.find_by_name('Sports').id
    )
    Game.create!(
      :title => 'Madden NFL 13',
      :price => 60,
      :platform_id => Platform.find_by_name('PlayStation 3').id,
      :genre_id => Genre.find_by_name('Sports').id
    )
    Game.create!(
      :title => 'Tiger Woods PGA TOUR 13',
      :price => 20,
      :platform_id => Platform.find_by_name('PlayStation 3').id,
      :genre_id => Genre.find_by_name('Sports').id
    )
    Game.create!(
      :title => 'NBA 2K',
      :price => 50,
      :platform_id => Platform.find_by_name('Xbox 360').id,
      :genre_id => Genre.find_by_name('Sports').id
    )
    Game.create!(
      :title => 'Mario Bros.',
      :price => 60,
      :platform_id => Platform.find_by_name('PlayStation 3').id,
      :genre_id => Genre.find_by_name('Action').id
    )

    visit '/'

    fill_in 'What is your name?', :with => 'Austin Schneider'
    select 'PlayStation 3', :from => 'Choose your platform'
    click_on "Let's go!"

    select 'Sports', :from => 'What genre?'
    select '$30', :from => 'Min. Price'
    select '$60', :from => 'Max. Price'
    click_on 'Show me the games!'

    within "#games" do
      expect(page).to have_content "FIFA 13"
      expect(page).to have_content "Madden NFL 13"
      expect(page).to_not have_content "Tiger Woods PGA TOUR 13"
      expect(page).to_not have_content "NBA 2K"
      expect(page).to_not have_content "Mario Bros."
    end
  end
end