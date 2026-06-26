from copy import deepcopy
from typing import Any, List, Optional

from utils.distance import (
    find_nearest_entity,
    safe_haversine_distance,
)

class RouteOptimizationError(Exception):
    pass


def _has_valid_coordinates(entity: Any) -> bool:
    """
    Checks whether entity contains valid coordinates.
    """

    latitude = getattr(entity, "latitude", None)
    longitude = getattr(entity, "longitude", None)
    return (
        latitude is not None
        and longitude is not None
    )


def _filter_valid_entities(
    entities: List[Any]
) -> List[Any]:
    """
    Removes entities with missing coordinates.
    """
    return [
        entity
        for entity in entities
        if _has_valid_coordinates(entity)
    ]


def calculate_route_distance(
    ordered_entities: List[Any]
) -> float:
    """
    Calculates total route distance.
    """

    if len(ordered_entities) < 2:
        return 0.0

    total_distance = 0.0

    for i in range(len(ordered_entities) - 1):
        current = ordered_entities[i]
        nxt = ordered_entities[i + 1]
        total_distance += safe_haversine_distance(
            current.latitude,
            current.longitude,
            nxt.latitude,
            nxt.longitude,
        )
    return round(total_distance, 2)


def optimize_route(
    start_latitude: float,
    start_longitude: float,
    locations: List[Any]
) -> List[Any]:
    """
    Nearest Neighbour Route Optimization.
    Returns ordered locations.
    """

    if not locations:
        return []
    
    valid_locations = _filter_valid_entities(
        deepcopy(locations)
    )
    if not valid_locations:
        raise RouteOptimizationError(
            "No locations with valid coordinates found."
        )
    if len(valid_locations) == 1:
        return valid_locations
    
    ordered_route = []
    current_latitude = start_latitude
    current_longitude = start_longitude
    remaining = valid_locations.copy()

    while remaining:
        nearest = find_nearest_entity(
            source_lat=current_latitude,
            source_lon=current_longitude,
            entities=remaining
        )

        if nearest is None:
            break

        ordered_route.append(nearest)
        current_latitude = nearest.latitude
        current_longitude = nearest.longitude
        remaining.remove(nearest)

    return ordered_route


def optimize_route_with_distance(
    start_latitude: float,
    start_longitude: float,
    locations: List[Any]
) -> dict:
    """
    Convenience wrapper.

    Returns:
    {
        "route": [...],
        "total_distance": 120.5
    }
    """

    route = optimize_route(
        start_latitude,
        start_longitude,
        locations
    )

    total_distance = 0.0

    if route:

        previous_lat = start_latitude
        previous_lon = start_longitude

        for location in route:

            total_distance += safe_haversine_distance(
                previous_lat,
                previous_lon,
                location.latitude,
                location.longitude
            )

            previous_lat = location.latitude
            previous_lon = location.longitude

    return {
        "route": route,
        "total_distance": round(
            total_distance,
            2
        )
    }


def get_last_location(
    route: List[Any]
) -> Optional[Any]:
    """
    Returns last location in route.
    """

    if not route:
        return None

    return route[-1]