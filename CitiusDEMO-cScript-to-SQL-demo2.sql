SELECT
    'Name',
    'CI',
    'CIName',
    'CIStatus',
    'CWDEMO_Plane.Registration',
    'CWDEMO_Plane.CI',
    'CWDEMO_Plane.CIName',
    'CWDEMO_Plane.CIStatus',
    'CWDEMO_Flight.CI',
    'CWDEMO_Flight.CIName',
    'CWDEMO_Flight.ICAO24Hex',
    'CWDEMO_Flight.CIStatus' 
FROM
    ( SELECT
        'CWAPPS_Organization'.cw_Name AS 'Name',
        'CWAPPS_Organization'.cw_CI,
        'CWAPPS_Organization'.cw_CI AS 'CI',
        'CWAPPS_Organization'.cw_CIName AS 'CIName',
        'CWAPPS_Organization'.cw_CIStatus AS 'CIStatus' 
    FROM
        'CWAPPS_Organization' ) AS 'CWAPPS_Organization' 
LEFT OUTER JOIN
    (
        SELECT
            'CWDEMO_Plane'.cw_Airline_CWAPPS_Organization_CI,
            'CWDEMO_Plane'.cw_Registration AS 'CWDEMO_Plane.Registration',
            'CWDEMO_Plane'.cw_CI,
            'CWDEMO_Plane'.cw_CI AS 'CWDEMO_Plane.CI',
            'CWDEMO_Plane'.cw_CIName AS 'CWDEMO_Plane.CIName',
            'CWDEMO_Plane'.cw_CIStatus AS 'CWDEMO_Plane.CIStatus' 
        FROM
            'CWDEMO_Plane' 
    ) AS '/CWDEMO_Plane' /* 
Join
    to upper level query */ 
        ON 'CWAPPS_Organization'.cw_CI = '/CWDEMO_Plane'.cw_Airline_CWAPPS_Organization_CI 
LEFT OUTER JOIN
    (
        SELECT
            'CWDEMO_Flight'.cw_Plane_CWDEMO_Plane_CI,
            'CWDEMO_Flight'.cw_CI AS 'CWDEMO_Flight.CI',
            'CWDEMO_Flight'.cw_CIName AS 'CWDEMO_Flight.CIName',
            'CWDEMO_Flight'.cw_ICAO24Hex AS 'CWDEMO_Flight.ICAO24Hex',
            'CWDEMO_Flight'.cw_CIStatus AS 'CWDEMO_Flight.CIStatus' 
        FROM
            'CWDEMO_Flight' 
    ) AS '/CWDEMO_Flight' /* 
Join
    to upper level query */ 
        ON '/CWDEMO_Plane'.cw_CI = '/CWDEMO_Flight'.cw_Plane_CWDEMO_Plane_CI 
WHERE
    (
        (
            'Name'='Finnair'
        ) 
    ) 
ORDER BY
    'CI' ASC,
    'CWDEMO_Plane.CI' ASC,
    'CWDEMO_Flight.CI' ASC LIMIT 0,
    100
