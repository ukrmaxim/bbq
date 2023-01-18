.PHONY: db

db:
	rails db:migrate

add:
	git add .

origin:
	git push origin master

amend:
	git commit --amend --no-edit

force:
	git push origin master -f
