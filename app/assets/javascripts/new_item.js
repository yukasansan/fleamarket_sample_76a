$(function(){
  let fileIndex = 1
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div class="js-file_group" data-index="${num}">
                    <input class="js-file" type="file" style="display:none"
                    name="item[item_images_attributes][${num}][image]"
                    id="camera[${num}]">
                  </div>`
    fileIndex += 1
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<div class="preview">
                    <img data-index="${index}" src="${url}" width="100px" height="100px" style="margin-right: 18px;" >
                    <label for='camera[${index + 1}]'><i class="fa fa-camera"></i></label>
                    <span class="js-remove">削除</span>
                    </img>
                  </div>`
    return html;
  }

  $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file)
    console.log(blobUrl)

    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));

    if($(".js-file_group").length >= 10 ){
      return false;
    } else {
    // fileIndexの先頭の数字を使ってinputを作る
      $('#image-box').append(buildFileField(fileIndex));
    }
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    let limitFileField = $(".js-file_group:last").data("index");
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    if ((targetIndex == limitFileField ) || ($(".js-file_group").length >= 9)) ($('#image-box').append(buildFileField(fileIndex[0])));
  });

  $('.new-camera').on('click', function(){
    $('.js-file').click();
    $('.js-file').change(function() {
      $('.new-camera').hide();
    });
  });

  $('#item_price').on("input", function() {
    let input = $("#item_price").val();
    let priceFix = Math.round(input * 0.1)
    let profit = input - priceFix

    $('.selling-fee__zero').html(priceFix)
    // 手数料に￥をつける
    $('.selling-fee__zero').prepend('¥')
    $('.selling-profit__zero').html(profit)
    // 販売利益に￥をつける
    $('.selling-profit__zero').prepend('¥')
  });
});



