require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.4.3.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'ce4d9f0c7f9618f95c0681e7ae38fe0d3aa57b154316e754d6583719456f7d54'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: tsuru-admin requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/tsuru/tsuru-admin"
    bin.install "tsuru-admin"
    bash_completion.install "src/github.com/tsuru/tsuru-admin/misc/bash-completion" => "tsuru-admin"
  end
end
