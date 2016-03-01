json.extract! @task, :id, :name, :created_at, :aasm_state
json.local_date @task.created_at.in_time_zone.strftime("%d/%m/%Y %H:%M")
json.next_state @task.get_next_state
json.view_task_url task_path(@task)
json.change_status_url task_state_path(task_id: @task, id: @task.get_next_state)

