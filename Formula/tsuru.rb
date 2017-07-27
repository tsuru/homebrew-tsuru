class Tsuru < Formula
  desc ""
  homepage ""
  url "https://github.com/tsuru/tsuru-client/releases/download/1.3.0/tsuru_1.3.0_macOS_amd64.tar.gz"
  version "1.3.0"
  sha256 "12bca17651135f8e959348a4e87c2f346960f3b09e4cf412308409ae4b254b93"

  def install
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion" => "tsuru"
    zsh_completion.install "misc/zsh-completion" => "tsuru"
  end

  test do
    
  end
end
