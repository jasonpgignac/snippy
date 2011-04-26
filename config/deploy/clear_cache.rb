namespace 'deploy' do
  desc "Clear cached files"
  task :clear_cache, :roles => :app, :except => { :no_release => true } do
    run <<-CMD
      cd #{current_path};
      rm public/stylesheets/all.css;
      rm public/javascripts/all.js;
      true;
    CMD
  end
end

after 'deploy:update_code', 'deploy:clear_cache'
