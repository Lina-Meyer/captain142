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
  'http://res.cloudinary.com/dahnkneeah/image/upload/v1527257582/3cd3c5dd614ba94ff1f3b8e4f718c1a9.jpg',
  'http://res.cloudinary.com/dahnkneeah/image/upload/v1527257736/21f5f2a913c8a591a07ac82847e2f134.jpg',
  'http://res.cloudinary.com/linameyer/image/upload/v1527078838/oytqkh5q4e1now8b0xtu.jpg',
  'http://res.cloudinary.com/linameyer/image/upload/v1527005394/ycfom2jzmpgqqia9cfoi.jpg',
  'http://res.cloudinary.com/dahnkneeah/image/upload/v1527257829/5b8297d87779e0732cc021ac0ec65ef7.jpg',

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


