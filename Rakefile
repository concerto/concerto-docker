namespace "test" do
  task :build do |t|
    system "docker build -t concerto-test #{Dir.pwd}/test"
  end

  task :run => [:build] do |t|
    system "docker run -v #{Dir.pwd}/artifacts/coverage:/concerto/rails-root/doc/coverage:rw concerto-test"
  end
end

namespace "docker" do
  task :build do |t|
    system "docker build -t concerto #{Dir.pwd}"
  end
  
  task :run => [:build] do |t|
    system "docker run -v #{Dir.pwd}/config:/opt/concerto/config:rw concerto"
  end
end