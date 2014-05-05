require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.9.0.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '85cf0e1f1f57ce1001a5a0a133bdaf02e9f3586fb7496d1ea6929cf1664ec4c1'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: tsuru requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/tsuru/tsuru/cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/tsuru/tsuru/misc/bash-completion.d/tsuru"
  end
end
