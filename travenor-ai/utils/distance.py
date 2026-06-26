from math import radians, sin, cos, sqrt, atan2
from typing import Optional

EARTH_RADIUS_KM = 6371.0088

class InvalidCoordinateError(ValueError):
    pass


def validate_coordinates(
    latitude: Optional[float],
    longitude: Optional[float]
) -> None:
    """
    Validate latitude and longitude.
    Latitude:  -90 to 90
    Longitude: -180 to 180
    """

    if latitude is None:
        raise InvalidCoordinateError(
            "Latitude cannot be None"
        )

    if longitude is None:
        raise InvalidCoordinateError(
            "Longitude cannot be None"
        )

    if not (-90 <= latitude <= 90):
        raise InvalidCoordinateError(
            f"Invalid latitude: {latitude}"
        )

    if not (-180 <= longitude <= 180):
        raise InvalidCoordinateError(
            f"Invalid longitude: {longitude}"
        )


def haversine_distance(
    lat1: float,
    lon1: float,
    lat2: float,
    lon2: float
) -> float:
    """
    Calculate great-circle distance between two points.
    Returns:
        Distance in kilometers.
    """

    validate_coordinates(lat1, lon1)
    validate_coordinates(lat2, lon2)

    if lat1 == lat2 and lon1 == lon2:
        return 0.0

    lat1_rad = radians(lat1)
    lon1_rad = radians(lon1)
    lat2_rad = radians(lat2)
    lon2_rad = radians(lon2)

    delta_lat = lat2_rad - lat1_rad
    delta_lon = lon2_rad - lon1_rad

    a = (
        sin(delta_lat / 2) ** 2
        + cos(lat1_rad)
        * cos(lat2_rad)
        * sin(delta_lon / 2) ** 2
    )

    c = 2 * atan2(sqrt(a), sqrt(1 - a))

    return round(EARTH_RADIUS_KM * c, 2)


def safe_haversine_distance(
    lat1: Optional[float],
    lon1: Optional[float],
    lat2: Optional[float],
    lon2: Optional[float]
) -> float:
    """
    Safe wrapper.

    Returns:
        float("inf")
        if coordinates are missing.
    """

    try:
        return haversine_distance(
            lat1,
            lon1,
            lat2,
            lon2
        )
    except InvalidCoordinateError:
        return float("inf")
    

def find_nearest_entity(
    source_lat: float,
    source_lon: float,
    entities: list,
    lat_attr: str = "latitude",
    lon_attr: str = "longitude"
):
    """
    Returns nearest object from a list.
    Example:
        nearest_hotel = find_nearest_entity(
            spot.latitude,
            spot.longitude,
            hotels
        )
    """

    if not entities:
        return None

    return min(
        entities,
        key=lambda entity: safe_haversine_distance(
            source_lat,
            source_lon,
            getattr(entity, lat_attr, None),
            getattr(entity, lon_attr, None)
        )
    )