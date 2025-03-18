class CreateJoinTableAffiliationsPeople < ActiveRecord::Migration[7.1]
  def change
    create_join_table :affiliations, :people do |t|
      # t.index [:affiliation_id, :person_id]
      # t.index [:person_id, :affiliation_id]
    end
  end
end
