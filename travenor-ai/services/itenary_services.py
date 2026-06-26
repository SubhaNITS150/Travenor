from datetime import datetime

from models.request_models import (
    ItineraryRequest
)

from services.spot_ranker import (
    rank_tourist_spots
)

from algorithms.nearest_neighbour import (
    optimize_route_with_distance
)

from algorithms.day_allocator import (
    allocate_days
)

# Future
# from services.hotel_selector import (
#     find_hotel_for_day_end
# )


class ItineraryGenerationError(Exception):
    pass


def calculate_trip_days(
    start_date: str,
    end_date: str
) -> int:
    """
    Calculates trip duration.
    """

    start = datetime.fromisoformat(start_date)
    end = datetime.fromisoformat(end_date)

    days = (end - start).days + 1

    if days <= 0:
        raise ItineraryGenerationError(
            "Trip duration must be greater than zero."
        )

    return days


def generate_itinerary(
    request: ItineraryRequest
) -> dict:
    """
    Main itinerary generation pipeline.
    """

    total_days = calculate_trip_days(
        request.tripInfo.startDate,
        request.tripInfo.endDate
    )

    # ---------------------------------
    # Step 1: Rank Tourist Spots
    # ---------------------------------

    ranked_spots = rank_tourist_spots(
        tourist_spots=request.touristSpots,
        preferences=request.tripInfo.preferences,
        budget=request.tripInfo.budget
    )

    # ---------------------------------
    # Step 2: Route Optimization
    # ---------------------------------

    route_result = optimize_route_with_distance(
        start_latitude=request.startLocation.latitude,
        start_longitude=request.startLocation.longitude,
        locations=ranked_spots
    )

    optimized_route = route_result["route"]

    total_distance = route_result["total_distance"]

    # ---------------------------------
    # Step 3: Day Allocation
    # ---------------------------------

    itinerary_days = allocate_days(
        route=optimized_route,
        total_days=total_days
    )

    # ---------------------------------
    # Step 4: Hotel Allocation
    # Future
    # ---------------------------------

    # for day in itinerary_days:
    #
    #     hotel = find_hotel_for_day_end(
    #         day["spots"],
    #         request.hotels
    #     )
    #
    #     day["hotel"] = hotel

    # ---------------------------------
    # Step 5: Build Response
    # ---------------------------------

    return {
        "title": (
            f"{total_days} Day "
            f"Itinerary"
        ),

        "overview": (
            f"Optimized itinerary covering "
            f"{len(optimized_route)} tourist spots."
        ),

        "totalDays": total_days,

        "totalTouristSpots": len(
            optimized_route
        ),

        "totalDistanceKm": total_distance,

        "days": [
            {
                "dayNumber": day["dayNumber"],

                "hotel": day["hotel"],

                "spots": [
                    {
                        "id": spot.id,
                        "spotName": spot.spotName,
                        "category": spot.category,
                        "entryFee": spot.entryFee,
                        "latitude": spot.latitude,
                        "longitude": spot.longitude
                    }
                    for spot in day["spots"]
                ]
            }
            for day in itinerary_days
        ]
    }