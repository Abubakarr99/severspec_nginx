require "serverspec"
require "docker"

describe "Docker NGINX image" do
  before(:all) do
    @image = Docker::Image.build_from_dir('.')
    @container = @image.run()

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, @image.id
    set :docker_container, @container.id
  end
  def debian_version
    command("cat /etc/debian_version").stdout
  end
  it "installs Debian Jessie" do
    expect(debian_version).to include("11.")
  end
  describe package('nginx') do
    it { should be_installed }
   end
  describe process("apache2") do
      it { should be_running }
  end
  after(:all) do
     @container.kill
     @container.delete(:force => true)
  end
end

