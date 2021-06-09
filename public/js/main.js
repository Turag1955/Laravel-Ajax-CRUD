//const { default: Swal } = require("sweetalert2");

// const {
//     default: Swal
// } = require("sweetalert2");

var table;
$(document).ready(function () {
    table = $('#dataTable').DataTable({
        "processing": true, //Feature control the processing control
        "serverSide": true, //Feature control DataTable server side processing mode
        "order": [], //initial no order
        "responsive": true, //make table responsive in mobile device
        "bInfo": true, //to show the total number of data
        "bFilter": false, //for datatable default search box show/hide
        "lengthMenu": [
            [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
            [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
        ],
        "pageLength": 5,
        "language": {
            processing: '<img src=' + LOADING_IMG_TABLE + ' alt="Loading..."/>',
            emptyTable: '<strong class="text-danger">No Data Found</strong>',
            infoEmpty: '',
            zeroRecords: '<strong class="text-danger">No Data Found</strong>',
        },
        "ajax": {
            "url": SITE_URL + '/user/list',
            "type": "POST",
            "data": function (data) {
                data.name = $('#search_form #name').val();
                data.email = $('#search_form #email').val();
                data.mobile = $('#search_form #mobile').val();
                data.district_id = $('#search_form #district_id').val();
                data.upazila_id = $('#search_form #upazila_id').val();
                data.role_id = $('#search_form #role_id').val();
                data.status = $('#search_form #status_id').val();
                data._token = _token;
            }
        },
        "columnDefs": [{
                "targets": [0, 2, 10, 11],
                "orderable": false
            },
            {
                "targets": [6, 7, 8, 9],
                "className": "text-center",
            }
        ],
        "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'B>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
        "buttons": [
            'colvis',
            {
                "extend": "csv",
                "title": "User List",
                "filename": "user-list",
                "exportOptions": {
                    columns: function (index, data, node) {
                        return table.column(index).visible();
                    }
                }
            },
            {
                "extend": "excel",
                "title": "User List",
                "filename": "user-list",
                "exportOptions": {
                    columns: function (index, data, node) {
                        return table.column(index).visible();
                    }
                }
            },
            {
                "extend": 'pdf',
                "title": "User List",
                "filename": "user-list",
                "orientaion": "landscape",
                "pageSize": "A4",
                "exportOptions": {
                    columns: [0, 1, 3, 4, 5, 6, 7, 8, 9]
                },
                customize: function (doc) {
                    doc.content[1].table.width = ['5%', '15%', '10%', '15%', '10%', '10%', '10%', '10%', '15%'];
                    //Remove the title created by datatTables

                    //Create a date string that we use in the footer. Format is dd-mm-yyyy
                    var now = new Date();
                    var jsDate = now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();
                    // Logo converted to base64
                    // var logo = getBase64FromImageUrl('https://datatables.net/media/images/logo.png');
                    // The above call should work, but not when called from codepen.io
                    // So we use a online converter and paste the string in.
                    // Done on http://codebeautify.org/image-to-base64-converter
                    // It's a LONG string scroll down to see the rest of the code !!!
                    var logo = 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAICAgICAQICAgIDAgIDAwYEAwMDAwcFBQQGCAcJCAgHCAgJCg0LCQoMCggICw8LDA0ODg8OCQsQERAOEQ0ODg7/2wBDAQIDAwMDAwcEBAcOCQgJDg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg4ODg7/wAARCAAwADADASIAAhEBAxEB/8QAGgAAAwEAAwAAAAAAAAAAAAAABwgJBgIFCv/EADUQAAEDAgQDBgUDBAMAAAAAAAECAwQFBgAHESEIEjEJEyJBUXEUI0JhgRVSYhYXMpEzcrH/xAAYAQADAQEAAAAAAAAAAAAAAAAEBQYHAv/EAC4RAAEDAgMGBQQDAAAAAAAAAAECAxEABAUGEhMhMUFRcSIyYaHBFkKB0ZGx8P/aAAwDAQACEQMRAD8Avy44hlhTrqw22kEqUo6BIG5JPkMSxz67RlFPzFquWnDParOaN4QVlmqXDKcKKLS19CCsf8qh6A6e+OfaK573LDTanDJllVV0q8r3ZVIuGqR1fMpdJSdHCCOinN0j7e+FjymydjRKdSbGsikpbSlG5O3/AHfeX5nU6knck6DFdg+DovkquLlWllHE8yeg+f4FBPvluEpEqNC657/4yr4ecm3ZxH1OghzxfptpQERI7X8QrqdPXGNpucXGLltU0SbZ4jazW0tHX4C6IiJcd37HUEj8YoHNtTKOzwuHVPj79rTfhkfCudxEbUOqQQd9Pc4HlaoGRt2JVAcptRsOe54WZZkd6yFHpzakgD3098ahYWuVVDQ/YrKD9wJnvGqfb8UAHH584npWw4eu0+iVO+6Vl3xO2zHy1uKa4GafdcBwqos5w7AOE6lgk+epT68uK8MvNPxmnmHEvMuJCm3EKCkqSRqCCNiCPPHmbzdyWcozkq1rpitVSkzGyqHNbT4HU+S0H6Vp22/9Bw8XZkcQ1wuzLg4V8yqq5U69a0X42zalJXq5NpeuhZJO5LWo0/idPpxI5ryszgyG77D3Nrau+U8weh/cDgQRI3sGXi54VCCKXK6Ku5fnbOcTt2znO/8A0SfFtymcx17llpGqgPTUjDj5WOIOUmYFPpLgjXQ5ES627r43I6R40I9D16fuGEfzPZeyq7afiRtec0W03O/GuSj82wdbdb8ZB89FEjb0xvrIzGk2pmnSrgcdUttl3lkoB2UyrZadPbf8DFFhGHuX+W0bASUyY6kKJg96XPK0XJmt9MrkFuIQw2XNup8IwFbruVaWXkttMgadCCcEfNuPTbbzPkiK87+jVRsTqctlIKVNubkD2J/0RgBVFDVQUpTTEksjdTjpG4xc4TYOvBu5AhB3yf8AcfmgTIUUmiMxcs27+CG42Koy3JqFqym3YLytebuVfRr9gVD2AwvOWt5u2f2qXDle0FK4UhVwijzgFbPMSUlBSftqdcMAqN/TfCVV0yGBDl3O+huMwvZXw6Oqzr67n8jC85VWw/fnakZD2tAaL/wtwGsSuTfu2YyCeY+6ikY5x1yzVlDECB4C8Nn3lEx6SFe9MWtW3R1jfVTu0l4a7lv6wbaz8yqp6p2Z2X6FmXT2U6uVelq8TrQA3UtG6gPMFQG+mJe2Xf8ASL5s1qp0p35qfDLhuHR2M4P8kLT5aH/ePUSpIUnQjUemJh8SXZs2fmVf8/MvJevKyfzNkEuTPhGeamVNZ3JeZGnKonqpPXqQTjE8tZmdwF4hSdbSjvHMHqP1zo24tw8J4EUn9MvWz7iymo9tX27PgTqQ4tMCfGY735SuiFdenTTTyGOIrGV1DSJLCqndb7Z1aamIDEZJHQqGg5vyDga3Fw28bVhS1wqrlHAzAjtkhFSt2sIQHR5HkXoQftjrqJw5cYt81BESDkuxaCVnRU24K0Fpb+/I3qT7Y1b6kygptSi88lKiSWxIEkyRygE8tUUDsbieA71mM2M0mZxlVytTQ0w0jkQlIIQ2PpabR1JJ6Abk4oP2bHDhW6O9WuITMKlLplxV9hMeg06Sn5lPgjdIUPJayedX4HljvOHvs16VbF7Uy/c86/8A3DuyIoOwoAaDdPgL66ts7gqH7lan2xVaJEjQaezFiMIjx2khLbaBoEgYyzMmZTjWi2t0bK3b8qfk+v8AW/jNMGWdn4lGVGv/2SAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA=';
                    // A documentation reference can be found at
                    // https://github.com/bpampuch/pdfmake#getting-started
                    // Set page margins [left,top,right,bottom] or [horizontal,vertical]
                    // or one number for equal spread
                    // It's important to create enough space at the top for a header !!!
                    doc.pageMargins = [20, 20, 20, 20];
                    // Set the font size fot the entire document
                    doc.defaultStyle.fontSize = 10;
                    // Set the fontsize for the table header
                    doc.styles.tableHeader.fontSize = 10;
                    // Create a header object with 3 columns
                    // Left side: Logo
                    // Middle: brandname
                    // Right side: A document title
                    doc.content.splice(0, 1, {
                        margin: [0, 0, 0, 5],
                        alignment: 'center',
                        fontSize: 10,
                        image: logo,
                        width: 35,
                    }, {
                        alignment: 'center',
                        text: ['user List'],
                        fontSize: 10,
                        margin: [0, 0, 0, 5],
                        bold: true
                    });
                    // Create a footer object with 2 columns
                    // Left side: report creation date
                    // Right side: current page and total pages
                    doc['footer'] = (function (page, pages) {
                        return {
                            columns: [{
                                    alignment: 'left',
                                    text: ['Created on: ', {
                                        text: jsDate.toString()
                                    }]
                                },
                                {
                                    alignment: 'right',
                                    text: ['page ', {
                                        text: page.toString()
                                    }, ' of ', {
                                        text: pages.toString()
                                    }]
                                }
                            ],
                            margin: [20, 5, 20, 5]
                        }
                    });
                    // Change dataTable layout (Table styling)
                    // To use predefined layouts uncomment the line below and comment the custom lines below
                    // doc.content[0].layout = 'lightHorizontalLines'; // noBorders , headerLineOnly
                    var objLayout = {};
                    objLayout['hLineWidth'] = function (i) {
                        return .5;
                    };
                    objLayout['vLineWidth'] = function (i) {
                        return .5;
                    };
                    objLayout['hLineColor'] = function (i) {
                        return '#aaa';
                    };
                    objLayout['vLineColor'] = function (i) {
                        return '#aaa';
                    };
                    objLayout['paddingLeft'] = function (i) {
                        return 4;
                    };
                    objLayout['paddingRight'] = function (i) {
                        return 4;
                    };
                    doc.content[0].layout = objLayout;
                }
                // customize:function(win){
                //     $(win.document.body).addClass('bg-white');
                // }
            },
            {
                "extend": "print",
                "title": "User List",
                "filename": "user-list",
                "exportOptions": {
                    columns: function (index, data, node) {
                        return table.column(index).visible();
                    }
                },
                customize: function (win) {
                    $(win.document.body).addClass('bg-white');
                }
            },
        ]
    });

    $('#dataTable_wrapper .dt-buttons').append('<button type="button" id="bulk_action_delete" class="btn btn-danger"><i class="fa fa-trash"></i>Delete</button>')

});

$('#search_btn_submit').click(function () {
    table.ajax.reload();
})

$('#search_btn_reset').click(function () {
    $('#search_form')[0].reset();
    table.ajax.reload();
})


$('.dropify').dropify();

$(document).on('click', '.user_edit', function () {
    let id = $(this).data('id');
    $.ajax({
        url: SITE_URL + "/user/edit",
        type: "POST",
        data: {
            id: id,
            _token: _token
        },
        dataType: "JSON",
        success: function (res) {
            $('#storeData #name').val(res.user.name);
            $('#storeData #email').val(res.user.email);
            $('#storeData #mobile').val(res.user.mobile);
            $('#storeData #district_id').val(res.user.district_id);
            upazila_list(res.user.district_id, 'storeData');
            setTimeout(() => {
                $('#storeData #upazila_id').val(res.user.upazila_id);
            }, 1000);

            $('#storeData #postal_code').val(res.user.postal_code);
            $('#storeData #address').val(res.user.address);
            $('#storeData #role_id').val(res.user.role_id);
            $('#storeData #update_id').val(res.user.id);
            $('#storeData #old_image').val(res.user.avatar);

            var avatar = url + '/' + res.user.avatar;
            $('.dropify-preview').css('display', 'block');
            $('.dropify-render').html('<img src="' + avatar + '"/>');

            $('#storeData #password').parent().hide();
            $('#storeData #cpassword').parent().hide();

            $('#saveData').modal({
                keyboard: true,
                backdrop: 'daynamic'
            });
            $('#saveData .modal-title').html('update Data For ' + res.user.name);
            $('#saveData #save_btn').text('Update');

        }
    });

});

$(document).on('click', '.user_view', function () {
    let id = $(this).data('id');
    $.ajax({
        url: SITE_URL + '/user/view',
        type: 'POST',
        data: {
            id: id,
            _token: _token,
        },
        dataType: "JSON",
        success: function (res) {
            if (res.user_view != '') {
                $('#user_view_row').html('');
                $('#user_view_row').html(res.user_view);

                $('#user_view').modal({
                    keyboard: false,
                    backdrop: 'daynamic',
                });
                $('.modal-title').html(res.user_name + ' Details');
            }
        },
        error: function (xhr, ajaxoption, thrownError) {
            console.log('error');
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
});

$(document).on('click', '.user_delete', function () {

    let id = $(this).data('id');
    let name = $(this).data('name');
    let url = SITE_URL + '/user/delete';
    let row = table.row($(this).parent('tr'));
    delete_user(table, url, row, id, name);
    // $.ajax({
    //     url: SITE_URL + '/user/delete',
    //     type: 'POST',
    //     data: {
    //         id: id,
    //         _token: _token,
    //     },
    //     dataType: "JSON",


    //     success: function (res) {
    //         if (res.status == 'success') {
    //             table.ajax.reload(null, false);
    //             console.log('delete');
    //         }
    //     },
    //     error: function (xhr, ajaxoption, thrownError) {
    //         console.log('error');
    //         console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
    //     }
    // });

});



function delete_user(table, url, row, id, name) {
    Swal.fire({
        title: 'Are you sure ' + name + ' Data Delete',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: url,
                type: 'POST',
                data: {
                    id: id,
                    _token: _token
                },
                dataType: "JSON",
            }).done(function (res) {
                if (res.status == 'success') {
                    Swal.fire("Delete", res.message, "success").then(function () {
                        table.row(row).remove().draw(false);
                    });
                }
            }).fail(function () {
                Swal.fire("Oops..!", "something went wrong", "error");
            });
        }
    })
}

$(document).on('change', '.change_status', function () {
    let id = $(this).data('id');
    let status;
    if ($(this).is(':checked')) {
        status = 1;
    } else {
        status = 0;
    }
    if (id && status != -1) {
        $.ajax({
            url: SITE_URL + '/user/status',
            type: "POST",
            data: {
                id: id,
                status: status,
                _token: _token
            },
            dataType: "JSON",
            success: function (data) {
                if (data.status == 'success') {
                    console.log(status);
                    table.ajax.reload(null, false);
                }
            },
            error: function (xhr, ajaxoption, thrownError) {
                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
            }
        });
    } else {
        console.log(status);
    }
});

function showModal(title, btnText) {
    resetForm('storeData');
    $('#storeData')[0].reset();
    $('#storeData').find('.is-invalid').removeClass('is-invalid');
    $('#storeData').find('.error').remove();
    //$('#storData .dropify-render img').attr('src', '');
    $('#storeData #password').parent().show();
    $('#storeData #cpassword').parent().show();
    $('.dropify-clear').trigger('click');
    $('#saveData').modal({
        keyboard: true,
        backdrop: 'daynamic'
    });
    $('#saveData .modal-title').text(title);
    $('#saveData #save_btn').text(btnText);
}

function upazila_list(district_id, from_id) {

    $.ajax({
        url: SITE_URL + '/upazila-list',
        type: "POST",
        data: {
            district_id: district_id,
            _token: _token
        },
        dataType: "JSON",
        success: function (data) {
            $('#' + from_id + ' #upazila_id').html('');
            $('#' + from_id + ' #upazila_id').html(data);
        },
        error: function (xhr, ajaxoption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
}


$(document).on('click', '#save_btn', function () {
    let storeData = document.getElementById('storeData');
    let formData = new FormData(storeData);
    let url = SITE_URL + '/user/store';
    let id = $('#update_id').val();
    let method;
    if (id != '') {
        method = 'update';
    } else {
        method = 'add';
    }
    console.log(id);
    console.log(method);
    console.log(table);
    store_form_data(table, url, method, formData);
});

function store_form_data(table, url, method, formData) {
    //alert('hi');

    $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "JSON",
        contentType: false,
        processData: false,
        cache: false,
        success: function (data) {
            $('#storeData').find('.is-invalid').removeClass('is-invalid');
            $('#storeData').find('.error').remove();
            if (data.status == false) {
                $.each(data.errors, function (key, value) {
                    $('#storeData #' + key).addClass('is-invalid');
                    $('#storeData #' + key).parent().append(
                        "<div class='error invalid-tooltip'>" + value + "</div>");
                });
            } else {
                //FlashMessage(data.status, data.msg);
                if (data.status == 'success') {
                    if (method == 'update') {
                        table.ajax.reload(null, false);
                        $('#storeData #update_id').val('');
                        $('#storeData #old_image').val('');

                    } else {
                        table.ajax.reload();
                    }
                    console.log(method);
                    //resetForm('storeData');
                    $('#saveData').modal('hide');
                }

            }
        },

        error: function (xhr, ajaxoption, thrownError) {
            console.log('error');
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
}


function FlashMessage(status, message) {
    // Command: toastr["success"]("Are you the six fingered man?")
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    switch (status) {
        case 'success':
            toastr.success(message, 'SUCCESS');
            break;
        case 'error':
            toastr.error(message, 'ERROR');
            break;
        case 'info':
            toastr.info(message, 'INFORMATION');
            break;
        case 'warning':
            toastr.warning(message, 'WARNING');
            break;

    }
}

function check_select_all() {
    if ($('#select_all:checked').length == 1) {
        $('.select_data').prop('checked', true);
    } else {
        $('.select_data').prop('checked', false);
    }
    $('.select_data').is(':checked') ? $('.select_data').closest('tr').addClass('bg-warning') : $('.select_data').closest('tr').removeClass('bg-warning')
}

function select_single_item(id) {
    let total = $('.select_data').length;
    let total_checked = $('.select_data:checked').length;
   // console.log(total + '==' + total_checked);

    $('#checkbox' + id).is(':checked') ? $('#checkbox' + id).closest('tr').addClass('bg-warning') : $('#checkbox' + id).closest('tr').removeClass('bg-warning')
    total == total_checked ? $('#select_all').prop('checked', true) : $('#select_all').prop('checked', false)

}

$(document).on('click', '#bulk_action_delete', function () {
    let id = [];
    let rows;
    $('.select_data:checked').each(function () {
        id.push($(this).val());
        rows = table.row($('.select_data:checked').parents('tr'));
    });
    if (id.length == 0) {
        Swal.fire({
            type: 'error',
            title: 'error',
            text: 'please select at least one row'
        });
    }else{
        bulk_action_delete(id, rows, table);
    }
    
});

function bulk_action_delete(id, rows, table) {
    Swal.fire({
        title: 'Are you sure  Data Delete',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: SITE_URL + '/user/bulk_action_delete',
                type: 'POST',
                data: {
                    id: id,
                    _token: _token
                },
                dataType: "JSON",
            }).done(function (res) {
                if (res.status == 'success') {
                    Swal.fire("Delete", res.message, "success").then(function () {
                       table.row(rows).remove().draw(false);
                       $('#select_all').prop('checked', false);
                    });
                }
            }).fail(function () {
                Swal.fire("Oops..!", "something went wrong", "error");
            });
        }
    })
}

function resetForm(formid) {
    $(':input', '#' + formid).not(':button, :submit, :reset, :hidden').val('')
        .removeAttr('checked').removeAttr('selected');
}
