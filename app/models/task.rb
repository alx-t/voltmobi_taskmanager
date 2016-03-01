class Task < ActiveRecord::Base
  include AASM

  validates :name, presence: true

  aasm do
    state :new, initial: true
    state :started
    state :finished

    event :start do
      transitions from: :new, to: :started
    end

    event :finish do
      transitions from: :started, to: :finished
    end
  end

  def to_state!(new_state)
    send((new_state.downcase + "!").to_sym) if get_next_state == new_state
  end

  def get_next_state
    aasm.events.try(:first).try(:name).to_s.capitalize
  end
end

