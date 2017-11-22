var url = window.location.href; 
var projectLink = document.querySelectorAll(".tableRow")[2];
var aboutMeLink = document.querySelectorAll(".tableRow")[5];

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

if (url.includes("me")) {
	displayAboutMe();
} else {
	displayProjects();
}