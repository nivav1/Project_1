import React, { useState } from 'react';
import './Register.css'

export default function Register() {
  const [showForm, setShowForm] = useState(false);
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [error, setError] = useState('');

  const handleRegister = (e) => {
    e.preventDefault();
    // Basic form validation
    if (password !== confirmPassword) {
      setError('Passwords do not match');
      return;
    }
    if (password < 5 ||password > 14 || !/^[a-zA-Z0-9]+$/.test(password)) {
        setError('Password should be between 5 and 14 characters, Contains both english letters and numbers only');
        return;
      }

    // Clear error message
    setError('');
    
    // Here, you would typically send a request to your API to register the user
    console.log({ username, email, password });
    alert('Registration successful');
  };

  return (
    <div className="register-container">
      <h1>Welcome!</h1>
      <p>Please register to get started.</p>
      {!showForm ? (
        <button onClick={() => setShowForm(true)} className="register-toggle-button">
          Register
        </button>
      ) : (
        <form onSubmit={handleRegister} className="register-form">
          {error && <p className="error">{error}</p>}
          <div className="form-group">
            <label>Username</label>
            <input
              type="text"
              value={username}
              onChange={(e) => setUsername(e.target.value)}
              required
            />
          </div>
          <div className="form-group">
            <label>Email</label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              onInvalid={(e) => {
                e.preventDefault();
                setError('Please enter a valid email address');
              }}
              onInput={() => setError('')} // Clear error when user starts typing again
              required
            />
          </div>
          <div className="form-group">
            <label>Password</label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>
          <div className="form-group">
            <label>Confirm Password</label>
            <input
              type="password"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              required
            />
          </div>
          <button type="submit" className="register-button">Register</button>
        </form>
      )}
    </div>
  );
}