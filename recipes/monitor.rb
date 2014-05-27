include_recipe 'lbstats::default'

python_pip 'bottle' do
  virtualenv "#{node['lbstats']['home']}/venv"
end

python_pip 'geoip' do
  virtualenv "#{node['lbstats']['home']}/venv"
end

git "#{node['lbstats']['home']}/app" do
  repository 'https://github.com/szelcsanyi/lbstats.git'
  action :sync
  notifies :restart, 'service[lbstats-monitor]', :delayed
end

template '/etc/init.d/lbstats-monitor' do
  source 'etc/init.d/lbstats.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(daemon_path: "#{node['lbstats']['home']}/app",
            daemon: 'monitor.py',
            virtualenv: "#{node['lbstats']['home']}/venv"
  )
  notifies :restart, 'service[lbstats-monitor]', :delayed
end

template "#{node['lbstats']['home']}/app/config.py" do
  source 'app/config.py.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(monitor_http_host: node['lbstats']['monitor_http_host'],
            monitor_http_port: node['lbstats']['monitor_http_port'],
            monitor_data_host: node['lbstats']['monitor_data_host'],
            monitor_data_port: node['lbstats']['monitor_data_port'],
            collector_data_host: node['lbstats']['collector_data_host'],
            collector_data_port: node['lbstats']['collector_data_port'],
            collector_remote_host: node['lbstats']['collector_remote_host'],
            collector_remote_port: node['lbstats']['collector_remote_port'],
            syslog_host: node['lbstats']['syslog_host'],
            syslog_port: node['lbstats']['syslog_port'],
            home: node['lbstats']['home']
  )
  notifies :restart, 'service[lbstats-monitor]', :delayed
end

service 'lbstats-monitor' do
  supports restart: true
  action [:enable, :start]
end
