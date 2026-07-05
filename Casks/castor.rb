cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "1.1.0"
  sha256 arm:   "4b678c918da167312edc8744bd3e3e21f4d46faef5d3ae3ac010407ffdba0881",
         intel: "80b4790b05ba98239db51bc635725e28fbd85f8aaca135d306cef2556f1d1b69"

  url "https://github.com/stupside/castor/releases/download/v#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  zap trash: "~/.castor/config.yml"
end
