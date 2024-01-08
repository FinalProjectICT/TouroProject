$(document).ready(function(){
    var fileTarget = $('.center-content .upload-hidden');
  
    fileTarget.on('change', function(){  // 값이 변경되면
      if(window.FileReader){  // modern browser
        var filename = $(this)[0].files[0].name;
      } 
      else {  // old IE
        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
      }
      
      // 추출한 파일명 삽입
      $(this).siblings('.upload-name').val(filename);
    });
    

    var fileTarget1 = $('.upload-hidden1');
    var fileTarget2 = $('.upload-hidden2');
    var fileTarget3 = $('.upload-hidden3');
    
    fileTarget1.on('change', function(){
        var filename = getFileInputName($(this));
        $(this).siblings('.upload-name1').val(filename);
    });
  
    fileTarget2.on('change', function(){
        var filename = getFileInputName($(this));
        $(this).siblings('.upload-name2').val(filename);
    });
  
    fileTarget3.on('change', function(){
        var filename = getFileInputName($(this));
        $(this).siblings('.upload-name3').val(filename);
    });
  
    function getFileInputName(input) {
        if (window.FileReader) {
            return input[0].files[0].name;
        } else {
            return input.val().split('/').pop().split('\\').pop();
        }
    }


    
  }); 
