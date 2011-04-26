namespace 'deploy' do
  desc "Setup a GitHub-style deployment."
  task :setup, :roles => :app, :except => { :no_release => true } do
    run "git clone #{repository} #{current_path}"
  end
  
  desc "Make the directory structure"
  task :make_path, :roles => :app do
    sudo "mkdir -m 0775 -p #{deploy_to}/current"
    %w{config log pids system tmp db}.each do |dir|
      sudo "mkdir -m 0775 -p #{deploy_to}/shared/#{dir}"
    end
  end
end

before 'deploy:setup', 'deploy:make_path'
