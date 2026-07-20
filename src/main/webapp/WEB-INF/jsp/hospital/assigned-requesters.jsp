<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Assigned Requesters</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2><a href="/hospital/dashboard" class="text-dark text-decoration-none"><i class="fa-solid fa-arrow-left"></i></a> Assigned Requesters</h2>
        <div class="card mt-4">
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Patient Name</th>
                            <th>Blood Group</th>
                            <th>Units Required</th>
                            <th>Required Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requests}" var="req">
                            <tr>
                                <td>${req.patientName}</td>
                                <td><span class="badge bg-danger">${req.bloodGroup.groupName}</span></td>
                                <td>${req.unitsRequired}</td>
                                <td>${req.requiredDate}</td>
                                <td><span class="badge bg-primary">${req.status}</span></td>
                                <td>
                                    <c:if test="${req.status == 'APPROVED'}">
                                        <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#issueModal${req.id}">Issue Blood</button>
                                        
                                        <!-- Issue Modal -->
                                        <div class="modal fade" id="issueModal${req.id}" tabindex="-1">
                                          <div class="modal-dialog">
                                            <div class="modal-content">
                                              <form action="/hospital/requests/issue" method="post">
                                                  <div class="modal-header">
                                                    <h5 class="modal-title">Issue Blood</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                  </div>
                                                  <div class="modal-body">
                                                    <input type="hidden" name="id" value="${req.id}">
                                                    <div class="mb-3">
                                                        <label>Blood Units Delivered</label>
                                                        <input type="number" name="unitsDelivered" class="form-control" min="1" value="${req.unitsRequired}" required>
                                                    </div>
                                                  </div>
                                                  <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Confirm Issue</button>
                                                  </div>
                                              </form>
                                            </div>
                                          </div>
                                        </div>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
