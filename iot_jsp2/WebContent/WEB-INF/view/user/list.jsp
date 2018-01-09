<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=rootPath%>/ui/css/list.css" />
<body>
	<jsp:include page="/WEB-INF/view/common/header.jspf" flush="false" />
<br>
	<div class="container">
	    <div class="row">
	    
	        <div class="col-md-10 col-md-offset-1">
	
	            <div class="panel panel-default panel-table">
	              <div class="panel-heading">
	                <div class="row">
	                  <div class="col col-xs-6">
	                    <h3 class="panel-title">User List</h3>
	                  </div>
	                  <div class="col col-xs-6 text-right">
	                  	<input type="text" class="input">
	                    <button type="button" class="btn btn-sm btn-primary btn-create">검색</button>
	                  </div>
	                </div>
	              </div>
	                <div class="panel-body">
	                <table id="grid1" data-key="uiNo" class="table table-striped table-bordered table-list">
	                  	<thead>
		                    <tr> 
		                        <th class="text-center" data-field="uiNo,ro">번호</th>  
		                        <th class="text-center" data-field="uiName,txt">이름</th>
		                        <th class="text-center" data-field="uiAge,txt">나이</th>
		                        <th class="text-center" data-field="uiRegdate,ro">가입일자</th>
		                        <th class="text-center" data-field="uiId,ro">ID</th>		                        
		                        <th class="text-center" data-field="address,txt">주소</th>
		                        <th class="text-center" data-field="BTN"><em class="glyphicon glyphicon-asterisk"></em></th> 
		                    </tr>  
	                  	</thead>
	                  	<tbody id="result_tb">
						</tbody>
	                </table>
	              </div>
	            </div>
			</div>
		</div>
	</div>
</body>
<script>
                                              
function deleteUser(uiNo) {
	var isDelete = confirm("진짜 지우게?");
	var param = "uiNo=" + uiNo;
	if(isDelete) { 
		$.ajax({url : '/user/delete',
			type : 'post',
			data : param,
			dataType:'json',
			success:function(res){
				alert(res.msg);
				if(res.result=='ok') {
					location.reload(); 
				}
			},
			error:function(xhr,status,error){
			}
		})
	}
}
function updateUser(uiNo) {
	var uiName = $("#uiName" + uiNo).val().trim();
	var uiAge = $("#uiAge" + uiNo).val().trim();
	var address = $("#address" + uiNo).val().trim();
    var param={uiNo:uiNo, uiName:uiName, uiAge:uiAge, address:address};
	param = "param=" + JSON.stringify(param);
	$.ajax({url : '/user/update',
		type : 'post',
		data : param,
		dataType:'json',
		success:function(res){
			alert(res.msg);
			if(res.result=='ok') {
				location.reload();
	       	 }
         },
         error:function(xhr,status,error) {
         }
    })
} 
var colsInfo = []; 
$(document).ready(function(){
	var colList = $("#grid1 th[data-field]");
	for(var i=0; i<colList.length; i++) {
		colsInfo.push(colList[i].getAttribute("data-field"));
	}
	var keyCol = $("#grid1").attr("data-key"); 
	
	$.ajax({
		url : '/user/list',
		type : 'get',
		success:function(res){
			var list = JSON.parse(res);
			var str ="";
			for(var uc of list){
				var key = uc[keyCol];
				str +="<tr>";
				for(var field of colsInfo){				
				  str += "<td class='text-center'>";
				  if(field=="BTN") {
					  str += '<a class="btn btn-default" onclick="updateUser(' + key + ')"><em class="glyphicon glyphicon-refresh"</a>';
				      str += '<a class="btn btn-danger" onclick="deleteUser(' + key + ')"><em class="glyphicon glyphicon-trash"</a>';				       
				  }else{
					  var colName = field.split(",")[0];
					  var colType = field.split(",")[1]; //콤마를 기준으로 배열을 만들어주는 것입니다. 이건 뭐냐면. (33번 라인부터의 데이터들을)
					  if(colType=="ro") {
						  str += uc[colName];
					  }else{
						  
					  }
				      str += "<input type='text' class='form-control' id='" + colName + key + "' value='" + uc[colName] + "'>"; //인풋타입을 준것. ([field]) -> 이제 필드타입을 줄 거에오.
				                                                      // 요부분 <<- 아이디의 로우값을 주는 것. (예를들어 1번 유저의 이름값 - uiname1, 나이는 uiage1, 주소는 address1.)
				      				      
				      
			      }
				  str += "</td>";
				}	
			    str += "</tr>";
		    }
			$("#result_tb").html(str);
		},
		error:function(xhr,status,error){
			
		}
	});
	
});
</script>
</html>