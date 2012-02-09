# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
end

Then /I should see all of the movies/ do
  Movie.all.each do |movie|
    step %Q(I should see "#{movie.title}")
  end
end 

Then /I should not see any of the movies/ do
  Movie.all.each do |movie|
    step %Q(I should not see "#{movie.title}")
  end 
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.gsub(/"/,'').split(',').each do |field|
  
    if(uncheck)
     step %Q(I uncheck "#{field.strip}")
    else
     step %Q(I check "#{field.strip}")
    end
    
  end
end




