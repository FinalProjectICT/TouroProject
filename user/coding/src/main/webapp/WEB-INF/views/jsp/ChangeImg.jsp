<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="rica" />
    <meta name="keywords" content="rica" />
    <meta name="author" content="rica" />
    <link rel="icon" href="../assets/images/favicon.png" type="image/x-icon" />
    <title>Rica</title>

    <!--Google font-->
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap"
      rel="stylesheet"
    />

    <!-- Icons -->
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/font-awesome.css"
    />

    <!-- Animation -->
    <link rel="stylesheet" type="text/css" href="../assets/css/animate.css" />

    <!--Slick slider css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/slick.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/slick-theme.css"
    />

    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/color1.css" />

    <!-- fileupload css-->
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/fileupload.css"
    />
  </head>

<style>
    /* 추가된 스타일 */
    .image-section {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center; /* 중앙 정렬을 위한 추가 */
        text-align: center;
        margin-bottom: 20px;
    }

    .image-section img {
        max-width: 100%;
        height: auto;
    }

    .button-section {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-top: 10px;
    }

    .button-section button {
        margin-top: 10px;
    }

    .image-container { /* 수정된 부분 */
        width: 50%;
        margin-right: 10px;
    }
</style>

<body>

<!-- header start -->
<header class="light_header">
  <h2>헤더</h2>
</header>
<!--  header end -->

<!-- 이미지 선택 폼 및 결과 표시 영역 -->
<div class="image-section">
    <div class="image-container">
        <h2>선택한 이미지</h2>
        <img src="" alt="Selected Image" id="selected-image">
    </div>

    <form action="/upload" method="post" enctype="multipart/form-data" id="upload-form">
        <div class="image-section">
            <div class="image-container">
                <label for="image">이미지 선택:</label>
                <input type="file" name="image" accept="image/*" id="image" onchange="previewImage()">
            </div>

            <div class="image-container">
                <label for="style">스타일 선택:</label>
                <select name="style" id="style">
                    <option value="Hayao">Hayao</option>
                    <option value="Hosoda">Hosoda</option>
                    <option value="Paprika">Paprika</option>
                    <option value="Shinkai">Shinkai</option>
                </select>
            </div>
        </div>

        <div class="button-section">
            <button type="submit">변환</button>
        </div>
    </form>

    <div class="image-container">
        <h2>변환된 이미지</h2>
        <img src="" alt="Cartoonized Image" id="result-image">

        <!-- 이미지 다운로드 버튼-->
        <a id="download-button" style="display: none; margin-top: 10px;">이미지 다운로드</a>
    </div>
</div>


  <!-- 푸터 -->
  <footer>
    <h2>푸터</h2>
  </footer>

<!-- Axios 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<!-- 파일 선택 후 미리보기 기능을 위한 스크립트 -->
<script>
  function previewImage() {
      var selectedImage = document.getElementById('selected-image');
      var imageInput = document.getElementById('image');

      var file = imageInput.files[0];
      if (file) {
          var reader = new FileReader();
          reader.onload = function (e) {
              selectedImage.src = e.target.result;
          };
          reader.readAsDataURL(file);
      }
  }
</script>

<!-- 파일 업로드 및 이미지 표시를 위한 스크립트 -->
<script>
  document.addEventListener('DOMContentLoaded', function () {
      document.getElementById('upload-form').addEventListener('submit', function (e) {
          e.preventDefault();

          var imageFile = document.getElementById('image').files[0];
          var selectedStyle = document.getElementById('style').value;

          var formData = new FormData();
          formData.append('image', imageFile);
          formData.append('style', selectedStyle);

          axios.post('http://localhost:5050/upload', formData)
              .then(function (response) {
                  var resultImageData = response.data.result_image;
                  var resultImageElement = document.getElementById('result-image');
                  resultImageElement.src = 'data:image/jpeg;base64,' + resultImageData;
                  resultImageElement.style.display = 'block';

                  // 이미지 다운로드 버튼 생성
                  var downloadButton = document.createElement('a');
                  downloadButton.href = 'data:image/jpeg;base64,' + resultImageData;
                  downloadButton.download = 'cartoonized_image.jpg';
                  downloadButton.textContent = '이미지 다운로드';
                  downloadButton.style.display = 'block';
                  downloadButton.style.marginTop = '10px';
                  downloadButton.addEventListener('click', function() {
                      document.body.removeChild(downloadButton);
                  });
                  document.body.appendChild(downloadButton);
              })
              .catch(function (error) {
                  console.error('Error during image upload:', error);
              });
      });
  });
</script>
</body>
</html>