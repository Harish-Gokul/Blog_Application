class User < ApplicationRecord
  has_many :articles
  VALID_EMAIL_REGEX= /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  validates :username, presence: true,uniqueness: true,length: {minimum: 5,maximum: 25}
  validates :email,presence: true,uniqueness: true,length: {maximum:250},format: { with: VALID_EMAIL_REGEX ,multiline:true}

end