#!/bin/bash --login

rvm use 1.8.7@$$ --create
bundle install
rm -rf puppetlabs_spec_helper/
git clone https://github.com/puppetlabs/puppetlabs_spec_helper.git
cd puppetlabs_spec_helper
rake package:gem
gem install pkg/puppetlabs_spec_helper-*.gem
gem uninstall puppetlabs_spec_helper --version=0.4.1
cd ../;rake spec
RESULT=$?
rvm --force gemset delete 1.8.7@$$
exit $RESULT
