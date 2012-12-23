SKIP_FILES = %W[ README.md Rakefile ]

task :default => :install

task :install do
  Dir.foreach(".") do |file|
    unless SKIP_FILES.include?(file) || file.start_with?(".")
      source = File.join(Dir.pwd, file)
      destination = File.join(ENV["HOME"], ".#{file}")
      rm_rf destination
      ln_s source, destination
    end
  end
end
