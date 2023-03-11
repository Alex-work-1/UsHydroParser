# UsHydroParser - Hydrology US daily data parser

This R library parses hydrology US daily data in a MOPEX format by its ID.
The source of data is - https://hydrology.nws.noaa.gov/pub/gcip/mopex/US_Data/Us_438_Daily/ .

To use this library simply type UsHydroParser function and insert in it a required id number in a form "UsHydroParser(id)".

## Example:
UsHydroParser("01048000")
