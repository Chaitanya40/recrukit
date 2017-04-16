$(document).ready(function(){
	$("#assign-button").click(function(){
		var req_inputs = $("input[name='req_ids[]']:checked");
		var rec_inputs = $("input[name='rec_ids[]']:checked");
		if(req_inputs.length==0 || rec_inputs.length == 0){
			console.log("Cannot assign");
			toastr.warning("","Select atleast one requirement and recruiter");
		}
		else{

			console.log("Can be assigned");
			var req_ids = req_inputs.map(function(){
      	return $(this).val();
    	}).get();
    	

    	var rec_ids = rec_inputs.map(function(){
      	return $(this).val();
    	}).get();
      console.log(req_ids);
      console.log(rec_ids);
      $.ajax({
      	type: "POST",
      	url: "http://localhost:3000/manager/requirements/assign",
      	data: {rec_ids: rec_ids, req_ids: req_ids}, 
      	success: function(result){
      		if(result["message"] == "Success"){
      			toastr.success("","Requirements created successfully");
      		}
      		else{
      			toastr.error("","Error creating requirements");
      		} 
      	}});
			}
	});



});