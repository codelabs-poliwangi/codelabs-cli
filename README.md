<div align="center">

# ✨ Glimx CLI

**AI-Powered Terminal Coding Agent**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub Stars](https://img.shields.io/github/stars/codelabs-poliwangi/glimx-cli?style=social)](https://github.com/codelabs-poliwangi/glimx-cli)
[![GitHub Forks](https://img.shields.io/github/forks/codelabs-poliwangi/glimx-cli?style=social)](https://github.com/codelabs-poliwangi/glimx-cli)

[Features](#-features) • [Installation](#-installation) • [Quick Start](#-quick-start) • [Documentation](#-documentation) • [Free Models](#-free-ai-models) • [Contributing](#-contributing)

</div>

---

## 🎯 Overview

**Glimx CLI** is a powerful AI-powered coding agent built for the terminal, based on OpenCode's proven architecture with enhanced features including **free AI models**, **smart permissions**, and **MCP support**.

Perfect for developers who love working in the terminal and want AI assistance without expensive API costs.

---

## ✨ Features

### 🆓 **Free AI Models**
- Works with **Qwen**, **DeepSeek**, **Mistral** via OpenRouter, Groq, and Cerebras
- No paid API required for basic usage
- Support for Claude, GPT-4, Gemini when you want premium models

### 🔌 **5 Default MCP Servers**
Pre-configured and ready to use:
- **Filesystem** - Local file system access
- **Git** - Repository operations and analysis  
- **Sequential Thinking** - Step-by-step problem solving
- **Fetch** - Web content retrieval
- **Memory** - Knowledge graph persistence

### 🧠 **Sequential Thinking**
- AI breaks down complex problems step-by-step
- Transparent reasoning process
- Better solutions through systematic analysis

### 🔒 **Smart Permissions**
- Command validation before execution
- User approval for dangerous operations (git push, rm, chmod)
- Granular permission control per command
- Default "ask" policy for safety

### 💾 **Memory System**
- Persistent knowledge graph across sessions
- AI remembers important facts and decisions
- Context retention for better continuity

### ⚡ **Additional Features**
- `/compact` mode - Summarize long sessions
- LSP support - Language Server Protocol integration
- Workspace templates - Quick project scaffolding
- Custom Glimx theme - Modern terminal aesthetics
- Client/server architecture - Remote control capable

---

## 📦 Installation

### Quick Install (Recommended)

```bash
curl -fsSL https://codelabs-poliwangi.github.io/glimx-cli/install.sh | bash
```

### Package Managers

```bash
# npm
npm install -g glimx

# Bun (fastest)
bun install -g glimx

# pnpm
pnpm install -g glimx

# Yarn
yarn global add glimx
```

### Build from Source

```bash
# Clone repository
git clone https://github.com/codelabs-poliwangi/glimx-cli.git
cd glimx-cli

# Install dependencies
bun install

# Build
cd packages/opencode
bun run build

# Link globally
bun link
```

---

## 🚀 Quick Start

### 1. Get Free API Keys

Choose one or more providers:

- **Groq** (Recommended): https://console.groq.com/keys
  - Free tier: 1,000 requests/day
  - Ultra-fast inference
  
- **OpenRouter**: https://openrouter.ai/keys
  - Free tier: 20 req/min, 50 req/day
  - Access to multiple free models

- **Cerebras**: https://cloud.cerebras.ai/console
  - Free tier available
  - Large model support

### 2. Configure Environment

```bash
# Set your API key(s)
export GROQ_API_KEY="your-groq-key-here"
export OPENROUTER_API_KEY="your-openrouter-key-here"
export CEREBRAS_API_KEY="your-cerebras-key-here"

# Add to your shell profile for persistence
echo 'export GROQ_API_KEY="your-key"' >> ~/.zshrc
```

### 3. Run Glimx

```bash
# Start with free model (recommended)
glimx --model groq/qwen-32b

# Or just run interactive mode
glimx

# Create new project from template
glimx --template react-vite my-app
```

### 4. Basic Commands

```bash
# Inside Glimx session:
/compact          # Summarize session to save tokens
/undo             # Undo last message
/redo             # Redo last message
/help             # Show all commands
```

---

## 🆓 Free AI Models

Glimx supports multiple free AI models for cost-effective development:

### Recommended Free Models

| Model | Provider | Best For | Speed | Context |
|-------|----------|----------|-------|---------|
| **Qwen 3 32B** | Groq | Coding | ⚡⚡⚡ | 32K |
| **DeepSeek Chat V3.1** | OpenRouter | Reasoning | ⚡⚡ | 64K |
| **Llama 3.3 70B** | Groq/Cerebras | General | ⚡⚡⚡ | 128K |
| **Qwen 3 235B** | Cerebras | Complex Tasks | ⚡⚡ | 128K |
| **Mistral Small 3.2** | OpenRouter | Balanced | ⚡⚡ | 32K |

### Configuration Example

Edit `~/.opencode/config.json`:

```json
{
  "model": "groq/qwen-32b",
  "provider": {
    "groq": {
      "api": "https://api.groq.com/openai/v1"
    }
  }
}
```

📖 **Full Guide**: [docs/FREE_MODELS.md](./docs/FREE_MODELS.md)

---

## 🎨 Features Deep Dive

### Smart Permissions

Configure granular permissions in `~/.opencode/config.json`:

```json
{
  "permission": {
    "bash": {
      "git push *": "ask",
      "rm -rf *": "deny",
      "npm install *": "ask",
      "ls *": "allow",
      "*": "ask"
    },
    "edit": "ask",
    "write": "ask"
  }
}
```

**Permission Levels:**
- `allow` - Auto-execute without asking
- `ask` - Require user approval (default)
- `deny` - Block completely

### MCP Configuration

Customize MCP servers in `~/.opencode/config.json`:

```json
{
  "mcp": {
    "filesystem": {
      "type": "local",
      "command": ["npx", "-y", "@modelcontextprotocol/server-filesystem", "~"],
      "enabled": true
    },
    "sequential-thinking": {
      "type": "local",
      "command": ["uvx", "mcp-server-sequential-thinking"],
      "enabled": true
    }
  }
}
```

### Workspace Templates

Quick start with pre-configured projects:

```bash
# Node.js + TypeScript
glimx --template node-typescript my-project

# React + Vite + TailwindCSS
glimx --template react-vite my-app

# Python + FastAPI
glimx --template python-fastapi my-api
```

**Available Templates:**
- `node-typescript` - Modern Node.js with ESLint & Prettier
- `react-vite` - React + TypeScript + TailwindCSS
- `python-fastapi` - FastAPI + Poetry + uvicorn

---

## 📚 Documentation

- [Installation Guide](https://codelabs-poliwangi.github.io/glimx-cli)
- [Free Models Guide](./docs/FREE_MODELS.md)
- [Configuration Reference](./docs/README.md)
- [MCP Servers](./docs/README.md#mcp-servers-auto-enabled)
- [Permissions System](./docs/README.md#permissions)

---

## 🛠️ Configuration

### Default Config Location

- macOS/Linux: `~/.opencode/config.json`
- Windows: `%USERPROFILE%\.opencode\config.json`

### Example Configuration

```json
{
  "model": "groq/qwen-32b",
  "theme": "glimx",
  "permission": {
    "bash": {
      "git push *": "ask",
      "rm *": "ask",
      "*": "ask"
    },
    "edit": "ask",
    "write": "ask"
  },
  "mcp": {
    "filesystem": { "enabled": true },
    "git": { "enabled": true },
    "sequential-thinking": { "enabled": true },
    "fetch": { "enabled": true },
    "memory": { "enabled": true }
  }
}
```

---

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

### Development Setup

```bash
# Clone repo
git clone https://github.com/codelabs-poliwangi/glimx-cli.git
cd glimx-cli

# Install dependencies
bun install

# Run in development mode
cd packages/opencode
bun run dev

# Run tests
bun test

# Build
bun run build
```

---

## 📊 Comparison

### Glimx vs OpenCode

| Feature | Glimx | OpenCode |
|---------|-------|----------|
| Free Models Support | ✅ Built-in | ⚠️ Manual |
| Default MCP Servers | ✅ 5 servers | ❌ None |
| Smart Permissions | ✅ Default safe | ⚠️ Manual setup |
| Sequential Thinking | ✅ Included | ❌ External |
| Memory System | ✅ Auto-enabled | ❌ External |
| Custom Theme | ✅ Glimx theme | ⚠️ Generic |
| Documentation | ✅ Free models guide | ⚠️ Basic |

---

## 🐛 Troubleshooting

### Common Issues

**Q: "API key not found"**
```bash
# Verify key is set
echo $GROQ_API_KEY

# Set permanently
echo 'export GROQ_API_KEY="your-key"' >> ~/.zshrc
source ~/.zshrc
```

**Q: "Permission denied" errors**
```bash
# Check permission config
cat ~/.opencode/config.json

# Reset to defaults
rm ~/.opencode/config.json
```

**Q: "MCP server failed to start"**
```bash
# Check if uvx/npx available
which uvx
which npx

# Install uv for Python MCP servers
curl -LsSf https://astral.sh/uv/install.sh | sh
```

---

## 📜 License

MIT License - see [LICENSE](./LICENSE) for details.

Based on [OpenCode](https://github.com/sst/opencode) with significant enhancements.

---

## 🌟 Acknowledgments

- Built on [OpenCode's](https://github.com/sst/opencode) proven architecture
- Powered by [Model Context Protocol (MCP)](https://modelcontextprotocol.io/)
- Uses [Bun](https://bun.sh) for ultra-fast runtime
- UI powered by [OpenTUI](https://github.com/opentui/opentui)

---

## 💬 Community & Support

- 🐛 [GitHub Issues](https://github.com/codelabs-poliwangi/glimx-cli/issues)
- 💬 [Discussions](https://github.com/codelabs-poliwangi/glimx-cli/discussions)
- 📧 Email: codelabs@poliwangi.ac.id

---

## 🗺️ Roadmap

- [ ] Cloud sync for settings & sessions
- [ ] Plugin marketplace
- [ ] Mobile companion app
- [ ] VS Code extension
- [ ] Docker container support
- [ ] Auto-update mechanism
- [ ] Telemetry dashboard
- [ ] Multi-language support

---

<div align="center">

**Built with 💜 by CodeLabs Poliwangi**

[⭐ Star us on GitHub](https://github.com/codelabs-poliwangi/glimx-cli) • [🐛 Report Bug](https://github.com/codelabs-poliwangi/glimx-cli/issues) • [✨ Request Feature](https://github.com/codelabs-poliwangi/glimx-cli/issues)

</div>
