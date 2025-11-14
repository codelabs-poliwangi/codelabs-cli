import { Installation } from "@/installation"
import { TextAttributes } from "@opentui/core"
import { For } from "solid-js"
import { useTheme } from "@tui/context/theme"

const LOGO = [
  "  ██████  ██      ██ ███    ███ ██   ██",
  " ██       ██      ██ ████  ████  ██ ██ ",
  " ██   ███ ██      ██ ██ ████ ██   ███  ",
  " ██    ██ ██      ██ ██  ██  ██  ██ ██ ",
  "  ██████  ███████ ██ ██      ██ ██   ██"
]

export function Logo() {
  const { theme } = useTheme()
  return (
    <box>
      <For each={LOGO}>
        {(line, index) => (
          <box flexDirection="row">
            <text 
              fg={index() === 2 ? theme.accent : theme.primary} 
              attributes={TextAttributes.BOLD}
            >
              {line}
            </text>
          </box>
        )}
      </For>
      <box flexDirection="row" justifyContent="center" marginTop={1}>
        <text fg={theme.textMuted}>AI-Powered Terminal Coding Agent</text>
      </box>
      <box flexDirection="row" justifyContent="center">
        <text fg={theme.textMuted}>v{Installation.VERSION}</text>
      </box>
    </box>
  )
}
