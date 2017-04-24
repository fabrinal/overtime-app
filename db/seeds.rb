100.times do |post|
  Post.create(date: Date.today, rationale: "#{post} rationale")
end

puts "create 100 sample"