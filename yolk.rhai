// Colorschemes
const colorschemes = #{
    rosepine: #{
        def: #{
            name:   "rosepine",
            base:   "#191724",
            surface:"#1f1d2e",
            overlay:"#26233a",
            muted:  "#6e6a86",
            subtle: "#908caa",
            text:   "#e0def4",
            love:   "#eb6f92",
            gold:   "#f6c177",
            rose:   "#ebbcba",
            pine:   "#31748f",
            foam:   "#9ccfd8",
            iris:   "#c4a7e7",
            hl:     "#21202e",
            hm:     "#403d52",
            hh:     "#524f67",
        },
        moon: #{
            name:   "rosepine",
            base:   "#232136",
            surface:"#2a273f",
            overlay:"#393552",
            muted:  "#6e6a86",
            subtle: "#908caa",
            text:   "#e0def4",
            love:   "#eb6f92",
            gold:   "#f6c177",
            rose:   "#ea9a97",
            pine:   "#3e8fb0",
            foam:   "#9ccfd8",
            iris:   "#c4a7e7",
            hl:     "#2a283e",
            hm:     "#44415a",
            hh:     "#56526e",
        },
        dawn: #{
            name:   "rosepine",
            base:   "#faf4ed",
            surface:"#fffaf3",
            overlay:"#f2e9e1",
            muted:  "#9893a5",
            subtle: "#797593",
            text:   "#575279",
            love:   "#b4637a",
            gold:   "#ea9d34",
            rose:   "#d7827e",
            pine:   "#286983",
            foam:   "#56949f",
            iris:   "#907aa9",
            hl:     "#f4ede8",
            hm:     "#dfdad9",
            hh:     "#cecacd",
        }
    }
};

// Data
export const data = #{
    color: colorschemes.rosepine.moon,
    border: #{
        rounding: 10,
        gaps: 10,
        size: 1,
    },
    font: #{

        family: #{
            monospaced: "MonaspaceNeon-Regular",
            regular: "WorkSans",
        },
        size: 16
    },
    icon: #{
        size: 20
    }
};

// Eggs
export let eggs = #{
    hypr: #{
        targets: "~/.config/hypr",
        templates: ["hyprland.conf", "hyprpaper.conf"],
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
    }
};
