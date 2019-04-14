class Column < ApplicationRecord
  belongs_to :list
  has_many :row_columns
  has_many :rows, through: :row_columns
end
