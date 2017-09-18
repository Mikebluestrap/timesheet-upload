$(document).ready(function () {

    getTimesheetByEndDate($('#currentEndDate').val());

    var table = $('#timesheetSummary').DataTable({
        ajax: {
            url: '/timesheetApp/api/timesheetSummary?employeeId=' + $('#employeeId').val(),
            dataSrc: ''
        },
        columns: [
            {
                data: 'timesheetId'
            },
            {
                data: 'fromDate',
                mRender: function (data) {
                    return moment(data).format("MM/DD/YYYY");
                }
            },
            {
                data: 'toDate',
                mRender: function (data) {
                    return moment(data).format("MM/DD/YYYY");
                }
            },
            {
                data: 'regularHours'
            },
            {
                data: 'extraHours'
            },
            {
                data: 'timesheetStatus'
            },
            {
                data: 'timesheetId',
                mRender: function (data, type, row) {
                    var link = '';
                    link = '<button class="btn-link" onclick="getTimesheetById(' + data + ')">View Timesheet</button>';
                    return link;
                }
            }
        ],
        order: [[1, 'desc'], [2, 'desc']]
    })
});

/**
 *  Retrieve Timesheet information based on given timesheetId and populate the View timesheet fields on dashboard page.
 * @param endDate
 */
function getTimesheetByEndDate(endDate) {
    console.log("Inside getTimesheetByEndDate method:: endDate: " + endDate);
    $.ajax({
        type: 'GET',
        url: '/timesheetApp/api/getTimesheetByEndDate?endDate=' + endDate,
        success: function (responsedata) {
            console.log("Inside success function after getting the timesheet info.");
            populateViewTimesheet(responsedata);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
            console.log(jqXHR);
        }
    });
}

/**
 * Retrieve Timesheet information based on given timesheetId and populate the View timesheet fields on dashboard page.
 * @param timesheetId
 */
function getTimesheetById(timesheetId) {
    console.log("Inside getTimesheet method:: timesheetId: " + timesheetId);
    $.ajax({
        type: 'GET',
        url: '/timesheetApp/api/getTimesheetById?timesheetId=' + timesheetId,
        success: function (responsedata) {
            console.log("Inside success function after getting the timesheet info.");
            populateViewTimesheet(responsedata);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(textStatus, errorThrown);
            console.log(jqXHR);
        }
    });
}

/**
 * Populates the Timesheet Information into the View Timesheet fields.
 * @param timesheetObj
 */
function populateViewTimesheet(timesheetObj) {
    console.log("Inside populateViewTimesheet method ::");
    $('#selectedTimePeriod').html(moment(timesheetObj.fromDate).format("MM/DD/YYYY") + ' - '
        + moment(timesheetObj.toDate).format("MM/DD/YYYY"));
    $('#timesheetStatus').html(timesheetObj.timesheetStatus);
    $('#regularHours').html(timesheetObj.regularHours);
    $('#extraHours').html(timesheetObj.extraHours);
    $('#totalHours').html(timesheetObj.regularHours + timesheetObj.extraHours);
    $('#submitterName').html(timesheetObj.nameCreated);
    $('#submittedDate').html(timesheetObj.dateCreated);
    $('#approvalDate').html(timesheetObj.dateApproved);
    $('#timesheetComments').html(timesheetObj.dscComments);
    $('#uploadedTimesheetName').html(timesheetObj.dscFileName);
    $('#uploadTimesheetLink').attr('href', '/timesheetApp/api/getUploadedTimesheet?timesheetId=' + timesheetObj.timesheetId);
}