$(document).on "ajax:beforeSend", "#emails-form", ()->
	$("#email-info").html "Se esta procesado tu peticion"
$(document).on "ajax:success", "#emails-form", (e,data,estado,xhr)->
	$(this).slideUp()
	$("#email-info").html "Ya estas en la lista de las invitaciones beta"
$(document).on "ajax:error", "#emails-form", (e,data,estado,xhr)->
	$("#email-info").html data.responseJSON.email[0]
