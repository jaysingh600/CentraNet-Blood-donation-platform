<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Blood Inventory - Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .sidebar { min-height: 100vh; background: #343a40; }
        .sidebar a { color: #fff; text-decoration: none; padding: 15px; display: block; }
        .sidebar a:hover, .sidebar a.active { background: #dc3545; }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 p-0 sidebar">
            <h4 class="text-white text-center py-4 border-bottom">Admin Panel</h4>
            <a href="/admin/dashboard"><i class="fas fa-tachometer-alt me-2"></i> Dashboard</a>
            <a href="/admin/inventory" class="active"><i class="fas fa-tint me-2"></i> Blood Inventory</a>
            <a href="/admin/donors"><i class="fas fa-users me-2"></i> Manage Donors</a>
            <a href="/admin/hospitals"><i class="fas fa-hospital me-2"></i> Manage Hospitals</a>
            <a href="/admin/donations"><i class="fas fa-hand-holding-water me-2"></i> Donation Requests</a>
            <a href="/admin/requests"><i class="fas fa-procedures me-2"></i> Blood Requests</a>
            <a href="/profile"><i class="fas fa-user me-2"></i> My Profile</a>
            <form action="/logout" method="post" class="mt-5">
                <button type="submit" class="btn btn-link text-white w-100 text-start px-3 text-decoration-none">
                    <i class="fas fa-sign-out-alt me-2"></i> Logout
                </button>
            </form>
        </div>
        
        <!-- Main Content -->
        <div class="col-md-10 p-4 bg-light">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="mb-0 text-dark fw-bold"><i class="fas fa-cubes me-2 text-danger"></i> Blood Inventory</h2>
                <span class="text-muted"><i class="fas fa-clock me-1"></i> Live Status</span>
            </div>
            
            <c:if test="${empty inventory}">
                <div class="alert alert-info border-0 shadow-sm rounded-3">
                    <i class="fas fa-info-circle me-2"></i> No inventory records found. Inventory will populate when hospitals process donations.
                </div>
            </c:if>

            <div class="row g-4">
                <c:forEach var="item" items="${inventory}">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card border-0 shadow-sm h-100 position-relative overflow-hidden" style="border-radius: 15px; transition: transform 0.3s ease;">
                            <div class="card-body text-center p-4">
                                <!-- Background Icon -->
                                <i class="fas fa-droplet position-absolute" style="font-size: 8rem; color: rgba(220,53,69,0.05); top: -20px; right: -20px; transform: rotate(15deg);"></i>
                                
                                <div class="mb-3">
                                    <span class="display-5 fw-bold text-danger">${item.bloodGroup.groupName}</span>
                                </div>
                                <h3 class="fw-bold mb-1">${item.availableUnits}</h3>
                                <p class="text-muted small text-uppercase fw-semibold tracking-wide mb-3">Available Units</p>
                                
                                <div>
                                    <c:choose>
                                        <c:when test="${item.availableUnits > 20}">
                                            <span class="badge bg-success rounded-pill px-3 py-2"><i class="fas fa-check-circle me-1"></i> Sufficient</span>
                                        </c:when>
                                        <c:when test="${item.availableUnits > 0}">
                                            <span class="badge bg-warning text-dark rounded-pill px-3 py-2"><i class="fas fa-exclamation-triangle me-1"></i> Low Stock</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-danger rounded-pill px-3 py-2"><i class="fas fa-times-circle me-1"></i> Out of Stock</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            
        </div>
    </div>
</div>
</body>
</html>
