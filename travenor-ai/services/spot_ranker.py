from typing import List

from models.request_models import (
    TouristSpot,
    Preferences
)


CATEGORY_MAPPING = {
    "nature": [
        "nature",
        "lake",
        "waterfall",
        "mountain",
        "park",
        "viewpoint"
    ],

    "adventure": [
        "adventure",
        "trekking",
        "camping",
        "rafting",
        "hiking",
        "caving"
    ],

    "cultural": [
        "culture",
        "cultural",
        "heritage",
        "museum",
        "temple",
        "historical"
    ],

    "food": [
        "food",
        "restaurant",
        "cafe",
        "street food"
    ],

    "nightlife": [
        "nightlife",
        "bar",
        "club",
        "pub"
    ]
}


def _category_match_score(
    category: str,
    preferences: Preferences | None
) -> int:
    """
    Score based on user preferences.
    """

    if not preferences:
        return 0

    category = (category or "").lower().strip()
    score = 0

    if preferences.nature:
        if any(
            keyword in category
            for keyword in CATEGORY_MAPPING["nature"]
        ):
            score += 10
            
    if preferences.adventure:
        if any(
            keyword in category
            for keyword in CATEGORY_MAPPING["adventure"]
        ):
            score += 10

    if preferences.cultural:
        if any(
            keyword in category
            for keyword in CATEGORY_MAPPING["cultural"]
        ):
            score += 10

    if preferences.food:
        if any(
            keyword in category
            for keyword in CATEGORY_MAPPING["food"]
        ):
            score += 10

    if preferences.nightlife:
        if any(
            keyword in category
            for keyword in CATEGORY_MAPPING["nightlife"]
        ):
            score += 10

    return score


def _budget_score(
    entry_fee: float,
    budget: str
) -> int:
    """
    Lower budget users prefer cheaper attractions.
    """

    entry_fee = entry_fee or 0

    if budget == "LOW":
        if entry_fee <= 100:
            return 5
        if entry_fee <= 300:
            return 2
        return -3

    if budget == "MEDIUM":
        if entry_fee <= 500:
            return 3
        return 0

    return 0


def _distance_score(
    distance_from_city: float | None
) -> int:
    """
    Small bonus for closer attractions.
    """

    if distance_from_city is None:
        return 0

    if distance_from_city <= 10:
        return 3

    if distance_from_city <= 25:
        return 2

    if distance_from_city <= 50:
        return 1

    return 0


def calculate_spot_score(
    spot: TouristSpot,
    preferences: Preferences | None,
    budget: str
) -> int:
    """
    Final score.
    """

    score = 0

    score += _category_match_score(
        spot.category,
        preferences
    )

    score += _budget_score(
        spot.entryFee,
        budget
    )

    score += _distance_score(
        spot.distanceFromCity
    )

    return score


def rank_tourist_spots(
    tourist_spots: List[TouristSpot],
    preferences: Preferences | None,
    budget: str
) -> List[TouristSpot]:
    """
    Returns spots sorted by descending score.
    """

    return sorted(
        tourist_spots,
        key=lambda spot: calculate_spot_score(
            spot,
            preferences,
            budget
        ),
        reverse=True
    )