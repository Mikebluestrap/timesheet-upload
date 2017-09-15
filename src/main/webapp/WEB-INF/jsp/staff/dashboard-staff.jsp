<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="images/favicon.ico">
    <title>TechNumen Home</title>
    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!--Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">
    <!-- Icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid" id="wrapper">
    <div class="row">
        <nav class="sidebar col-xs-12 col-sm-4 col-lg-3 col-xl-2 bg-faded sidebar-style-1">
            <h1 class="site-title"><a href="index.html"><em class="fa fa-rocket"></em> TechNumen Inc.,</a></h1>

            <a href="#menu-toggle" class="btn btn-default" id="menu-toggle"><em class="fa fa-bars"></em></a>

            <ul class="nav nav-pills flex-column sidebar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="/timesheetApp/dashboard">
                        <em class="fa fa-dashboard"></em>
                        Dashboard <span class="sr-only">(current)</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/timesheetApp/reports">
                        <em class="fa fa-bar-chart"></em> Reports
                    </a>
                </li>
            </ul>
        </nav>

        <main class="col-xs-12 col-sm-8 offset-sm-4 col-lg-9 offset-lg-3 col-xl-10 offset-xl-2 pt-3 pl-4">
            <header class="page-header row justify-center">
                <div class="col-md-6 col-lg-8">
                    <h1 class="float-left text-center text-md-left">Dashboard</h1>
                </div>

                <div class="dropdown user-dropdown col-md-6 col-lg-4 text-center text-md-right">
                    <a
                            class="btn btn-stripped dropdown-toggle" href="https://example.com" id="dropdownMenuLink"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="images/profile-pic.png" alt="profile photo" class="circle float-left profile-photo"
                             width="50" height="auto">

                        <div class="username mt-1">
                            <h4 class="mb-1">${user.employeeFirstName} ${user.employeeFirstName}</h4>
                            <h6 class="text-muted">${user.employeeRoleDesc}</h6>
                        </div>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right" style="margin-right: 1.5rem;"
                         aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="#"><em class="fa fa-user-circle mr-1"></em> View Profile</a>
                        <a class="dropdown-item" href="#"><em class="fa fa-sliders mr-1"></em> Preferences</a>
                        <a class="dropdown-item" href="#"><em class="fa fa-power-off mr-1"></em> Logout</a>
                    </div>
                </div>

                <div class="clear"></div>
            </header>

            <section class="row">
                <div class="col-sm-12">
                    <section class="row">
                        <div class="col-md-12">

                            <div class="card mb-4" id="viewTimesheet">
                                <div class="card-block">
                                    <h3 class="card-title mb-4">View Timesheet</h3>

                                    <form>

                                        <div class="form-group row">
                                            <label for="selectedTimePeriod" class="col-lg-2 form-control-label">Selected
                                                TimePeriod : </label>
                                            <div class="col-lg-4">
                                                <span id="selectedTimePeriod"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">Status : </label>
                                            <div class="col-lg-4">
                                                <span id="timesheetStatus"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-lg-2 form-control-label">Regular
                                                Hours : </label>
                                            <div class="col-lg-2">
                                                <span id="regularHours"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">Extra
                                                Hours : </label>
                                            <div class="col-lg-2">
                                                <span id="extraHours"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">Total
                                                Hours : </label>
                                            <div class="col-lg-2">
                                                <span id="totalHours"></span>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-lg-2 form-control-label">Submitted By : </label>
                                            <div class="col-lg-2">
                                                <span id="submitterName"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">Submitted On : </label>
                                            <div class="col-lg-2">
                                                <span id="submittedDate"></span>
                                            </div>

                                            <label class="col-lg-2 form-control-label">Approved On : </label>
                                            <div class="col-lg-2">
                                                <span id="approvalDate"></span>
                                            </div>
                                        </div>
                                        <br>

                                        <div class="form-group row" id="uploadedTimesheet">
                                            <a href="" target="_blank" id="uploadTimesheetLink">
                                                Click here to access the uploaded timesheet:
                                                <span id="uploadedTimesheetName"></span>
                                            </a>
                                        </div>
                                        <br>


                                        <div class="form-group">
                                            <label for="timesheetComments">Comments : </label>
                                            <textarea class="form-control col-xl-8" id="timesheetComments"
                                                      rows="3" readonly></textarea>
                                        </div>

                                    </form>
                                </div>

                            </div>

                            <div class="card mb-4">
                                <div class="card-block">
                                    <h3 class="card-title">Timesheet Summary</h3><br>

                                    <form>

                                        <div class="form-group row">
                                            <label for="selectTime" class="col-lg-2 col-form-label">
                                                Select TimePeriod
                                            </label>
                                            <div class="col-lg-4">
                                                <select class="form-control" id="selectTime">

                                                </select>
                                            </div>

                                            <label for="selectStatus"
                                                   class="col-lg-2 col-form-label">Status
                                            </label>
                                            <div class="col-lg-4">
                                                <select class="form-control" id="selectStatus">
                                                    <option>SUBMITTED</option>
                                                    <option>APPROVED</option>
                                                    <option>REJECTED</option>
                                                </select>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="text-center">
                                            <input type="submit" class="btn btn-success"
                                                   value="Search For Timesheets"/>
                                        </div>
                                        <br>

                                    </form>

                                    <div class="table-responsive">
                                        <table id="timesheetSummary" class="table table-striped table-bordered"
                                               cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                                <th>Employee Name</th>
                                                <th>Emp Title</th>
                                                <th>From Period</th>
                                                <th>To Period</th>
                                                <th>RT Hours</th>
                                                <th>OT Hours</th>
                                                <th>Status</th>
                                                <th>View</th>
                                            </tr>
                                            </thead>

                                            <tfoot>
                                            <tr>
                                                <th>Employee Name</th>
                                                <th>Emp Title</th>
                                                <th>From Period</th>
                                                <th>To Period</th>
                                                <th>RT Hours</th>
                                                <th>OT Hours</th>
                                                <th>Status</th>
                                                <th>View</th>
                                            </tr>
                                            </tfoot>

                                        </table>
                                    </div>

                                </div>
                            </div>

                        </div>

                    </section>
                    <section class="row">
                        <div class="col-12 mt-1 mb-4">Copy Right by <a href="http://www.technumen.com/">TechNumen
                            Inc.,</a></div>
                    </section>
                </div>
            </section>
        </main>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="../js/external/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
        integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
        crossorigin="anonymous"></script>
<script src="../js/external/bootstrap.min.js"></script>
<script src="./js/external/bootstrap-datepicker.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
<script src="./js/external/custom.js"></script>
<script src=".js/dashboard-staff.js"></script>

</body>
</html>
