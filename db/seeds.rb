require 'faker'

User.destroy_all
Boat.destroy_all
Booking.destroy_all

User.create(email: "user@gmail.com", password: "123123")



users = User.all
prices = [10, 100, 1000, 10000, 100000]
capacities = [1,2,3,4,5,6,7,8,9,10]
cities = ['Berlin', 'London', 'Paris', 'Amsterdam', 'Barcelona']
urls = [
  'http://res.cloudinary.com/linameyer/image/upload/v1527087057/q5ounjkwr3bswhfkmmxf.jpg',
  'http://res.cloudinary.com/linameyer/image/upload/v1527083380/hucqdwhzygmd6y7egmvt.jpg',
  'http://res.cloudinary.com/linameyer/image/upload/v1527078838/oytqkh5q4e1now8b0xtu.jpg',
  'http://res.cloudinary.com/linameyer/image/upload/v1527005394/ycfom2jzmpgqqia9cfoi.jpg',
  'http://res.cloudinary.com/linameyer/image/upload/v1527087229/toaw7c86w7xsvvr9ydjd.jpg'
]

5.times do
  photo = urls.delete_at(0)
  boat = Boat.new(
    name: Faker::Friends.character,
    price: prices.sample,
    category: Faker::Vehicle.manufacture,
    description: Faker::Lorem.sentence(3, true, 4),
    availability: true,
    capacity: capacities.sample,
    city: cities.sample,
    user: users.sample
  )
  boat.remote_photo_url = photo
  boat.save
end


