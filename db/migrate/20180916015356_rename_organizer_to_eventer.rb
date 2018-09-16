class RenameOrganizerToEventer < ActiveRecord::Migration[5.2]
  def change
    rename_table :organizers, :eventers
  end
end
