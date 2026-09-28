cask "castor" do
  arch arm: "arm64", intel: "amd64"

  version "v1.9.0"
  sha256 arm:   "13e1685fff7e36798701c336d0bf50e5e2bfd7660f5b2e5f893e667e3ae4cd69",
         intel: "90cd764c9909e8c9000459aeef6205b0791147e9f95a7c402845d7721e35871b"

  url "https://github.com/stupside/castor/releases/download/#{version}/castor_#{version}_darwin_#{arch}.tar.gz"
  name "castor"
  desc "Cast video streams to networked devices"
  homepage "https://github.com/stupside/castor"

  binary "castor"

  # The binary is unsigned, so macOS Gatekeeper quarantines it on download and
  # refuses to run it. Strip the quarantine attribute so it works out of the box.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{staged_path}}/castor"]
  end

  zap trash: "~/.castor/config.yml"
end
