# Remote control checker for kitty.conf's password-less remote_control_password.
# It lets programs in a kitty window ask kitty to open a web link, which kitty
# does with a Wayland activation token so the browser comes to the front.
# Every other remote control command is refused.
import re

OPEN_URL = re.compile(r"open_url https?://\S+")


def is_cmd_allowed(pcmd, window, from_socket, extra_data):
    payload = pcmd.get("payload") or {}
    return (
        pcmd.get("cmd") == "action"
        and not payload.get("match_window")
        and OPEN_URL.fullmatch(payload.get("action") or "") is not None
    )
