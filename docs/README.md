# Glimx Documentation

Welcome to Glimx documentation! 📚

## What is Glimx?

Glimx is an AI-powered terminal coding agent built on OpenCode's architecture with enhanced features:

- 🆓 **Free AI Models** - Qwen, DeepSeek, Mistral via OpenRouter, Groq, Cerebras
- 🔌 **5 Default MCP Servers** - Filesystem, Git, Sequential Thinking, Fetch, Memory
- 🧠 **Sequential Thinking** - Step-by-step problem solving
- 🔒 **Smart Permissions** - Command validation and approval
- 💾 **Memory System** - Context persistence across sessions

## Quick Links

- [Installation Guide](https://codelabs-poliwangi.github.io/glimx-cli)
- [Free Models Guide](./FREE_MODELS.md)
- [GitHub Repository](https://github.com/codelabs-poliwangi/glimx-cli)

## Installation

### Quick Install
```bash
curl -fsSL https://codelabs-poliwangi.github.io/glimx-cli/install.sh | bash
```

### Package Managers
```bash
npm install -g glimx    # or bun/pnpm/yarn
```

## Getting Started

### 1. Get Free API Keys

- **Groq** (recommended): https://console.groq.com/keys
- **OpenRouter**: https://openrouter.ai/keys
- **Cerebras**: https://cloud.cerebras.ai/console

### 2. Configure Environment

```bash
export GROQ_API_KEY="your-key-here"
export OPENROUTER_API_KEY="your-key-here"
```

### 3. Run Glimx

```bash
# With free model
glimx --model groq/qwen-32b

# Interactive mode
glimx
```

## Features

### MCP Servers (Auto-enabled)

Glimx includes 5 MCP servers by default:

1. **filesystem** - File system access
2. **git** - Git operations
3. **sequential-thinking** - Step-by-step reasoning
4. **fetch** - Web content fetching
5. **memory** - Knowledge graph persistence

### Commands

- `/compact` - Summarize session to reduce tokens
- `/undo` - Undo last message
- `/redo` - Redo last message
- `/help` - Show help

### Permissions

Default permission policy (configurable):

```json
{
  "bash": {
    "git push *": "ask",
    "rm *": "ask",
    "chmod *": "ask",
    "*": "ask"
  },
  "edit": "ask",
  "write": "ask"
}
```

Three levels:
- `allow` - Auto-execute
- `ask` - Require approval
- `deny` - Block

### Workspace Templates

Quick start with pre-configured projects:

- **node-typescript** - Node.js + TypeScript + ESLint
- **react-vite** - React + Vite + TailwindCSS
- **python-fastapi** - FastAPI + Poetry

## Configuration

Edit `~/.opencode/config.json`:

```json
{
  "model": "groq/qwen-32b",
  "theme": "glimx",
  "permission": {
    "bash": {
      "git push *": "ask"
    }
  },
  "mcp": {
    "filesystem": {
      "type": "local",
      "command": ["npx", "-y", "@modelcontextprotocol/server-filesystem", "~"],
      "enabled": true
    }
  }
}
```

## Troubleshooting

### Permission Denied

```bash
# Make sure install script is executable
chmod +x docs/install.sh
```

### API Key Issues

```bash
# Verify keys are set
echo $GROQ_API_KEY
echo $OPENROUTER_API_KEY
```

### Model Not Found

Check available models:
- [Groq Models](https://console.groq.com/docs/models)
- [OpenRouter Models](https://openrouter.ai/models)

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](../CONTRIBUTING.md)

## Support

- 💬 Email: codelabs@poliwangi.ac.id
- 🐛 [GitHub Issues](https://github.com/codelabs-poliwangi/glimx-cli/issues)

## License

MIT License - see [LICENSE](../LICENSE)
