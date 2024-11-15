const bcrypt = require('bcrypt');
const { Pool } = require('pg');

// Configuración de la base de datos
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'Proyecto Corner',
    password: '123456789',
    port: 5432,
});

// Función para hashear las contraseñas en texto plano en la base de datos
async function hashPasswords() {
    try {
        // Selecciona todas las contraseñas en texto plano
        const { rows } = await pool.query('SELECT nombre, contraseña FROM rol');
        for (const row of rows) {
            const hashedPassword = await bcrypt.hash(row.contraseña, 15);
            // Actualiza la contraseña con el hash en la base de datos
            await pool.query('UPDATE rol SET contraseña = $1 WHERE nombre = $2', [hashedPassword, row.nombre]);
        }
        console.log('Contraseñas hasheadas y actualizadas en la base de datos.');
    } catch (error) {
        console.error('Error al hashear contraseñas:', error);
    } finally {
        await pool.end(); // Cierra la conexión a la base de datos
    }
}

// Ejecuta la función
hashPasswords();
