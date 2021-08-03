db:
	rails db:migrate

add:
	git add .

origin:
	git push origin master

heroku:
	git push heroku master

amend:
	git commit --amend --no-edit

force:
	git push origin master -f

h_force:
	git push heroku master -f
