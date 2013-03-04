require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.3.1.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '4f20c1cb3ce5df7a0d89142bd41baed57d1c327db2fc9a7d2acd157998997e4b'

  depends_on 'go'

  def install
    system "go", "build", "-o", "crane", "./cmd/crane"
    bin.install "crane"
    bash_completion.install "misc/bash-completion.d/crane"
  end
end
