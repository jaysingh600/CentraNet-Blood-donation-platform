<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Manage Blood Requests</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2><a href="/admin/dashboard" class="text-dark text-decoration-none"><i class="fa-solid fa-arrow-left"></i></a> Manage Blood Requests</h2>
        
        <table class="table table-striped mt-4">
            <thead class="table-dark">
                <tr>
                    <th>Patient Name</th>
                    <th>Blood Group</th>
                    <th>Units</th>
                    <th>Date Needed</th>
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
                        <td>
                            <c:choose>
                                <c:when test="${req.status == 'PENDING'}"><span class="badge bg-warning text-dark">Pending</span></c:when>
                                <c:when test="${req.status == 'APPROVED'}"><span class="badge bg-success">Approved</span></c:when>
                                <c:when test="${req.status == 'REJECTED'}"><span class="badge bg-danger">Rejected</span></c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${req.status == 'PENDING'}">
                                <!-- Approve Button -->
                                <button type="button" class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#approveModal${req.id}">
                                    Approve
                                </button>
                                <!-- Reject Button -->
                                <button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#rejectModal${req.id}">
                                    Reject
                                </button>
                                
                                <!-- Approve Modal -->
                                <div class="modal fade" id="approveModal${req.id}" tabindex="-1">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <form action="/admin/requests/approve" method="post">
                                          <div class="modal-header">
                                            <h5 class="modal-title">Approve Blood Request</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                          </div>
                                          <div class="modal-body">
                                            <input type="hidden" name="id" value="${req.id}">
                                            <div class="mb-3">
                                                <label>Assign Hospital for Blood Collection</label>
                                                <select name="hospitalId" class="form-select" required>
                                                    <option value="">Select Hospital</option>
                                                    <c:forEach items="${hospitals}" var="h">
                                                        <option value="${h.id}">${h.hospitalName} (${h.city})</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label>Instructions to Requester</label>
                                                <textarea name="instructions" class="form-control" rows="2"></textarea>
                                            </div>
                                          </div>
                                          <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-success">Approve Request</button>
                                          </div>
                                      </form>
                                    </div>
                                  </div>
                                </div>
                                
                                <!-- Reject Modal -->
                                <div class="modal fade" id="rejectModal${req.id}" tabindex="-1">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <form action="/admin/requests/reject" method="post">
                                          <div class="modal-header">
                                            <h5 class="modal-title">Reject Blood Request</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                          </div>
                                          <div class="modal-body">
                                            <input type="hidden" name="id" value="${req.id}">
                                            <div class="mb-3">
                                                <label>Rejection Reason</label>
                                                <textarea name="reason" class="form-control" rows="3" required></textarea>
                                            </div>
                                          </div>
                                          <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-danger">Reject Request</button>
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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
