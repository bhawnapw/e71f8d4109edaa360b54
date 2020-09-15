# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

channels = ["Aaj tak", "Apv news", "Starplus", "Pogo", "Colours", "Zee news"]
min = [00,05,10,15,20,25,30,35,40,45,50,55]
channels.each do |channel_name|
  channel = Channel.new(name: channel_name)
  if channel.save
    (1..10).to_a.each do |num|
        tv_show = channel.tv_shows.new(name: "Show #{num}", timing: "#{rand(0..23)}:#{min[rand(0..(min.length-1))]}")
        tv_show.save
    end 
  end
end