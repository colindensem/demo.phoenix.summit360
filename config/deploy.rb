# config valid only for current version of Capistrano
lock '3.4.0'

set :default_env,   { mix_env: "prod" }

set :application, 'phoenix.summit360'
set :repo_url, 'git@github.com:colindensem/phoenix.summit360.git'

set :deploy_to, '/home/deploy/apps/summit360/www'

set :log_level, :info
set :keep_releases, 3

# Setup Phoenix Secrets & Assets
set :linked_files, %w{
    'config/prod.secret.exs'
  }

set :linked_dirs, %w{
    deps
    node_modules
    rel
    _build
    priv/static/css
    priv/static/js
  }


namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
