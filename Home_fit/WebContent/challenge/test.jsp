<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
<script>
class CitiesSlider extends React.Component {
	  constructor(props) {
	    super(props);
	    
	    this.IMAGE_PARTS = 4;
	    
	    this.changeTO = null;
	    this.AUTOCHANGE_TIME = 4000;
	    
	    this.state = { activeSlide: -1, prevSlide: -1, sliderReady: false };
	  }
	  
	  componentWillUnmount() {
	    window.clearTimeout(this.changeTO);
	  }
	  
	  componentDidMount() {
	    this.runAutochangeTO();
	    setTimeout(() => {
	      this.setState({ activeSlide: 0, sliderReady: true });
	    }, 0);
	  }
	  
	  runAutochangeTO() {
	    this.changeTO = setTimeout(() => {
	      this.changeSlides(1);
	      this.runAutochangeTO();
	    }, this.AUTOCHANGE_TIME);
	  }
	  
	  changeSlides(change) {
	    window.clearTimeout(this.changeTO);
	    const { length } = this.props.slides;
	    const prevSlide = this.state.activeSlide;
	    let activeSlide = prevSlide + change;
	    if (activeSlide < 0) activeSlide = length - 1;
	    if (activeSlide >= length) activeSlide = 0;
	    this.setState({ activeSlide, prevSlide });
	  }
	  
	  render() {
	    const { activeSlide, prevSlide, sliderReady } = this.state;
	    return (
	      <div className={classNames('slider', { 's--ready': sliderReady })}>
	        <p className="slider__top-heading">Travelers</p>
	        <div className="slider__slides">
	          {this.props.slides.map((slide, index) => (
	            <div
	              className={classNames('slider__slide', { 's--active': activeSlide === index, 's--prev': prevSlide === index  })}
	              key={slide.city}
	              >
	              <div className="slider__slide-content">
	                <h3 className="slider__slide-subheading">{slide.country || slide.city}</h3>
	                <h2 className="slider__slide-heading">
	                  {slide.city.split('').map(l => <span>{l}</span>)}
	                </h2>
	                <p className="slider__slide-readmore">read more</p>
	              </div>
	              <div className="slider__slide-parts">
	                {[...Array(this.IMAGE_PARTS).fill()].map((x, i) => (
	                  <div className="slider__slide-part" key={i}>
	                    <div className="slider__slide-part-inner" style={{ backgroundImage: `url(${slide.img})` }} />
	                  </div>
	                ))}
	              </div>
	            </div>
	          ))}
	        </div>
	        <div className="slider__control" onClick={() => this.changeSlides(-1)} />
	        <div className="slider__control slider__control--right" onClick={() => this.changeSlides(1)} />
	      </div>
	    );
	  }
	}

	const slides = [
	  {
	    city: 'Paris',
	    country: 'France',
	    img: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/paris.jpg',
	  },
	  {
	    city: 'Singapore',
	    img: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/singapore.jpg',
	  },
	  {
	    city: 'Prague',
	    country: 'Czech Republic',
	    img: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/prague.jpg',
	  },
	  {
	    city: 'Amsterdam',
	    country: 'Netherlands',
	    img: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/amsterdam.jpg',
	  },
	  {
	    city: 'Moscow',
	    country: 'Russia',
	    img: 'https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/moscow.jpg',
	  },
	];

	ReactDOM.render(<CitiesSlider slides={slides} />, document.querySelector('#app'));
</script>
<style>
*, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: 'Roboto', Helvetica, Arial, sans-serif;
  background: #000;
}

$numOfParts: 4;
$animTime: 1s;
$stagger: 0.08s;
$sliderReadyTrans: all $animTime/2 $animTime;
$maxLettersStagger: 6;
$letterStagger: 0.1s;

.slider {
  overflow: hidden;
  position: relative;
  height: 100vh;
  color: #fff;
  
  @mixin sliderReady {
    .slider.s--ready & {
      @content;
    }
  }

  &__top-heading {
    z-index: $numOfParts*3;
    position: absolute;
    left: 0;
    top: 100px;
    width: 100%;
    text-align: center;
    font-size: 16px;
    text-transform: uppercase;
    letter-spacing: 2.5px;
    transition: $sliderReadyTrans;
    transform: translateY(-30px);
    opacity: 0;
    
    @include sliderReady {
      transform: translateY(0);
      opacity: 1;
    }
  }

  &__slides {
    position: relative;
    height: 100%;
  }

  &__slide {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;

    &.s--active {
      pointer-events: auto;
    }
    
    @mixin slidePrev {
      .slider__slide.s--prev & {
        @content;
      }
    }

    @mixin slideActive {
      .slider__slide.s--active & {
        @content;
      }
    }

    &-content {
      z-index: $numOfParts + 2;;
      position: relative;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      height: 100%;
      text-transform: uppercase;
      line-height: 1;
    }
    
    @mixin subTextsActiveSlide {
      opacity: 0;
      transition: $animTime/2;
      
      @include slideActive {
        transition-delay: $animTime*0.65;
        opacity: 1;
        transform: translateY(0);
      }
    }

    &-subheading {
      margin-bottom: 20px;
      font-size: 24px;
      letter-spacing: 2px;
      transform: translateY(20px);
      
      @include subTextsActiveSlide;
    }

    &-heading {
      $fontSize: 60px;
      
      display: flex;
      margin-bottom: 20px;
      font-size: $fontSize;
      letter-spacing: 12px;
      
      span {
        display: block;
        opacity: 0;
        transform: translateY($fontSize*-1);
        transition: all $animTime/3;
        
        @include slidePrev {
          transform: translateY($fontSize)
        }
        
        @include slideActive {
          opacity: 1;
          transform: translateY(0);
        }
        
        @for $i from 1 through $maxLettersStagger {
          &:nth-child(${$i}) {
            $delay: $letterStagger * ($i - 1);
            
            transition-delay: $delay;
            
            @include slideActive {
              transition-delay: $delay + $animTime/3;
            }
          }
        }
        
        &:nth-child(n+${$maxLettersStagger + 1}) {
          $delay: $letterStagger * $maxLettersStagger;
          
          transition-delay: $delay;
          
          @include slideActive {
            transition-delay: $delay + $animTime/3;
          }
        }
      }
    }

    &-readmore {
      position: relative;
      font-size: 14px;
      text-transform: lowercase;
      backface-visibility: hidden;
      transform: translateY(-20px);
      cursor: pointer;
      
      @include subTextsActiveSlide;
      
      &:before {
        content: '';
        position: absolute;
        left: -2px;
        top: -3px;
        width: calc(100% + 4px);
        height: calc(100% + 6px);
        background: rgba(255,255,255,0.4);
        transform: scaleX(0.3);
        transform-origin: 0 50%;
        transition: transform 0.3s;
      }
      
      &:hover:before {
        transform: scaleX(1);
      }
    }

    &-parts {
      position: absolute;
      left: 0;
      top: 0;
      display: flex;
      width: 100%;
      height: 100%;
      
      &:after {
        content: '';
        z-index: $numOfParts + 1;
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.1);
      }
    }

    &-part {
      $partW: (100vw / $numOfParts);
      
      position: relative;
      width: percentage(1 / $numOfParts);
      height: 100%;
      
      $partRef: &;
      $imageFadeAT: $animTime/4;

      &-inner {
        overflow: hidden;
        position: relative;
        width: 100%;
        height: 100%;
        background-size: 0 0;
        background-repeat: no-repeat;
        transition: transform $animTime/2 ease-in-out;

        &:before {
          content: '';
          position: absolute;
          width: 100vw;
          height: 100%;
          background-image: inherit;
          background-size: cover;
          background-position: center center;
          transition: opacity $imageFadeAT;
          opacity: 0;
        }

        @for $i from 1 through $numOfParts {
          ${$partRef}:nth-child(${$i}) & {
            $delayOut: ($numOfParts - $i) * $stagger;
            $delayIn: $i * $stagger + $animTime/5;
            
            z-index: $numOfParts - $i;
            transition-delay: $delayOut;
            transform: translateX(percentage($i / $numOfParts * -1.3));
            
            @include slideActive {
              transition-delay: $delayIn;
            }

            &:before {
              left: $partW * ($i - 1) * -1;
              transition-delay: $delayOut + $imageFadeAT/2;
              
              @include slideActive {
                transition-delay: $delayIn;
              }
            }
          }
        }
        
        @include slideActive {
          transform: translateX(0);
          transition-timing-function: ease;
          
          &:before {
            opacity: 1;
          }
        }
      }
    }
  }
  
  &__control {
    $size: 50px;
    
    z-index: 100;
    position: absolute;
    left: 50px;
    top: 50%;
    width: $size;
    height: $size;
    margin-top: $size/-2;
    border-radius: 50%;
    background: rgba(255,255,255,0.4);
    transform: translateX($size*-1);
    opacity: 0;
    transition: $sliderReadyTrans;
    cursor: pointer;
    
    &:before {
      content: '';
      position: absolute;
      left: 50%;
      top: 50%;
      width: 20px;
      height: 20px;
      margin-left: -10px;
      margin-top: -10px;
      border: 2px solid #000;
      border-bottom: none;
      border-right: none;
      transform: translateX(5px) rotate(-45deg);
    }
    
    &--right {
      left: auto;
      right: 50px;
      transform: translateX($size);
      
      &:before {
        transform: translateX(-5px) rotate(135deg);
      }
    }
    
    @include sliderReady {
      transform: translateX(0);
      opacity: 1;
    }
  }
}

.icon-link {
  z-index: 100;
  position: absolute;
  left: 5px;
  bottom: 5px;
  width: 32px;

  img {
    width: 100%;
    vertical-align: top;
  }

  &--twitter {
    left: auto;
    right: 5px;
  }
}
</style>
</head>
<body>
<div id="app"></div>
<a href="https://dribbble.com/shots/3774469-T-R-A-V-E-L-E-R" target="_blank" class="icon-link">
  <img src="https://images.pexels.com/photos/956981/milky-way-starry-sky-night-sky-star-956981.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260">
</a>
<a href="https://twitter.com/NikolayTalanov" target="_blank" class="icon-link icon-link--twitter">
  <img src="https://bnetcmsus-a.akamaihd.net/cms/blog_header/ki/KI5Z7EH68HEA1589910860503.jpg">
</a>

</body>
</html>
