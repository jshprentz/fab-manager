# frozen_string_literal: true

# Component is a material that can be used in Projects.
class Component < ApplicationRecord
  has_and_belongs_to_many :projects, join_table: 'projects_components'
  validates :name, presence: true, length: { maximum: 50 }
end
