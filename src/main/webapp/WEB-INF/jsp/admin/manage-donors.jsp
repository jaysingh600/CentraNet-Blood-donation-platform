<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Donors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2><a href="/admin/dashboard" class="text-dark text-decoration-none"><i class="fa-solid fa-arrow-left"></i></a> Manage Donors</h2>
        <table class="table table-striped mt-4">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Blood Group</th>
                    <th>Contact</th>
                    <th>City</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${donors}" var="donor">
                    <tr>
                        <td>${donor.id}</td>
                        <td>${donor.name}</td>
                        <td><span class="badge bg-danger">${donor.bloodGroup}</span></td>
                        <td>${donor.phone}<br><small>${donor.user.email}</small></td>
                        <td>${donor.address}</td>
                        <td>
                            <button class="btn btn-sm btn-info"><i class="fa-solid fa-eye"></i> View</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
