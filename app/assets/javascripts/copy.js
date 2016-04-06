$(document).ready(function(){
    $('#btn_copy').on('click', function(){
        copyToClipboard($('#copy_target'));
        Materialize.toast("Copied succesfully to clipboard!", 3000)
    })  
})

function copyToClipboard(element) {
  var $temp = $("<input>");
  $("body").append($temp);
  $temp.val($(element).text()).select();
  document.execCommand("copy");
  $temp.remove();
}


