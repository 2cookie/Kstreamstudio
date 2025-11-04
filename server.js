const express = require('express');
const http = require('http');
const socketIo = require('socket.io');
const cors = require('cors');
const path = require('path');
//sentry 

// Import with `import * as Sentry from "@sentry/node"` if you are using ESM
const Sentry = require("@sentry/node");

Sentry.init({
  dsn: "http://127.0.0.1",
  // Setting this option to true will send default PII data to Sentry.
  // For example, automatic IP address collection on events
  tracesSampleRate: 1.0, //  Capture 100% of the transactions
  sendDefaultPii: true,
});
//int error
try {
  // mycatuwu();
  console.log("Sentry connected")
} catch (e) {
  Sentry.captureException(e);
}
const app = express();
const server = http.createServer(app);
const io = socketIo(server, {
  cors: {
    origin: '*',
    methods: ['GET', 'POST']
  }
});

app.use(cors());
app.use(express.static(path.join(__dirname, 'public')));

//song controler
let currentSong = "Waiting for a song to be set 🩷";

io.on('connection', (socket) => {
  console.log('Client connected!', socket.id);
  socket.emit('currentSong', currentSong);
  socket.on('setSong', (song) => {
    currentSong = song;
    io.emit('currentSong', currentSong);
    io.emit('Song updated song is now:', currentSong);
  });
  socket.on('disconnect', () => {
    console.log('Client disconnected', socket.id);
  });
});

server.listen(3000, () => {
  console.log('Welcome to K Stream studio 🩷');
  console.log('Server started on port 3000');
  console.log('visit http://localhost:3000 in your web browser to access the web ui 🌐');
});
