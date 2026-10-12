#!/bin/bash

echo "======================================"
echo " INICIANDO DESPLIEGUE PROYECTO GAIA"
echo "======================================"

chmod +x 1limpiar.sh 2crear.sh

# 1. Limpiar y recrear contenedores
./1limpiar.sh
./2crear.sh

# 2. Bucle inteligente para esperar a MySQL
echo ""
echo "[*] Esperando a que el motor MySQL despierte (puede tardar hasta 40s)..."
for i in {1..30}; do
    # Hace ping a MySQL internamente para saber si ya acepta conexiones
    if sudo docker exec mysql84 mysqladmin ping -h localhost -uroot -proot --silent; then
        echo "¡MySQL está 100% operativo!"
        break
    fi
    echo "Inicializando base de datos... ($i/30)"
    sleep 2
done

# 3. Mover y ejecutar el ETL
echo ""
echo "[*] Copiando script ETL Gaia al contenedor Jupyter..."
sudo docker cp 3ETL_Gaia.py jupyter:/home/jovyan/

echo "[*] Instalando dependencias en el contenedor..."
sudo docker exec -it jupyter pip install mysql-connector-python sqlalchemy pymysql requests pandas

echo "[*] Extrayendo datos de la Agencia Espacial Europea (ESA)..."
# OJO: Si falla aquí, el script se detiene y no abre la página web (|| exit 1)
sudo docker exec -it jupyter python /home/jovyan/3ETL_Gaia.py || { echo "❌ ERROR: Falló la extracción de datos. Revisa la consola."; exit 1; }

# 4. Crear entorno virtual local para Streamlit
echo ""
echo "[*] Creando entorno virtual local..."
python3 -m venv gaia_venv
source gaia_venv/bin/activate

# 5. Instalar dependencias del frontend
echo "[*] Instalando dependencias locales para la interfaz gráfica..."
pip install pandas mysql-connector-python streamlit plotly

# 6. Levantar el dashboard
echo ""
echo "[*] Iniciando servidor de Streamlit..."
streamlit run 4gaia_app.py
