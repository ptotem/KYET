class Question < ActiveRecord::Base
  attr_accessible :answer, :is_mcq, :name, :insertion_date, :quiz_id
  just_define_datetime_picker :insertion_date, :add_to_attr_accessible => true
  has_many :options, :dependent => :destroy
  has_many :responses, :dependent => :destroy
  accepts_nested_attributes_for :options
  has_and_belongs_to_many :bonus
  belongs_to :quiz
end
