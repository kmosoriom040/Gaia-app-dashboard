# 🔭 Análisis Astrométrico y Cinemático - Gaia DR3 (ESA)

Este proyecto es un pipeline de datos automatizado que extrae, procesa y visualiza información astrofísica de la misión **Gaia DR3** de la Agencia Espacial Europea (ESA). El sistema está completamente orquestado con Docker, Python y MySQL.

## 🚀 Arquitectura del Proyecto

El sistema se compone de tres fases ejecutadas de forma secuencial y autónoma:
1. **Infraestructura (Docker):** Creación de una red virtual, un volumen persistente y contenedores para MySQL 8.4 y Jupyter.
2. **ETL (Python/ADQL):** Consulta asincrónica al servidor TAP de la ESA (`gea.esac.esa.int`) mediante ADQL para extraer las 3,000 estrellas más brillantes. Los datos se normalizan en un esquema relacional padre-hijo y se inyectan en MySQL.
3. **Dashboard (Streamlit):** Interfaz gráfica interactiva que lee la base de datos relacional para visualizar el posicionamiento ecuatorial, los vectores de movimiento propio y un pseudo Diagrama de Hertzsprung-Russell.

## 🗄️ Modelo Relacional
La base de datos `gaia_db` mantiene la integridad referencial a través de 3 tablas:
* **`estrella`** (Padre): IDs, coordenadas (RA, Dec) y magnitud aparente.
* **`cinematica`** (Hijo): Paralaje, movimiento propio y velocidad radial.
* **`fisica_estelar`** (Hijo): Temperatura efectiva y gravedad superficial.

## 🛠️ Tecnologías Utilizadas
* **Base de Datos & Contenedores:** Docker, MySQL 8.4
* **Procesamiento de Datos:** Python 3, Pandas, Requests, SQLAlchemy
* **Visualización Frontend:** Streamlit, Plotly Express

## ⚙️ Instrucciones de Ejecución
Para desplegar el proyecto desde cero en cualquier distribución Linux, simplemente ejecute el script orquestador:

```bash
chmod +x instalar_gaia.sh
./instalar_gaia.sh

El script se encargará de clonar el repositorio, instalar las dependencias necesarias de forma segura y le permitirá elegir qué entorno analítico desea desplegar.
