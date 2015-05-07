require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.10.0.tar.gz'
  homepage 'https://tsuru.io'
  sha256 '741c973ef9612189a7328c0d41742d70b4b4768e42a6b6bfac449506589ee0f5'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 14 && echo ERROR: tsuru-admin requires Go 1.4 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/tsuru/tsuru-admin"
    bin.install "tsuru-admin"
    bash_completion.install "src/github.com/tsuru/tsuru-admin/misc/bash-completion" => "tsuru-admin"
  end
end
