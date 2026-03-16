<div class="row mx-0 mt-3 mb-5">
<div class="col-12 col-md-4 row mx-0">
	<div class="faq-menu">
		<a href="#" class="d-inline-block col-12 js-faq-menu-toggle" data-faq-section="1">Carteles</a>
		<a href="#" class="d-inline-block col-12 js-faq-menu-toggle" data-faq-section="2">Banderas y Fly Banners</a>
		<a href="#" class="d-inline-block col-12 js-faq-menu-toggle" data-faq-section="3">Calcos Disuasivos</a>
		<a href="#" class="d-inline-block col-12 js-faq-menu-toggle" data-faq-section="4">Kits de calcos para Bicicletas</a>
		<a href="#" class="d-inline-block col-12 js-faq-menu-toggle" data-faq-section="5">Calendarios, Reglas y Material POP</a>
		<a href="#" class="d-inline-block col-12 js-faq-menu-toggle" data-faq-section="6">Banners, Carpas y Parasoles</a>
		<a href="#" class="d-inline-block col-12 js-faq-menu-toggle" data-faq-section="7">Generales </a>
	</div>
</div>

<div class="col-12 col-md-8">
<div class="title-content pt-4 pt-md-0 pb-md-3 pb-">
	<div class="custom-separator pr-4 mb-2">
		<div class="custom-separator-highlight"></div>
	</div>
	<h2 class="question-section-title">Carteles</h2>
</div>
{{page.content}}
</div>
</div>
<script>
	document.addEventListener('DOMContentLoaded', () => {
		const faqSections = document.querySelectorAll(".question-section");
		const faqSectionsMenu = document.querySelectorAll(".faq-menu .js-faq-menu-toggle");

		function hideAllFaqSectionsExcept(sectionIdNumber) {
			faqSections.forEach(f => {
				if(f.id === "faq-question-section-"+sectionIdNumber){
					f.style.display = "block";
				} else {
					f.style.display = "none";
				}
			})
		}

		faqSectionsMenu.forEach(m => {
			m.addEventListener("click", (e) => {
				let menuItem = e.currentTarget;
				console.log(menuItem);
				let sectionIdNumber = menuItem.dataset.faqSection;
				let textContentItem = menuItem.textContent;
				hideAllFaqSectionsExcept(sectionIdNumber);
				let textTitle = document.querySelector('.question-section-title');
				textTitle.textContent = textContentItem;
			})
		})

		let faq = document.querySelectorAll(".question-section .js-accordion-container").forEach(f => {
			let inactiveIcon = f.querySelector(".js-accordion-toggle-inactive");
			let activeIcon = f.querySelector(".js-accordion-toggle-active");
			let content = f.querySelector(".js-accordion-content");

			inactiveIcon.innerHTML = '<svg class="icon-inline icon-lg mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512"><path d="M24.707 38.101L4.908 57.899c-4.686 4.686-4.686 12.284 0 16.971L185.607 256 4.908 437.13c-4.686 4.686-4.686 12.284 0 16.971L24.707 473.9c4.686 4.686 12.284 4.686 16.971 0l209.414-209.414c4.686-4.686 4.686-12.284 0-16.971L41.678 38.101c-4.687-4.687-12.285-4.687-16.971 0z"></path></svg>';
			activeIcon.innerHTML = '<svg class="icon-inline icon-lg mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M441.9 167.3l-19.8-19.8c-4.7-4.7-12.3-4.7-17 0L224 328.2 42.9 147.5c-4.7-4.7-12.3-4.7-17 0L6.1 167.3c-4.7 4.7-4.7 12.3 0 17l209.4 209.4c4.7 4.7 12.3 4.7 17 0l209.4-209.4c4.7-4.7 4.7-12.3 0-17z"></path></svg>';
			activeIcon.style.display = "none";
			content.style.display = "none";

			let toggleIcons = f.querySelector(".toggle-icons");
			let toggleText = f.querySelector(".toggle-text");
			let toggleAnchor = document.createElement("a");

			toggleAnchor.href = "#";
			toggleAnchor.classList.add("js-accordion-toggle","py-1","row");
			toggleIcons.parentNode.insertBefore(toggleAnchor, toggleIcons);
			toggleAnchor.appendChild(toggleIcons);
			toggleAnchor.appendChild(toggleText);
		})
		
		hideAllFaqSectionsExcept(1);
	});
</script>

<style>
	.js-faq-menu-toggle {
		font-size: var(--font-big);
		font-weight: 400;
    	line-height: 29px;
		color: #8C8C8C;
	}

	.js-faq-menu-toggle.active {
		font-weight: 700;
		color: var(--main-foreground);
	}

	.title-content {
		.custom-separator {
			height: 3px;
			width: 100%;
			background-color: #D9D9D9;
			border-radius: 2px;
		}

		.custom-separator-highlight {
			height: 100%;
			width: 15%;
			background-color: var(--main-foreground);
		}

		.question-section-title {
			font-size: var(--h3);
			font-weight: 400;
		}

	}
	
	.js-accordion-container .toggle-text {
		font-size: var(--font-base) !important;
		font-weight: 300;
	}

</style>