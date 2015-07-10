del config\database.yml.deploy /Q
copy config\database.yml config\database.yml.deploy
del config\database.yml /Q
copy config\database.yml.dev config\database.yml

del Gemfile_deploy /Q
copy Gemfile Gemfile_deploy
del Gemfile /Q
copy Gemfile_dev Gemfile

bundle install

rails s