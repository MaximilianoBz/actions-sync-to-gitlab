FROM alpine:3.14

# Instalar git y bash
RUN apk add --no-cache git bash

# Copiar el script principal
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Configurar entrypoint
ENTRYPOINT ["/entrypoint.sh"]