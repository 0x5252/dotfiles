from libqtile import qtile

BACKLIGHT_FILEPATH = "/sys/class/backlight/intel_backlight/brightness"
MAX_BACKLIGHT_FILEPATH = "/sys/class/backlight/intel_backlight/max_brightness"


def change_backlight(qtile, increase_decrease: bool, amount: int = 1000):
    with open(BACKLIGHT_FILEPATH, "r") as brightness_file:
        current_brightness = int(brightness_file.readline())

    if increase_decrease:
        with open(MAX_BACKLIGHT_FILEPATH, "r") as max_brightness_file:
            max_brightness = int(max_brightness_file.readline())
        new_brightness = (
            current_brightness + amount
            if current_brightness + amount <= max_brightness
            else max_brightness
        )
    else:
        new_brightness = (
            current_brightness - amount if current_brightness - amount >= 5 else 5
        )
    with open(BACKLIGHT_FILEPATH, "w") as fp:
        fp.write(f"{new_brightness}\n")
