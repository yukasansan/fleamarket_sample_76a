$(function(){
  $('#delete__btn').click(function(){
    if(window.confirm('本当に削除しますか？')){
      location.href = 'index.html';
    }else{
      return false;
    }
  });
});