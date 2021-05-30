function createDiv(){
    var bodytag = document.getElementsByTagName('body')[0];
    var div = document.createElement('div');
    div.setAttribute('id','wapiti-xss');
    div.setAttribute('style', 'background-color: black; width: 99%; padding: 1px; margin: 1px; font-family: "Open sans", sans-serif; font-weight: 600; font-size: 12px; color: rgb(116, 223, 0);');
    div.innerHTML = '<p> &#9888; XSS vulnerability found BY  <a href="http://github.com/BDhaCkers009">BDhaCkers009</a>.  <a href="javascript:void(0);" onclick="removeMe();">&#10008;</a></p>';
    bodytag.insertBefore(div,bodytag.firstChild);
}
 
window.onload = function(){
    createDiv(); 
}

function removeMe(){
	var element = document.getElementById('wapiti-xss');
	element.parentNode.removeChild(element);
}
