# 9Hits Viewer — ONE-CLICK version (works on Railway + Render)
# App token is pre-baked as the default NINEHITS_KEY.
# A platform variable named NINEHITS_KEY can override it.
# start.sh also runs a tiny web server on $PORT so Render's port check passes.

FROM 9hitste/appv6

ENV NINEHITS_KEY="26140480952327e644b165701ff3e101"

RUN apt-get update && apt-get install -y --no-install-recommends python3 && rm -rf /var/lib/apt/lists/*

RUN printf '#!/bin/bash\nset -e\nif [ -z "$NINEHITS_KEY" ]; then\n  echo "ERROR: NINEHITS_KEY env var not set!"\n  exit 1\nfi\npython3 -m http.server "${PORT:-10000}" >/dev/null 2>&1 &\necho "Starting 9Hits Viewer..."\nexec /nh.sh --access-key="$NINEHITS_KEY" --note=railway --hide-browser=yes --system-session\n' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
