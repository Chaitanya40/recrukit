
$(document).ready(function() {
  $("#emailButton").click(function(){
  	req_id = $("#requirement_id").val();
  	sub_id = $("#submission_id").val();
  	$.ajax({
  		type: "POST",
  		url: "http://localhost:3000/manager/requirements/"+req_id+"/submissions/send_email",
  		data: {req_id: req_id, sub_id: sub_id},
  		success: function(result){
  			if(result["message"]=="Success"){
  				toastr.success("","Email sent successfully");
  			}else{
  				toastr.error("","Error sending email");
  			}

  		}
  	});

  });
});