class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # attr_accessor :login

  # validates :pseudo, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}
  #validates :email, presence: true, format: { with: '@', message: 'Doit contenir un @' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  devise :omniauthable, omniauth_providers: [:facebook]

  #def self.find_first_by_auth_conditions(warden_conditions)
  #  conditions = warden_conditions.dup
  #  if login = conditions.delete(:login)
  #    where(conditions.to_hash).where("lower(pseudo) = :value OR lower(email) = :value", value: login.downcase).first
  #  else
  #    where(conditions.to_hash)
  #  end
  #end

  def self.from_facebook(auth)
    where(facebook_id: auth.uid).first_or_create do |user|
      user.facebook_id = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
end
