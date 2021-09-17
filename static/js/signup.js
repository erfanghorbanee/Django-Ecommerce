// AJAX for Signup
function signup() {
    console.log("signup is working!") // sanity check

    $.ajax({
        url: "http://127.0.0.1:8000/rest-auth/registration/", // the endpoint
        type: "POST", // http method
        data: {
            email: $('#id_email').val(), // data sent with the post request
            phone: $('#id_phone').val(),
            first_name: $('#id_first_name').val(),
            last_name: $('#id_last_name').val(),
            gender: $('#id_gender').val(),
            password: $('#id_password1').val(),
            password2: $('#id_password2').val(),
        },

        // handle a successful response
        success: function (json) {
            console.log(json); // log the returned json to the console
            console.log("success"); // another sanity check
            alert("Please click the activation link we sent to your email.");
        },

        // handle a non-successful response
        error: function (xhr) {

            console.log(xhr.status + ": " + xhr.responseText); // provide a bit more info about the error to the console
            alert(xhr.responseText);
            // $("#talk").prepend("<li><strong>" + xhr.responseText + "</strong></li>");
        }
    });

}

$('#signup_form').on('submit', function(event){
    event.preventDefault();
    console.log("form submitted!")  // sanity check
    signup();
});