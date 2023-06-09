# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Onboardbasekit < Formula
  desc ""
  homepage "https://github.com/Onboardbase/onboardbasekit"
  version "0.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Onboardbase/onboardbasekit/releases/download/v0.0.2/onboardbasekit_Darwin_arm64.tar.gz"
      sha256 "c46494923b3d2eb2d97073af7958959d2587fd347d0955b17f01edaa127b4ecc"

      def install
        bin.install "onboardbasekit"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/Onboardbase/onboardbasekit/releases/download/v0.0.2/onboardbasekit_Darwin_x86_64.tar.gz"
      sha256 "2ed1564920590d7cd0f35f25e1b83f10a88bb9da07a8bfba023f1ffa4e1e8dd1"

      def install
        bin.install "onboardbasekit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Onboardbase/onboardbasekit/releases/download/v0.0.2/onboardbasekit_Linux_x86_64.tar.gz"
      sha256 "3483300b479e2d4b564a3daeb81d3e438d543e9a45d736d49f9062e688d3ce6c"

      def install
        bin.install "onboardbasekit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Onboardbase/onboardbasekit/releases/download/v0.0.2/onboardbasekit_Linux_arm64.tar.gz"
      sha256 "4d56ca1553bee21bec2ebd84c6fb4e8eeaf9f3320834d7833e82f80e0f8dcb4a"

      def install
        bin.install "onboardbasekit"
      end
    end
  end
end
