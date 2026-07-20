<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                        <h4 class="mb-0">My Profile</h4>
                        <a href="/" class="btn btn-sm btn-light">Back to Home</a>
                    </div>
                    <div class="card-body text-center">
                        <c:if test="${param.success != null}">
                            <div class="alert alert-success">Profile updated successfully.</div>
                        </c:if>
                        
                        <div class="mb-4">
                            <c:choose>
                                <c:when test="${not empty user.profileImage}">
                                    <img src="${user.profileImage}" alt="Profile Image" class="rounded-circle img-thumbnail" style="width: 150px; height: 150px; object-fit: cover;">
                                </c:when>
                                <c:otherwise>
                                    <i class="fa-solid fa-circle-user fa-5x text-secondary"></i>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        
                        <h5>${user.email}</h5>
                        <p class="text-muted">Role: ${user.role}</p>
                        <p class="text-muted">Joined: ${user.createdAt}</p>
                        
                        <hr>
                        
                        <form action="/profile/upload-image" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="image" class="form-label text-start w-100">Update Profile Picture</label>
                                <input class="form-control" type="file" id="image" name="image" accept="image/*" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100"><i class="fa-solid fa-upload me-2"></i> Upload</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
