class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic, optional: true
  accepts_nested_attributes_for :topic,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  has_many :comments, dependent: :destroy

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

  def self.recent
    order("created_at DESC")
  end

end
