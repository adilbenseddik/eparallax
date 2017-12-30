#Does the magic, maks everything parallax at once ;-{P
$parallaxed = document.querySelector(".parallaxed")
$tooltip = document.querySelector(".tooltip")

document.querySelector(".cta-main-menu").onmouseenter = ->
  $parallaxed.classList.add("has-focus")
  $tooltip.style.opacity = .9
  for i in [0...$parallaxed.children.length]
    $parallaxed.children[i].style.transitionTimingFunction = "ease"
    $parallaxed.children[i].style.transitionDuration = Math.random() * 1 + .2 + "s"
    $parallaxed.children[i].style.left = "0px"
    $parallaxed.children[i].style.top = "0px"
  this.classList.remove("is-hidden")
  this.classList.add("is-visible")
  $tooltip.style.visibility = 'visible'

document.querySelector(".cta-main-menu").onmouseleave = ->
  $tooltip.style.opacity = 0
  for i in [0...$parallaxed.children.length]
    $parallaxed.children[i].style.transitionTimingFunction = "linear"
    $parallaxed.children[i].style.transitionDuration = ".2s"
  $parallaxed.classList.remove("has-focus")
  this.classList.remove("is-visible")
  this.classList.add("is-hidden")
  $tooltip.style.visibility = 'hidden'

window.onmousemove = (e) ->
  ex = this.innerWidth / 2 - e.clientX
  ey = this.innerHeight / 2 - e.clientY
  r = [.2, .3, .4, .5]
  $items = document.querySelectorAll(".item1, .item2, .item3, .item4")

  if !document.querySelector(".parallaxed").classList.contains("has-focus")
    for i in [0...$items.length]
      $items[i].style.left = ex * r[i] + "px"
      $items[i].style.top = ey * r[i] + "px"