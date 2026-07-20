<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body { background-color: #f4f6f9; }
        .sidebar { min-height: 100vh; background: #0f5132; color: white; }
        .sidebar a { color: #d1e7dd; text-decoration: none; padding: 15px; display: block; }
        .sidebar a:hover { background: #146c43; color: white; }
    </style>
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="sidebar w-25">
            <h4 class="text-center py-4 border-bottom border-light">Hospital Portal</h4>
            <div class="px-3 mb-4 text-center">
                <small class="text-light">Logged in as:</small><br>
                <strong>${hospital.hospitalName}</strong>
            </div>
            <a href="/hospital/dashboard"><i class="fa-solid fa-gauge me-2"></i> Dashboard</a>
            <a href="/hospital/assigned-donors"><i class="fa-solid fa-user-plus me-2"></i> Assigned Donors</a>
            <a href="/hospital/assigned-requesters"><i class="fa-solid fa-user-minus me-2"></i> Assigned Requesters</a>
            <a href="/logout" class="mt-auto text-warning"><i class="fa-solid fa-right-from-bracket me-2"></i> Logout</a>
        </div>

        <!-- Main Content -->
        <div class="w-75 p-4">
            <h2 class="mb-4">Hospital Dashboard</h2>
            
            <div class="row">
                <div class="col-md-6 mb-4">
                    <div class="card shadow-sm border-0 border-top border-success border-4">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h5 class="card-title text-muted">Assigned Donors</h5>
                                    <h2 class="fw-bold">${assignedDonorsCount}</h2>
                                </div>
                                <i class="fa-solid fa-users fa-3x text-success opacity-50"></i>
                            </div>
                            <a href="/hospital/assigned-donors" class="btn btn-outline-success mt-3 btn-sm">View Donors</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6 mb-4">
                    <div class="card shadow-sm border-0 border-top border-primary border-4">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h5 class="card-title text-muted">Assigned Requesters</h5>
                                    <h2 class="fw-bold">${assignedRequestersCount}</h2>
                                </div>
                                <i class="fa-solid fa-procedures fa-3x text-primary opacity-50"></i>
                            </div>
                            <a href="/hospital/assigned-requesters" class="btn btn-outline-primary mt-3 btn-sm">View Requesters</a>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</body>
</html>
