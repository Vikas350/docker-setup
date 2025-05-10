const express = require('express');

const app = express();  
const PORT = process.env.PORT ?? 8001;

app.use(express.json()); //to parse JSON data

app.get('/', (req, res) => {
    return res.json({
        status: 'success',
        message: 'Hello from Express server'
    })
})

app.get('/health', (req, res) => {
    return res.json({
        status: 'success',
        message: 'Server is healthy'
    })
})

app.listen(PORT, () => {
    console.log(`Server is running on: ${PORT}`);
})

/**
 * Node v22.6.0
 * NPM installed v10.8.2
 */