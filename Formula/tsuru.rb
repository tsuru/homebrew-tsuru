class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
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
  devel do
    url "https://github.com/tsuru/tsuru-client/releases/download/1.4.0-rc1/tsuru_1.4.0-rc1_macOS_amd64.tar.gz"
    version "1.4.0-rc1"
    sha256 "802cbe090ec7786e43657b2381ccc07abea7bc4b817b8655ff4f2867bd36e48d"
    ENV['TSURU_DEVEL'] = "true"
  end
end
