class List < ApplicationRecord
  belongs_to :project
  has_many :names, :dependent => :destroy
  has_many :infos, :dependent => :destroy
  has_many :name_infos, through: :names
  validates :title, uniqueness: { case_sensitive: false }

  def newRow
    name = Name.create(list_id: self[:id], name: "row")
    self.infos.each do |column|
      NameInfo.create(name_id: name.id, info_id: column.id)
    end
  end
  def newColumn
    column = Info.create(list_id: self[:id], name: "column")
    self.names.each do |row|
      NameInfo.create(name_id: row.id, info_id: column.id)
    end
  end
end
