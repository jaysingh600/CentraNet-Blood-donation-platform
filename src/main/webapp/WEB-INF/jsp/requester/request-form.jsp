<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Request Blood</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow border-0 border-top border-primary border-4">
                    <div class="card-header bg-white">
                        <h4 class="mb-0 text-primary">Emergency Blood Request</h4>
                    </div>
                    <div class="card-body">
                        <form action="/requester/request-blood" method="post">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Patient Name</label>
                                    <input type="text" name="patientName" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label>Patient Age</label>
                                    <input type="number" name="patientAge" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Blood Group Required</label>
                                    <select name="bloodGroupId" class="form-select" required>
                                        <option value="">Select Group...</option>
                                        <c:forEach items="${bloodGroups}" var="bg">
                                            <option value="${bg.id}">${bg.groupName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label>Units Required</label>
                                    <input type="number" name="unitsRequired" class="form-control" min="1" required>
                                </div>
                            </div>
                            
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Required Date</label>
                                    <input type="date" name="requiredDate" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label>Hospital Name / Location</label>
                                    <input type="text" name="hospitalPreference" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label>Reason for Request</label>
                                <textarea name="reason" class="form-control" rows="2" required></textarea>
                            </div>
                            
                            <div class="mb-4">
                                <label>Attendant / Emergency Contact</label>
                                <input type="text" name="emergencyContact" class="form-control" required>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100">Submit Request</button>
                            <a href="/requester/dashboard" class="btn btn-secondary w-100 mt-2">Cancel</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
