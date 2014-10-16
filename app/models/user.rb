class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :sent_thanks, :class_name => 'Thank', :foreign_key => 'sender_id'
  has_many :received_thanks, :class_name => 'Thank', :foreign_key => 'recipient_id'


  def all_thanks
    sent_thanks + received_thanks
  end
end
