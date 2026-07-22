<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Blood Donation System</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #fdfbfb 0%, #ebedee 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 20px 0;
        }
        .login-wrapper {
            width: 100%;
            max-width: 450px;
            padding: 15px;
        }
        .login-card {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.2);
        }
        .login-header {
            background: linear-gradient(135deg, #e52d27 0%, #b31217 100%);
            padding: 40px 20px 50px;
            text-align: center;
            color: white;
            position: relative;
        }
        .login-header::after {
            content: '';
            position: absolute;
            bottom: -20px;
            left: 0;
            width: 100%;
            height: 40px;
            background: #ffffff;
            border-radius: 50% 50% 0 0;
        }
        .login-header i {
            font-size: 3.5rem;
            margin-bottom: 15px;
            text-shadow: 0 4px 10px rgba(0,0,0,0.2);
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        .login-header h4 {
            font-weight: 700;
            margin-bottom: 5px;
            letter-spacing: 0.5px;
            font-size: 1.5rem;
        }
        .login-header p {
            color: rgba(255, 255, 255, 0.9);
            margin: 0;
            font-weight: 300;
        }
        .login-body {
            padding: 30px 40px 40px;
        }
        .form-control {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1.5px solid #e2e8f0;
            background-color: #f8fafc;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }
        .form-control:focus {
            background-color: #ffffff;
            border-color: #e52d27;
            box-shadow: 0 0 0 4px rgba(229, 45, 39, 0.1);
        }
        .form-label {
            font-weight: 600;
            color: #334155;
            margin-bottom: 8px;
            font-size: 0.9rem;
        }
        .btn-brand {
            background: linear-gradient(135deg, #e52d27 0%, #b31217 100%);
            border: none;
            border-radius: 10px;
            padding: 14px;
            font-weight: 600;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
            margin-top: 10px;
        }
        .btn-brand:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(229, 45, 39, 0.3);
            color: white;
        }
        .footer-links {
            text-align: center;
            margin-top: 25px;
        }
        .footer-links p {
            margin-bottom: 10px;
            color: #64748b;
            font-size: 0.95rem;
        }
        .footer-links a {
            color: #e52d27;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s;
        }
        .footer-links a:hover {
            color: #b35012;
            text-decoration: underline;
        }
        .alert {
            border-radius: 10px;
            font-size: 0.9rem;
            border: none;
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div class="login-card">
            <div class="login-header">
                <i class="fa-solid fa-droplet"></i>
                <h4>Blood Donation Platform</h4>
                <p>Sign in to your account</p>
            </div>
            
            <div class="login-body">
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger d-flex align-items-center">
                        <i class="fa-solid fa-circle-exclamation me-2"></i> Invalid Email or Password.
                    </div>
                </c:if>

                <c:if test="${param.success != null}">
                    <div class="alert alert-success d-flex align-items-center">
                        <i class="fa-solid fa-circle-check me-2"></i> Registration successful!! Please login.
                    </div>
                </c:if>
                
                <c:if test="${param.logout != null}">
                    <div class="alert alert-info d-flex align-items-center">
                        <i class="fa-solid fa-circle-info me-2"></i> You have been  logged out.
                    </div>
                </c:if>

                <form action="<c:url value='/login'/>" method="post">
                    <div class="mb-4">
                        <label for="username" class="form-label">Email address : </label>
                        <input type="email" class="form-control" id="username" name="username" placeholder="Enter your email" required>
                    </div>
                    <div class="mb-4">
                        <label for="password" class="form-label">Password : </label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                    </div>
                    <button type="submit" class="btn btn-brand w-100">Login</button>
                </form>
                
                <div class="footer-links">
                    <p>Don't have an account? <a href="/register">Register Here</a></p>
                    <p><a href="/"><i class="fa-solid fa-arrow-left me-1"></i> Back to Home</a></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
