{specialArgs, ...}: {
  home.file.".claude/settings.json".source = "${specialArgs.dotfiles}/claude/settings.json";
  home.file.".claude/CLAUDE.md".source = "${specialArgs.dotfiles}/claude/CLAUDE.md";
  home.file.".claude/output-styles/plainspoken.md".source = "${specialArgs.dotfiles}/claude/output-styles/plainspoken.md";
  home.file.".claude/skills/review-changes".source = "${specialArgs.dotfiles}/claude/skills/review-changes";
  home.file.".claude/skills/grill-me".source = "${specialArgs.dotfiles}/claude/skills/grill-me";
}
