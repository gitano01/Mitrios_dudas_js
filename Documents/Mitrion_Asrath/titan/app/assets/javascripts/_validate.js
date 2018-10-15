$("#new_usuario").validate({
    //error place
    errorPlacement: function (error, element) {
        error.insertBefore(element);
    },
//adding rule
    rules: {
        // El nombre de usuario debe introducirse
        "user[usrname]":{
            required: true,

        },
        // el email debe ser reportado
        "user[email]": {
            required: true,
            email: true
        },
        // password requerida
        "user[password]": {
            required: true
        },
        // password conf requerida
        "user[password_confirmation]": {
            required: true,
            equalTo: "#user_password"
        },
        // introduction is optional with maxlenght 500
        "user[password_confirmation]": {
            maxlength: 500
        }
    },
    // error messages
    messages: {
        username:{
            required: "El nombre de usuario es requerido",

        },
        mail:{
            required: "Email requerido",
            email: "Por favor introduzca una direeción de correo"
        },
        password: {
            required: "la contraseña es requerida"
        },
        password_confirmation: {
            required: "Se requiere confirmar la contraseña",
            equalTo: "Ambas contraseñas deben ser iguales"
        }
    }
});