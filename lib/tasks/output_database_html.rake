# rubocop:disable all
namespace :dev do
  desc 'Output database schema to html'
  task :output_schema_define do
    code = File.open('lib/schema_output.rb').read
    code += File.open('db/schema.rb').read
    $stdout = File.open('tmp/db_schema.html', 'w')
    eval(code)
    $stdout = STDOUT
  end
end
