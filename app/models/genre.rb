class Genre < ActiveHash::Base
  self.data = [
    {:id => 1, :name => 'Action'},
    {:id => 2, :name => 'Shooting'},
    {:id => 3, :name => 'Sports'}
  ]
end