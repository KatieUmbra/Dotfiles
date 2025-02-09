import "colors" as colors;

// Data
export const data = #{
    color: colors::colorschemes.rosepine.moon,
    font: #{

        family: #{
            monospaced: "MonaspaceNeon-Regular",
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
        border: #{
            rounding: 5,
            gaps: 10,
            size: 1,
        },
    }
};

fn rgba_hyprland_color(color, alpha, padding) {
    const my_color = color - "#";
    let line = get_yolk_text();
    let pad = "";
    pad.pad(padding, " ");
    return pad + line.split()[0] + " = rgba(" + my_color + alpha + ")";
}

fn rgb_hyprland_color(color, padding) {
    const my_color = color - "#";
    let line = get_yolk_text();
    let pad = "";
    pad.pad(padding, " ");
    return pad + line.split()[0] + " = rgb(" + my_color + ")";
}

// Eggs
export let eggs = #{
    hypr: #{
        targets: "~/.config/hypr",
        templates: ["hyprland.conf", "hyprpaper.conf", "hyprlock.conf"],
        enabled: true,
    },
    kitty: #{
        targets: "~/.config/kitty",
        templates: ["kitty.conf"],
        enabled: true
    },
    zsh: #{
        targets: "~/.config/zsh",
        templates: [".zshrc"],
        enabled: true
    },
    eww: #{
        targets: "~/.config/eww",
        templates: ["*"],
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
        templates: ["*.lua", "*.py", "*.md", "*.json"],
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
    }
};
