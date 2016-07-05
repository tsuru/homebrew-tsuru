require 'formula'

class Tsuru < Formula
  url "https://s3.amazonaws.com/tsuru/tsuru-1.0.1.tar.gz"
  homepage "https://tsuru.io"
  sha256 "ca246f280c010f43ff816ee4a41df0c4e90eb555639d52d4c7ed5760a5a49069"

  depends_on 'go'

  def install
    system "bash", "-c", "test -n \"$(go version | awk '{print \$3}' | perl -ne 'print if /go1\.[0-4](\.[0-9]+)?$/')\" && echo ERROR: tsuru requires Go 1.5 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/tsuru/tsuru-client/tsuru"
    ENV['TSURU_PATH'] = "./tsuru"
    bin.install "tsuru"
    unless ENV.key?('TSURU_DEVEL')
      system "python", "src/github.com/tsuru/tsuru-client/docs/source/exts/man_pages.py"
      man8.install "src/github.com/tsuru/tsuru-client/docs/source/exts/tsuru.8"
    end
    bash_completion.install "src/github.com/tsuru/tsuru-client/misc/bash-completion" => "tsuru"
    zsh_completion.install "src/github.com/tsuru/tsuru-client/misc/zsh-completion" => "tsuru"
  end
end
