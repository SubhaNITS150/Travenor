from typing import List, Optional

from models.request_models import (
    Hotel,
    TouristSpot
)

from utils.distance import (
    find_nearest_entity,
    safe_haversine_distance
)


class HotelSelectionError(Exception):
    pass


def _has_valid_coordinates(
    hotel: Hotel
) -> bool:
    """
    Checks if hotel has valid coordinates.
    """

    return (
        hotel.latitude is not None
        and hotel.longitude is not None
    )


def _filter_valid_hotels(
    hotels: List[Hotel]
) -> List[Hotel]:
    """
    Removes hotels with missing coordinates.
    """

    return [
        hotel
        for hotel in hotels
        if _has_valid_coordinates(hotel)
    ]


def find_nearest_hotel(
    tourist_spot: TouristSpot,
    hotels: List[Hotel]
) -> Optional[Hotel]:
    """
    Finds nearest hotel to a tourist spot.
    """

    if not hotels:
        return None

    valid_hotels = _filter_valid_hotels(
        hotels
    )

    if not valid_hotels:
        return None

    return find_nearest_entity(
        source_lat=tourist_spot.latitude,
        source_lon=tourist_spot.longitude,
        entities=valid_hotels
    )


def calculate_hotel_distance(
    tourist_spot: TouristSpot,
    hotel: Hotel
) -> float:
    """
    Distance between spot and hotel.
    """

    return safe_haversine_distance(
        tourist_spot.latitude,
        tourist_spot.longitude,
        hotel.latitude,
        hotel.longitude
    )


def find_hotel_for_day_end(
    day_spots: List[TouristSpot],
    hotels: List[Hotel]
) -> Optional[Hotel]:
    """
    Select hotel based on last tourist spot
    of the day.
    """

    if not day_spots:
        return None

    last_spot = day_spots[-1]

    return find_nearest_hotel(
        last_spot,
        hotels
    )


def find_hotel_with_distance(
    tourist_spot: TouristSpot,
    hotels: List[Hotel]
):
    """
    Returns both hotel and distance.
    """

    hotel = find_nearest_hotel(
        tourist_spot,
        hotels
    )

    if hotel is None:
        return {
            "hotel": None,
            "distance": None
        }

    distance = calculate_hotel_distance(
        tourist_spot,
        hotel
    )

    return {
        "hotel": hotel,
        "distance": round(distance, 2)
    }