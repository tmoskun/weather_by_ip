#!/usr/bin/env rake
require "bundler/gem_tasks"

desc 'Run tests'
    task :test do
      result = system("ruby -Ilib -Itest -e 'ARGV.take(ARGV.size-1).each { |f| load f }' test/unit/* '#{File.read('test/data/keys/ipinfodb_key.txt') rescue ENV['API_KEY']}'")
      exit(result ? 0 : 1)
    end
    
    task :ci => [:test]
    task :default => [:test]
    
    namespace :pre_commit do
      desc "run the tests"
      task :ci => [:test]
end
