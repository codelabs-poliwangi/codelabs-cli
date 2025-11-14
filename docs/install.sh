#!/bin/bash
set -e

# Glimx Installer
# Quick install script for Glimx CLI

echo "🚀 Installing Glimx..."

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

if [ "$MACHINE" = "UNKNOWN:${OS}" ]; then
    echo "❌ Unsupported operating system: ${OS}"
    exit 1
fi

# Check for Bun
if command -v bun &> /dev/null; then
    echo "✅ Bun detected"
    bun install -g glimx
    echo "✨ Glimx installed successfully via Bun!"
# Check for npm
elif command -v npm &> /dev/null; then
    echo "✅ npm detected"
    npm install -g glimx
    echo "✨ Glimx installed successfully via npm!"
# Check for pnpm
elif command -v pnpm &> /dev/null; then
    echo "✅ pnpm detected"
    pnpm install -g glimx
    echo "✨ Glimx installed successfully via pnpm!"
# Check for yarn
elif command -v yarn &> /dev/null; then
    echo "✅ Yarn detected"
    yarn global add glimx
    echo "✨ Glimx installed successfully via Yarn!"
else
    echo "❌ No package manager found (Bun, npm, pnpm, or yarn required)"
    echo ""
    echo "Please install one of the following:"
    echo "  • Bun:  curl -fsSL https://bun.sh/install | bash"
    echo "  • Node.js/npm: https://nodejs.org"
    exit 1
fi

echo ""
echo "🎉 Installation complete!"
echo ""
echo "📚 Quick start:"
echo "  1. Get free API keys:"
echo "     • Groq: https://console.groq.com/keys"
echo "     • OpenRouter: https://openrouter.ai/keys"
echo ""
echo "  2. Set your API key:"
echo "     export GROQ_API_KEY='your-key-here'"
echo ""
echo "  3. Run Glimx:"
echo "     glimx --model groq/qwen-32b"
echo ""
echo "📖 Documentation: https://github.com/codelabs-poliwangi/glimx-cli"
echo "💬 Support: codelabs@poliwangi.ac.id"
