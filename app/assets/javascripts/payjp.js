$(function() {
  
  $("#token_submit").on("click", function(e) {
    e.preventDefault();
    Payjp.setPublicKey("pk_test_2bb73c99988d60ce0dac5864");

    // 入力されたカード情報をcardに代入
    var card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val()
    };
    Payjp.createToken(card, function(status, response) {
      console.log(response.id)
      if (status === 200) {
        $("#card_number").removeAttr("name");
        console.log($("#card_number").removeAttr("name"));
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        $("#token_submit").append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        ); //トークンを送信できるように隠しタグを生成
        $("#charge-form")[0].submit();
        alert("登録が完了しました");
      } else {
        alert("カード情報が正しくありません。");
        $("#token_submit").prop('disabled', false);
      }
    });
  });
});