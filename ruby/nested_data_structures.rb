math_class =  {
  sophomore: {
    teacher: "Dionysius Branimira",
    exam_scores: {"Jehanne Maolsheachlann" => 76,
                  "Tarina Asa" => 89,
                  "Jordanes Kalle" => 67
                  }
  },
  junior: {
    teacher: "Natan Stian",
    exam_scores: {"Jehanne Maolsheachlann" => 76,
                  "Tarina Asa" => 59,
                  "Jordanes Kalle" => 87
                  }
  },
  senior: {
    teacher: "Bharata Estrella",
    exam_scores: {"Rodrigo Kameron" => 92,
                  "Wendelin Trudy" => 76,
                  "Atalia Floriana" => 42
                  }
    }
}

p math_class[:sophomore][:exam_scores]["Jehanne Maolsheachlann"]
p math_class[:senior][:teacher]
