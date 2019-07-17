    function refresh() {  
        //IE存在缓存,需要new Date()实现更换路径的作用  
        document.getElementById("image").src="createImageAction.action?+ Math.random()"+new Date();  
    }  
    function login(){
    	var $name=$("#name");
    	var $psw=$("#psw");
    	var $code=$("#code");
    	
    	if($name.val()==""||$psw.val()==""||$code.val()=="" ){
    		return false;
    	}else{
    		return true;
    	}
    }