require 'formula'

class Tsuru < Formula
  url "https://s3.amazonaws.com/tsuru/tsuru-1.1.1.tar.gz"
  homepage "https://tsuru.io"
  sha256 "389e94f06c8cc58f9eae310791d1663a4bb43ee74011d0198d432378e087d2db"

  depends_on 'go'

  def install
    system "bash", "-c", "test -n \"$(go version | awk '{print \$3}' | perl -ne 'print if /go1\.[0-4](\.[0-9]+)?$/')\" && echo ERROR: tsuru requires Go 1.5 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/tsuru/tsuru-client/tsuru"
    ENV['TSURU_PATH'] = "./tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/tsuru/tsuru-client/misc/bash-completion" => "tsuru"
    zsh_completion.install "src/github.com/tsuru/tsuru-client/misc/zsh-completion" => "tsuru"
  end
end
