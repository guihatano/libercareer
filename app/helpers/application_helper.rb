# frozen_string_literal: true

module ApplicationHelper
  def rentals_delayeds(rentals_delayeds_array)
    return 'Nenhum atraso' if rentals_delayeds_array

    string = ''
    rentals_delayeds_array.each do |rental|
      string += "<li>#{rental[:name]}, "
      string += "<b>atraso:</b> #{rental[:days]} dia(s), "
      string += "#{rental[:hours]} hora(s) "
      string += "e #{rental[:minutes]} minutos</li>"
    end
    string.html_safe
  end

  def list_person_full_name(people)
    html = ''
    if people.present?
      people.each do |person|
        html += "<li>#{person.full_name}</li>"
      end
    else
      html = t(:nobody)
    end

    html.html_safe
  end
end
