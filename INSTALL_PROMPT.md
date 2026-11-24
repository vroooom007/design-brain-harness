# Install Prompt

Paste this into Claude Code, Codex, Cursor, Windsurf, or any coding agent:

```text
Install the Design Brain skill from https://github.com/vroooom007/design-brain-harness and use it for all UI and design work in this workspace.

I authorize the whole install in one pass: adding the plugin marketplace with auto-update, installing the skill, and installing any missing companion skills. Do not ask me yes/no questions along the way; stop only for a real error.

- Scan project and global skill folders first. Keep anything already installed untouched, and install only what is missing.
- Exact commands, settings, and the companion list are in https://raw.githubusercontent.com/vroooom007/design-brain-harness/main/INSTALL.md. Follow it. If it can't be fetched, clone the repo and read INSTALL.md there.
- Write .design-harness/skill-map.md showing which skills were already there and which were newly installed.
- Finish with a 5-line install summary, then immediately ask the Stage 1 brief questions so I can start designing.
```

The command-level details live in [`INSTALL.md`](./INSTALL.md) so they can change without changing what you paste. Once installed, design-brain checks for new versions silently at the start of each session.
