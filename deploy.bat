del config\database.yml.dev /Q
copy config\database.yml config\database.yml.dev
del config\database.yml /Q
copy config\database.yml.deploy config\database.yml

del Gemfile_dev /Q
copy Gemfile Gemfile_dev
del Gemfile /Q
copy Gemfile_deploy Gemfile

bundle install

git add .
git commit -m%1
git push heroku master