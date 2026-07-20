<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>National Blood Transfusion Network</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-dark: #0f172a;    /* Deep Slate */
            --primary-mid: #3b82f6;     /* Vibrant Blue */
            --primary-light: #06b6d4;   /* Cyan */
            --accent: #f59e0b;          /* Amber Gold */
            --bg-light: #f8fafc;
        }
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg-light);
            color: #334155;
        }
        /* Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        .navbar-brand {
            font-weight: 800;
            background: linear-gradient(135deg, var(--primary-mid), var(--primary-light));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 1.6rem;
            letter-spacing: -0.5px;
        }
        .nav-link {
            font-weight: 600;
            color: var(--primary-dark) !important;
            transition: color 0.3s ease;
        }
        .nav-link:hover {
            color: var(--primary-mid) !important;
        }
        
        /* Hero Section */
        .hero {
            position: relative;
            background: linear-gradient(135deg, #1e1b4b 0%, #312e81 50%, #06b6d4 100%);
            color: white;
            padding: 160px 0 120px;
            text-align: center;
            overflow: hidden;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0 100%);
        }
        .hero::after {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background: url('data:image/svg+xml,<svg width="20" height="20" xmlns="http://www.w3.org/2000/svg"><circle cx="2" cy="2" r="2" fill="rgba(255,255,255,0.05)"/></svg>');
            z-index: 0;
        }
        .hero-content {
            position: relative;
            z-index: 1;
        }
        .hero h1 {
            font-weight: 800;
            font-size: 4rem;
            letter-spacing: -1px;
            margin-bottom: 20px;
        }
        .hero p {
            font-size: 1.25rem;
            font-weight: 300;
            opacity: 0.9;
            max-width: 700px;
            margin: 0 auto 40px;
        }
        .btn-gradient {
            background: linear-gradient(135deg, var(--primary-mid), var(--primary-light));
            color: white;
            border: none;
            border-radius: 50px;
            padding: 14px 35px;
            font-weight: 700;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .btn-gradient:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(6, 182, 212, 0.4);
            color: white;
        }
        .btn-outline-light-custom {
            border: 2px solid rgba(255,255,255,0.5);
            color: white;
            border-radius: 50px;
            padding: 12px 35px;
            font-weight: 700;
            transition: all 0.3s ease;
        }
        .btn-outline-light-custom:hover {
            background: white;
            color: var(--primary-dark);
        }

        /* How it works */
        .section-title {
            text-align: center;
            font-weight: 800;
            font-size: 2.5rem;
            margin-bottom: 60px;
            color: var(--primary-dark);
        }
        .process-card {
            background: white;
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.03);
            height: 100%;
            transition: transform 0.3s ease;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(0,0,0,0.02);
        }
        .process-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(59, 130, 246, 0.1);
        }
        .process-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; height: 4px;
            background: linear-gradient(90deg, var(--primary-mid), var(--primary-light));
        }
        .icon-box {
            width: 70px;
            height: 70px;
            background: #eff6ff;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            font-size: 1.8rem;
            color: var(--primary-mid);
            transform: rotate(-5deg);
        }
        .process-card h4 {
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--primary-dark);
        }
        
        /* Information Panel */
        .info-panel {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            color: white;
            border-radius: 30px;
            padding: 60px;
            margin: 80px 0;
            box-shadow: 0 20px 50px rgba(0,0,0,0.15);
        }
        .info-list li {
            margin-bottom: 15px;
            font-size: 1.1rem;
            display: flex;
            align-items: flex-start;
        }
        .info-list li i {
            color: var(--primary-light);
            margin-top: 5px;
            margin-right: 15px;
        }

        footer {
            background: var(--primary-dark);
            color: rgba(255,255,255,0.7);
            padding: 40px 0;
            margin-top: 80px;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top py-3">
        <div class="container">
            <a class="navbar-brand" href="/">
                <i class="fa-solid fa-hand-holding-medical" style="color: var(--primary-mid);"></i> CentralNet
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#guidelines">Guidelines</a></li>
                    <li class="nav-item ms-lg-3"><a class="nav-link" href="/login">Portal Login</a></li>
                    <li class="nav-item ms-lg-2"><a class="btn btn-gradient px-4" href="/register">Register</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <div class="hero">
        <div class="container hero-content">
            <h1>National Blood Transfusion Network</h1>
            <p>A centralized, secure, and unified platform connecting willing donors, verified hospitals, and critical patients across the nation seamlessly.</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="/register" class="btn btn-gradient btn-lg"><i class="fa-solid fa-user-plus me-2"></i> Join as Donor</a>
                <a href="/login" class="btn btn-outline-light-custom btn-lg"><i class="fa-solid fa-right-to-bracket me-2"></i> Access Portal</a>
            </div>
        </div>
    </div>
    
    <!-- How It Works -->
    <div class="container" style="margin-top: 80px;">
        <h2 class="section-title">How The System Works</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="process-card">
                    <div class="icon-box"><i class="fa-solid fa-address-card"></i></div>
                    <h4>1. Registration</h4>
                    <p class="text-muted">Donors, Hospitals, and Requesters register on our central portal through a secure authentication system.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="process-card">
                    <div class="icon-box"><i class="fa-solid fa-clipboard-list"></i></div>
                    <h4>2. Central Approval</h4>
                    <p class="text-muted">Requests for donations or blood requirements are sent to the administrative hub for verification and hospital assignment.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="process-card">
                    <div class="icon-box"><i class="fa-solid fa-truck-medical"></i></div>
                    <h4>3. Fulfillment</h4>
                    <p class="text-muted">Hospitals process the physical blood donation or dispatch. Our real-time inventory updates automatically.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Official Guidelines -->
    <div class="container" id="guidelines">
        <div class="info-panel">
            <div class="row">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <h3 class="fw-bold mb-4" style="color: var(--primary-light);"><i class="fa-solid fa-circle-info me-2"></i> Central Guidelines for Donors</h3>
                    <ul class="list-unstyled info-list">
                        <li><i class="fa-solid fa-check-circle"></i> Must be between 18 and 65 years of age.</li>
                        <li><i class="fa-solid fa-check-circle"></i> Must weigh at least 50 kg (110 lbs) for general donation.</li>
                        <li><i class="fa-solid fa-check-circle"></i> Minimum interval of 3 months between whole blood donations.</li>
                        <li><i class="fa-solid fa-check-circle"></i> Must not suffer from chronic diseases like Cardiac arrest, Hypertension, or blood disorders.</li>
                        <li><i class="fa-solid fa-check-circle"></i> Ensure you have eaten a healthy meal and are well-hydrated before donating.</li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <h3 class="fw-bold mb-4" style="color: var(--accent);"><i class="fa-solid fa-hospital-user me-2"></i> Hospital Instructions</h3>
                    <ul class="list-unstyled info-list">
                        <li><i class="fa-solid fa-shield-halved" style="color: var(--accent);"></i> Ensure your hospital license is officially uploaded for admin verification.</li>
                        <li><i class="fa-solid fa-shield-halved" style="color: var(--accent);"></i> Once a donor is assigned by the admin, process their donation on time.</li>
                        <li><i class="fa-solid fa-shield-halved" style="color: var(--accent);"></i> Mark the request as "Completed" in your dashboard to trigger auto-inventory updates.</li>
                        <li><i class="fa-solid fa-shield-halved" style="color: var(--accent);"></i> Dispatch blood only when the central request is strictly approved.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Live Statistics (Static visual representation for home) -->
    <div class="container text-center mb-5 pb-4">
        <h2 class="fw-bold mb-4" style="color: var(--primary-dark);">National Reach</h2>
        <div class="row justify-content-center">
            <div class="col-md-3 col-sm-6 mb-3">
                <h2 class="fw-bolder" style="color: var(--primary-mid); font-size: 3rem;">24/7</h2>
                <p class="text-muted fw-semibold">Central Support</p>
            </div>
            <div class="col-md-3 col-sm-6 mb-3">
                <h2 class="fw-bolder" style="color: var(--primary-light); font-size: 3rem;">100%</h2>
                <p class="text-muted fw-semibold">Verified Network</p>
            </div>
            <div class="col-md-3 col-sm-6 mb-3">
                <h2 class="fw-bolder" style="color: var(--primary-mid); font-size: 3rem;">Real-time</h2>
                <p class="text-muted fw-semibold">Inventory Tracking</p>
            </div>
        </div>
    </div>

    <footer class="text-center">
        <div class="container">
            <h4 class="fw-bold text-white mb-3"><i class="fa-solid fa-hand-holding-medical" style="color: var(--primary-light);"></i> CentralNet</h4>
            <p class="mb-0">Powered by the National Blood Transfusion Network System © 2026</p>
            <p class="small mt-2" style="opacity: 0.5;">Confidential & Secure Platform</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
