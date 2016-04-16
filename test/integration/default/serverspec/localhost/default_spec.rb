# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'

describe "Check for default installed Java version" do

  describe "in Debian 8 distribution", :if => (os[:family] == 'debian' && os[:release] == '8.4') do
    describe command('java -version') do
      its(:stderr) { should include 'java version "1.7.0' }
    end
    describe package('openjdk-7-jdk') do
      it { should be_installed }
    end
  end

end

