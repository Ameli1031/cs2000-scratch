use context dcic2024
#choose hat
fun choose-hat(tem-in-F :: Number) -> String:
  doc: "Show sun hat when tem > 80F, show no hat when tem < 80F"
  spy:
    tem-in-F
  end
  if tem-in-F > 80:
    "sun hat"
  else:
    "no hat"
  end
where:
  choose-hat(90) is "sun hat"
  choose-hat(100) is "sun hat"
  choose-hat(60) is "no hat"
end
choose-hat(90)

#winter hat
fun choose-winter-hat(tem-in-F :: Number) -> String:
  doc: "Wear winter hat when tem < 50F, wear sun hat when tem > 80F, if else wearing no hat"
spy:
  tem-in-F
  end
  if tem-in-F > 80:
    "sun hat"
  else if tem-in-F < 50:
    "winter hat"
  else:
    "no hat"
  end
where: 
  choose-winter-hat(90) is "sun hat"
  choose-winter-hat(30) is "winter hat"
  choose-winter-hat(70) is "no hat"
end
choose-winter-hat(70)

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
add-glasses("outfit")
