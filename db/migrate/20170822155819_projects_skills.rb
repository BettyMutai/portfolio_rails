class ProjectsSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :projects_skills, :id => false do |t|
      t.integer :project_id
      t.integer :skill_id
    end
  end
end
