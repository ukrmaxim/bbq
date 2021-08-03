amend:
	git commit --amend --no-edit

force:
	git push origin master -f

master:
	git push origin master

db:
	rails db:migrate

heroku_force:
	git push heroku master -f
