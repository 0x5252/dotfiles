import subprocess
from libqtile.config import Screen

from core.bar import Bar
from utils.config import cfg

autorandr_profiles = {
    "mobile": [cfg.wallpaper_1920],
    "home_hdmi": [cfg.wallpaper_3440],
    "work_wide": [cfg.wallpaper_3440_work],
    "work_ultrawide": [cfg.wallpaper_5120],
}


def check_autorandr_profile() -> list[str]:
    autorandr = subprocess.check_output(["autorandr", "--current"]).decode("utf-8")[:-1]
    return next(
        (
            autorandr_profiles[profile]
            for profile in autorandr_profiles
            if autorandr in profile
        ),
        autorandr_profiles["mobile"],
    )


def check_screens() -> list[str]:
    autorandr = subprocess.check_output(["autorandr", "--config"]).decode("utf-8")
    monitor_dict = {}
    current_screen = autorandr.split("\n")[0].replace("output ", "")
    monitor_dict[current_screen] = []
    for line in autorandr.split("\n"):
        if line.startswith("output"):
            current_screen = line.replace("output ", "")
            monitor_dict[current_screen] = []
        elif line.startswith("x-"):
            break
        else:
            monitor_dict[current_screen].append(line)
    active_monitors = []
    for monitor in monitor_dict:
        if "off" in monitor_dict[monitor]:
            continue
        else:
            screen_mode = next(
                (
                    monitor_setting
                    for monitor_setting in monitor_dict[monitor]
                    if "mode" in monitor_setting
                ),
                "",
            ).replace("mode ", "")
            if "1920" in screen_mode:
                wallpaper = cfg.wallpaper_1920
            elif "3440" in screen_mode:
                wallpaper = cfg.wallpaper_3440
            elif "5120" in screen_mode:
                wallpaper = cfg.wallpaper_5120
            else:
                wallpaper = cfg.wallpaper_1920
            active_monitors.append(wallpaper)
    return active_monitors if active_monitors else [cfg.wallpaper_1920]


screens = [
    Screen(
        wallpaper=wallpaper,
        wallpaper_mode="fill",
        top=Bar(cfg.bar).create(),
    )
    for wallpaper in check_autorandr_profile()
]
#     Screen(
#         wallpaper="~/.config/qtile/background.jpeg",
#         wallpaper_mode="fill",
#         top=Bar(cfg.bar).create(),
#     ),
#     Screen(
#         wallpaper="~/.config/qtile/background.jpeg",
#         wallpaper_mode="fill",
#         top=Bar(cfg.bar).create(),
#     ),
# ]
