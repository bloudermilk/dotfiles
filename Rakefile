SKIP_FILES = %W[ README.md Rakefile ]

task :default => :install

task :install do
  Dir.foreach(".") do |file|
    unless SKIP_FILES.include?(file) || file.start_with?(".")
      file_with_path = File.expand_path(file)
      `ln -s -f #{file_with_path} ~/.#{file}`
    end
  end
end
