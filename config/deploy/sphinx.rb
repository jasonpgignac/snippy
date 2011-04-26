namespace 'deploy' do
  desc 'Stop the sphinx daemon'
  task :stop_sphinx, :roles => :app, :except => { :no_release => true } do
    thinking_sphinx.stop
  end

  desc 'Configure the sphinx daemon'
  task :configure_sphinx, :roles => :app, :except => { :no_release => true } do
    thinking_sphinx.configure
  end

  desc 'Start the sphinx daemon'
  task :start_sphinx, :roles => :app, :except => { :no_release => true } do
    thinking_sphinx.start
  end

end

before 'deploy:update_code', 'deploy:stop_sphinx'
after 'deploy:update_code', 'deploy:configure_sphinx'
after 'deploy:update_code', 'deploy:start_sphinx'

