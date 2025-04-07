class CreateProjectStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :project_statuses, id: :uuid do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :sequence, null: false
      t.timestamps
    end

    change_column :project_statuses, :created_at, :timestamptz
    change_column :project_statuses, :updated_at, :timestamptz

    change_column_default :project_statuses, :id, -> { 'uuid_generate_v4()' }
    change_column_default :project_statuses, :created_at, -> { 'now()' }
    change_column_default :project_statuses, :updated_at, -> { 'now()' }
  end
end
