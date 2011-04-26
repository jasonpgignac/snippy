set :normal_symlinks, %w(
  config/database.yml
  config/rack_ldap.yml
  config/sphinx.yml
  db/sphinx
)

namespace :make_symlinks do
  desc "Link the files"
  task :make, :roles => :app, :except => { :no_release => true } do
    commands = normal_symlinks.map do |path|
      "ln -nfs #{shared_path}/#{path} #{current_path}/#{path}"
    end
    run <<-CMD
      cd #{current_path} && #{commands.join(" && ")}
    CMD
  end
end

after 'deploy:update_code', 'make_symlinks:make'

