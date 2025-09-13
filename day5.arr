use context dcic2024
#choose hat
fun choose-hat(tem-in-F :: Number) -> String:
  doc: "Show sun hat when tem > 80F, show no hat when tem < 80F"
  spy:
    tem-in-F,
    comparison: tem-in-F >= 80
  end
  if tem-in-F >= 80:
    "sun hat"
  else:
    "no hat"
  end
where:
  choose-hat(90) is "sun hat"
  choose-hat(100) is "sun hat"
  choose-hat(60) is "no hat"
end

#winter hat
fun choose-winter-hat(tem-in-F :: Number) -> String:
  doc: "Wear winter hat when tem < 50F, wear sun hat when tem > 80F, if else wearing no hat"
spy:
    tem-in-F
  end
  if tem-in-F >= 80:
    "sun hat"
  else if tem-in-F <= 50:
    "winter hat"
  else:
    "no hat"
  end
where: 
  choose-winter-hat(90) is "sun hat"
  choose-winter-hat(30) is "winter hat"
  choose-winter-hat(70) is "no hat"
end

#add glasses
fun add-glasses(outfit :: String) -> String:
  doc:" Add and glasses after any outfit"
  spy:
    outfit
  end
  outfit + "and glasses"
where:
add-glasses("shoes") is "shoes and glasses"
add-glasses("tshirt") is "tshirt and glasses"
add-glasses("dress") is "dress and glasses"
end

#choose outfit
fun choose-outfit(tem-in-F :: Number) -> String:
  doc: "To determine the final outfit, wear sun hat when tem > 80F, winter hat when tem < 50F, else with no hat, and add glasses in all cases"
  spy:
    tem-in-F
  end
  if tem-in-F >= 80:
    "sun hat and glasses"
  else if tem-in-F <= 50:
    "winter hat and glasses"
  else:
    "no hat and glasses"
  end
where:
  choose-outfit(100) is "sun hat and glasses"
  choose-outfit(20) is "winter hat and glasses"
  choose-outfit(60) is "no hat and glasses"
end

#choose hat or visor
fun choose-hat-or-visor(has-visor :: Boolean, tem-in-F :: Number) -> String:
  doc: " When a person fullfill both has-visor and tem > 95F, he will wear visor"
  spy:
    has-visor,
    tem-in-F
  end
  if has-visor and (tem-in-F >= 95):
    "visor"
  else:
    choose-winter-hat(tem-in-F)
  end
where:
  choose-hat-or-visor(true, 100) is "visor"
  choose-hat-or-visor(false, 100) is "sun hat"
  choose-hat-or-visor(true, 90) is "sun hat"
  choose-hat-or-visor(false, 90) is "sun hat"
  choose-hat-or-visor(false, 30) is "winter hat"
end
choose-hat-or-visor(false, 100)
choose-hat-or-visor(false, 30)
    