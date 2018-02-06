class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # attr_accessor :login

  # validates :pseudo, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}
  #validates :email, presence: true, format: { with: '@', message: 'Doit contenir un @' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #def self.find_first_by_auth_conditions(warden_conditions)
  #  conditions = warden_conditions.dup
  #  if login = conditions.delete(:login)
  #    where(conditions.to_hash).where("lower(pseudo) = :value OR lower(email) = :value", value: login.downcase).first
  #  else
  #    where(conditions.to_hash)
  #  end
  #end
end
