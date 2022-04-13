require('dotenv/config');
const express = require('express');
const errorMiddleware = require('./error-middleware');
const staticMiddleware = require('./static-middleware');
const db = require('./db');

const app = express();

app.use(staticMiddleware);

app.get('/api/entries', (req, res, next) => {
  const userId = 1;

  const sql = `
    select
      "entryId",
      "title",
      "photoUrl"
    from
      "entries"
    where
      "userId" = $1;
  `;
  const params = [userId];

  db.query(sql, params)
    .then(results => {
      const entries = results.rows;

      res.json(entries);
    })
    .catch(err => next(err));
});

app.use(errorMiddleware);

app.listen(process.env.PORT, () => {
  // eslint-disable-next-line no-console
  console.log(`express server listening on port ${process.env.PORT}`);
});
