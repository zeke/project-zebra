class Striper
  
  constructor: (@code) ->
    [@sex, @orientation, @weight] = @code.split('_')

  @data:
    female_vertical_slender: 7
    female_horizontal_slender: 73
    female_vertical_husky: 0
    female_horizontal_husky: 19
    male_vertical_slender: 8
    male_horizontal_slender: 31
    male_vertical_husky: 4
    male_horizontal_husky: 20

window.Stiper = Striper

jQuery ->
  
  window.stripers = []
    
  for code, count of Striper.data
    until count is 0
      window.stripers.push new Striper(code)
      count--
      
  $('#count_women').html (s for s in stripers when s.sex == 'female').length
  $('#count_men').html (s for s in stripers when s.sex == 'male').length

  $('#count_horizontal').html (s for s in stripers when s.orientation == 'horizontal').length
  $('#count_vertical').html (s for s in stripers when s.orientation == 'vertical').length

  $('#count_slender').html (s for s in stripers when s.weight == 'slender').length
  $('#count_husky').html (s for s in stripers when s.weight == 'husky').length


  for code, count of Striper.data
    
    [sex, orientation, weight] = code.split('_')
        
    $('#results').append "
      <h3 class='#{sex}'>#{count} #{weight} #{sex}s in #{orientation} stripes.</h3>
      <ul class='stripers' id='#{code}'></ul>"

    for striper in stripers when striper.code is code
      $("##{code}").append "<li class='#{striper.sex} #{striper.orientation} #{striper.weight}'></li>"
        