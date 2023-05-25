const list = document.querySelector('.slide__list');
const items = document.querySelectorAll('.slide__item');
const lastIndex = items.length-1;
let selected = 0;
let interval;

    // Util Functions
    const setTransition = (value) => {
      list.style.transition = value;
    };

    const setTranslate = ({ index, reset }) => {
      if (reset) list.style.transform = `translate(0, 0)`;
      else list.style.transform = `translate(-${(index) * list.clientWidth}px, 0)`;
    };


    // <-- 나머지 함수는 여기부터 작성해 주세요!
     // Clone the first and last elements.
    /*const cloneElement = () => {
      list.append(items[0].cloneNode(true));
      setTranslate({ reset: true });
    };*/
    
    // Automatically play the slide
	const autoplayIterator = () => {
	  selected += 1;
	  setTransition('all 4s');
	  setTranslate({ index: selected });
	  if (selected >= lastIndex) {
	    clearInterval(interval);
	    setTimeout(() => {
	      selected = 0;
	      setTransition('all 4s');
	      setTranslate({ reset: true });
	      autoplay({ duration: 4000 });
	    }, 4000);
	  }
	};
	
	const autoplay = ({ duration }) => {
	  interval = setInterval(autoplayIterator, duration);
	};

    
    const render = () => {
      // makeButton();
      //makePagination();
      autoplay({ duration: 4000 });
      /*cloneElement();*/
    };
    
	
    render();