import React from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';

import App from './App';

axios.defaults.baseURL = 'API_ENDPOINT'; 

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
