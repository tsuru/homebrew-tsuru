# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  version "1.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.16.0/tsuru_1.16.0_macOS_arm64.tar.gz"
      sha256 "791d08b957a7e3d6238dfc70df8896a91a6fe6447c4bd28a70cd5ac73e5624e5"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.16.0/tsuru_1.16.0_macOS_amd64.tar.gz"
      sha256 "77f076847125ba3fe0e7212b916ec2022d3e6acacb0e6f4dbfb994b99e82f2fd"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.16.0/tsuru_1.16.0_linux_amd64.tar.gz"
      sha256 "25a6eaaf39b6da0e64f946974f1171dfe0095782f980ac85485328bc3c577212"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.16.0/tsuru_1.16.0_linux_arm64.tar.gz"
      sha256 "d559d8a028e7a0d3e74a7c9d0472559211e69612399614fd83b1a7af0dea31c1"

      def install
        bin.install "tsuru"
        bash_completion.install "misc/bash-completion" => "tsuru"
        zsh_completion.install "misc/zsh-completion" => "tsuru"
      end
    end
  end
end
