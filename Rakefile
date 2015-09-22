concurrency = ENV['CONCURRENT'] || 1

desc 'run all tests'
task :test => %w(test:foodcritic test:chefspec test:serverspec) do
  puts 'Tests complete!'
end

namespace :test do
  desc 'run foodcritic lint'
  task :foodcritic do
    sh 'bundle exec foodcritic .'
  end

  desc 'run chefspec tests'
  task :chefspec do
    sh 'bundle exec rspec --color -fd test/unit/chefspec/*_spec.rb'
  end

  desc 'run serverspec tests'
  task :serverspec do
    sh "bundle exec kitchen test -c #{concurrency}"
  end
end

desc 'upload cookbook'
task :upload do
  sh 'bundle exec update_metadata_version'
  sh 'MESSAGE=`git log -1 --pretty=%B` && git add metadata.rb && git commit -m "$MESSAGE" --amend'
  sh 'bundle exec berks update && bundle exec berks upload -e unit'
  sh 'git push --follow-tags'
end

