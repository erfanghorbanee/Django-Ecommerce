$(document).ready(function () {
    // CSRF token setup for AJAX requests
    function getCookie(name) {
        let cookieValue = null;
        if (document.cookie && document.cookie !== '') {
            const cookies = document.cookie.split(';');
            for (let i = 0; i < cookies.length; i++) {
                const cookie = cookies[i].trim();
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }

    const csrftoken = getCookie('csrftoken');

    // Function to display messages
    function displayMessage(message, type) {
        const messageDiv = $('<div class="alert alert-' + type + '">' + message + '</div>');
        $('#signup_form').prepend(messageDiv);
        setTimeout(function () {
            messageDiv.fadeOut('slow', function () {
                $(this).remove();
            });
        }, 5000);
    }

    // AJAX for Signup
    function signup() {
        // Clear previous messages
        $('.alert').remove();

        // Show loading indicator
        const loadingIndicator = $('<div class="loading">Loading...</div>');
        $('#signup_form').append(loadingIndicator);

        $.ajax({
            url: "/rest-auth/registration/", // the endpoint
            type: "POST", // http method
            headers: { "X-CSRFToken": csrftoken },
            data: {
                email: $('#id_email').val(), // data sent with the post request
                phone: $('#id_phone').val(),
                first_name: $('#id_first_name').val(),
                last_name: $('#id_last_name').val(),
                gender: $('#id_gender').val(),
                password1: $('#id_password1').val(),
                password2: $('#id_password2').val(),
            },

            // handle a successful response
            success: function (json) {
                loadingIndicator.remove();
                displayMessage("Please click the activation link we sent to your email.", "success");
                $('#signup_form')[0].reset(); // Clear the form
            },

            // handle a failed response
            error: function (xhr, errmsg, err) {
                loadingIndicator.remove();
                const errors = xhr.responseJSON;
                for (const field in errors) {
                    if (errors.hasOwnProperty(field)) {
                        displayMessage(errors[field], "danger");
                    }
                }
            }
        });
    }

    $('#signup_form').on('submit', function (event) {
        event.preventDefault();
        signup();
    });
});
