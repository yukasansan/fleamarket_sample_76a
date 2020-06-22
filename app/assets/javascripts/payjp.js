$(function() {
  
  $("#token_submit").on("click", function(e) {
    e.preventDefault();
    Payjp.setPublicKey("pk_test_2bb73c99988d60ce0dac5864");

    let card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val()
    };
    Payjp.createToken(card, function(status, response) {
      if (status === 200) {
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#token_submit").append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        );
        $("#charge-form")[0].submit();
        alert("登録が完了しました");
      } else {
        alert("カード情報が正しくありません。");
        $("#token_submit").prop('disabled', false);
      }
    });
  });
});