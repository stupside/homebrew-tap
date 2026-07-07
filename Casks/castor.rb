cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "1.3.0"
  sha256 arm:   "dcbbe3d1f295a2bf384381a9efda440890c8cc222d5dbd4963598f2396dc55da",
         intel: "6f543b42043a3e154cec74d87b796bb89a433514f1781cf1b9acf7d998a8a88c"

  url "https://github.com/stupside/castor/releases/download/v#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  zap trash: "~/.castor/config.yml"
end
