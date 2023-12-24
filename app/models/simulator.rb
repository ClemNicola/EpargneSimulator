class Simulator < ApplicationRecord
  belongs_to :user

  validates :marital, presence: true, inclusion: { in: ['Marié', 'Divorcé', 'Célibataire', 'Veuf'] }
  validates :professional, presence: true, inclusion: { in: ['Manager', 'Employé', 'Entrepreneur', 'Chômeur'] }
  validates :children, presence: true, inclusion:{ in: ['1', '2', '3', '4+']}
  validates :income, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
