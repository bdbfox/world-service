const express = require('express');
const nconf = require('nconf');

const app = express();

// the world service doesn't really do anything
// it just retrieves the redis environment variable
// and spits it out for you

nconf.argv()
  .env();

app.get('/', (req, res) => {
  const redis_host = nconf.get('REDIS_HOST') || 'unknown';
  res.json({ redis_host });
});

app.listen(3000, () => {
  console.log('World service listening on port 3000!');
});
