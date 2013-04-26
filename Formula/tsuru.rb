require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.7.11.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '6e355eb6b97964c442a89a64e8eb49826a2c5fbdbd5db1e441f8530a14e6c265'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/globocom/tsuru/cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/tsuru"
  end
end
