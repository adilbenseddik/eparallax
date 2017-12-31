# Does the magic, maks everything parallax at once ;-{P
$nav = document.querySelector(".navigation")
$content = document.querySelector(".content")
$parallaxed = document.querySelector(".parallaxed")
$tooltip = document.querySelector(".tooltip")
$cta = document.querySelector(".cta-main-menu")
$state = true

$cta.onmouseenter = ->
  if $state
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

$cta.onmouseleave = ->
  if $state
    $tooltip.style.opacity = 0
    for i in [0...$parallaxed.children.length]
      $parallaxed.children[i].style.transitionTimingFunction = "linear"
      $parallaxed.children[i].style.transitionDuration = ".2s"
    $parallaxed.classList.remove("has-focus")
    this.classList.remove("is-visible")
    this.classList.add("is-hidden")
    $tooltip.style.visibility = 'hidden'

$cta.onclick = ->
  $state = false
  $tooltip.style.opacity = 0
  $parallaxed.style.visibility = 'hidden'
  $parallaxed.classList.remove("has-focus")
  this.classList.remove("is-visible")
  this.classList.add("is-hidden")
  $tooltip.style.visibility = 'hidden'
  init()

window.onmousemove = (e) ->
  ex = this.innerWidth / 2 - e.clientX
  ey = this.innerHeight / 2 - e.clientY
  r = [.2, .3, .4, .5]
  $items = document.querySelectorAll(".item1, .item2, .item3, .item4")

  if !document.querySelector(".parallaxed").classList.contains("has-focus")
    for i in [0...$items.length]
      $items[i].style.left = ex * r[i] + "px"
      $items[i].style.top = ey * r[i] + "px"

init = ->
  $nav.style.display = "flex"
  $nav.children[0].classList.add("has-focus")
  $content.style.display = "block"
  $content.children[0].style.display = 'block'
  for i in [0...$nav.children.length]
    $nav.children[i].onclick = (e) ->
      for i in [0...$nav.children.length]
        $nav.children[i].classList.remove("has-focus")
      e.target.classList.add("has-focus")
      for i in [0...$content.children.length]
        $content.children[i].style.display = "none"
      css = e.target.innerText.toLowerCase()
      document.querySelector('.'+css).style.display = "block"
