{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.starship.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Starship prompt.";
  };

  config = lib.mkIf config.starship.enable {
    home.packages = with pkgs; [
      starship
    ];

    programs.starship.settings = pkgs.lib.importTOML (
      builtins.toFile "inline-starship-config" ''
        format = """
        $username\
        $hostname\
        $directory\
        $git_branch\
        $git_state\
        $git_status\
        $cmd_duration\
        $line_break\
        $python\
        $character"""

        [directory]
        style = "blue"

        [character]
        success_symbol = "[❯](purple)"
        error_symbol = "[❯](red)"
        vimcmd_symbol = "[❮](green)"

        [git_branch]
        format = "[$branch]($style)"
        style = "bright-black"

        [git_status]
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)"
        style = "cyan"
        conflicted = "​"
        untracked = "​"
        modified = "​"
        staged = "​"
        renamed = "​"
        deleted = "​"
        stashed = "≡"

        [git_state]
        format = '\([$state( $progress_current/$progress_total)]($style)\) '
        style = "bright-black"

        [cmd_duration]
        format = "[$duration]($style) "
        style = "yellow"

        [python]
        format = "[$virtualenv]($style) "
        style = "bright-black"
      ''
    );
  };
}
