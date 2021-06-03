/**
 * 
 */
function doLike(pid, uid){
	//console.log(pid+","+uid);
	
	const d ={
		uid: uid,
		pid: pid
		//operation: 'like'
	}
	$.ajax({
		url: "LikeServlet",
		data: d,
		success: function(data, textStatus, jqXHR){
			if(data.trim()=='liked'){
				let c = $('.likecounter'+pid).html();
				c++;
				$('.likecounter'+pid).html(c);
				$('#likebtn'+pid).removeClass("btn-outline-dark");
				$('#likebtn'+pid).addClass("btn-outline-light");
				
			}
			else if(data.trim()=='unliked'){
				let c = $('.likecounter'+pid).html();
				c--;
				$('.likecounter'+pid).html(c);
				$('#likebtn'+pid).removeClass("btn-outline-light");
				$('#likebtn'+pid).addClass("btn-outline-dark");
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(data);
		}
	})
}
