recipe 'emacs-git-snapshot' do
  git 'https://git.savannah.gnu.org/r/emacs.git'

  osx do
    option '--with-modules'
    option '--with-ns'
    option '--without-x'
    option '--without-dbus'
  end

  linux do
    option '--with-modules'
    option '--prefix', installation_path
    option '--without-gif'
  end

  install do
    autogen
    configure
    make 'bootstrap'
    make 'install'

    osx do
      copy File.join(build_path, 'nextstep', 'Emacs.app'), installation_path
    end
  end
end
