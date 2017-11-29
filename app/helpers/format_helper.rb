module FormatHelper
  def format_trips(trips)
    trips.map do |trip|
      [  [trip.id],
        "<div class='col-xs-12 col-md-4'>
          <div class='filter-radio travels-to-clean travel' type='button'
          data-toggle='modal' data-target='#exampleModal'>

            <div class='trip-to-compensate'>
              <p>de: #{trip.start_address}</p>
              <p>à: #{trip.destination_address}</p>
            </div>

<div class='trips-to'>
<i class='fa #{trip.transportation.icon} transport-icon'aria-hidden='true'></i>
            <div class='trip-to-compensate-infos text-center'>
              <p>#{km_total(trip.km, trip.number)}km </p>
              <p class='travel-emission'>#{(trip.transportation.emission * km_total(trip.km, trip.number)).round(2)} kg CO2</p>
            </div>

</div>
          <div class='trash-size'>
            <a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='trips/#{trip.id}'>
            <i class='fa fa-close' style='color: white;' aria-hidden='true'></i>
            </a>
          </div>
          </div>
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
