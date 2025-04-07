# project = Project.create!(title: "Website Redesign", status: "Planning")
# project.comments.create!(content: "Initial idea proposed.")
# project.status_changes.create!(previous_status: "Planning", new_status: "In Progress")

[ "PLANNING", "IN_PROGRESS", "ON_HOLD", "WAITING_FOR_REVIEW", "IN_REVIEW", "REJECTED", "APPROVED", "COMPLETED", "CANCELLED" ].each_with_index do |status, index|
  ProjectStatus.find_or_create_by name: status.upcase, sequence: index + 1
end