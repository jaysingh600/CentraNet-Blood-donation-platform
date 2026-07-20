<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Blood Donation System</title>
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
            padding: 40px 0;
        }
        .register-wrapper {
            width: 100%;
            max-width: 750px;
            padding: 15px;
        }
        .register-card {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
            border: 1px solid rgba(255,255,255,0.2);
        }
        .register-header {
            background: linear-gradient(135deg, #e52d27 0%, #b31217 100%);
            padding: 40px 20px 50px;
            text-align: center;
            color: white;
            position: relative;
        }
        .register-header::after {
            content: '';
            position: absolute;
            bottom: -20px;
            left: 0;
            width: 100%;
            height: 40px;
            background: #ffffff;
            border-radius: 50% 50% 0 0;
        }
        .register-header i {
            font-size: 3rem;
            margin-bottom: 15px;
            text-shadow: 0 4px 10px rgba(0,0,0,0.2);
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        .register-header h4 {
            font-weight: 700;
            margin-bottom: 5px;
            letter-spacing: 0.5px;
            font-size: 1.5rem;
        }
        .register-header p {
            color: rgba(255, 255, 255, 0.9);
            margin: 0;
            font-weight: 300;
        }
        .register-body {
            padding: 30px 40px 40px;
        }
        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px 15px;
            border: 1.5px solid #e2e8f0;
            background-color: #f8fafc;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }
        .form-control:focus, .form-select:focus {
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
        .section-title {
            color: #e52d27;
            font-weight: 700;
            font-size: 1.1rem;
            margin-top: 30px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f1f5f9;
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
            margin-top: 20px;
        }
        .btn-brand:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(229, 45, 39, 0.3);
            color: white;
        }
        .error {
            color: #dc2626;
            font-size: 0.85em;
            margin-top: 5px;
            display: block;
            font-weight: 500;
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
            color: #b31217;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-wrapper">
        <div class="register-card">
            <div class="register-header">
                <i class="fa-solid fa-user-plus"></i>
                <h4>Create an Account</h4>
                <p>Join our blood donation community today</p>
            </div>
            
            <div class="register-body">
                <form:form method="post" modelAttribute="userDto" action="/register">
                    
                    <div class="mb-4">
                        <label class="form-label">Register As</label>
                        <form:select path="role" class="form-select" id="roleSelect">
                            <form:option value="DONOR">Blood Donor</form:option>
                            <form:option value="REQUESTER">Blood Requester</form:option>
                            <form:option value="HOSPITAL">Hospital</form:option>
                        </form:select>
                    </div>

                    <h5 class="section-title">Basic Information</h5>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Full Name / Hospital Name</label>
                            <form:input path="name" class="form-control" placeholder="Enter full name" />
                            <form:errors path="name" class="error" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Email Address</label>
                            <form:input path="email" type="email" class="form-control" placeholder="Enter email address" />
                            <form:errors path="email" class="error" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Phone Number</label>
                            <form:input path="phone" class="form-control" placeholder="Enter phone number" />
                            <form:errors path="phone" class="error" />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Password</label>
                            <form:input path="password" type="password" class="form-control" placeholder="Enter password" />
                            <form:errors path="password" class="error" />
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Confirm Password</label>
                            <form:input path="confirmPassword" type="password" class="form-control" placeholder="Confirm password" />
                            <form:errors path="confirmPassword" class="error" />
                        </div>
                    </div>

                    <!-- Donor Specific Fields -->
                    <div id="donorFields">
                        <h5 class="section-title">Donor Information</h5>
                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <label class="form-label">Age</label>
                                <form:input path="age" type="number" class="form-control" placeholder="Age" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label">Gender</label>
                                <form:select path="gender" class="form-select">
                                    <form:option value="Male">Male</form:option>
                                    <form:option value="Female">Female</form:option>
                                    <form:option value="Other">Other</form:option>
                                </form:select>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label class="form-label">Blood Group</label>
                                <form:select path="bloodGroup" class="form-select">
                                    <form:option value="A+">A+</form:option>
                                    <form:option value="A-">A-</form:option>
                                    <form:option value="B+">B+</form:option>
                                    <form:option value="B-">B-</form:option>
                                    <form:option value="AB+">AB+</form:option>
                                    <form:option value="AB-">AB-</form:option>
                                    <form:option value="O+">O+</form:option>
                                    <form:option value="O-">O-</form:option>
                                </form:select>
                            </div>
                            <div class="col-md-2 mb-3">
                                <label class="form-label">Weight</label>
                                <form:input path="weight" type="number" step="0.1" class="form-control" placeholder="kg" />
                            </div>
                        </div>
                    </div>

                    <!-- Hospital Specific Fields -->
                    <div id="hospitalFields" style="display: none;">
                        <h5 class="section-title">Hospital Information</h5>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Registration Number</label>
                                <form:input path="registrationNumber" class="form-control" placeholder="Hospital Reg. No." />
                                <form:errors path="registrationNumber" class="error" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">City</label>
                                <form:input path="city" class="form-control" placeholder="City" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">State</label>
                                <form:input path="state" class="form-control" placeholder="State" />
                            </div>
                        </div>
                    </div>

                    <div class="d-grid mt-2">
                        <button type="submit" class="btn btn-brand">Create Account</button>
                    </div>
                    
                    <div class="footer-links">
                        <p>Already have an account? <a href="/login">Login Here</a></p>
                        <p><a href="/"><i class="fa-solid fa-arrow-left me-1"></i> Back to Home</a></p>
                    </div>

                </form:form>
            </div>
        </div>
    </div>

    <!-- JavaScript to toggle fields based on role -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var roleSelect = document.getElementById('roleSelect');
            var donorFields = document.getElementById('donorFields');
            var hospitalFields = document.getElementById('hospitalFields');

            function toggleFields() {
                var role = roleSelect.value;
                if (role === 'DONOR') {
                    donorFields.style.display = 'block';
                    hospitalFields.style.display = 'none';
                } else if (role === 'HOSPITAL') {
                    donorFields.style.display = 'none';
                    hospitalFields.style.display = 'block';
                } else {
                    donorFields.style.display = 'none';
                    hospitalFields.style.display = 'none';
                }
            }

            roleSelect.addEventListener('change', toggleFields);
            toggleFields(); // Initial call
        });
    </script>
</body>
</html>
