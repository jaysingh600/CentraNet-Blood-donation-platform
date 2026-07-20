<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Hospitals</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2><a href="/admin/dashboard" class="text-dark text-decoration-none"><i class="fa-solid fa-arrow-left"></i></a> Manage Hospitals</h2>
        <table class="table table-striped mt-4">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Hospital Name</th>
                    <th>Registration No</th>
                    <th>Contact</th>
                    <th>Location</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${hospitals}" var="hospital">
                    <tr>
                        <td>${hospital.id}</td>
                        <td>${hospital.hospitalName}</td>
                        <td>${hospital.registrationNumber}</td>
                        <td>${hospital.phone}<br><small>${hospital.user.email}</small></td>
                        <td>${hospital.city}, ${hospital.state}</td>
                        <td>
                            <c:choose>
                                <c:when test="${hospital.user.active}">
                                    <span class="badge bg-success">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger">Suspended</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
