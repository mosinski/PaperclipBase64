$(document).ready(function() {
  function getBase64(file) {
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (e) {
      $("#product_image").val(reader.result);
      $('#preview').attr('src', e.target.result);
    };
    reader.onerror = function (error) {
      console.log('Error: ', error);
    };
  }

  $(document).on('change', '#image', function() {
    getBase64(this.files[0]);
  });
});
