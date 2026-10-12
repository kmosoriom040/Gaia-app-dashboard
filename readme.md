# 🌌 Sistema de Análisis Astrofísico Automatizado

**Autor:** Kevin Osorio  
**Materia:** Física Computacional  

Este repositorio contiene una arquitectura completa de extracción, transformación y carga (ETL), junto con visualización interactiva de datos astronómicos reales. El sistema despliega contenedores Docker de forma autónoma para procesar información de dos de los catálogos astronómicos más importantes del mundo: el **NASA Exoplanet Archive** y el **ESA Gaia DR3**.

## 🚀 Arquitectura del Proyecto

El proyecto está diseñado bajo un enfoque de microservicios y entornos virtuales locales para garantizar la reproducibilidad del código sin romper las dependencias del sistema operativo anfitrión (Linux):

1. **Orquestación (Bash):** Scripts automatizados que limpian el entorno, despliegan una red Docker (`ciencia-net`) y levantan los servicios.
2. **Almacenamiento (MySQL 8.4):** Contenedor de base de datos que aloja los modelos relacionales asegurando la integridad de los datos (Primary Keys, Foreign Keys).
3. **Procesamiento ETL (Python):** Script ejecutado *dentro* de un contenedor aislado de Jupyter. Se conecta a las APIs TAP (Table Access Protocol) mediante consultas ADQL/SQL, limpia los DataFrames con Pandas y los inyecta en MySQL usando SQLAlchemy.
4. **Visualización (Streamlit):** Interfaz gráfica ejecutada en un entorno virtual (`venv`) en la máquina anfitriona, que consume los datos de MySQL y renderiza gráficos científicos interactivos con Plotly.

## 🔭 Módulos Disponibles

### 1. Catálogo de Exoplanetas (NASA)
Analiza miles de exoplanetas confirmados, comparando métodos de descubrimiento (Tránsito vs. Velocidad Radial), evaluando la 3ra Ley de Kepler y graficando la relación masa-radio de gigantes gaseosos y supertierras.

### 2. Archivo Gaia DR3 (Agencia Espacial Europea)
Extrae información astrométrica de estrellas brillantes. Incluye un mapa de posicionamiento ecuatorial (RA/Dec), vectores de movimiento propio, distribución de velocidad radial y una aproximación empírica al Diagrama Hertzsprung-Russell.

## ⚙️ Instrucciones de Ejecución

Para evaluar este proyecto, solo es necesario ejecutar el script maestro interactivo. Abre una terminal y ejecuta:

```bash
chmod +x ejecutar_proyecto.sh
./ejecutar_proyecto.sh
```

El script se encargará de clonar el repositorio, instalar las dependencias necesarias de forma segura y le permitirá elegir qué entorno analítico desea desplegar.