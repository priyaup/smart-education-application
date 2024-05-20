# lib/tasks/remove_seed_data.rake

namespace :db do
  desc 'Remove seed data'
  task remove_seed_data: :environment do
    ActiveRecord::Base.transaction do
       Quiz.destroy_all
       TestQuestion.destroy_all
      puts 'Seed data removed successfully.'
    end
  end
end