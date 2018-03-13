import 'package:flutter_test/flutter_test.dart';
import 'package:project_lazer/horizons/horizons_data_parser.dart';

import 'block_parsers/requester_info_parser_test.dart';
import 'block_parsers/target_selection_parser_test.dart';
import 'block_parsers/time_span_parser_test.dart';

final String HORIZONS_DATA = r'''
*******************************************************************************
Revised: Jul 26, 2016             Moon / (Earth)                            301
 
PHYSICAL PROPERTIES:
 Radius (IAU), km      = 1737.4          Mass, 10^20 kg        =  734.9
 Radius (gravity), km  = 1738.0          Geometric albedo      =    0.12
 Density, gm cm^-3     =    3.3437       GM, km^3/s^2          = 4902.80007
 V(1,0)                =   +0.21         Surface gravity       =    1.62 m s^-2
 Earth/Moon mass ratio = 81.3005691      Farside crust. thick. = ~80 - 90 km   
 Nearside crust. thick.= 58+-8 km        Heat flow, Apollo 17  = 2.2+-.5 mW/m^2
 Heat flow, Apollo 15  = 3.1+-.6 mW/m^2  k2                    = 0.024059
 Mean crustal density  = 2.97+-.07g/cm^3 Magnetometer moment   = 435+-15        
 Induced magnetic mom. = 4.23x10^22Gcm^3 

DYNAMICAL CHARACTERISTICS:
 Mean angular diameter = 31'05.2"        Orbit period          = 27.321582 d
 Obliquity to orbit    = 6.67 deg        Eccentricity          = 0.05490
 Semi-major axis, a    = 384400 km       Inclination           = 5.145 deg
 Mean motion, rad/s    = 2.6616995x10^-6 Nodal period          = 6798.38 d
 Apsidal period        = 3231.50 d       Mom. of inertia C/MR^2= 0.393142
 beta (C-A/B), x10^-4  = 6.310213        gamma (B-A/C), x10^-4 = 2.277317
*******************************************************************************
 
 
*******************************************************************************
Ephemeris / WWW_USER Wed Mar  7 19:56:26 2018 Pasadena, USA      / Horizons    
*******************************************************************************
Target body name: Moon (301)                      {source: DE431mx}
Center body name: Earth (399)                     {source: DE431mx}
Center-site name: (user defined site below)
*******************************************************************************
Start time      : A.D. 2018-Mar-07 14:56:00.0000 UT      
Stop  time      : A.D. 2018-Mar-07 17:56:00.0000 UT      
Step-size       : 5 minutes
*******************************************************************************
Target pole/equ : IAU_MOON                        {East-longitude positive}
Target radii    : 1737.4 x 1737.4 x 1737.4 km     {Equator, meridian, pole}    
Center geodetic : 288.943100,42.3567000,0.0000000 {E-lon(deg),Lat(deg),Alt(km)}
Center cylindric: 288.943100,4720.39581,4274.9653 {E-lon(deg),Dxy(km),Dz(km)}
Center pole/equ : High-precision EOP model        {East-longitude positive}
Center radii    : 6378.1 x 6378.1 x 6356.8 km     {Equator, meridian, pole}    
Target primary  : Earth
Vis. interferer : MOON (R_eq= 1737.400) km        {source: DE431mx}
Rel. light bend : Sun, EARTH                      {source: DE431mx}
Rel. lght bnd GM: 1.3271E+11, 3.9860E+05 km^3/s^2                              
Atmos refraction: YES (Earth refraction model)
RA format       : HMS
Time format     : CAL 
RTS-only print  : NO       
EOP file        : eop.180306.p180528                                           
EOP coverage    : DATA-BASED 1962-JAN-20 TO 2018-MAR-06. PREDICTS-> 2018-MAY-27
Units conversion: 1 au= 149597870.700 km, c= 299792.458 km/s, 1 day= 86400.0 s 
Table cut-offs 1: Elevation (-90.0deg=NO ),Airmass (>38.000=NO), Daylight (NO )
Table cut-offs 2: Solar elongation (  0.0,180.0=NO ),Local Hour Angle( 0.0=NO )
Table cut-offs 3: RA/DEC angular rate (     0.0=NO )                           
Table format    : Comma Separated Values (spreadsheet)
*******************************************************************************
 Date__(UT)__HR:MN, , ,Azi_(r-appr), Elev_(r-appr),
***************************************************
$$SOE
 2018-Mar-07 14:56,*, ,254.6904, -4.8278,
 2018-Mar-07 15:01, ,m,255.4781, -5.6978,
$$EOE
*******************************************************************************
Column meaning:
 
TIME

  Prior to 1962, times are UT1. Dates thereafter are UTC. Any 'b' symbol in
the 1st-column denotes a B.C. date. First-column blank (" ") denotes an A.D.
date. Calendar dates prior to 1582-Oct-15 are in the Julian calendar system.
Later calendar dates are in the Gregorian system.

  Time tags refer to the same instant throughout the solar system, regardless
of where the observer is located. For example, if an observation from the
surface of another body has an output time-tag of 12:31:00 UTC, an Earth-based
time-scale, it refers to the instant on that body simultaneous to 12:31:00 UTC
on Earth.

  The Barycentric Dynamical Time scale (TDB) is used internally as defined by
the planetary equations of motion. Conversion between TDB and the selected
non-uniform UT output time-scale has not been determined for UTC times after
the next July or January 1st. The last known leap-second is used as a constant
over future intervals.

  NOTE: "n.a." in output means quantity "not available" at the print-time.
 
SOLAR PRESENCE (OBSERVING SITE)
  Time tag is followed by a blank, then a solar-presence symbol:

        '*'  Daylight (refracted solar upper-limb on or above apparent horizon)
        'C'  Civil twilight/dawn
        'N'  Nautical twilight/dawn
        'A'  Astronomical twilight/dawn
        ' '  Night OR geocentric ephemeris

LUNAR PRESENCE WITH TARGET RISE/TRANSIT/SET MARKER (OBSERVING SITE)
  The solar-presence symbol is immediately followed by another marker symbol:

        'm'  Refracted upper-limb of Moon on or above apparent horizon
        ' '  Refracted upper-limb of Moon below apparent horizon OR geocentric
        'r'  Rise    (target body on or above cut-off RTS elevation)
        't'  Transit (target body at or past local maximum RTS elevation)
        's'  Set     (target body on or below cut-off RTS elevation)
 
RTS MARKERS (TVH)
  Rise and set are with respect to the reference ellipsoid true visual horizon
defined by the elevation cut-off angle. Horizon dip and yellow-light refraction
(Earth only) are considered. Accuracy is < or = to twice the requested search
step-size.
 
 Azi_(r-appr)_Elev =
  Refracted apparent azimuth and elevation of target center. Adjusted for
light-time, the gravitational deflection of light, stellar aberration,
precession, nutation and approximate atmospheric refraction. Azimuth measured
North(0) -> East(90)-> South(180) -> West(270) -> North (360). Elevation is
with respect to plane perpendicular to local zenith direction. TOPOCENTRIC
ONLY.  Units: DEGREES


 Computations by ...
     Solar System Dynamics Group, Horizons On-Line Ephemeris System
     4800 Oak Grove Drive, Jet Propulsion Laboratory
     Pasadena, CA  91109   USA
     Information: http://ssd.jpl.nasa.gov/
     Connect    : telnet://ssd.jpl.nasa.gov:6775  (via browser)
                  telnet ssd.jpl.nasa.gov 6775    (via command-line)
     Author     : Jon.D.Giorgini@jpl.nasa.gov

*******************************************************************************

!$$SOF
COMMAND = '301'
CENTER = 'coord'
COORD_TYPE = 'GEODETIC'
SITE_COORD = '-71.05690,+42.35670,0'
MAKE_EPHEM = 'YES'
TABLE_TYPE = 'OBSERVER'
START_TIME = '2018-03-07 14:56'
STOP_TIME = '2018-03-07 17:56'
STEP_SIZE = '5 m'
CAL_FORMAT = 'CAL'
TIME_DIGITS = 'MINUTES'
ANG_FORMAT = 'HMS'
OUT_UNITS = 'KM-S'
RANGE_UNITS = 'AU'
APPARENT = 'REFRACTED'
SUPPRESS_RANGE_RATE = 'NO'
SKIP_DAYLT = 'NO'
EXTRA_PREC = 'NO'
R_T_S_ONLY = 'NO'
REF_SYSTEM = 'J2000'
CSV_FORMAT = 'YES'
OBJ_DATA = 'YES'
QUANTITIES = '4'
$$EOE
''';

void main() {
  test('Test parsing HORIZONS data', () {
    final HorizonsDataParser horizonsDataParser = new HorizonsDataParser.withDefaultParsers();
    final List<Object> expectedHorizonsData = createFakeHorizonsData();
    final List<Object> actualHorizonsData = horizonsDataParser.parse(HORIZONS_DATA);

    expect(actualHorizonsData, expectedHorizonsData);
  });
}

List<Object> createFakeHorizonsData() {
  return [
    RequesterInfoParserTest.createRequesterInfoBlock(),
    TargetSelectionParserTest.createTargetInfoBlock(),
    TimeSpanParserTest.createTimeSpanBlock(),
  ];
}
