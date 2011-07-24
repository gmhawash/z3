namespace :import do 
  desc "Export database"
  task :notes => :environment do
    hash = {}
    
    File.open(File.join(File.expand_path('..', __FILE__), 'notes.txt')).each_line do |line|
     l = line.gsub('\r\n', "<br/>").split("###")
     note = Note.find_or_initialize_by_title_and_category(l[0], l[1])
     note.title = l[0]
     note.category =  l[1]
     note.body = l[2]
     note.save
    end
  end
end
