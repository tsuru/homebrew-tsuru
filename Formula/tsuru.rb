require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.7.5.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '15c0b09ae838c59375a53b29e96d05ae7bc85a3dd85e804c9db933b31b639b93'

  depends_on 'go'

  def install
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/globocom/tsuru/cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/tsuru"
  end
end
