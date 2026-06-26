from math import ceil
from typing import Any, List


class DayAllocationError(Exception):
    pass


def allocate_days(
    route: List[Any],
    total_days: int
) -> List[dict]:
    """
    Split optimized route into itinerary days.

    Parameters:
        route: Ordered tourist spots
        total_days: Number of trip days

    Returns:
        [
            {
                "dayNumber": 1,
                "spots": [...],
                "hotel": None
            }
        ]
    """

    if total_days <= 0:
        raise DayAllocationError(
            "Total days must be greater than 0."
        )

    if not route:
        return []

    total_spots = len(route)

    # More days than spots
    if total_days >= total_spots:

        itinerary_days = []

        for index, spot in enumerate(route):

            itinerary_days.append({
                "dayNumber": index + 1,
                "spots": [spot],
                "hotel": None
            })

        return itinerary_days

    spots_per_day = ceil(
        total_spots / total_days
    )

    itinerary_days = []

    current_index = 0

    for day in range(total_days):

        if current_index >= total_spots:
            break

        day_spots = route[
            current_index:
            current_index + spots_per_day
        ]

        itinerary_days.append({
            "dayNumber": day + 1,
            "spots": day_spots,
            "hotel": None
        })

        current_index += spots_per_day

    return itinerary_days


def count_spots_per_day(
    itinerary_days: List[dict]
) -> List[int]:
    """
    Utility for debugging.

    Example:
        [4, 4, 3]
    """

    return [
        len(day["spots"])
        for day in itinerary_days
    ]


def total_allocated_spots(
    itinerary_days: List[dict]
) -> int:
    """
    Returns total allocated spots.
    """

    return sum(
        len(day["spots"])
        for day in itinerary_days
    )