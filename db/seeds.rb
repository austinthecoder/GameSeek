# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

prices = (10..100).to_a
action_genre_id = Genre.find_by_name('Action').id
shooting_genre_id = Genre.find_by_name('Shooting').id
sports_genre_id = Genre.find_by_name('Sports').id

{
  Platform.find_by_name('PlayStation 3').id => {
    action_genre_id => [
      "Army of Two: The Devil's Cartel",
      "Dead Space 3",
      "Mass Effect 3",
      "Battlefield 3",
      "Dragon Age II Mark of the Assassin",
      "Dragon Age 2 Legacy DLC",
      "Harry Potter and the Deathly Hallows - Part 2",
      "Shadows of the Damned",
      "Alice: Madness Returns"
    ],
    shooting_genre_id => [
      "Fuse",
      "Dead Space 3",
      "Crysis 3",
      "Medal Of Honor Warfighter",
      "Battlefield 3: Armored Kill",
      "Battlefield 3 Close Quarters",
      "Battlefield 3",
      "Crysis 2",
      "Bulletstorm"
    ],
    sports_genre_id => [
      "EA SPORTS FIFA 13",
      "NHL 13",
      "Madden NFL 13",
      "NCAA Football 13",
      "Tiger Woods PGA TOUR 13",
      "EA SPORTS FIFA Street",
      "SSX",
      "EA SPORTS FIFA 12",
      "FIFA 12 Ultimate Team"
    ]
  },
  Platform.find_by_name('Xbox 360').id => {
    action_genre_id => [
      "Army of Two: The Devil's Cartel",
      "Dead Space 3",
      "Mass Effect 3",
      "Battlefield 3",
      "Dragon Age II Mark of the Assassin",
      "Dragon Age 2 Legacy DLC",
      "Harry Potter and the Deathly Hallows - Part 2",
      "Shadows of the Damned",
      "Alice: Madness Returns"
    ],
    shooting_genre_id => [
      "Fuse",
      "Dead Space 3",
      "Crysis 3",
      "Medal Of Honor Warfighter",
      "Battlefield 3: Armored Kill",
      "Battlefield 3 Close Quarters",
      "Battlefield 3",
      "Crysis 2",
      "Bulletstorm"
    ],
    sports_genre_id => [
      "EA SPORTS FIFA 13",
      "NHL 13",
      "Madden NFL 13",
      "NCAA Football 13",
      "Tiger Woods PGA TOUR 13",
      "EA SPORTS FIFA Street",
      "SSX",
      "EA SPORTS FIFA 12",
      "FIFA 12 Ultimate Team"
    ]
  }
}.each do |platform_id, hash|
  hash.each do |genre_id, titles|
    titles.each do |title|
      Game.create!(
        :platform_id => platform_id,
        :genre_id => genre_id,
        :title => title,
        :price => prices.shuffle.first
      )
    end
  end
end