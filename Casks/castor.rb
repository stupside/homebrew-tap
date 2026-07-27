cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v1.8.1"
  sha256 arm:   "a82503b3ce65e6abfda2f6400b7849778d11708e0fa90bf5b57604c4b9be63b8",
         intel: "3b3243dd56eb1f0ccee4558606e38d28ba01d99b0cb87bd8edfd6943b95d3db3"

  url "https://github.com/stupside/castor/releases/download/#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  # The binary is unsigned, so macOS Gatekeeper quarantines it on download and
  # refuses to run it. Strip the quarantine attribute so it works out of the box.
  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{staged_path}/castor"]
  end

  zap trash: "~/.castor/config.yml"
end
