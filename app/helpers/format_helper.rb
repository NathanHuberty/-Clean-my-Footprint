module FormatHelper
  def format_trips(trips)
    trips.map do |trip|
      [  [trip.id],
        "<div class='col-xs-12 filter-radio travels-to-clean travel' type='button'
        data-toggle='modal' data-target='#exampleModal'>
        <p>
          <i class='fa #{trip.transportation.icon}'aria-hidden='true'></i>
          #{trip.start_address} - #{trip.destination_address}  #{km_total(trip.km, trip.number)}km
          #{(trip.transportation.emission * km_total(trip.km, trip.number)).round(2)} kg CO2
        </p>
        <a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='trips/#{trip.id}'>
          <i class='fa fa-trash-o' aria-hidden='true'></i>
        </a>
        </div>".html_safe
      ]
    end
  end

def format_project(projects)
  projects.map do |project|
    [  [project.id],
      "<div class='logo-projects'> #{image_tag project.logo,  class: 'logo-project-modal'}   </div>".html_safe
    ]
  end
end
end
