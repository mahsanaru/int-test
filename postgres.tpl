POSTGRES_USER={{ with secret "secret/postgres" }}{{ .Data.data.POSTGRES_USER }}{{ end }}
POSTGRES_PASSWORD={{ with secret "secret/postgres" }}{{ .Data.data.POSTGRES_PASSWORD }}{{ end }}
POSTGRES_DB={{ with secret "secret/postgres" }}{{ .Data.data.POSTGRES_DB }}{{ end }}
