# cit-staging.rackspace.com
# cio-access-n01.dfw1.stabletransit.com (old ip was 172.17.16.35)
# 172.17.16.35
role :app, '172.17.50.30'
role :db, '172.17.50.30'
set :rails_env, 'staging'
set :repository, "git@172.17.50.13:#{application}"
set :user, "dd_deploy"
