Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


$ bundle install

$ rails db:reset db:migrate

$ rails db:drop
$ rails db:create
$ rails db:migrate
$ rails db:seed

$ rails s


Resetear la base de datos

heroku pg:reset DATABASE
heroku run rails db:migrate
heroku run rails db:seed


$ rails c

p = Patient.first

p.email = "old@gmail.com"

p.save

Patient.all


---------------

git diff app/admin/conversation.rb

 filter :status, as: :select, collection: [['Abiertas', 'open'], ['Terminadas', 'closed']]
-filter :doctor , as: :select, collection: ::User.all.select {|a| a.class == Doctor }.map{|a| [a.doctor_profile.last_name, a.id] }
