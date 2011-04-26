default_run_options[:pty] = true
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]

set :application, 'snippy'
set :branch,     "origin/master"
set :default_stage, 'staging'
set :deploy_to, "/srv/#{application}"
set :current_path, "#{deploy_to}/current"
set :current_release, "#{deploy_to}/current"
set :release_path, "#{deploy_to}/current"
set :shared_path, "#{deploy_to}/shared"
set :repository, "git@cs-db-2.rackspace.com:#{application}"
set :scm, 'git'
set :stages, %(staging production)
set :synchronous_connect, true
set :user, 'rails'




