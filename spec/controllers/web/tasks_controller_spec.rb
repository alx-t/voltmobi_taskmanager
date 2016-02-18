require 'rails_helper'

RSpec.describe Web::TasksController, type: :controller do
  let(:task) { create :task }

  describe 'GET #index' do
    let(:tasks) { create_list :task, 2 }

    before { get :index }

    it 'populates an array of all tasks' do
      expect(assigns(:tasks)).to match_array tasks
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Task to @task' do
      expect(assigns(:task)).to be_a_new(Task)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    context 'with valid attributes' do
      let(:subject) { post :create, task: attributes_for(:task) }

      it 'saves the new task in the database' do
        expect { subject }.to change(Task, :count).by(1)
      end

      it 'redirect to show view' do
        subject
        expect(response).to redirect_to task_path(assigns(:task))
      end
    end

    context 'with invalid attributes' do
      let(:subject) { post :create, task: attributes_for(:invalid_task) }

      it 'does not save the question' do
        expect { subject }.to_not change(Task, :count)
      end

      it 're-renders new view' do
        subject
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #show' do
    before { get :show, id: task }

    it 'assigns the requested task to @task' do
      expect(assigns(:task)).to eq task
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end

