recipe 'emacs-26.1' do
  tar_gz 'https://ftpmirror.gnu.org/emacs/emacs-26.1.tar.gz'

  osx do
    option '--with-modules'
    option '--with-ns'
    option '--without-x'
    option '--without-dbus'
    option '--without-makeinfo'
  end

  linux do
    option '--with-modules'
    option '--prefix', installation_path
    option '--without-gif'
    option '--without-makeinfo'
  end

  install do
    configure
    make 'install'

    osx do
      copy File.join(build_path, 'nextstep', 'Emacs.app'), installation_path
    end
  end
end
