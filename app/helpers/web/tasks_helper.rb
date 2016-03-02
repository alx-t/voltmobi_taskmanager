module Web::TasksHelper
  EXTNAMES = %w(.jpg .jpeg .gif .png .bmp)

  def btn_link(task)
    unless task.get_next_state.empty?
      link_to task.get_next_state,
        task_state_path(task_id: task, id: task.get_next_state),
        method: :patch, class: 'btn btn-primary btn-sm',
        remote: true, data: {type: :json}
    end
  end

  def file_link(file)
    if is_image?(file)
      image_tag file.url
    else
      link_to file.file.identifier, file.url
    end
  end

  private

  def is_image?(file)
    EXTNAMES.include? File.extname(file.file.identifier)
  end
end
