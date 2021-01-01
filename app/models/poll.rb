class Poll < ApplicationRecord
  has_many :options, dependent: :destroy
  has_many :user_options, through: :options

  accepts_nested_attributes_for :options

  def option_score(option_id)
    opts = user_options.where(option_id: option_id)
    opts.pluck(:score).inject(:+)
  end
end
