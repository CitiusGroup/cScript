SELECT
    'DepartureTime',
    'ICAO24Hex',
    'CI',
    'CIName',
    'CIStatus',
    'PlaneCI',
    'PlaneCI.CIName',
    'PlaneCI.CI',
    'PlaneCI.Registration',
    'PlaneCI.AirlineCI',
    'PlaneCI.AirlineCI.CIName',
    'PlaneCI.AirlineCI.CI',
    'PlaneCI.PhotoCI',
    'PlaneCI.PhotoCI.CIName',
    'PlaneCI.PhotoCI.CI',
    'PlaneCI.PhotoCI.MIMEType',
    'PlaneCI.PhotoCI.IconBase64',
    'PlaneCI.PhotoCI.Thumbnail480wHeight',
    'DepartureStationCI',
    'DepartureStationCI.CIName',
    'DepartureStationCI.CI' 
FROM
    ( SELECT
        'CWDEMO_Flight'.cw_DepartureTime AS 'DepartureTime',
        'CWDEMO_Flight'.cw_ICAO24Hex AS 'ICAO24Hex',
        'CWDEMO_Flight'.cw_Plane_CWDEMO_Plane_CI,
        'CWDEMO_Flight'.cw_DepartureStation_CWDEMO_Station_CI,
        'CWDEMO_Flight'.cw_CI AS 'CI',
        'CWDEMO_Flight'.cw_CIName AS 'CIName',
        'CWDEMO_Flight'.cw_CIStatus AS 'CIStatus' 
    FROM
        'CWDEMO_Flight' ) AS 'CWDEMO_Flight' 
LEFT OUTER JOIN
    (
        SELECT
            'CWDEMO_Plane'.cw_CIName AS 'PlaneCI',
            'CWDEMO_Plane'.cw_CIName AS 'PlaneCI.CIName',
            'CWDEMO_Plane'.cw_CI AS 'PlaneCI.CI',
            'CWDEMO_Plane'.cw_CI,
            'CWDEMO_Plane'.cw_Registration AS 'PlaneCI.Registration',
            'CWDEMO_Plane'.cw_Airline_CWAPPS_Organization_CI,
            'CWDEMO_Plane'.cw_Photo_CWCORE_File_CI 
        FROM
            'CWDEMO_Plane' 
    ) AS 'PlaneCI' /* 
Join
    to upper level query */ 
        ON 'CWDEMO_Flight'.cw_Plane_CWDEMO_Plane_CI = 'PlaneCI'.cw_CI 
        AND 'PlaneCI'.cw_CI != '' 
LEFT OUTER JOIN
    (
        SELECT
            'CWAPPS_Organization'.cw_CIName AS 'PlaneCI.AirlineCI',
            'CWAPPS_Organization'.cw_CIName AS 'PlaneCI.AirlineCI.CIName',
            'CWAPPS_Organization'.cw_CI AS 'PlaneCI.AirlineCI.CI',
            'CWAPPS_Organization'.cw_CI 
        FROM
            'CWAPPS_Organization' 
    ) AS 'PlaneCI.AirlineCI' /* 
Join
    to upper level query */ 
        ON 'PlaneCI'.cw_Airline_CWAPPS_Organization_CI = 'PlaneCI.AirlineCI'.cw_CI 
        AND 'PlaneCI.AirlineCI'.cw_CI != '' 
LEFT OUTER JOIN
    (
        SELECT
            'CWCORE_File'.cw_CIName AS 'PlaneCI.PhotoCI',
            'CWCORE_File'.cw_CIName AS 'PlaneCI.PhotoCI.CIName',
            'CWCORE_File'.cw_CI AS 'PlaneCI.PhotoCI.CI',
            'CWCORE_File'.cw_MIMEType AS 'PlaneCI.PhotoCI.MIMEType',
            'CWCORE_File'.cw_IconBase64 AS 'PlaneCI.PhotoCI.IconBase64',
            'CWCORE_File'.cw_Thumbnail480wHeight AS 'PlaneCI.PhotoCI.Thumbnail480wHeight',
            'CWCORE_File'.cw_CI 
        FROM
            'CWCORE_File' 
    ) AS 'PlaneCI.PhotoCI' /* 
Join
    to upper level query */ 
        ON 'PlaneCI'.cw_Photo_CWCORE_File_CI = 'PlaneCI.PhotoCI'.cw_CI 
        AND 'PlaneCI.PhotoCI'.cw_CI != '' 
LEFT OUTER JOIN
    (
        SELECT
            'CWDEMO_Station'.cw_CIName AS 'DepartureStationCI',
            'CWDEMO_Station'.cw_CIName AS 'DepartureStationCI.CIName',
            'CWDEMO_Station'.cw_CI AS 'DepartureStationCI.CI',
            'CWDEMO_Station'.cw_CI 
        FROM
            'CWDEMO_Station' 
    ) AS 'DepartureStationCI' /* 
Join
    to upper level query */ 
        ON 'CWDEMO_Flight'.cw_DepartureStation_CWDEMO_Station_CI = 'DepartureStationCI'.cw_CI 
        AND 'DepartureStationCI'.cw_CI != '' 
WHERE
    (
        (
            'PlaneCI.AirlineCI'='Finnair'
        ) 
    ) 
ORDER BY
    'DepartureTime' DESC,
    'CI' ASC LIMIT 0,
    100
