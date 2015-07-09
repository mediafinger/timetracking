class CreatePeopleAndParticipations < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.timestamps
    end

    create_table :participations do |t|
      t.integer :person_id,  null: false
      t.integer :project_id, null: false
      t.timestamps
    end
  end
end
