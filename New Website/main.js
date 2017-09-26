var projectLink = document.getElementsByClassName("tableRow center")[2];
var aboutMeLink = document.getElementsByClassName("tableRow center")[5];

var iframeContent = document.getElementById("iframe");

function displayProjects() {
	iframeContent.src = "projects.html";
	projectLink.className = "tableRow center current";
	aboutMeLink.className = "tableRow center";
}

function displayAboutMe() {
	iframeContent.src = "aboutMe.html";
	projectLink.className = "tableRow center";
	aboutMeLink.className = "tableRow center current";
}

var current = document.getElementsByClassName("current")[0].click();