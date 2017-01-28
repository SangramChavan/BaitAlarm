function resetDefaultSuggestion() {
  chrome.omnibox.setDefaultSuggestion({
    description: 'WEB: Anti Phishing Plugin %s'
  });
}

resetDefaultSuggestion();

chrome.omnibox.onInputChanged.addListener(function(text, suggest) {
  // Suggestion code will end up here.
});

chrome.omnibox.onInputCancelled.addListener(function() {
  resetDefaultSuggestion();
});
function IsURL(url) {

  if (url.indexOf("http://") == 0) {
	  return true;
	  }
     if (url.indexOf("https://") == 0) {
	 	  return true;
	  }

	  return false;
 }

function navigate(url) {
  chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
    chrome.tabs.update(tabs[0].id, {url: url});
  });
}

chrome.omnibox.onInputEntered.addListener(function(text) {
  //navigate("http://192.168.0.101:8080/WebClustering/pages/search.jsp?search=Search&searchId=" + text);
if(IsURL(text)){
var xhr = new XMLHttpRequest();
u='http://192.168.0.101:8080/BaitAlarms';
xhr.open("GET", u+"/check.jsp?url="+encodeURI(text), true);

xhr.onreadystatechange = function() {
  if (xhr.readyState == 4&& xhr.status == 200) {
    // WARNING! Might be evaluating an evil script!

var ret=xhr.responseText.trim();
msg='';
if(ret==1){
	msg='Site is Phishing Site. We recommend you not to access the site.';
}else if(ret==2){
	msg='Site is Malware Site. We recommend you not to access the site. ';
}else if(ret==3){
	msg='Site is Phishing and Malware Site. We recommend you not to access the site. ';
}

	if(ret>-1){
			msg+="\n\nClick OK if you want to continue?";
			//if(confirm(msg)){
				u='http://192.168.0.101:8080/BaitAlarms/phishing.jsp?url='+encodeURI(text);
				navigate(u);
			//}
	}else{
		navigate(text);
	}
  }
}
xhr.send();

}else{
	alert('Please enter an appropriate URL.');
}
});

