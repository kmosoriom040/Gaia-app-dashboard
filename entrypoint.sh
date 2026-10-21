#!/bin/bash
set -e
export DB_HOST="${DB_HOST:-mysql84}"

echo "[*] Esperando a MySQL en $DB_HOST..."
until python -c "import os,mysql.connector as m; m.connect(host=os.environ['DB_HOST'],user='root',password='root',database='gaia_db')" 2>/dev/null; do
  sleep 3
done

FILAS=$(python -c "import os,mysql.connector as m; c=m.connect(host=os.environ['DB_HOST'],user='root',password='root',database='gaia_db'); k=c.cursor(); k.execute('SELECT COUNT(*) FROM estrella'); print(k.fetchone()[0])" 2>/dev/null || echo 0)

if [ "$FILAS" = "0" ]; then
  echo "[*] Base vacia, ejecutando ETL (descarga desde la ESA)..."
  python 3ETL_Gaia.py
else
  echo "[*] Base ya poblada ($FILAS estrellas), se omite el ETL."
fi

exec streamlit run 4gaia_app.py --server.port=8501 --server.address=0.0.0.0
