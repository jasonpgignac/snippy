namespace :deploy do
  namespace :web do
    task :disable do
      on_rollback {  delete "/var/www/html/maintenance.html"}
      template = File.read('./app/views/layouts/maintenance.html.erb')
      reason = ENV['REASON']
      deadline = ENV['UNTIL']
      maintenance = ERB.new(template).result(binding)
      put maintenance, "#{shared_path}/system/maintenance.html", :mode=>0644
    end

    task :enable do
      run "rm /var/www/html/maintenance.html"
    end
  end
end
