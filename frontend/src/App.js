import React, { Component } from 'react';
import Register from './Register';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import './App.css';
import Home from './Home';

class App extends Component {
  render() {
    return (
      <Router>
      <Routes>
        <Route path="/Welcome" element={<Home />} />
        <Route path="/" element={<Register />} />
      </Routes>
    </Router>
    );
  }
}

export default App;
