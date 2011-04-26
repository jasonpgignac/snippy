# inspired by Github
# http://github.com/blog/470-deployment-script-spring-cleaning
require 'rubygems'
require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'thinking_sphinx/deploy/capistrano'
load 'config/deploy/settings'
load 'config/deploy/clear_cache'
load 'config/deploy/disable'
load 'config/deploy/setup'
load 'config/deploy/sphinx'
load 'config/deploy/symlinks'


namespace :deploy do
  desc "Deploy the MFer"
  task :default do
    update
    restart
  end

  desc "Update"
  task :update, :except => { :no_release => true } do
    update_code
  end
  
  desc "Restart"
  task :restart, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  namespace :rollback do
    desc "Rollback"
    task :default do
      code
    end
    
    desc "Rollback a single commit."
    task :code, :except => { :no_release => true } do
      set :branch, "HEAD^"
      update_code
    end
  end
  
  desc "Update the deployed code."
  task :update_code, :except => { :no_release => true } do
    run "cd #{current_path}; git fetch origin; git reset --hard #{branch}"
  end
end
