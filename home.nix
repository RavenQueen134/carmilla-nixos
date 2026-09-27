{ config, inputs, pkgs, ... }: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.stateVersion = "26.05";

  programs.alacritty.enable = true;

  programs.fuzzel.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "RavenQueen134";
        email = "184346456+RavenQueen134@users.noreply.github.com";
      };
      init.defaultBranch = "main";
    };
  };

  programs.libreoffice = {
    enable = true;
    settings = {
      # libreOffice config
    };
  };

  programs.niri = {
    settings = {
      spawn-at-startup = [
        { command = [ "noctalia" ]; }
      ];
      environment = {
        NIXOS_OZONE_WL = "1";
      };
      binds = with config.lib.niri.actions; {
        "Mod+T" = {
          action = spawn "alacritty";
          repeat = false;
        };
        "Mod+D" = {
          action = spawn "fuzzel";
          repeat = false;
        };
        "Mod+Shift+E" = {
          action = quit;
          repeat = false;
        };
      };
    };
  };

  programs.noctalia = {
    enable = true;
    settings = {
      theme = {
        mode = "dark";
        source = "community";
        builtin = "Noctalia";
        community_palette = "Occult Umbral";
      };
      wallpaper = {
        enabled = true;
        fill_mode = "crop";
      };
      wallpaper.default = {
        path = "~/Pictures/anatomy_of_an_arm.jpg";
      };
    };
  };

  programs.vscodium = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        dracula-theme.theme-dracula
        yzhang.markdown-all-in-one
      ];
      userSettings = {
        "security.workspace.trust.enabled" = true;
        "security.workspace.trust.startupPrompt" = "once";
      };
    };
  };

  home.packages = with pkgs; [
    firefox
    fastfetch
  ];
}
