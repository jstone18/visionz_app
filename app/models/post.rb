class Post < ApplicationRecord

  acts_as_votable
  belongs_to :user

  has_many :comments
  has_many :users, through: :comments

  validates :title, presence: true, length: { minimum: 3 }, length: { maximum: 25 }
  validates :description, presence: true

  has_attached_file :image, styles: { medium: "700x500#", small: "350x250>" }
  validates :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.search(search)
    if search
      where(["category LIKE ?", "%#{search}%"])
    else
      self.all
    end
  end


end
