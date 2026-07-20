<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Assigned Donors</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2><a href="/hospital/dashboard" class="text-dark text-decoration-none"><i class="fa-solid fa-arrow-left"></i></a> Assigned Donors</h2>
        <div class="card mt-4">
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Donor Name</th>
                            <th>Blood Group</th>
                            <th>Contact</th>
                            <th>Reporting Date/Time</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${donations}" var="req">
                            <tr>
                                <td>${req.donor.name}</td>
                                <td><span class="badge bg-danger">${req.bloodGroup.groupName}</span></td>
                                <td>${req.donor.phone}</td>
                                <td>${req.reportingDate} at ${req.reportingTime}</td>
                                <td><span class="badge bg-warning text-dark">${req.status}</span></td>
                                <td>
                                    <c:if test="${req.status == 'APPROVED'}">
                                        <button class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#completeModal${req.id}">Mark Completed</button>
                                        
                                        <!-- Complete Modal -->
                                        <div class="modal fade" id="completeModal${req.id}" tabindex="-1">
                                          <div class="modal-dialog">
                                            <div class="modal-content">
                                              <form action="/hospital/donations/complete" method="post">
                                                  <div class="modal-header">
                                                    <h5 class="modal-title">Complete Donation</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                  </div>
                                                  <div class="modal-body">
                                                    <input type="hidden" name="id" value="${req.id}">
                                                    <div class="mb-3">
                                                        <label>Blood Units Collected</label>
                                                        <input type="number" name="unitsCollected" class="form-control" min="1" required>
                                                    </div>
                                                  </div>
                                                  <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-success">Save</button>
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
