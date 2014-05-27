%w( python-dev libgeoip-dev git-core ).each do |pkg|
  package pkg do
    action :install
  end
end

directory node['lbstats']['home'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

%w( /log /var /app /venv ).each do |dir|
  directory node['lbstats']['home'] + dir do
    owner 'nobody'
    group 'nogroup'
    mode '0755'
    action :create
  end
end

python_virtualenv "#{node['lbstats']['home']}/venv" do
  action :create
end

python_pip 'python-daemon' do
  virtualenv "#{node['lbstats']['home']}/venv"
end
