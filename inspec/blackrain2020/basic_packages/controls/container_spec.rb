title 'basic_packages'

control "containers" do

  title "Amun container"
  desc "The Amun container should be installed"

  describe docker_container(name: 'amun') do
     it { should exist }
     it { should be_running }
  end

end
