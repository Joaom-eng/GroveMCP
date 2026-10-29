"""Read account quota metadata through Codex's public app-server protocol."""
import math
import time
from codex_chat_models import request


def normalize_usage(result, now=None):
    buckets = result.get('rateLimitsByLimitId')
    # Prefer the explicit codex bucket; never label another product's quota as it.
    if isinstance(buckets, dict) and buckets:
        snapshot = buckets.get('codex')
    else:
        snapshot = result.get('rateLimits')
        if isinstance(snapshot, dict) and snapshot.get('limitId') not in (None, 'codex'):
            snapshot = None
    windows = {'five_hour': None, 'weekly': None}
    if isinstance(snapshot, dict):
        for key in ('primary', 'secondary'):
            window = snapshot.get(key)
            if not isinstance(window, dict):
                continue
            duration, used = window.get('windowDurationMins'), window.get('usedPercent')
            name = {300: 'five_hour', 10080: 'weekly'}.get(duration)
            if not name or type(used) not in (int, float) or not math.isfinite(used):
                continue
            reset = window.get('resetsAt')
            if type(reset) not in (int, float) or not math.isfinite(reset):
                reset = None
            windows[name] = {'used_percent': max(0, min(100, used)), 'resets_at': reset}
    timestamp = int(time.time() if now is None else now)
    return {'state': 'ok', 'updated_at': timestamp, 'checked_at': timestamp,
            'scope': 'account', 'windows': windows}


def read_usage(codex, stop_event=None):
    return normalize_usage(request(codex, 'account/rateLimits/read', stop_event=stop_event))


if __name__ == '__main__':
    import json
    import shutil
    print(json.dumps(read_usage(shutil.which('codex')), ensure_ascii=False, indent=2))
