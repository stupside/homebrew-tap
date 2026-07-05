cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "1.2.0"
  sha256 arm:   "aeaf104f6fca11a5a688a7b58b77aea6fb52f313740d746c2d8ef9892f80f53b",
         intel: "52bb9356c756a230a68b2a48f826a54ef14846593db029437b2d6f4c49604669"

  url "https://github.com/stupside/castor/releases/download/v#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  zap trash: "~/.castor/config.yml"
end
