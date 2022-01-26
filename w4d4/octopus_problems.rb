
#Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish(fish)
  longest_fish = ""
  fish.each do |f1|
    fish.each do |f2|
      if f2.length > f1.length
        longest_fish = f2
      else
        longest_fish = f1
      end
    end
  end
  longest_fish
end