require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.4.2.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'a6a468e811b67be964efc2e6989e3fb7da6011f21990d4e75c92fa3eef554aad'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: tsuru-admin requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/tsuru/tsuru/cmd/tsuru-admin"
    bin.install "tsuru-admin"
  end
end
