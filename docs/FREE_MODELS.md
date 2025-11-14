# Glimx Free Model Providers

This document lists free AI model providers that can be used with Glimx.

## Configuration

Add these to your `~/.opencode/config.json` or project's `.opencode/opencode.jsonc`:

```jsonc
{
  "provider": {
    "openrouter": {
      "api": "https://openrouter.ai/api/v1",
      "models": {
        "qwen-3-32b-free": {
          "id": "qwen/qwen3-32b:free",
          "cost": { "input": 0, "output": 0 },
          "limit": { "context": 32768, "output": 8192 }
        },
        "deepseek-chat-free": {
          "id": "deepseek/deepseek-chat-v3.1:free",
          "cost": { "input": 0, "output": 0 },
          "limit": { "context": 64000, "output": 8000 }
        },
        "mistral-small-free": {
          "id": "mistralai/mistral-small-3.2-24b-instruct:free",
          "cost": { "input": 0, "output": 0 },
          "limit": { "context": 32768, "output": 8192 }
        }
      }
    },
    "groq": {
      "api": "https://api.groq.com/openai/v1",
      "models": {
        "qwen-32b": {
          "id": "qwen/qwen3-32b",
          "cost": { "input": 0, "output": 0 },
          "limit": { "context": 32768, "output": 8192 }
        },
        "llama-3.3-70b": {
          "id": "llama-3.3-70b-versatile",
          "cost": { "input": 0, "output": 0 },
          "limit": { "context": 128000, "output": 32768 }
        }
      }
    },
    "cerebras": {
      "api": "https://api.cerebras.ai/v1",
      "models": {
        "qwen-235b": {
          "id": "qwen/qwen3-235b-a22b-instruct",
          "cost": { "input": 0, "output": 0 },
          "limit": { "context": 128000, "output": 8192 }
        },
        "llama-3.3-70b": {
          "id": "llama3.3-70b",
          "cost": { "input": 0, "output": 0 },
          "limit": { "context": 128000, "output": 8192 }
        }
      }
    }
  }
}
```

## API Keys

Get your free API keys from:

- **OpenRouter**: https://openrouter.ai/keys (Free tier: 20 req/min)
- **Groq**: https://console.groq.com/keys (Free tier: 1000 req/day)
- **Cerebras**: https://cloud.cerebras.ai/console (Free tier available)

Set them in your environment:
```bash
export OPENROUTER_API_KEY="your-key-here"
export GROQ_API_KEY="your-key-here"
export CEREBRAS_API_KEY="your-key-here"
```

## Recommended Free Models

### For Coding (Best Performance)
1. **Qwen 3 32B** (Groq/OpenRouter) - Fast, excellent code generation
2. **DeepSeek Chat V3.1** (OpenRouter) - Strong reasoning, code-focused
3. **Llama 3.3 70B** (Groq/Cerebras) - General purpose, very capable

### For Thinking/Reasoning
1. **Qwen 3 235B** (Cerebras) - Massive context, deep thinking
2. **DeepSeek R1** (OpenRouter) - Reasoning-focused architecture

### For Speed
1. **Groq** - Ultra-fast inference (>500 tokens/sec)
2. **Cerebras** - Fast with large models

## Usage

```bash
# Use specific model
glimx --model groq/qwen-32b

# Or set default in config
{
  "model": "groq/qwen-32b"
}
```

## Rate Limits

| Provider | Free Tier Limits |
|----------|-----------------|
| OpenRouter | 20 req/min, 50 req/day |
| Groq | 1000 req/day, 6000 tokens/min |
| Cerebras | 30 req/min, 64K tokens/min |

## Notes

- All providers require API keys (free to obtain)
- Free tiers have rate limits but are generous for personal use
- Models update frequently - check provider docs for latest
