# config valid only for current version of Capistrano
lock '3.4.0'

set :default_env,   { mix_env: "prod", port:8088 }

set :application, 'phoenix.summit360'
set :repo_url, 'git@github.com:colindensem/phoenix.summit360.git'

set :deploy_to, '/home/deploy/apps/summit360/www'

set :log_level, :info
set :keep_releases, 3

# Setup Phoenix Secrets & Assets
set :linked_files, %w{
    config/prod.secret.exs
  }

set :linked_dirs, %w{
    deps
    node_modules
    rel
    _build
    priv/static/css
    priv/static/js
  }


namespace :dependencies do

  # --force is used to try and force the install.
  # If this 'takes too long' try manually first on server as deploy.
  task :phoenix do
    on roles(:app) do |host|
      within(current_path) do
        execute(:mix, "deps.get", "--force")
      end
    end
  end

  task :npm do
    on roles(:app) do |host|
      within(current_path) do
        execute(:npm, "install")
      end
    end
  end

end

task :brunch_assets do
  on roles(:app) do |host|
    within(current_path) do
      execute(:brunch, "build", "--production")
    end
  end
end


namespace :phoenix do

  task :assets do
    on roles(:app) do |host|
      within(current_path) do
        execute(:mix, "phoenix.digest")
      end
    end
  end

  task :release do
    on roles(:app) do |host|
      within(current_path) do
        execute(:mix, "deps.get")
        execute(:mix, "deps.compile")
        # Figure out a check if we need to migrate
        # execute(:mix, "ecto.migrate")
      end
    end
  end

  task :serve do
      on roles(:app) do |host|
          within(current_path) do
            execute(:elixir, "--detached","-S", "mix", "phoenix.server")
          end
      end
  end

end


namespace :deploy do

  after :deploy, "dependencies:phoenix"
  after :deploy, "dependencies:npm"

  after :deploy, :brunch_assets
  after :deploy, 'phoenix:assets'
  after :deploy, 'phoenix:release'
  after 'deploy:publishing', 'phoenix:serve'

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
