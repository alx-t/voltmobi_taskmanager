module Web::TasksHelper

  def btn_to(task)
    unless task.get_next_state.empty?
      link_to task.get_next_state,
        task_state_path(task_id: task, id: task.get_next_state),
        method: :patch, class: 'btn btn-primary btn-sm',
        remote: true, data: {type: :json}
    end
  end
end
