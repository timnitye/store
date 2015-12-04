class AddWorkflowStateToCart < ActiveRecord::Migration
  def change
    add_column :carts, :workflow_state, :string
  end
end
