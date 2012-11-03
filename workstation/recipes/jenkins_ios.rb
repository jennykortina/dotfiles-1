# 
# http://blog.shinetech.com/2011/06/23/ci-with-jenkins-for-ios-apps-build-distribution-via-testflightapp-tutorial/

brew_install "jenkins"
directory "#{WS_HOME}/.jenkins/plugins" do
  action :create
  owner WS_USER
  group "staff"
  mode "0700"
  recursive true
end


# xcode-plugin depends on token-macro
local_path = "#{WS_HOME}/.jenkins/plugins/token-macro.hpi"
remote_file local_path do
    user WS_USER
    source "http://updates.jenkins-ci.org/download/plugins/token-macro/1.5.1/token-macro.hpi"
    not_if "test -e #{local_path}"
end

# xcode plugin
local_path = "#{WS_HOME}/.jenkins/plugins/xcode-plugin.hpi"
remote_file local_path do
    user WS_USER
    source "http://updates.jenkins-ci.org/download/plugins/xcode-plugin/1.3.1/xcode-plugin.hpi"
    not_if "test -e #{local_path}"
end

# git plugin
local_path = "#{WS_HOME}/.jenkins/plugins/git.hpi"
remote_file local_path do
    user WS_USER
    source "http://updates.jenkins-ci.org/download/plugins/git/1.1.23/git.hpi"
    not_if "test -e #{local_path}"
end
