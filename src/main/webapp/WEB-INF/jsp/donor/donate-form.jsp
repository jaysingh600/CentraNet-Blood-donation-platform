<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Request Donation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-danger text-white">
                        <h4 class="mb-0">Blood Donation Form</h4>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-info">
                            <strong>Eligibility Check:</strong> You must be 18-65 years old, weigh at least 50kg, and have no major diseases.
                        </div>
                        <form action="/donor/donate" method="post">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Blood Group to Donate</label>
                                    <select name="bloodGroupId" class="form-select" required>
                                        <option value="">Select Group...</option>
                                        <c:forEach items="${bloodGroups}" var="bg">
                                            <option value="${bg.id}">${bg.groupName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label>Available Date</label>
                                    <input type="date" name="availableDate" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label>Preferred Hospital</label>
                                <input type="text" name="preferredHospital" class="form-control" placeholder="Optional">
                            </div>
                            
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>Health Status</label>
                                    <select name="healthStatus" class="form-select" required>
                                        <option value="Excellent">Excellent</option>
                                        <option value="Good">Good</option>
                                        <option value="Average">Average</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label>Units Expected to Donate</label>
                                    <input type="number" name="unitsExpected" class="form-control" min="1" max="2" value="1" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label>Medical Remarks (if any)</label>
                                <textarea name="medicalRemarks" class="form-control" rows="2"></textarea>
                            </div>
                            
                            <div class="mb-3">
                                <label>Emergency Contact Number</label>
                                <input type="text" name="emergencyContact" class="form-control" required>
                            </div>
                            
                            <div class="form-check mb-4">
                                <input class="form-check-input" type="checkbox" required id="terms">
                                <label class="form-check-label" for="terms">
                                    I confirm that I meet the eligibility criteria and the information provided is accurate.
                                </label>
                            </div>
                            
                            <button type="submit" class="btn btn-danger w-100">Submit Request</button>
                            <a href="/donor/dashboard" class="btn btn-secondary w-100 mt-2">Cancel</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
