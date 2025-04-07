class Project < ApplicationRecord
  has_many :project_histories
  has_many :comments

  belongs_to :user
  belongs_to :project_status

  def is_final?
    final_status = [ "REJECTED", "APPROVED", "COMPLETED", "CANCELLED" ]
    return final_status.include?(self.project_status.name)
  end
end
