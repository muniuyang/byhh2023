$(function(){
	if($('body').find('img.lazyload').length > 0) {
		$("img.lazyload").lazyLoad();
	}
});

function pageBack()
{
	window.history.back();
}
