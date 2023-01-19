class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '重要' },
    { id: 3, name: '任意' },
  ]

  include ActiveHash::Associations
  has_many :plans
  end