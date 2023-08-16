class JiraTaskList < Phlex::HTML
  register_element :ac_task_list, tag: "ac:task-list"
  register_element :ac_task, tag: "ac:task"
  register_element :ac_task_status, tag: "ac:task-status"
  register_element :ac_task_body, tag: "ac:task-body"
  register_element :ac_placeholder, tag: "ac:placeholder"

  def template
    ac_task_list do
      ac_task do
        ac_task_status { "incomplete" }
        ac_task_body do
          ac_placeholder(**{:"ac:type" => "mention"}) do
            "@mention example. This placeholder will automatically search for a user to mention in the page when the user begins typing."
          end
        end
      end
    end
  end
end
