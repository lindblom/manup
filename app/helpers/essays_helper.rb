module EssaysHelper
  def row_it(essays, number_of_rows = 3)
    #html = ""
    #essays.each_with_index do |essay, index|
    #  html << '<div class="row">' if (index % 3) == 0
    #  
    #end
    
    html = ""
    
    essays.each_with_index do |essay, index|
      html << '<div class="row">' if (index % number_of_rows) == 0
      html << yield(essay)
      html << '</div>' if (index % number_of_rows) == (number_of_rows - 1)
    end
  end
end
