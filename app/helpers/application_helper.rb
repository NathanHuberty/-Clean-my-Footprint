module ApplicationHelper
  def custom_transports
    [ {
      icon: "bus",
      name: Transportation.find_by(category: "Transport en commun").id
        }, {
      icon: "train",
      name: Transportation.find_by(category: "Train").id
        }, {
      icon: "motorcycle",
      name: Transportation.find_by(category: "Moto").id
        }, {
      icon: "car",
      name: Transportation.find_by(category: "Voiture").id
        }, {
      icon: "plane",
      name: Transportation.find_by(category: "Avion").id
        }
    ]
  end


  def yield_with_default(holder, default)
    if content_for?(holder)
      content_for(holder).squish
    else
      default
    end
  end

end
