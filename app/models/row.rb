class Row < ApplicationRecord
  has_many :row_columns
  belongs_to :list
  has_many :columns, through: :row_columns
end
