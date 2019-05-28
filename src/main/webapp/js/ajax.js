// 1.�õ�XMLHttpRequest����

function getXMLHttpRequest() {

	try {// ��IE�����

		return new XMLHttpRequest();

	} catch (e) {

		try {// ie�Ͱ汾

			return new AcitveXObject("Microsoft.XMLHTTP");

		} catch (e) {

			try {// ie�߰汾��

				return new ActiveXObject("Msxml2.XMLHTTP");

			} catch (e) {

				// ������һ�㲻�ᷢ��

			alert("���ǣ����õ��������ʲô���뻻һ����");
			
			throw e;
			}
		}
	}
}
  //��װһ��ajax�ķ���
  //1.����ʽ method get post
  //2.�����ַ url
  //3.�Ƿ��첽 ansy true
  //4.����  params
  //5.������������ type
  //6.�ɹ�֮����ķ��� success()
  //����������������һ��������
  /*
   *{
   *method:"POST",
   *url:"TESTServlet",
   *ansy:true,
   *params:"action",
   *type:"xml",
   *success:function(){
   *
   *  }
   *
   *}
   *
   *
   */
//opt
       function ajax(opt) {
     
    //1.�õ�����
	var http = getXMLHttpRequest();

	//2.������	
	//methodĬ�ϲ����Ļ����Ҿ���get����
	if (!opt.method) {

		opt.method = "GET";
	}

	//ansyһ�㶼���첽
	if (opt.ansy == undefined) {

		opt.ansy = true;
	}
	
	http.open(opt.method, opt.url, opt.ansy);
	
	//3.��������
	//�����post���󣬷���ͷ��Ϣ	
	if (opt.method == "POST") {

		http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	}
	
	http.send(opt.params);
	
	// ����������Ӧ�ı仯
    http.onreadystatechange = function() {

		if (http.readyState == 4 && http.status == 200) {

			var data;

			//���type���Ͳ���������Ĭ�Ͼ����ַ���
			if (!opt.type) {

				data = http.responseText;

			} else if (opt.type == "text") {//������ͨ�ַ���

				data = http.responseText;

			} else if (opt.type == "xml") {

				data = http.responseXML;

			} else if (opt.type == "json") {

				var content = http.responseText;

				data = eval("(" + content + ")");
			}
          
			//����success������
			opt.success(data);
		}
	}

}

