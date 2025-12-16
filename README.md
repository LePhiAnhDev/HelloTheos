# HelloTheos - Swift iOS App

A simple iOS app built with Swift and Theos, demonstrating automatic CI/CD builds.

## Features

- 🎯 Simple tap counter interface
- 🎨 Animated button interactions
- 🌈 Color-changing background
- 📱 iOS 14.0+ support
- 🚀 Built with Theos & Swift

## Building Locally

### Prerequisites

- macOS with Xcode installed
- Theos installed
- iOS SDK

### Build Steps

```bash
# Install dependencies (if needed)
brew install ldid-procursus make

# Clone and setup Theos
git clone --recursive https://github.com/theos/theos.git ~/theos
export THEOS=~/theos

# Build the app
gmake clean package
```

## Installation

### Method 1: DEB Package (Jailbroken)
1. Download the `.deb` file from [Releases](../../releases)
2. Install using your package manager

### Method 2: IPA Sideloading
1. Download the `.ipa` file from [Releases](../../releases)
2. Install using AltStore or similar tools

## CI/CD

This project uses GitHub Actions for automatic building:
- ✅ Builds on every push to main/master
- ✅ Creates releases on version tags
- ✅ Generates both DEB and IPA files

## Project Structure

```
HelloTheos/
├── Sources/              # Swift source files
├── Resources/            # App resources (Info.plist, icons)
├── Makefile             # Theos build configuration
├── control              # Package metadata
└── .github/workflows/   # CI/CD configuration
```

## Development

### Adding New Features

1. Edit Swift files in `Sources/`
2. Update `Info.plist` if needed
3. Rebuild: `gmake clean package`

### Creating a Release

```bash
git tag v1.0.0
git push origin v1.0.0
```

The CI will automatically build and create a GitHub release.

## License

MIT License - feel free to use and modify!

## Credits

Built with ❤️ using Theos framework