# frozen_string_literal:true

class CreateTrainingsMachine < ActiveRecord::Migration[4.2]
  def change
    create_table :trainings_machines do |t|
      t.belongs_to :training, index: true
      t.belongs_to :machine, index: true
    end
  end
end
