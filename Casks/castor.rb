cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "1.0.0"
  sha256 arm:   "bd2b88ee74bf717495309c9d5f32037c04298d7478e79c48a547fcab5b57a286",
         intel: "5672ea0f786349e63eeff430af102631e5d927399205d8a622833364ce817911"

  url "https://github.com/stupside/castor/releases/download/v#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  zap trash: "~/.castor/config.yml"
end
