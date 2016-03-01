require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { create :task }

  it { should validate_presence_of :name }

  it 'have initial state new' do
    expect(task).to have_state :new
    expect(task.get_next_state).to eq "Start"
  end

  it 'can transit from new to started' do
    expect(task).to transition_from(:new).to(:started).on_event(:start)
    expect(task).to have_state :started
    expect(task.get_next_state).to eq "Finish"
  end

  it 'can transit from startded to finished' do
    expect(task).to transition_from(:started).to(:finished).on_event(:finish)
    expect(task).to have_state :finished
    expect(task.get_next_state).to eq ""
  end

  it 'can change state' do
    expect(task).to have_state :new
    task.to_state!('Start')
    expect(task).to have_state :started
  end
end

