
class LongLatLocation

  attr_reader :long,:lat,:type

  def initalize(long,lat,type='bus')
    @long = long
    @lat = lat
    @type = type
  end

end
