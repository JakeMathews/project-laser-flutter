import 'package:project_lazer/horizons/model/horizons_data_entry.dart';

enum SolarPresence {
  daylight,
  civilTwilight,
  nauticalTwilight,
  astronomicalTwilight,
  night
}
enum LunarPresence {
  aboveApparentHorizon,
  belowApparentHorizon,
  rise,
  transit,
  set
}

class ObserverAngleDataEntry extends HorizonsDataEntry {
  /*
  SOLAR PRESENCE (OBSERVING SITE)
  Time tag is followed by a blank, then a solar-presence symbol:
        '*'  Daylight (refracted solar upper-limb on or above apparent horizon)
        'C'  Civil twilight/dawn
        'N'  Nautical twilight/dawn
        'A'  Astronomical twilight/dawn
        ' '  Night OR geocentric ephemeris
   */
  SolarPresence solarPresence;

  /*
  LUNAR PRESENCE WITH TARGET RISE/TRANSIT/SET MARKER (OBSERVING SITE)
  The solar-presence symbol is immediately followed by another marker symbol:
        'm'  Refracted upper-limb of Moon on or above apparent horizon
        ' '  Refracted upper-limb of Moon below apparent horizon OR geocentric
        'r'  Rise    (target body on or above cut-off RTS elevation)
        't'  Transit (target body at or past local maximum RTS elevation)
        's'  Set     (target body on or below cut-off RTS elevation)
   */
  LunarPresence lunarPresence;

  /*
  Refracted apparent azimuth and elevation of target center. Adjusted for
  light-time, the gravitational deflection of light, stellar aberration,
  precession, nutation and approximate atmospheric refraction. Azimuth measured
  North(0) -> East(90)-> South(180) -> West(270) -> North (360). Elevation is
  with respect to plane perpendicular to local zenith direction. TOPOCENTRIC
  ONLY.  Units: DEGREES
   */
  double azimuth;
  double elevation;
}