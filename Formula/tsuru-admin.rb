require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.7.0.tar.gz'
  homepage 'http://tsuru.io'
  sha256 'bd9c770ec22eb8453495ff7b671c6a4cc0a3acb26f4e21dad730f4e8d05262ae'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: tsuru-admin requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/tsuru/tsuru-admin"
    bin.install "tsuru-admin"
    bash_completion.install "src/github.com/tsuru/tsuru-admin/misc/bash-completion" => "tsuru-admin"
  end
end
