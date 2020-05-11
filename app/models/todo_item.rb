class TodoItem < ApplicationRecord
  belongs_to :todo_list

  after_create :assign_status

  enum status: {red: 0, yellow: 1, blue: 2, lightgreen: 3}

  default_scope { order(due_date: :asc) }

  def completed?
    !completed_at.blank?
  end

  def item_complete_updation
    self.update!(completed_at: Time.now, status: :lightgreen, due_date: close_to_infinite)
  end

  def assign_status
    if self.completed?
      self.lightgreen!
    elsif self.due_date <= Time.now.utc
      self.red!
    elsif self.due_date <= Time.now.utc + 2.days
      self.yellow!
    else
      self.blue!
    end
  end

  private
  def close_to_infinite
    Date.today + 500.years
  end

end
