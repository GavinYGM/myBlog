    function refresh() {  
        //IE存在缓存,需要new Date()实现更换路径的作用  
        document.getElementById("image").src="createImageAction.action?+ Math.random()"+new Date();  
    }  
     $(document).ready(function(){
         //绑定失去焦点事件
			
         $("#name").blur(checkName);
         $("#psw").blur(checkPass);
         $("#repsw").blur(checkRePass);
        
     })

      //验证姓名
      function checkName() {
          var $name = $("#name");
          if ($name.val() == "") {
              return false;
          }
          if (($name.val().length < 6)||!judgeName($name.val())) {
              return false;
          }
          return true;
      }
      //验证姓名格式
      function judgeName(str){
      		return (/^[a-z]+[A-Za-z0-9]+$/.test(str)); 
      }
      
      //验证输入密码
      function checkPass() {
          var $psw = $("#psw");
          var $Divpsw = $("#DivPsw");
          $Divpsw.html("");
          if ($psw.val() == "") {
              $Divpsw.html("密码不能为空");
              return false;
          }
          if (($psw.val().length < 6||$psw.val().length>10)||!jugde($psw.val())) {
              $Divpsw.html("密码必须6~10个数字");
              return false;
          }
          return true;
      }
      //验证是否全是数字
      function jugde(str){
      		return (/^\d+$/.test(str)); 
      }
      //验证重复密码
      function checkRePass() {
          var $psw = $("#psw"); //输入密码
          var $repsw = $("#repsw");  //再次输入密码
          var $divID = $("#DivRepsw");
          $divID.html("");
          if ($psw.val() != $repsw.val()) {
              $divID.html("两次输入的密码不一致");
              return false;
          }
          return true;
      }
      var flag = true;
    //验证验证码
      function checkCode1() {
    	  flag=true;
    	  var code=$("#code").val();
        //AJAX异步表单验证
			$.ajax({
				url:"ajax.action",
				type:"post",	//post请求
				async:"false",	//异步
				data:{"code":code,"type":2},
				dataType:"text",	//数据格式为文本格式
				success:function(result){
					$("#DivCode").text(result);
					if(result =="验证码不能为空！！！"||result=="验证码错误！！！"){
						flag=false;
					}
				}
			});
      }
      
      function jugdesub(){
    	  	loginAjax();
    	  	checkCode1();
            if (!checkName()) flag = false;
            if (!checkPass()) flag = false;
            if (!checkRePass()) flag = false;
            return flag;
      }
      function loginAjax(){
    		var name = $("#name").val();
    		
    		//AJAX异步表单验证
    			$.ajax({
    				url:"ajax.action",
    				type:"post",	//post请求
    				async:"false",	//异步
    				data:{"name":name,"type":1},
    				dataType:"text",	//数据格式为文本格式
    				success:function(result){
    					$("#Divname").text(result);
    				}
    			});
    	}