require 'rails_helper'

RSpec.describe Web::Tasks::StateController, type: :controller do
  let(:task) { create :task }

  describe 'PATCH #update' do
    before { patch :update, task_id: task, id: 'Start', format: :json }

    it 'changes task to started' do
      task.reload
      expect(task).to have_state :started
      expect(task.get_next_state).to eq 'Finish'
    end

    it 'renders update.json.jbuilder' do
      expect(response).to render_template :update
    end
  end
end

