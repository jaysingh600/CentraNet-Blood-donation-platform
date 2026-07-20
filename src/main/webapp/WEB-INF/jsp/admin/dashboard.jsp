<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body { background-color: #f4f6f9; }
        .sidebar { min-height: 100vh; background: #343a40; color: white; }
        .sidebar a { color: #c2c7d0; text-decoration: none; padding: 15px; display: block; }
        .sidebar a:hover { background: #495057; color: white; }
        .card-stats { border-left: 4px solid #dc3545; }
    </style>
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="sidebar w-25">
            <h4 class="text-center py-4 border-bottom border-secondary">Admin Panel</h4>
            <a href="/admin/dashboard"><i class="fa-solid fa-gauge me-2"></i> Dashboard</a>
            <a href="/admin/donors"><i class="fa-solid fa-users me-2"></i> Manage Donors</a>
            <a href="/admin/hospitals"><i class="fa-solid fa-hospital me-2"></i> Manage Hospitals</a>
            <a href="/admin/donations"><i class="fa-solid fa-hand-holding-medical me-2"></i> Manage Donations</a>
            <a href="/admin/requests"><i class="fa-solid fa-heart-pulse me-2"></i> Manage Requests</a>
            <a href="/admin/inventory"><i class="fa-solid fa-droplet me-2"></i> Blood Inventory</a>
            <a href="/logout" class="mt-auto text-danger"><i class="fa-solid fa-right-from-bracket me-2"></i> Logout</a>
        </div>

        <!-- Main Content -->
        <div class="w-75 p-4">
            <h2 class="mb-4">Dashboard Overview</h2>
            
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card card-stats shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title text-muted">Total Donors</h5>
                            <h2 class="fw-bold">${totalDonors}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card card-stats shadow-sm" style="border-left-color: #0d6efd;">
                        <div class="card-body">
                            <h5 class="card-title text-muted">Total Requesters</h5>
                            <h2 class="fw-bold">${totalRequesters}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card card-stats shadow-sm" style="border-left-color: #198754;">
                        <div class="card-body">
                            <h5 class="card-title text-muted">Total Hospitals</h5>
                            <h2 class="fw-bold">${totalHospitals}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card card-stats shadow-sm" style="border-left-color: #ffc107;">
                        <div class="card-body">
                            <h5 class="card-title text-muted">Pending Donations</h5>
                            <h2 class="fw-bold">${pendingDonations}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card card-stats shadow-sm" style="border-left-color: #0dcaf0;">
                        <div class="card-body">
                            <h5 class="card-title text-muted">Pending Requests</h5>
                            <h2 class="fw-bold">${pendingRequests}</h2>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card shadow-sm">
                        <div class="card-header bg-white">
                            <h5 class="mb-0">Current Blood Inventory Summary</h5>
                        </div>
                        <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Blood Group</th>
                                        <th>Available Units</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${inventory}" var="item">
                                        <tr>
                                            <td><span class="badge bg-danger fs-6">${item.bloodGroup.groupName}</span></td>
                                            <td class="fw-bold">${item.availableUnits}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty inventory}">
                                        <tr>
                                            <td colspan="2" class="text-center text-muted">No inventory data available yet.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
