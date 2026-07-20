<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Requester Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body { background-color: #f4f6f9; }
        .sidebar { min-height: 100vh; background: #0d6efd; color: white; }
        .sidebar a { color: #cfe2ff; text-decoration: none; padding: 15px; display: block; }
        .sidebar a:hover { background: #0a58ca; color: white; }
    </style>
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="sidebar w-25">
            <h4 class="text-center py-4 border-bottom border-light">Requester Portal</h4>
            <div class="px-3 mb-4 text-center">
                <i class="fa-solid fa-circle-user fa-3x mb-2 text-white"></i><br>
                <strong>${requester.name}</strong>
            </div>
            <a href="/requester/dashboard"><i class="fa-solid fa-gauge me-2"></i> Dashboard</a>
            <a href="/requester/request-blood"><i class="fa-solid fa-heart-pulse me-2"></i> Request Blood</a>
            <a href="/logout" class="mt-auto text-light fw-bold"><i class="fa-solid fa-right-from-bracket me-2"></i> Logout</a>
        </div>

        <!-- Main Content -->
        <div class="w-75 p-4">
            <h2 class="mb-4">My Blood Requests</h2>
            
            <c:if test="${param.success != null}">
                <div class="alert alert-success">Blood request submitted successfully! Waiting for Admin approval.</div>
            </c:if>

            <div class="card shadow-sm border-0">
                <div class="card-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Patient Name</th>
                                <th>Blood Group</th>
                                <th>Required Units</th>
                                <th>Date Needed</th>
                                <th>Status</th>
                                <th>Assigned Hospital</th>
                                <th>Instructions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requests}" var="req">
                                <tr>
                                    <td>${req.patientName}</td>
                                    <td><span class="badge bg-danger">${req.bloodGroup.groupName}</span></td>
                                    <td>${req.unitsRequired}</td>
                                    <td>${req.requiredDate}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${req.status == 'PENDING'}"><span class="badge bg-warning text-dark">Pending</span></c:when>
                                            <c:when test="${req.status == 'APPROVED'}"><span class="badge bg-success">Approved</span></c:when>
                                            <c:when test="${req.status == 'REJECTED'}"><span class="badge bg-danger">Rejected</span></c:when>
                                        </c:choose>
                                    </td>
                                    <td>${req.assignedHospital != null ? req.assignedHospital.hospitalName : 'Not Assigned'}</td>
                                    <td>
                                        <c:if test="${req.status == 'APPROVED'}">
                                            <small class="text-muted">${req.instructions}</small>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty requests}">
                                <tr>
                                    <td colspan="7" class="text-center text-muted">You haven't requested any blood yet.</td>
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
