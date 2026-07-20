<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Donor Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body { background-color: #f4f6f9; }
        .sidebar { min-height: 100vh; background: #dc3545; color: white; }
        .sidebar a { color: #f8d7da; text-decoration: none; padding: 15px; display: block; }
        .sidebar a:hover { background: #b02a37; color: white; }
    </style>
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="sidebar w-25">
            <h4 class="text-center py-4 border-bottom border-light">Donor Portal</h4>
            <div class="px-3 mb-4 text-center">
                <i class="fa-solid fa-circle-user fa-3x mb-2 text-white"></i><br>
                <strong>${donor.name}</strong><br>
                <span class="badge bg-light text-danger fs-6 mt-1">${donor.bloodGroup}</span>
            </div>
            <a href="/donor/dashboard"><i class="fa-solid fa-gauge me-2"></i> Dashboard</a>
            <a href="/donor/donate"><i class="fa-solid fa-hand-holding-medical me-2"></i> Donate Blood</a>
            <a href="/logout" class="mt-auto text-light fw-bold"><i class="fa-solid fa-right-from-bracket me-2"></i> Logout</a>
        </div>

        <!-- Main Content -->
        <div class="w-75 p-4">
            <h2 class="mb-4">My Donations</h2>
            
            <c:if test="${param.success != null}">
                <div class="alert alert-success">Donation request submitted successfully! Waiting for Admin approval.</div>
            </c:if>

            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Requested Date</th>
                                <th>Preferred Hospital</th>
                                <th>Status</th>
                                <th>Assigned Hospital</th>
                                <th>Reporting Details</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${donations}" var="req">
                                <tr>
                                    <td>${req.availableDate}</td>
                                    <td>${req.preferredHospital}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${req.status == 'PENDING'}"><span class="badge bg-warning text-dark">Pending</span></c:when>
                                            <c:when test="${req.status == 'APPROVED'}"><span class="badge bg-success">Approved</span></c:when>
                                            <c:when test="${req.status == 'REJECTED'}"><span class="badge bg-danger">Rejected</span></c:when>
                                            <c:when test="${req.status == 'COMPLETED'}"><span class="badge bg-primary">Completed</span></c:when>
                                        </c:choose>
                                    </td>
                                    <td>${req.assignedHospital != null ? req.assignedHospital.hospitalName : 'Not Assigned'}</td>
                                    <td>
                                        <c:if test="${req.status == 'APPROVED'}">
                                            <strong>${req.reportingDate}</strong> at ${req.reportingTime}<br>
                                            <small class="text-muted">${req.instructions}</small>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty donations}">
                                <tr>
                                    <td colspan="5" class="text-center text-muted">You haven't made any donation requests yet.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
