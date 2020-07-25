require 'active_record'

ActiveRecord::Base.establish_connection({
  :adapter => "mysql2",
  :host => "localhost",
  :username => "root",
  :password => "root",
  :database => "teste"
  })

class User < ActiveRecord::Base
end

=begin
user = User.new
user.nome = "Anna"
user.email = "Bebe@gmail.com"
user.sexo = "F"
user.save
=end

=begin
user = User.create(
  :nome => "Mario",
  :email => "mama@gmail.com",
  :sexo => "H"
)
=end

=begin
user = User.find(2)
puts user.nome
=end

=begin
user = User.all
p user
=end

=begin
user = User.all
for k in user
  p k.nome
end
=end

#User.delete_all
