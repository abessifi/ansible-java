# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'

describe "Check for system Java version" do

  describe "in Debian 8 distribution", :if => (os[:family] == 'debian' && os[:release] == '8.4') do
    describe package('openjdk-7-jdk') do
      it { should be_installed }
    end
    describe package('openjdk-8-jdk') do
      it { should be_installed }
    end
    describe file('/etc/apt/sources.list.d/http_debian_net_debian.list') do
      it { should exist }
      it { should be_file }
      its(:content) { should match /^deb http:\/\/http\.debian\.net\/debian jessie-backports main/ }
    end
    describe command('java -version') do
      its(:stderr) { should include 'openjdk version "1.8.0_72' }
    end
  end

end

