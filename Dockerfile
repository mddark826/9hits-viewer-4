# 9Hits Viewer on Railway — ONE-CLICK version
# App token is pre-baked as the default NINEHITS_KEY.
# A Railway variable named NINEHITS_KEY can override it.
# Start script already includes --system-session so earning starts automatically.

FROM 9hitste/appv6

ENV NINEHITS_KEY="26140480952327e644b165701ff3e101"

RUN printf '#!/bin/bash\nset -e\nif [ -z "$NINEHITS_KEY" ]; then\n  echo "ERROR: NINEHITS_KEY env var not set!"\n  exit 1\nfi\necho "Starting 9Hits Viewer..."\nexec /nh.sh --access-key="$NINEHITS_KEY" --note=railway --hide-browser=yes --system-session\n' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
