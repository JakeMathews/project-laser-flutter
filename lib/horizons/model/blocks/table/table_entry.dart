enum SolarPresence { daylight, civilTwilight, nauticalTwilight, astronomicalTwilight, night }
enum LunarPresence { aboveApparentHorizon, belowApparentHorizon, rise, transit, set }

final Map<String, SolarPresence> solarPresenceSymbolMap = {
  '*': SolarPresence.daylight,
  'C': SolarPresence.civilTwilight,
  'N': SolarPresence.nauticalTwilight,
  'A': SolarPresence.astronomicalTwilight,
  ' ': SolarPresence.night,
};

final Map<String, LunarPresence> lunarPresenceSymbolMap = {
  'm': LunarPresence.aboveApparentHorizon,
  ' ': LunarPresence.belowApparentHorizon,
  'r': LunarPresence.rise,
  't': LunarPresence.transit,
  's': LunarPresence.set,
};

class TableEntry {
  final DateTime dateTime;

  /*
  SOLAR PRESENCE (OBSERVING SITE)
  Time tag is followed by a blank, then a solar-presence symbol:
        '*'  Daylight (refracted solar upper-limb on or above apparent horizon)
        'C'  Civil twilight/dawn
        'N'  Nautical twilight/dawn
        'A'  Astronomical twilight/dawn
        ' '  Night OR geocentric ephemeris
   */
  final SolarPresence solarPresence;

  /*
  LUNAR PRESENCE WITH TARGET RISE/TRANSIT/SET MARKER (OBSERVING SITE)
  The solar-presence symbol is immediately followed by another marker symbol:
        'm'  Refracted upper-limb of Moon on or above apparent horizon
        ' '  Refracted upper-limb of Moon below apparent horizon OR geocentric
        'r'  Rise    (target body on or above cut-off RTS elevation)
        't'  Transit (target body at or past local maximum RTS elevation)
        's'  Set     (target body on or below cut-off RTS elevation)
   */
  final LunarPresence lunarPresence;

  /*
  Refracted apparent azimuth and elevation of target center. Adjusted for
  light-time, the gravitational deflection of light, stellar aberration,
  precession, nutation and approximate atmospheric refraction. Azimuth measured
  North(0) -> East(90)-> South(180) -> West(270) -> North (360). Elevation is
  with respect to plane perpendicular to local zenith direction. TOPOCENTRIC
  ONLY.  Units: DEGREES
   */
  final double azimuth;
  final double elevation;

  TableEntry(this.dateTime, this.solarPresence, this.lunarPresence, this.azimuth, this.elevation);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TableEntry &&
              runtimeType == other.runtimeType &&
              dateTime == other.dateTime &&
              solarPresence == other.solarPresence &&
              lunarPresence == other.lunarPresence &&
              azimuth == other.azimuth &&
              elevation == other.elevation;

  @override
  int get hashCode =>
      dateTime.hashCode ^
      solarPresence.hashCode ^
      lunarPresence.hashCode ^
      azimuth.hashCode ^
      elevation.hashCode;



}
