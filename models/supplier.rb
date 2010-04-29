require 'dm-timestamps'
require 'attr_encrypted'
class Supplier
  include DataMapper::Resource
  devise :database_authenticatable
  property :id, Serial
  property :email, String
  property :encrypted_password, String
  property :created_at, DateTime
  property :updated_at, DateTime

  attr_encrypted :password, :key => 'CHANGE ME - a secret key'

#  has_many :products, :dependent => :destroy

#  validates_presence_of :mobile_number
end

