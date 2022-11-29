PROTECT_FILE="/etc/.redis_protect"

if [ ! -f "$PROTECT_FILE" ]; then
    sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

	touch "$PROTECT_FILE"
fi

redis-server --protected-mode no