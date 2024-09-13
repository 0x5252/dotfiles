import subprocess
from time import sleep


def check_mute() -> str:
    volume = subprocess.getoutput("wpctl get-volume @DEFAULT_AUDIO_SINK@")
    if "mute" in volume.lower():
        return "True"
    return "False"


def get_volume() -> str:
    sleep(1)
    volume = subprocess.getoutput("wpctl get-volume @DEFAULT_AUDIO_SINK@")
    return f"{int(volume.replace('Volume: ', '').replace('.', '').replace(' [MUTED]', ''))}%"
