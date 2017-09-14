class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :age, :gender
  validates_inclusion_of :gender, in: %w(Male Female Other)
  validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 120 }
  has_many :sushi_rolls, dependent: :destroy

  # def is_old_enough?
  #   age > 14 ? true : false
  # end

end
