/*
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * ▗▖ ▗▖ ▗▄▖▗▄▄▄▖▗▖ ▗▖▗▖  ▗▖▗▄▄▖    ▗▄▄▄  ▗▄▖▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖   ▗▄▄▄▖ ▗▄▄▖
 * ▐▌▗▞▘▐▌ ▐▌ █  ▐▌ ▐▌ ▝▚▞▘▐▌       ▐▌  █▐▌ ▐▌ █  ▐▌     █  ▐▌   ▐▌   ▐▌
 * ▐▛▚▖ ▐▛▀▜▌ █  ▐▛▀▜▌  ▐▌  ▝▀▚▖    ▐▌  █▐▌ ▐▌ █  ▐▛▀▀▘  █  ▐▌   ▐▛▀▀▘ ▝▀▚▖
 * ▐▌ ▐▌▐▌ ▐▌ █  ▐▌ ▐▌  ▐▌ ▗▄▄▞▘    ▐▙▄▄▀▝▚▄▞▘ █  ▐▌   ▗▄█▄▖▐▙▄▄▖▐▙▄▄▖▗▄▄▞▘
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 *
 * Author: Katherine C. (katherine@kaytea.dev)
 * Source: http://github.com/KatieUmbra/Dotfiles
 * License: MIT
 * Description: Main dotfiles config file
 */

import "colors" as colors;

// Data
export const data = #{
    color: colors::colorschemes.nord.def,
    /*
     * options:
     * - weeb
     * - plain
     * - landscape
     */
    wallpaper_type: "landscape",
    font: #{
        family: #{
            monospaced: "Monaspace Neon",
            regular: "WorkSans",
        },
        size: #{
            // In pt
            title: 16,
            normal: 14,
            small: 12,
            tiny: 10,
            speck: 8,
        }
    },
    icon: #{
        size: 20
    },
    styling: #{
        // Css values in rem
        padding: #{
            tiny: 0.125,
            small: 0.25,
            medium: 0.5,
            large: 0.75,
            largest: 1,
            xl: 2,
        },
        margin: #{
            tiny: 0.125,
            small: 0.25,
            medium: 0.5,
            large: 0.75,
            largest: 1,
            xl: 2,
        },
        // Css values in pixels
        border: #{
            rounding: 10,
            gaps: 10,
            size: 0,
        },
    }
};

fn image_mako() {
    return "image=~/.config/share/wallpaper/" + data.color.name + "/" + data.color.variant + "/" + data.wallpaper_type;
}

fn image_swaylock() {
    return image_mako() + ".png";
}

fn wallpaper_theme() {
    return "THEME="+data.color.name
}

fn wallpaper_variant() {
    return "VARIANT="+data.color.variant
}

fn wallpaper_type() {
    return "TYPE="+data.wallpaper_type
}

// Eggs
export let eggs = #{
    kitty: #{
        targets: "~/.config/kitty",
        templates: ["kitty.conf", "kitty_system.conf"],
        enabled: true
    },
    zsh: #{
        targets: "~/.config/zsh",
        templates: [".zshrc", ".fzf_theme"],
        enabled: true
    },
    eww: #{
        targets: "~/.config/eww",
        templates: ["*", "**/*.svg", "**/**/*.svg"],
        enabled: true,
    },
    starship : #{
        targets: "~/.config/starship",
        enalbed: true,
    },
    fastfetch: #{
        targets: "~/.config/fastfetch",
        enabled: true,
    },
    gowall: #{
        targets: "~/.config/gowall",
        templates: ["config.yml"],
        enabled: true,
    },
    assets: #{
        targets: "~/.config/share/",
        enabled: true,
        templates: ["wofi-bg.svg"]
    },
    wofi: #{
        targets: "~/.config/wofi",
        templates: ["config", "style.css"],
        enabled: true,
    },
    mako: #{
        targets: "~/.config/mako",
        templates: ["config"],
        enabled: true
    },
    nvim: #{
        targets: "~/.config/nvim",
        templates: ["*.lua", "**/*.lua", "**/**/*.lua", "*.py", "*.md", "*.json"],
        enabled: true
    },
    btop: #{
        targets: "~/.config/btop",
        templates: ["themes/rice.theme", "btop.conf"],
        enabled: true
    },
    bat: #{
        targets: "~/.config/bat",
        templates: ["themes/rice.tmTheme", "config"],
        enabled: true
    },
    cava: #{
        targets: "~/.config/cava",
        templates: ["config"],
        enabled: true
    },
    wlogout: #{
        targets: "~/.config/wlogout",
        templates: ["layout", "style.css"],
        enabled: true
    },
    yazi: #{
        targets: "~/.config/yazi",
        templates: ["*"],
        enabled: true
    },
    scripts: #{
        targets: "~/.config/scripts",
        templates: ["*.sh", "reload", "reload_wallpaper"],
        enabled: true
    },
    niri: #{
        targets: "~/.config/niri",
        templates: ["config.kdl"],
        enabled: true
    },
    swaylock: #{
        targets: "~/.config/swaylock",
        templates: ["config"],
        enabled: true,
    },
    discord: #{
        targets: "~/.config/vesktop/themes",
        templates: ["rice.theme.css"],
        enabled: true,
    },
    fum: #{
        targets: "~/.config/fum",
        templates: ["config.jsonc"],
        enabled: true,
    }
};
