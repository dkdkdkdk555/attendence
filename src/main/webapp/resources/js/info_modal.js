// 모달열기
function show(msg) {
  $('.background').attr('class', 'background show');
  $('#alertMsg').text(msg);
}

//모달닫기
function closer() {
  $('.background').attr('class', 'background');
}

//$('#confirmBtn').on('click',function(){
//	closer();
//});
