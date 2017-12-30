(function() {
  var $parallaxed;

  $parallaxed = document.querySelector(".parallaxed");

  document.querySelector(".cta-main-menu").onmouseenter = function() {
    var i, j, ref;
    $parallaxed.classList.add("has-focus");
    for (i = j = 0, ref = $parallaxed.children.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
      $parallaxed.children[i].style.transitionTimingFunction = "ease";
      $parallaxed.children[i].style.transitionDuration = Math.random() * 1 + .2 + "s";
      $parallaxed.children[i].style.left = "0px";
      $parallaxed.children[i].style.top = "0px";
    }
    this.classList.remove("is-hidden");
    return this.classList.add("is-visible");
  };

  document.querySelector(".cta-main-menu").onmouseleave = function() {
    var i, j, ref;
    for (i = j = 0, ref = $parallaxed.children.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
      $parallaxed.children[i].style.transitionTimingFunction = "linear";
      $parallaxed.children[i].style.transitionDuration = ".2s";
    }
    $parallaxed.classList.remove("has-focus");
    this.classList.remove("is-visible");
    return this.classList.add("is-hidden");
  };

  window.onmousemove = function(e) {
    var $items, ex, ey, i, j, r, ref, results;
    ex = this.innerWidth / 2 - e.clientX;
    ey = this.innerHeight / 2 - e.clientY;
    r = [.2, .3, .4, .5];
    $items = document.querySelectorAll(".item1, .item2, .item3, .item4");
    if (!document.querySelector(".parallaxed").classList.contains("has-focus")) {
      results = [];
      for (i = j = 0, ref = $items.length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
        $items[i].style.left = ex * r[i] + "px";
        results.push($items[i].style.top = ey * r[i] + "px");
      }
      return results;
    }
  };

}).call(this);
