function handleEdit() {
    document.getElementById("myFieldset").disabled = false;
    document.getElementById('edit').hidden = true;
    document.getElementById('save').hidden = false;

    return false;
}

function handleSave() {
    document.getElementById("myFieldset").disabled = true;
    document.getElementById('edit').hidden = false;
    document.getElementById('save').hidden = true;

    return false;
}

$(function() {
   $.ajaxSetup({
       headers: {
         "X-CSRFToken": $('[name=csrfmiddlewaretoken]').val()
       }
   })
});

function edit_detail() {
    console.log("edit is working!") // sanity check

    $.ajax({
        url: "/rest-auth/user/", // the endpoint
        type: "PUT", // http method
        data: {
            email: $('#id_email').val(), // data sent with the post request
            phone: $('#id_phone').val(),
            first_name: $('#id_first_name').val(),
            last_name: $('#id_last_name').val(),
            gender: $('#id_gender').val(),
        },

        // handle a successful response
        success: function (json) {
            console.log(json); // log the returned json to the console
            console.log("success"); // another sanity check
            alert("اطلاعات شما با موفقیت ویرایش شد.");
        },

        // handle a non-successful response
        error: function (xhr) {

            console.log(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
            alert(xhr.responseText);
            // $("#talk").prepend("<li><strong>" + xhr.responseText + "</strong></li>");
        }
    });

}

$('#details').on('submit', function(event){
    event.preventDefault();
    console.log("form submitted!")  // sanity check
    edit_detail();
    handleSave();
});
