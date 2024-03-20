---------------------------------------------------------------------------
--Animated Headers
---------------------------------------------------------------------------

local header = {}

local dir = ".config/nvim/.gifs/"

local colors = {
    "none" , "2"   , "8"   , "16/8" , --4
    "16"   , "240" , "256" , "full" , --8
}

local formats = {
    "iterm", "kitty", "sixels", "symbols",
}

local dither = {
    "none", "ordered", "diffusion",
}

local symbols = {
    "all"       , "none"     , "space"   , "solid"     , --   1 - 4
    "stipple"   , "block"    , "border"  , "diagonal"  , --   5 - 8
    "dot"       , "quad"     , "half"    , "hhalf"     , --   9 - 12
    "vhalf"     , "inverted" , "braille" , "technical" , --  13 - 16
    "geometric" , "ascii"    , "legacy"  , "sextant"   , --  17 - 20
    "wedge"     , "wide"     , "narrow"  , "extra"     , --  21 - 24
}

header.animated_rainbow_circle = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--speed "            .. "1.5"                            .. " "              ..
        "--dither "           .. dither[3]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "rainbow_circle.gif",
    width = 70,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_geometry = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--speed "            .. "1.0"                            .. " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "geometry.gif",
    width = 70,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_sphere_2 = {
    type = "terminal",
    command =
        "chafa "              ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "sphere_2.gif",
    width = 70,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_sphere_1 = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "sphere_1.gif",
    width = 60,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_nyan = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "nyan.gif",
    width = 80,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_plane_light = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "plane.gif",
    width = 80,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_predator_fish = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "predator_fish.gif",
    width = 80,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_string = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[15]                      .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "string.gif",
    width = 80,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_pepe = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "pepe.gif",
    width = 90,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_rain_light = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "rain.gif",
    width = 90,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_bat_dark = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "bat.gif",
    width = 70,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_bat_light = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "bat.gif",
    width = 70,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_ufo_light = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "ufo.gif",
    width = 70,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_fish_dark = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[21]                      .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "fish.gif",
    width = 80,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_fish_light = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[21]                      .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "fish.gif",
    width = 80,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_eyes_dark = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "eyes.gif",
    width = 80,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_eyes_light = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[1]                        .. " "              ..
        "--dither-intensity " .. "1.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "eyes.gif",
    width = 80,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_pikachu = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[3]                        .. " "              ..
        "--dither-intensity " .. "2.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "pikachu.gif",
    width = 80,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_slinky = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[3]                        .. " "              ..
        "--dither-intensity " .. "2.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        " %:p:h"              .. dir                              .. "slinky.gif",
    width = 60,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_cat = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--dither "           .. dither[3]                        .. " "              ..
        "--dither-intensity " .. "2.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "cat.gif",
    width = 60,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_prism = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[3]                        .. " "              ..
        "--dither-intensity " .. "2.0"                            .. " "              ..
        "--symbols "          .. symbols[15]                      .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "prism.gif",
    width = 60,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_duck_dark = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[3]                        .. " "              ..
        "--dither-intensity " .. "2.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "duck.gif",
    width = 60,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_duck_light = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--invert"            ..                                     " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[3]                        .. " "              ..
        "--dither-intensity " .. "2.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "duck.gif",
    width = 60,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_planet = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[3]                        .. " "              ..
        "--dither-intensity " .. "2.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "planet.gif",
    width = 70,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

header.animated_spaceship = {
    type = "terminal",
    command =
        "chafa"               ..                                     " "              ..
        "-c "                 .. colors[8]                        .. " "              ..
        "--format "           .. formats[4]                       .. " "              ..
        "--fg-only"           ..                                     " "              ..
        "--dither "           .. dither[3]                        .. " "              ..
        "--dither-intensity " .. "2.0"                            .. " "              ..
        "--symbols "          .. symbols[1]                       .. " "              ..
        vim.fn.expand("~/")   .. dir                              .. "spaceship.gif",
    width = 70,
    height = 30,
    opts = {
        position = "center",
        redraw = true,
        window_config = {}
    }
}

return header





