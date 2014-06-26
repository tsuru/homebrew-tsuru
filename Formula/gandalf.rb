require 'formula'

class Gandalf < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/gandalf-0.4.0.tar.gz'
  homepage 'https://github.com/tsuru/gandalf'
  sha256 '73606eb0fcee7ccbe0926b29b2474da7c88678239128f1c100dc56722af3fbd1'
  version '0.4.0'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: tsuru requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o gandalf-server github.com/tsuru/gandalf/webserver"
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o gandalf-wrapper github.com/tsuru/gandalf/bin"
    bin.install "gandalf-server"
    bin.install "gandalf-wrapper"
  end
end
