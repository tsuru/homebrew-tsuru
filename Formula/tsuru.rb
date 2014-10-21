require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.13.0.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '22241143f096d6d85d2928dd37e96d763e1fa292e1100637c1e996401f3cdfa7'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: tsuru requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/tsuru/tsuru-client/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/tsuru/tsuru-client/misc/bash-completion" => "tsuru"
  end
end
