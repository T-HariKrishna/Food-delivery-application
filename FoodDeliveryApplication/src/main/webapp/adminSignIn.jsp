<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', sans-serif;
}

body {
  height: 100vh;
  display: flex;S
  justify-content: center;
  align-items: center;
  background: linear-gradient(135deg, #ffffff 0%, #fdf2f1 50%, #fee2e2 100%);
  padding: 20px;
}

.login-wrapper {
  width: 100%;
  max-width: 420px;
}

.login-card {
  background: #ffffff;
  border-radius: 16px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
  padding: 40px;
  border: 1px solid #fecaca;
}

.logo-container {
  text-align: center;
  margin-bottom: 32px;
}

.logo-icon {
  width: 64px;
  height: 64px;
  background: linear-gradient(135deg, #f43f5e 0%, #dc2626 100%);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 16px;
  box-shadow: 0 10px 25px rgba(244, 63, 94, 0.25);
  font-size: 32px;
}

.logo-container h2 {
  font-size: 28px;
  font-weight: 700;
  color: #1f2937;
  margin-bottom: 6px;
}

.logo-container p {
  font-size: 14px;
  color: #6b7280;
}

.error-message {
  background: #fee2e2;
  border: 1px solid #fecaca;
  color: #991b1b;
  padding: 12px 16px;
  border-radius: 8px;
  margin-bottom: 20px;
  font-size: 14px;
  text-align: center;
  animation: slideDown 0.3s ease-out;
  display: none;
}

.error-message.show {
  display: block;
}

@keyframes slideDown {
  from {
    opacity: 0;
    transform: translateY(-10px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.form-group {
  margin-bottom: 20px;
}

.form-group label {
  display: block;
  font-size: 14px;
  font-weight: 500;
  color: #374151;
  margin-bottom: 8px;
}

.input-wrapper {
  position: relative;
  display: flex;
  align-items: center;
}

.input-icon {
  position: absolute;
  left: 12px;
  color: #9ca3af;
  width: 20px;
  height: 20px;
  display: flex;
  align-items: center;
  justify-content: center;
  pointer-events: none;
}

input {
  width: 100%;
  padding: 12px 12px 12px 40px;
  border: 1px solid #d1d5db;
  border-radius: 8px;
  font-size: 14px;
  color: #1f2937;
  transition: all 0.3s ease;
  background: #ffffff;
}

input::placeholder {
  color: #9ca3af;
}

input:focus {
  outline: none;
  border-color: #f43f5e;
  box-shadow: 0 0 0 3px rgba(244, 63, 94, 0.1);
  background: #ffffff;
}

.password-wrapper {
  position: relative;
}

.toggle-password {
  position: absolute;
  right: 12px;
  top: 50%;
  transform: translateY(-50%);
  background: none;
  border: none;
  cursor: pointer;
  color: #9ca3af;
  padding: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: color 0.3s ease;
}

.toggle-password:hover {
  color: #6b7280;
}

.forgot-link {
  text-align: right;
  margin-bottom: 20px;
}

.forgot-link a {
  font-size: 14px;
  color: #f43f5e;
  text-decoration: none;
  font-weight: 500;
  transition: color 0.3s ease;
}

.forgot-link a:hover {
  color: #e11d48;
}

.login-button {
  width: 100%;
  padding: 12px;
  background: linear-gradient(135deg, #f43f5e 0%, #dc2626 100%);
  color: #ffffff;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 10px 25px rgba(244, 63, 94, 0.2);
}

.login-button:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 15px 35px rgba(244, 63, 94, 0.3);
  background: linear-gradient(135deg, #e11d48 0%, #b91c1c 100%);
}

.login-button:active:not(:disabled) {
  transform: translateY(0);
}

.login-button:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.back-link-container {
  text-align: center;
  margin-top: 24px;
}

.back-link {
  font-size: 14px;
  color: #4b5563;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 6px;
  transition: color 0.3s ease;
}

.back-link:hover {
  color: #1f2937;
}

.back-arrow {
  width: 16px;
  height: 16px;
}



@media (max-width: 480px) {
  .login-card {
    padding: 32px 20px;
  }

  .logo-container h2 {
    font-size: 24px;
  }
}
</style>
</head>

<body>

<div class="login-wrapper">
  <div class="login-card">
    <div class="logo-container">
      <div class="logo-icon">🛡️</div>
      <h2>Admin Panel</h2>
      <p>Secure Login</p>
    </div>

    <% String error = (String) request.getAttribute("admin_error"); %>
    <div class="error-message <% if(error != null){ %>show<% } %>">
      <% if(error != null){ %><%= error %><% } %>
    </div>

    <form action="AdminVerification" method="POST" onsubmit="return validateForm()">

      <div class="form-group">
        <label for="username">Username</label>
        <div class="input-wrapper">
          <div class="input-icon">👤</div>
          <input
            type="text"
            id="username"
            name="username"
            placeholder="Enter your username"
            required
            autocomplete="off"
          >
        </div>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <div class="input-wrapper password-wrapper">
          <div class="input-icon">🔒</div>
          <input
            type="password"
            id="password"
            name="password"
            placeholder="Enter your password"
            required
            autocomplete="off"
          >
          <button
            type="button"
            class="toggle-password"
            onclick="togglePassword()"
            aria-label="Toggle password visibility"
          >
            <span id="toggle-icon">👁️</span>
          </button>
        </div>
      </div>

      <div class="forgot-link">
        <a href="forgotPasswordUsernameVerification.html">Forgot password?</a>
      </div>

      <button type="submit" class="login-button" id="submit-btn">
        <span id="btn-text">Login</span>
      </button>
    </form>

    <div class="back-link-container">
      <a href="index.jsp" class="back-link">
        <span>←</span>
        Back to User Login
      </a>
    </div>

    
  </div>
</div>

<script>
function togglePassword() {
  const passwordInput = document.getElementById('password');
  const toggleIcon = document.getElementById('toggle-icon');

  if (passwordInput.type === 'password') {
    passwordInput.type = 'text';
    toggleIcon.textContent = '👁️‍🗨️';
  } else {
    passwordInput.type = 'password';
    toggleIcon.textContent = '👁️';
  }
}

function validateForm() {
  const username = document.getElementById('username').value.trim();
  const password = document.getElementById('password').value.trim();
  const submitBtn = document.getElementById('submit-btn');
  const btnText = document.getElementById('btn-text');

  if (!username || !password) {
    return false;
  }

  submitBtn.disabled = true;
  btnText.textContent = 'Logging in...';

  return true;
}

// Clear error message when user starts typing
document.getElementById('username').addEventListener('input', function() {
  const errorMsg = document.querySelector('.error-message');
  if (errorMsg) {
    errorMsg.classList.remove('show');
  }
});

document.getElementById('password').addEventListener('input', function() {
  const errorMsg = document.querySelector('.error-message');
  if (errorMsg) {
    errorMsg.classList.remove('show');
  }
});
</script>

</body>
</html>
