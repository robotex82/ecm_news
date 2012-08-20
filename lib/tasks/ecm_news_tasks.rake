namespace :ecm_news do
  namespace :db do
    desc "Purges and creates example data"
    task :populate!, [] => [:environment] do |t, args|

      Rake::Task["ecm_news:db:clear!"].execute
      Rake::Task["ecm_news:db:populate"].execute
    end
    
    desc "Clears all data!"
    task :clear!, [] => [:environment] do |t, args|
      Ecm::News::Item.delete_all
    end
    
    desc "Creates example_data"
    task :populate, [] => [:environment] do |t, args|
      require "ffaker"
      require "forgery"

      # Create example news items
      100.times do
        Ecm::News::Item.create! do |i|   
          i.title           = Faker::Lorem.paragraph(1).split(" ")[0..3].join(" ")
          i.locale          = I18n.available_locales.choice.to_s
          i.body            = Faker::Lorem.paragraph(rand(9) + 1)
          i.link_to_more    = [true, false].choice
          i.published       = [true, false].choice  
          i.markup_language = Ecm::News::Item::MARKUP_LANGAUGES.choice
        end  
      end     
    end  
  end
end
