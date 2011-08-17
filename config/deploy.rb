$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require "rvm/capistrano"
default_run_options[:pty] = true

set :rvm_ruby_string, 'ree-1.8.7'

require 'capistrano-deploy'
use_recipes :git, :rails, :bundle, :unicorn

server '178.63.38.189', :web, :app, :db, :primary => true
set :user, 'lingapp'
set :deploy_to, '/srv/rortestapp'
set :repository, 'git@github.com:mdyrda/rortestapp.git'

after 'deploy:update', 'bundle:install'
after 'deploy:restart', 'unicorn:stop'
