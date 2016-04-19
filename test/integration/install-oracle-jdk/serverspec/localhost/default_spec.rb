# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'

describe "Check for system Java version" do

  describe "in Debian 8 distribution", :if => (os[:family] == 'debian' && os[:release] == '8.4') do
    describe package('oracle-java7-installer') do
      it { should be_installed }
    end
    describe file('/etc/apt/sources.list.d/ppa_launchpad_net_webupd8team_java_ubuntu.list') do
      it { should exist }
      it { should be_file }
      its(:content) { should match /^deb http:\/\/ppa\.launchpad\.net\/webupd8team\/java\/ubuntu trusty main/ }
    end
    describe command('java -version') do
      its(:stderr) { should include 'java version "1.7.0' }
    end
  end

  describe "in CentOS 7 distribution", :if => (os[:family] == 'redhat' && os[:release].start_with?('7.2')) do
    describe package('jdk-1.7.0_79') do
      it { should be_installed }
    end
    describe command('java -version') do
      its(:stderr) { should include 'java version "1.7.0' }
    end
  end
end

