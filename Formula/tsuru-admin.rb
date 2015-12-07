require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.11.1.tar.gz'
  homepage 'https://tsuru.io'
  sha256 '35313f12f92378f29ff6680c1b83881e865a7f3b910882da95911bba7b1234cf'

  depends_on 'go'

  devel do
    url "https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.12.0.tar.gz"
    sha256 "7e7a31eb0ba2a9aa3def2e2be0a4ca4a7e5cfe45c027f608809412e2334afaf2"
  end

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 14 && echo ERROR: tsuru-admin requires Go 1.4 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/tsuru/tsuru-admin"
    bin.install "tsuru-admin"
    bash_completion.install "src/github.com/tsuru/tsuru-admin/misc/bash-completion" => "tsuru-admin"
    zsh_completion.install "src/github.com/tsuru/tsuru-admin/misc/zsh-completion" => "tsuru-admin"
  end
end
