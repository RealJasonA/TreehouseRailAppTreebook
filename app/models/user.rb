class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :profile_name




    has_many :statuses

    def full_name
        first_name + " " + last_name
    end

    def gravatar_url
        stripped_email = email.stripped
        downcased_email = stripped_email.downcase
        hash = Digest::MD5.hexdigest(downcased_email)

        "http://gravatar.com/avatar/#{hash}"
    end
    

end
