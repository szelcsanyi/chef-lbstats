maintainer       'Gabor Szelcsanyi'
maintainer_email 'szelcsanyi.gabor@gmail.com'
license          'MIT'
description      'Installs/Configures lbstats'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
name             'lbstats'
version          '1.0.0'

depends          'python'

%w( ubuntu debian ).each do |os|
  supports os
end
